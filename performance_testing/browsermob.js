var companies = [
  'BrowserMob',
  'Heroku',
  'Pusher',
  'MongoHQ',
  'Google Font API',
  'Ruby on Rails',
  'Futurice'
];

var praises = [
  ' is cool',
  ' ROCKS!',
  ' makes me dance',
  ' o vitu awesome',
  ' is pure sex',
  ' kicks ass...',
  ' #success',
  ': best the nerd can get',
  '... a love story',
  ': future is here'
];

var selenium = browserMob.openBrowser();

var timeout = 10000;
selenium.setTimeout(timeout);

var tx = browserMob.beginTransaction();

var step = browserMob.beginStep("Open existing notes page");
selenium.open("http://futu-stickies.heroku.com/notes");
browserMob.endStep();

browserMob.beginStep("Create a new note");
selenium.click("link=New Note");
selenium.waitForPageToLoad(timeout);
selenium.type("note_text", companies[Math.floor(Math.random()*companies.length)] + praises[Math.floor(Math.random()*praises.length)] + " [" + (browserMob.getUserNum()+1) + "]");
var color = ['yellow', 'green', 'purple'][Math.floor(Math.random()*3)];
selenium.select("note_color", "label=" + color);
browserMob.endStep();

browserMob.beginStep("Submit new note");
selenium.click("note_submit");
selenium.waitForPageToLoad(timeout);
browserMob.endStep();

browserMob.endTransaction();