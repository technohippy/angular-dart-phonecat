part of phonecat;

@NgFilter(name: 'checkmark')
class PhonecatCheckmarkFilter {
  call(value) {
    return (value != null) && value ? '\u2713' : '\u2718';
  }
}
