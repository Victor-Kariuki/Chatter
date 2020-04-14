import 'dart:html';

void main() {
  // selectors
  var signInForm = querySelector('#signInForm');
  var validationBox = signInForm.querySelector('p.help');
  var notificationBox = querySelector('.notification');
  ButtonElement notificationButton = notificationBox.querySelector('.delete');
  InputElement userNameField = signInForm.querySelector('input[type="text"]');
  ButtonElement submitButton = signInForm.querySelector('button');

  // event listeners
  userNameField.addEventListener('input', (event) {
    if (userNameField.value.trim().isNotEmpty) {
      userNameField.classes
        ..removeWhere((className) => className == 'is-danger')
        ..add('is-success');
      validationBox.text = 'The username is available';
      validationBox.classes
        ..removeWhere((className) => className == 'has-text-danger')
        ..add('has-text-success');
    } else {
      userNameField.classes
        ..removeWhere((className) => className == 'is-success')
        ..add('is-danger');
    }
  });

  submitButton.addEventListener('click', (event) async {
    // 1. Validate name field
    if (userNameField.value.trim().isEmpty) {
      userNameField.classes.add('is-danger');
      validationBox.text = 'Please enter your username';
      validationBox.classes.add('has-text-danger');
      return;
    }
    submitButton.disabled = true;

    try {
      // prevent page from reloading
      event.preventDefault();
      var response = await HttpRequest.postFormData('http://localhost:4040/signin', {
        'username': userNameField.text
      });
      signInForm.hidden = true;
      notificationBox.hidden = false;
      notificationBox.text = 'Success';
    } catch (e) {
      submitButton
        ..disabled = false
        ..text = 'Failed to join chat. Try again?';
    }
    // TODO: Handle success response
    // TODO: Handle failure responses
  });
}
