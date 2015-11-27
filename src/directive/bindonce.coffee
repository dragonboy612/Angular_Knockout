
alight.d.bo.switch =
    priority: 500
    ChangeDetector: true
    link: (scope, cd, element, name, env) ->
        cd.$switch =
            value: cd.eval name
            on: false
        null


alight.d.bo.switchWhen =
    priority: 500
    link: (scope, cd, element, name) ->
        if cd.$switch.value != name
            f$.remove element
            owner: true
        else
            cd.$switch.on = true
            null


alight.d.bo.switchDefault =
    priority: 500
    link: (scope, cd, element, name) ->
        if cd.$switch.on
            f$.remove element
            owner: true

do ->
    makeBindOnceIf = (direct) ->
        self =
            priority: 700
            link: (scope, cd, element, exp) ->
                value = cd.eval exp
                if !value is direct
                    f$.remove element
                    owner: true

    alight.d.bo.if = makeBindOnceIf true
    alight.d.bo.ifnot = makeBindOnceIf false
