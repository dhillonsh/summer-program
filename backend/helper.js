function sanitize_input(input) {
    input = input.replaceAll(' ', '')

    return input
}
module.exports = sanitize_input;
