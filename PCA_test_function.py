############################### 
#Principal Component Analysis #
###############################
class PCA(object):
    def __init__(self, arry_, target_, features_):
        self.arry_ = arry_
        self.target_ = target_
        self.features_ = features_

        #Error Flag
        self.cannot_run = False
    
    #CHECK DIMENSIONS
    def dim(self):
        return self.arry_.shape, self.target_.shape

   #Data Check
    def check_obs(self):
    # if the number of observations is less than the number of parameters (bad)
        if (self.arry_.shape[0] < self.features_): 
            self.cannot_run = 1
            print("Data = False: Not enough data.")       
        else:
            print(f"Data = True: {self.arry_.shape[0]} observations > {self.features_} features")

    #CHECK IF INVERTIBLE
    def invertible(self):
        X = self.arry_
        
        if (np.linalg.det(np.dot(X.T,X)) == 0):
            self.cannot_run = True
            print("det(X'*X) = 0.  Not invertible")
            
        else:
            print("det(X'*X) = ", np.linalg.det(np.dot(X.T,X)),"Invertible")

    #f. collinearity
    def collinearity(self):
        X = self.arry_
        k = self.features_

        r = np.linalg.matrix_rank(np.dot(X.T,X))

        if (r == (k+1)):
            print("X'*X is a full rank matrix and is invertible. Just another way to check invertibility.")

        else:
            if (r == 1):
                print("Collinearity = True:","Perfect collinearity in X.")

            else:
                print("Collinearity = False:", "No collinearity in X.")

############################### 
#NORMALIZATION                #
###############################
    def normalize_x(self) -> np.array:
        # Normalize x 
        x = self.arry_
        x_norm = np.zeros(shape=x.shape)
        n = self.arry_.shape[1]

        for j in range (1, n + 1):
            xj_min = min(x[:, j-1])
            xj_max = max(x[:, j-1])
            
            for i in range(1,n+1):
                x_norm[i-1,j-1] = (x[i-1,j-1] - xj_min) / (xj_max  - xj_min)

        #Save x_norm
        self.x_norm = x_norm

        #Return x_norm
        return x_norm
        
    def normalize_y(self) -> np.array:
        y = self.target_

        y_max = max(self.target_)
        y_min = min(self.target_)

        if (abs(y_max-y_min) > np.finfo(float).eps):
            y_norm = (y - y_min)  / (y_max - y_min)
        
        #Return y_norm
            return y_norm

        #Save y_norm
            self.y_norm = y_norm

        else:
            self.cannot_run = True
            return "Cannot Normalize y"

############################### 
#PCA FUNCTIONS                #
###############################
    def check_all(self) -> str:
        #Run the three checks for data
        '''
        self.check_obs()
        self.collinearity()
        '''
        self.invertible()
        
        #Return a message if there is a data issue.
        if self.cannot_run == True:
            print("Data condition not ready for OLS.") #changed return to print as the use won't do anything with the text
            return False
        
        #Return a message if the data is OK.
        else:
            return True

    def run_pca(self, select_pca = 1, var_retain = 100):
        if type(select_pca) is not int:
            raise ValueError("Please enter an Int Value.")

        elif select_pca > self.num_features or select_pca < 0:
             print("Number of Components must be between 0 and Number of Features.")
             return False

        else:
            ret_features_pca = np.cumsum(eigval[np.argsort(eigval)[::-1]]/eigval.sum() * 100)[0:n]

    #PCT VAR Return
        if len(ret_features_num) >= len(ret_features_pct):
            pass
    
############################### 
#EIGENVALUES                  #
###############################
    def get_PC(self):
        data = self.arry_
        cov = np.dot((data - data.mean(axis = 0)).T,(data - data.mean(axis = 0)))/data.shape[0]
        return np.linalg.eig(cov)

    #EIGENVALUES FUNCTION
    def eigen_return(self):
        data_ = self.arry_
        self.eigval, self.eigvec = np.linalg.eig(np.dot((data_ - data_.mean(axis = 0)).T,(data_ - data_.mean(axis = 0)))/len(data_))
        return self.eigval, self.eigvec
    
    #COVARIANCE FUNCTION
    def covar(self):
        data_ = self.arry_
        return np.dot((data_ - data_.mean(axis = 0)).T,(data_ - data_.mean(axis = 0)))/len(data_)
    
    def eigen_pcts(self):
        self.eigen_return()
        eigval = self.eigval
        return np.cumsum(eigval[np.argsort(eigval)[::-1]]/eigval.sum() * 100)
