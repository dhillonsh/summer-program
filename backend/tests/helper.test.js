const sanitize_input = require('../helper');

test('string without sanitizing', () => {
  expect(sanitize_input("abcabc")).toBe("abcabc");
});

test('string with sanitizing', () => {
  expect(sanitize_input("   abc  a    b    c   ")).toBe("abcabc");
});
