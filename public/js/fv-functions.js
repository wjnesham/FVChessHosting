function createMessages(tournamentID) {

    var generated = document.getElementById('generated')

    var day = dayOfWeekAsString(getTournamentDate().getDay())

    var chessLink = "https://lichess.org/tournament/" + tournamentID;
    document.getElementById('tournament-url').value = chessLink;

    var password = document.getElementById('pass').value

    generated.textContent = 'Generated ' + day + ' Messages. Enjoy! ^-^'

    document.getElementById('dow1').textContent = (day)
    document.getElementById('dow2').textContent = (day)
    document.getElementById('dow3').textContent = (day)
    document.getElementById('daycmd').textContent = (day)

    document.getElementById('link1').textContent = (chessLink)
    document.getElementById('link2').textContent = (chessLink)
    document.getElementById('link3').textContent = (chessLink)

    document.getElementById('pass1').textContent = (password)
    document.getElementById('pass2').textContent = (password)
    document.getElementById('pass3').textContent = (password)

}

function dayOfWeekAsString(dayIndex) {
    return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][dayIndex] || 'LaughAtFlutterwolfDay';
}

function loadSignIn() {
    const url = "https://lichess.org/account/oauth/token/create?scopes[]=challenge:write&scopes[]=puzzle:read&scopes[]=study:write&scopes[]=tournament:write&scopes[]=team:write&scopes[]=msg:write&description=FV+admin+chess+token";

    var tokenUrlButton = document.getElementById('tokenLink')
    tokenUrlButton.href = url;
}


function getTournamentDate() {
    const cd = new Date();
    var utcDate1 = new Date(cd.toUTCString());

    var diff = (cd.getTimezoneOffset() / 60) - 4

    var tzOffset = (cd.getTimezoneOffset() / 60) + diff; // - 4; // == 1

    const est8pm = 13 + tzOffset;
    const est10am = 3 + tzOffset;

    alert("Diff = " + diff + " offset = " + tzOffset + " hour = " + est8pm)

    switch (utcDate1.getDay()) {
        case 0:
            // Sun
            utcDate1.setHours(est10am - 1, 30, 0, 0)
            break;
        case 2:
            // Tuesday
            utcDate1.setHours(est8pm, 0, 0, 0)
            break;
        case 4:
            // Thursday
            utcDate1.setHours(est8pm, 0, 0, 0)
            break;
        case 5:
            // Friday
            utcDate1.setHours(est8pm, 0, 0, 0)
            break;
        case 6:
            // Sat
            utcDate1.setHours(est10am, 30, 0, 0)
            break;

        default:
            // assume weekday
            utcDate1.setHours(est8pm, 0, 0, 0)
            break;
    }

    return utcDate1;
}

function createWithLink(link) {
    var linkSplit = link.split('/');
    var linkID = linkSplit[linkSplit.length - 1];
    createMessages(linkID)
}

function getPostBody() {
    var clockTime = document.getElementById('minutes').value

    var increment = document.getElementById('seconds').value

    var password = document.getElementById('pass').value

    var description = document.getElementById('description').value

    // Set defaults if no values were supplied.
    if (clockTime == null || clockTime < 1) {
        clockTime = 5;
        document.getElementById('minutes').value = clockTime;
    }
    if (increment == null || increment < 0) {
        increment = 5;
        document.getElementById('seconds').value = increment;
    }
    if (password == null || password == "") {
        password = "Pawshop";
        document.getElementById('pass').value = password;
    }
    if (description == null || description == "") {
        description = "Fur Brawls :3";
        document.getElementById('description').value = description;
    }

    var details = {
        'name': "Furry Valley Tournament",
        'clockTime': clockTime,
        'clockIncrement': increment,
        'minutes': 60,
        'waitMinutes': 60,
        'startDate': getTournamentDate().getTime(),
        'berserkable': false,
        'description': description,
        'password': password
    };
    var formBody = [];
    for (var property in details) {
        var encodedKey = encodeURIComponent(property);
        var encodedValue = encodeURIComponent(details[property]);
        formBody.push(encodedKey + "=" + encodedValue);
    }
    return formBody.join("&");
}

function doSubmit() {
    const url = "https://lichess.org/api/tournament";

    if (document.getElementById('tournament-url').value.includes("https://lichess.org/tournament/")) {

        createWithLink(document.getElementById('tournament-url').value);
        return;
    }

    const personalToken = document.getElementById('token').value; // const personalToken = [your_token];


    const formBody = getPostBody();

    fetch(url, {
        method: "POST",

        headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Authorization': 'Bearer ' + personalToken
        },
        body: formBody
    })
        .then(res => {
            res.json().then(data => {
                if (data.id == null) {
                    var errorMsg = '';
                    if (typeof (data['error']) == 'string') {
                        errorMsg = data['error'] + "\nAdd the Lichess Token and try again.";
                    } else {
                        for (const key in data['error']) {
                            if (Object.hasOwnProperty.call(data['error'], key)) {
                                errorMsg += (key + ': ' + data['error'][key] + '\n')
                            }
                        }
                    }

                    alert("Error creating tournament! Error = " + errorMsg);
                    return;
                } else {
                    // Hide submit button
                    document.getElementById('submitButton').hidden = true;
                }


                createMessages(data.id)
            })
        });

}