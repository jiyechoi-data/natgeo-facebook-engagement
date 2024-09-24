# Facebook “National Geographic” Engagement Analysis


```markdown
# Facebook "National Geographic" Engagement Analysis

This project analyzes the engagement patterns of the "National Geographic" Facebook page by applying text mining techniques, such as word cloud generation, clustering, and topic modeling. The analysis aims to identify key themes, frequent topics, and clusters of related words, providing insights into the page’s content and audience interaction.

## Table of Contents
1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [How to Run the Project](#how-to-run-the-project)
4. [Required Libraries](#required-libraries)
5. [Analysis Methods](#analysis-methods)
6. [Key Findings](#key-findings)
7. [Results](#results)
8. [Project Link](#project-link)

## Overview

The goal of this project is to analyze the engagement patterns of posts on the "National Geographic" Facebook page using text mining techniques. We collected up to 2000 posts, cleaned the text, and performed various analyses, including:
- Word Cloud generation to visualize frequent words.
- Clustering (Hierarchical) to identify groups of related words.
- Topic Modeling using Latent Dirichlet Allocation (LDA) to extract 10 main topics.

The analysis was conducted using **R** and several text mining libraries.

## Project Structure

This repository is organized as follows:


```plaintext
stat4-project/
│
├── README.md               # Overview of your project (this file)
├── scripts/                # All scripts for analysis
│   ├── Facebook_analysis.R  # Main R script for Facebook analysis
├── images/                 # Generated images from the analysis
│   ├── barchart_facebook.png
│   ├── dendrogram_facebook.png
│   ├── topicmodeling_facebook.png
│   └── wordcloud_facebook.png
```

- **scripts/**: Contains the R scripts used for analysis.
- **images/**: Contains images generated from the analysis.

## How to Run the Project

### 1. Clone the repository:

First, clone this repository to your local machine:

```bash
git clone https://github.com/jiyechoi-data/stat4-project.git
cd stat4-project
```

### 2. Install the required libraries:

The following R libraries are required for this project. You can install them by running the command below in your R environment:

```r
install.packages(c("tm", "Rfacebook", "wordcloud", "SnowballC", "lda"))
```

### 3. Update the API Token:

In the `scripts/Facebook_analysis.R` file, replace `YOUR_FACEBOOK_API_TOKEN` with your personal Facebook API token to access the posts:

```r
token <- "YOUR_FACEBOOK_API_TOKEN"
N_timeline <- getPage(page = "NatGeo", token, n = 2000)
```

### 4. Run the Analysis:

Once the necessary libraries are installed and the API token is updated, you can run the script:

- Open `scripts/Facebook_analysis.R` in RStudio or another R environment.
- Execute the code to perform text cleaning, word cloud generation, clustering, and topic modeling.

## Required Libraries

The following R libraries are required to run the analysis:

- **tm**: For text mining and preprocessing.
- **Rfacebook**: For accessing Facebook's Graph API.
- **wordcloud**: For generating word clouds.
- **SnowballC**: For stemming words.
- **lda**: For performing Latent Dirichlet Allocation (LDA) for topic modeling.

## Analysis Methods

1. **Data Collection**: 
   - Used the Facebook API to extract up to 2000 posts from the National Geographic Facebook page.
   - Text was cleaned by converting to lowercase, removing punctuation, numbers, and stopwords, and applying additional filters to remove unnecessary words.

2. **Word Cloud**: 
   - A word cloud was generated using term-document matrices to visualize the most frequently used words.

3. **Bar Plot**: 
   - A bar chart was created to display the frequency of words that appeared more than 40 times.

4. **Clustering**: 
   - Hierarchical clustering was applied to group similar words, visualized through a dendrogram.

5. **Topic Modeling**: 
   - Latent Dirichlet Allocation (LDA) was used to extract 10 key topics from the posts.

## Key Findings

- The most frequent words included “photo,” “image,” “world,” and “animal,” reflecting National Geographic’s focus on photography and wildlife.
- Clustering revealed related words grouped into distinct themes, and LDA modeling highlighted topics like wildlife conservation, travel, and photography.
- Posts with the highest engagement were typically related to wildlife and conservation efforts.

## Results

The results of the analysis, including word clouds, dendrograms, and topic modeling outputs, are available in the **images/** folder. These include:
- **Word Cloud**: A visualization of the most frequent words used in the posts.
- **Bar Plot**: A bar chart showing the frequency of words.
- **Dendrogram**: A hierarchical clustering of terms.
- **Topic Modeling**: An overview of the key topics identified using LDA.

## Project Link

The full code for this project, including data collection, text cleaning, word cloud generation, clustering, and topic modeling, is available on [GitHub](https://github.com/jiyechoi-data/natgeo-facebook-engagement/blob/main/scripts/Facebook_analysis.R).
