/* based on https://gist.github.com/DaBs/89ccc2ffd1d435efdacff05248514f38 */
var es6TestStr = 'class ಠ_ಠ extends Array {constructor(j = "a", ...c) {const q = (({u: e}) => {return { [`s${c}`]: Symbol(j) };})({});super(j, q, ...c);}}' +
    'new Promise((f) => {const a = function* (){return "\u{20BB7}".match(/./u)[0].length === 2 || true;};for (let vre of a()) {' +
    'const [uw, as, he, re] = [new Set(), new WeakSet(), new Map(), new WeakMap()];break;}f(new Proxy({}, {get: (han, h) => h in han ? han[h] ' +
    ': "42".repeat(0o10)}));}).then(bi => new ಠ_ಠ(bi.rd));';

try {
    eval(es6TestStr);
} catch(e) {
    alert('This page uses es6 features that may not be supported by your browser!')
}

/*
 * All credits to Netflix for providing this approach to ES6 feature detection. Although this could be written in many different ways
 * this proved to be the most direct and elegant approach for me.
 * License: MIT
 */
