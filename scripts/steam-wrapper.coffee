# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   Have Ah-nahld comment on what a great deal you're getting

module.exports = (robot) ->

  robot.responseMiddleware (context, next, done) ->
    if isDiscountString(context.strings[0])
      percentage = discountRegex().exec(context.strings[0])[1]

      if percentage >= 75
        sendComment("**AGHH SUCH A GUUD DEAL**", context.response)
      else
        null

    next()

isDiscountString = (steamString) ->
  discountRegex().test(steamString)

discountRegex = () ->
  /-(100(\.00?)?|[1-9]?\d(\.\d\d?)?)%/

sendComment = (comment, response) ->
  setTimeout(() ->
    response.send(comment)
  , 10000)
