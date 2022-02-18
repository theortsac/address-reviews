// SPDX-License-Identifier: MIT

pragma solidity 0.8.11;

contract AddressReviews {
    struct Review {
        uint stars;
        string message;
    }

    mapping(address => Review[]) addressToReviews;

    function writeReview(address _reviewed, uint _stars, string calldata _message) public {
        require(_stars >= 1, "The stars value needs to be equal or greater than 1.");
        require(_stars <= 5, "The stars value needs to be equal or less than 5.");
        require(msg.sender != _reviewed, "You can't write a review about yourself.");
        addressToReviews[_reviewed].push(Review(_stars, _message));
    }

    function seeReviews(address _reviewed) public view returns(Review[] memory) {
        return addressToReviews[_reviewed];
    }
}