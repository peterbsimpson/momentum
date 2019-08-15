## momentum

# Backtesting Stocks With a Momentum Strategy


Introduction:
According to, Eugene Fama, the 2014 co-recipient of the Nobel Prize in Economics and the father of the efficient market hypothesis, the premier anomaly in the efficient market hypothesis is momentum. Momentum is the rate of acceleration of a security’s price, and when a momentum trader sees the acceleration in a stock price, earnings, or revenues, the trader will often take a long or short position in the stock in the hope that its momentum will continue in either an upward or downward direction.


In the intermediate-term, highly ranked momentum stocks tend to outperform those with lower ranks. For the purpose of this study, the method used for finding equities and ranking them was made easier by using portfolio123.com’s stock screener and ranking system.

  Figure 1: Stock Screener

![Test Image 1](https://i.imgur.com/lFUDlEN.png)

The screener filtered out stocks with market capitalizations below $1.9 Billion and eliminated stocks whose percent change in price decreased over a 4, 13, and 26 week period. One of the challenges when screening for momentum is finding stocks whose returns are smooth. A study by Mith Awarachka concluded that the path that stock takes to get its final return is more important than the return itself in relation to a stock’s momentum. Firms with smooth, or “high-quality” momentum, tend to do better than those firms with choppy low-quality momentum. To select from the remaining 617 stocks left in the screen in figure 1, a ranking system based on the “Frog in the Pan” hypothesis was implemented and used to select the top 20 momentum stocks. 

![Test Image 1](https://i.imgur.com/GEyhYlw.png)

The variable that was calcualted to capture wether or not a stock is exhibiting smooth returns is denoted as ID. The cumulative return during the formation period is denoted as PRET. PRET is the sign of PRET is denoted sgn(PRET) and equals +1 when PRET >0 and -1 when PRET <0. ID which stands for information discreteness measures the relative frequency of small signals. A high ID means the returns are more discreet, and a small ID means returns are more continuous. Past winners most often had a high percentage of positive returns and few negative returns.

# Assumptions
By relying on the “Frog in Pan” hypothesis and momentum as a method for picking stocks there are multiple assumptions that the results will be dependent on. First, stocks with low ID values will produce continuous returns. Secondly, momentum is a good predictor of future performance. Thirdly these stocks will have smooth returns. The results of testing these assumptions will be found in the next section.

To test the assumptions that low-level ID stocks have continuous and “smooth” returns the variance of the stocks’ daily returns was calculated over the ranking period was compared to its return in the following months. The intuition behind this comparison is that if stock exhibits “smooth” and positive returns then it will also have a low variance. As shown in the figure below stocks with low variance overwhelmingly have positive returns, which implies that this assumption could be correct and provides the support that this momentum strategy could be used as a potential investment strategy.


Figure 5: Variance and 3-Month Returns
![Test Image 1](https://i.imgur.com/AP7mO3n.png)


1.3 Main Results and Findings


global minimum variance portfolio is y will outperform all other portfolios. However, the tangency returns are very close and are very similar to the global minimum variance portfolio. Additionally, by using the S&P500 denoted as (SPY) and the lowest line in Figure 3 it becomes easy to see how well the portfolios outperform the market over the course of the year.

Figures 3 & 4:Cumulative Returns & Percentage Return. The profits of all portfolios were reinvested quarterly

2. Financial Models
To answer the question if momentum can be used as a viable investment strategy, and if the strategy can be improved through portfolio optimization, four separate weight-adjusted portfolios were implemented and multiple assumptions needed to be tested. The first strategy used was the global minimum variance allocation strategy. GMV adjusted portfolios derive their weights based on risk, which is based on the variance of the assets expected returns. The second strategy created a portfolio based on the efficient frontier and was optimized to produce the highest Sharpe ratio possible. Theoretically, the portfolio should have the highest amount of risk-adjusted return possible. Together the GMV portfolio and the tangency portfolio generated the highest returns with an average of 30.42% which is double that of the benchmark market return of the S&P500. The third strategy, the custom strategy, used the positive or negative value of a stocks return over the six-month ranking period to determine if the stock would be shorted or held long. 




If a stock had a negative return over its six-month ranking period it would be shorted during the period when its returns would be measured. The intuition behind this strategy would is to rely on the past returns of stock to indicate the future performance of the asset. More data would be needed to prove that this strategy is effective and the results of its implementation are inconclusive. The final and worst preforming portfolio was an equally weighted portfolio. The purpose of using this model in the test would be to see what returns the portfolio would yield if the investment strategy was followed blindly and disregarded the risk returns structure that most diversified portfolios implement. This model performed surprisingly well and out preformed the S&P500 by 2.5%.


# Conclusion
The stock data that was manipulated by adjusting the weights of the portfolios, and testing the future returns based on past performance. The results showed that returns of a global minimum variance and tangency strategy can be viable options for investment strategies. This strategy’s also helped answer whether or not, a basic momentum strategy, which was represented by the equally weighted and the custom-weighted portfolios, could be improved through portfolio optimization.  The GMV portfolio and the tangency had an average return of 30.42% and outperformed a portfolio that was reinvested in the benchmark S&P500 by 225%. The profits of all the portfolios were reinvested each quarter to obtain the year-to-year returns. In order to fully confirm these results the models would need to be proven a year to year basis, however, the returns of the risk-adjusted GMV and sharpe ratio tangency portfolio offer positive support that these strategies could be used to yield positive alpha.


# Financial Data
The daily stock data from 1/07/15–12/30/16 for the 75 separate stocks that were used in this project were gathered through finance.jasonstrimpel.com where bulk stock data series of stocks could be obtained by uploading a .csv file of the desired stock tickers. 


