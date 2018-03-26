import { mongodb_chartTitle, mongodb_urlPrefix, mongodb_rawData } from './mongodb.js';
import { clojure_chartTitle, clojure_urlPrefix, clojure_rawData } from './clojure.js';
import { kubernetes_chartTitle, kubernetes_urlPrefix, kubernetes_rawData } from './kubernetes.js';
import { linux_chartTitle, linux_urlPrefix, linux_rawData } from './linux.js';
import { spring_chartTitle, spring_urlPrefix, spring_rawData } from './spring.js';
import { vscode_chartTitle, vscode_urlPrefix, vscode_rawData } from './vscode.js';

export const allData = {
    mongodb: {chartTitle: mongodb_chartTitle, urlPrefix: mongodb_urlPrefix, rawData: mongodb_rawData},
    clojure: {chartTitle: clojure_chartTitle, urlPrefix: clojure_urlPrefix, rawData: clojure_rawData},
    kubernetes: {chartTitle: kubernetes_chartTitle, urlPrefix: kubernetes_urlPrefix, rawData: kubernetes_rawData},
    linux: {chartTitle: linux_chartTitle, urlPrefix: linux_urlPrefix, rawData: linux_rawData},
    spring: {chartTitle: spring_chartTitle, urlPrefix: spring_urlPrefix, rawData: spring_rawData},
    vscode: {chartTitle: vscode_chartTitle, urlPrefix: vscode_urlPrefix, rawData: vscode_rawData},
}
