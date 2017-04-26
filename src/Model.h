
#ifndef MODEL_H_
#define MODEL_H_

#include "globals.h"
#include "Data.h"

class Model {

public:

	Model();

	Model(Data* data,
			size_t order,
			std::vector<size_t> features,
			double alpha,
			std::vector<std::ostream*> v_levels);

	virtual ~Model();

	virtual void fit() = 0;

	virtual void predict() = 0;

	std::vector<uint> getObservationsInCell() const;
	std::vector<uint> getObservationsOutCell() const;
	std::vector<double> getCellStatistics() const;
	std::vector<double> getCellPValues() const;
	std::vector<int> getCellLabels() const;
	double getModelStatistic() const;
	double getModelPValue() const;
	size_t getOrder() const;
	std::vector<size_t> getFeatures() const;
	size_t getNumObservations() const;
	double getAlpha() const;

protected:

	// Pointer to original data
	Data* data;

	// Interaction order
	size_t order;

	// Features used in this feature model
	std::vector<size_t> features;

	// Total observations
	size_t n;

	// Significance threshold for cell labels
	double alpha;

	// Total observations per genotype combination
	std::vector<uint> in_cell;

	// Total observations in all other genotype combinations per genotype combination
	std::vector<uint> out_cell;

	// Test statistic per cell
	std::vector<double> cell_statistics;

	// P value per cell
	std::vector<double> cell_pvalues;

	// Cell label
	std::vector<int> cell_labels;

	// Test statistic of model
	double statistic;

	// P value of model
	double pvalue;

	// Get counts per cell
	virtual void getCounts() = 0;

	// Classify cells
	virtual void classifyCells() = 0;

	// Calculate model test statistic
	virtual void calculateModelTestStatistic() = 0;

	// Verbose streams
	std::vector<std::ostream*> v_levels;

private:
	DISALLOW_COPY_AND_ASSIGN(Model);

};

// Comparisons of feature models
struct CmpModelPtrs {
	bool operator()(const Model* lhs, const Model* rhs) const {
		return lhs->getModelStatistic() > rhs->getModelStatistic();
	}
};

#endif /* MODEL_H_ */