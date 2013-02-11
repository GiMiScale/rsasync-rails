toHex = (x, minLength = 0) ->
  hex = x.toString(16)

  if minLength > 0 and hex.length < minLength
    hex = Array(minLength - hex.length + 1).join("0") + hex

  if (hex.length % 2 == 1)
    return "0" + hex
  else
    return hex


class DERElement
  constructor: (@type, @value) ->

  getHexValue: ->
    @value

  toHex: ->
    value = @getHexValue()
    size = value.length / 2

    if size < 128
      encodedSize = toHex(size)
    else
      encodedSize = toHex(size)
      encodedSize = toHex((encodedSize.length/2)+128) + encodedSize

    toHex(@type) + encodedSize + value

  toString: (width = 64) ->
    if width == 0
      hex2b64(@toHex())
    else
      linebrk hex2b64(@toHex()), width


class DERInteger extends DERElement
  constructor: (value) ->
    super 2, value

  getHexValue: ->
    hexValue = @value.toString(16)

    if hexValue.length % 2 == 1
      hexValue = "0" + hexValue

    hexValue


class DERBitString extends DERElement
  constructor: (value) ->
    super 3, value


class DERNull extends DERElement
  constructor: ->
    super 5, ""


class DERObjectIdentifier extends DERElement
  constructor: (value) ->
    super 6, value


class DERSequence extends DERElement
  constructor: (value = []) ->
    super 48, value

  addElement: (element) ->
    @value.push element

  getHexValue: ->
    @value.reduce (str, element) ->
      str += element.toHex()
    , ""


generatePublicKey = (rsa) ->
  # see: http://www.ietf.org/rfc/rfc4253.txt Sect. 6.6

  # type
  hexType = ""
  for c in "ssh-rsa"
    hexType += toHex c.charCodeAt(0)

  # exponent
  hexExponent = toHex(rsa.e)

  # modulus
  hexModulus = rsa.n.toString(16)
  #short = 8 - hexModulus.length % 8
  short = 2
  if short < 8
    hexModulus = Array(short + 1).join("0") + hexModulus

  encodedType     = toHex(    hexType.length/2, 8) + hexType
  encodedExponent = toHex(hexExponent.length/2, 8) + hexExponent
  encodedModulus  = toHex( hexModulus.length/2, 8) + hexModulus

  "ssh-rsa " + hex2b64(encodedType + encodedExponent + encodedModulus)

generatePrivateKeyBlock = (rsa) ->
  # see: http://etherhack.co.uk/asymmetric/docs/rsa_key_breakdown.html

  doc = new DERSequence [
    # algorithm_version
    new DERInteger(0)
    # modulus
    new DERInteger(rsa.n)
    # public_exponent
    new DERInteger(rsa.e)
    # private_exponent
    new DERInteger(rsa.d)
    # prime1
    new DERInteger(rsa.p)
    # prime2
    new DERInteger(rsa.q)
    # exponent1
    new DERInteger(rsa.dmp1)
    # exponent2
    new DERInteger(rsa.dmq1)
    # coefficient
    new DERInteger(rsa.coeff)
  ]

  header = "-----BEGIN RSA PRIVATE KEY-----\n"
  footer = "\n-----END RSA PRIVATE KEY-----"

  return header + doc.toString() + footer


# export public functions

window.generatePublicKey = (rsa) ->
  generatePublicKey rsa

window.generatePrivateKeyBlock = (rsa) ->
  generatePrivateKeyBlock rsa
