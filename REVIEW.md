# TICKET-101 | Code Review

## Overview

This document is a summary of the code review for this project. This is a review for frontend code only. For backend code, please refer to the backend code review document here: [Backend Code Review](https://github.com/richardscull/inbank-backend-homework/blob/main/REVIEW.md).

## 🛠️ General

- The project is well-structured and easy to navigate.
- The code is clean and well-documented. (Not over-documented, but enough to understand the code).
- The project is responsive and works well for different systems.

### Code quality
The code is properly formatted and follows the best practices. Meaningful names are used for variables and functions, which is a good practice for code readability. Could argue that the code could be more modular, but it is not a big issue for this project. (A good practice is to keep components small and focused on a single task).

Test coverage is fine. API calls are tested, and that is the most important part. However, there are some components that are not tested. It would be good to add tests for those components as well.

### Performance
The project is fast and responsive. The images are optimized, and the code is well-structured. The project is not using any heavy libraries, which is good for performance.

### UI/UX
The project has a clean and modern design. The UI is intuitive and easy to use. The project is responsive and works well on different devices. The project is accessible and follows the best practices for accessibility.

## 📃 Things to improve
From my perspective, the project is well done. However, there are some things that could be improved:

- Design: The design is good, but it could be more polished. Adding some animations or transitions could make the project more engaging.

- Documentation: Improve git commit messages and slightly improve the README file. (Add more information about the project, how to run it, etc.). Splitting the commit to smaller ones would be a good thing to do as well.


## 🧱 Shortcomings

- Invalid minimum loan period as default. In the code was set to 6, but from the design, it should be 12. Fixed.
- `_submitForm()` function better having just one guard clause, not all conditions in the if statement. Also, the code parses the same value twice, which is not necessary. Fixed.
- `requestLoanDecision()` "null" handling is bad, null values should be null and not "null" string. Using optional chaining for `toString()` will get null values as `null`. It also lets us use the `??` operator, since `null` isn't a string. (Test was also updated to reflect this change). 
- `InBankForm()` function in main component was wrapped in `MaterialApp`, which is not necessary, since it is already wrapped in `MaterialApp`. Removed.
- Loan period slider divisions is not correct. `60-12=48`, not `40`. Fixed.
- `inbank-frontend-98f09aabec29a741365f750db29dfe606f20f0b2` folder should be removed from the repository, since it is not used anywhere in the project. Removed.

## 🚀 Conclusion

Intern did a great job with this project. The code is clean and well-structured. The project is responsive and works well on different devices. The project is fast and responsive. The UI is clean and modern. The project is accessible and follows the best practices for accessibility. There are some things that could be improved, but overall, the project is well done.

