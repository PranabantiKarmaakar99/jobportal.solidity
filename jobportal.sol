//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract jobPortal{
     

      
     address public admin; 

     constructor() public{

         admin = msg.sender;

     }

     modifier onlyAdmin(){
       require(msg.sender == admin);

        _;

     }

    struct applicant {

       uint256 id;

        string name;
        string laborhistory;
        string skill;
        bool availibility;
        string location;
        uint8 age;
        string rating;


    }

    struct job {

    uint256 id;
    uint256 jobApplicant;
    string jobTitle;
    string skillType;
    string exp;
    string location;




    }

    mapping(uint256 => applicant ) public applicants;
    mapping(uint256 => job) public jobs;




//add new applicant

function newApplicantdetails (uint256 Applicantid,
                       string memory _name,
                        string memory _laborhistory,
                        string memory _skill,
                        bool _availibility,
                        string memory _location,
                        uint8 _age
                        
                       
                       
                       
                       
                       ) 
public onlyAdmin() {

applicants[Applicantid].name = _name;
applicants[Applicantid].laborhistory = _laborhistory;
applicants[Applicantid].skill = _skill;
applicants[Applicantid].availibility = _availibility;
applicants[Applicantid].location = _location;
applicants[Applicantid].age = _age;
applicants[Applicantid].rating = "";


}


//add new job

function newJob       (uint256 Jobid,
                       string memory _jobTitle,
                       
                      
                        string memory _skillType,
                        string memory _exp,
                        string memory _location
                       
                       
                       
                       
                       
                       ) 
public onlyAdmin() {

jobs[Jobid].jobTitle = _jobTitle;
jobs[Jobid].jobApplicant = 0;
jobs[Jobid].skillType = _skillType;
jobs[Jobid].exp = _exp;
jobs[Jobid].location = _location;



}

//getApplicantdetails

function getApplicantdetails (uint256 Applicantid) 
public view returns(
                    string memory name,
                    string memory laborhistory,
                    string memory skill,
                    bool availibility,
                    string memory location,
                    uint8 age
) 

{

return ( applicants[Applicantid].name,
        
        applicants[Applicantid].laborhistory,
        
        applicants[Applicantid].skill,
        
        applicants[Applicantid].availibility,
        
        applicants[Applicantid].location,
        
        applicants[Applicantid].age
       
       );


}


//getApplicantType

function getApplicantType (uint256 Applicantid) 
public view returns(
                   
                    string memory skill
                   
) 

{

return ( 
        
        applicants[Applicantid].skill
        
       
       
       );


}


//get job
function getJob (uint256 JobId) 
public view returns(
                    string memory jobTitle,
                    string memory skillType,
                    string memory exp,
                    string memory location
) 

{

return ( jobs[JobId].jobTitle,
         jobs[JobId].skillType,
         jobs[JobId].exp,
         jobs[JobId].location
       
       );


}

//apply for a job

function applyJob ( uint256  _Applicantid,
                     uint256 JobId)

public  {


 jobs[JobId].jobApplicant = _Applicantid;


}

//provide rating to applicant

function provideRating ( 
                         uint256 Applicantid,
                         string memory  _rating
                         
                         
                         
                         )

public  {


      applicants[Applicantid].rating = _rating;


}

//get rating of applicant


function getRating ( 
                         uint256 Applicantid)

public view returns(

string memory rating




)  {


      return(applicants[Applicantid].rating); 


}








}