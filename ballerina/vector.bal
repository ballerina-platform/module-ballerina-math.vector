// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
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


# Calculates the l1 and l2 norm of a float vector.
#
# ```ballerina
# float[] vector1 = [1.0, 2.0, 3.0];
# vectorNorm(vector1, "l2") ⇒ 3.7416573867739413
# vectorNorm(vector1, "l1") ⇒ 6.0
# ```
#
# + vector1 - float vector to operate on
# + norm - norm type to calculate out of ["l1", "l2"]
# + return - the l1 or l2 norm of the given float vector
function vectorNorm(float[] vector1, string norm = "l2") returns float {

    if norm == "l2" {
        float magnitudeSquared = 0.0;
        foreach int i in 0 ..< vector1.length(){
            magnitudeSquared += (<float>vector1[i]).pow(2);
        }
        return (<float>magnitudeSquared).sqrt();
    }
    else if norm == "l1" {
        float absoluteMagnitude = 0.0;
        foreach int i in 0 ..< vector1.length(){
            absoluteMagnitude += (<float>vector1[i]).abs();
        }
        return absoluteMagnitude;
    }
    else {
        panic error("The selected norm type is not implemented");
    }
}

# Calculates the dot product of two float vectors.
#
# ```ballerina
# float[] vector1 = [1.0, 2.0, 3.0];
# float[] vector2 = [4.0, 5.0, 6.0];
# dotProduct(vector1, vector2) ⇒ 32.0
# ```
#
# + vector1 - float vector 1
# + vector2 - float vector 2
# + return - the dot product of the given two vectors
function dotProduct(float[] vector1, float[] vector2) returns float {

    if vector1.length() != vector2.length() {
        panic error("Lengths of the two vectors should match for calculating the dot product");
    }
    else {
        float dotProduct = 0.0;
        foreach int i in 0 ..< vector1.length(){
            dotProduct += vector1[i] * vector2[i];
        }
        return dotProduct;
    }
}

# Calculates the cosine similarity between two float vectors.
#
# ```ballerina
# float[] vector1 = [1.0, 2.0, 3.0];
# float[] vector2 = [4.0, 5.0, 6.0];
# cosineSimilarity(vector1, vector2) ⇒ 0.9746318461970762
# ```
#
# + vector1 - float vector 1
# + vector2 - float vector 2
# + return - the cosine similarity between the given two vectors
function cosineSimilarity(float[] vector1, float[] vector2) returns float {

    float vector1Norm = vectorNorm(vector1, norm = "l2");
    float vector2Norm = vectorNorm(vector2, norm = "l2");

    if vector1Norm == 0.0 || vector2Norm == 0.0 {
        panic error("Cosine similarity is undefined for zero vectors");
    }
    else {
        return dotProduct(vector1, vector2) / (vector1Norm * vector2Norm) ;
    }
}

# Calculates the euclidean distance between two float vectors.
#
# ```ballerina
# float[] vector1 = [1.0, 2.0, 3.0];
# float[] vector2 = [4.0, 5.0, 6.0];
# euclideanDistance(vector1, vector2) ⇒ 5.196152422706632
# ```
#
# + vector1 - float vector 1
# + vector2 - float vector 2
# + return - the euclidean distance between the given two vectors
function euclideanDistance(float[] vector1, float[] vector2) returns float {

    if vector1.length() != vector2.length() {
        panic error("Lengths of the two vectors should match for calculating the euclidean distance");
    }
    else{
        float differenceSquared = 0.0;
        foreach int i in 0 ..< vector1.length(){
            differenceSquared += (<float>(vector1[i]-vector2[i])).pow(2);
        }
        return (<float>differenceSquared).sqrt();
    }
}

# Calculates the manhattan distance between two float vectors.
#
# ```ballerina
# float[] vector1 = [1.0, 2.0, 3.0];
# float[] vector2 = [4.0, 5.0, 6.0];
# manhattanDistance(vector1, vector2) ⇒ 9.0
# ```
#
# + vector1 - float vector 1
# + vector2 - float vector 2
# + return - the manhattan distance between the given two vectors
function manhattanDistance(float[] vector1, float[] vector2) returns float {

    if vector1.length() != vector2.length() {
        panic error("Lengths of the two vectors should match for calculating the manhattan distance");
    }
    else{
        float absoluteDifference = 0.0;
        foreach int i in 0 ..< vector1.length(){
            absoluteDifference += (<float>(vector1[i]-vector2[i])).abs();
        }
        return absoluteDifference;
    }
}