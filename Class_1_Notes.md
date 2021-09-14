# Class 1 Notes

## Teaching Philosophy- Practicality-driven:
- Understand your goals and backgrounds
- Status of the tech job market (DA, DS, MLE, SWE, PM)
- Start Slow (in 4-5 weeks, pick up pace)

## Code of conduct:
- Your first assignment: By Friday, send me an email on:
- Why you want to study data science and machine learning?
- Tell me your math, ML and coding background
- Set your goal by graduation

## Different levels of proficiency:
**Beginner:** You have some background knowledege in algebra/geometry/probability/calculus, but have little math training.  

**Moderate:** You have a background in math/stats, and know how ML algorithms work in general. You may have some working knowledge on how data and ML algorithms marry.  

**Advanced:** You can hardcode out basic ML algorithms such as KNN, K-means, GMM, PCA, Logisitic Regression. You generally know what models to use and what hyperparameters to tune on.  

**Mastered it Well:** You can hardcode ML algorithms such as decision trees, RF, DNN. You know exactly what potential problems are when an algorithm isn't working.  

**Kudos to you:** You can hardcode advanced ML algorithms such as CNN, LSTM, gradient boosting. You are at the frontier of ML dev stack.   

## Expectations:
1. You are expected to say "I don't understand. Please explain again."
2. You are expected to ask "Why does this matter? What are the applications in practice?"
3. You are expected to discuss with each other on and off the class. Explain your understanding to your fellow classmates, and raise and answer questions.
4. You are expected to review previous lectures at your own pace and make practice.
5. Every week, I will send out some short reading assignments (<1 hr/week). Textbook blocks, tech blogs, and/or youtube videos. You are expected to read/watch those.
6. You are expected to care much more about learning than grade. 

## Logistic Reg: Generalized Linear Reg
Decision Tree fits better with non-linear data.
Select Features? How?
PCA (100) -> (10)
Why PCA? Why 10?
How do you do PCA?
Correlation also reduces feature space
- Corr(X, y)
- Correlation Matrix to get a sense of relationships between independent/dependent variables.
- Make sure in Pandas, number of features is less than 20.

*Have to close the loop when you answer these questions*

### Data representation using matrices
Rows: Observations
Columns: Features
Any operation on data can be done with matrices

### Efficiency, simplicity and generalizability
- Cheap and fast to compute
- Easy to understand and do analysis with
- SPan from linear regression to DNN

### Why should DS care about linear algebra?

### Vectors and Matrices
What is a vector?
- Extension of single dimension real numbers (scalars) to high dimensions
(1, -2, 3.2) vs. 10

Representation of a point in the real space with respect to (0,0,0)...

*Scalar is a Scaling Vector*
(1,1,2) x 2 = (2,2,4)

Every scalar starts at the origin (0,0,0). 

## Matrices
- A bunch of vectors, BUT
- Matrices typically represent functions/mappings for vectors.
- E.g. M dot v becomes another vector or a scalar.

Linear algebra: Generalizing basic algebra to higher origins. 
