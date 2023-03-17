// Copyright (c) 2023 WSO2 LLC (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;

@test:Config {}
isolated function testVectorNormL1() {
    float[] v = [1.0, -2.5, 3.2, -6.8, 4.9];
    float actualValue = vectorNorm(v, L1);
    test:assertEquals(actualValue, 18.4, msg = "Float values are not equal");
}

@test:Config {}
isolated function testVectorNormL2() {
    float[] v = [1.0, -2.5, 3.2, -6.8, 4.9];
    float actualValue = vectorNorm(v, L2); 
    test:assertEquals(actualValue, 9.366963221877196, msg = "Float values are not equal");
}

@test:Config {}
isolated function testDotProduct() {
    float[] v1 = [1.0, -2.5, 3.2, -6.8, 4.9];
    float[] v2 = [4.3, 0.8, -1.5, -9.6, 2.0];
    float actualValue = dotProduct(v1, v2); 
    test:assertEquals(actualValue, 72.58, msg = "Float values are not equal");
}

@test:Config {}
isolated function testCosineSimilarity() {
    float[] v1 = [1.0, -2.5, 3.2, -6.8, 4.9];
    float[] v2 = [4.3, 0.8, -1.5, -9.6, 2.0];
    float actualValue = cosineSimilarity(v1, v2); 
    test:assertEquals(actualValue, 0.7147025072290608, msg = "Float values are not equal");
}

@test:Config {}
isolated function testEuclideanDistance() {
    float[] v1 = [1.0, -2.5, 3.2, -6.8, 4.9];
    float[] v2 = [4.3, 0.8, -1.5, -9.6, 2.0];
    float actualValue = euclideanDistance(v1, v2); 
    test:assertEquals(actualValue, 7.753708789992052, msg = "Float values are not equal");
}

@test:Config {}
isolated function testManhattanDistance() {
    float[] v1 = [1.0, -2.5, 3.2, -6.8, 4.9];
    float[] v2 = [4.3, 0.8, -1.5, -9.6, 2.0];
    float actualValue = manhattanDistance(v1, v2); 
    test:assertEquals(actualValue, 17.0, msg = "Float values are not equal");
}
