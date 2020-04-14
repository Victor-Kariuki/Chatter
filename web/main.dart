import 'dart:html';

void main() {
  // selectors
  var signInForm = querySelector('#signInForm');
  var validationMessage = signInForm.querySelector('p.help');
  var notificationBox = querySelector('.notification');
  ButtonElement notificationButton = notificationBox.querySelector('.delete');
  InputElement usernameField = signInForm.querySelector('input[type="text"]');
  ButtonElement submitButton = signInForm.querySelector('button');

  // event listeners
  usernameField.addEventListener('input', (event) {
    /**
     * TODO: Run field vaildation
     */
  });

  submitButton.addEventListener('click', (event) async {
    // TODO: Run name field validation
    // TODO: Submit name field to backend
    // TODO: Handle success response
    // TODO: Handle failure responses
  });
}
