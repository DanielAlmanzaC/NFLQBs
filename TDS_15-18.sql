SELECT CASE 
    WHEN S5.PLAYER IS NOT NULL
        THEN S5.PLAYER
        WHEN S5.PLAYER IS NULL
            THEN COALESCE(S6.PLAYER,S7.PLAYER)
            WHEN S6.PLAYER IS NULL
                THEN COALESCE(S7.PLAYER,S8.PLAYER)
                WHEN S7.PLAYER IS NULL
                    THEN COALESCE(S8.PLAYER,S7.PLAYER)
    ELSE COALESCE(S6.PLAYER,S5.PLAYER)
END as NAME,
COALESCE(S5.TD,0) AS TD5,COALESCE(S6.TD,0) AS TD6,
COALESCE(S7.TD,0) AS TD7,COALESCE(S8.TD,0) AS TD8,
(COALESCE(S5.TD,0)+COALESCE(S6.TD,0)+COALESCE(S7.TD,0)+COALESCE(S8.TD,0)) AS TOTAL_TD FROM NFL.S2015 AS S5
LEFT JOIN NFL.S2018 AS S8
ON S8.PLAYER = S5.PLAYER
LEFT JOIN NFL.S2016 AS S6
ON S6.PLAYER = S8.PLAYER
LEFT JOIN NFL.S2017 AS S7
ON S7.PLAYER = S6.PLAYER

UNION

SELECT CASE 
    WHEN S5.PLAYER IS NOT NULL
        THEN S5.PLAYER
        WHEN S5.PLAYER IS NULL
            THEN COALESCE(S6.PLAYER,S7.PLAYER)
            WHEN S6.PLAYER IS NULL
                THEN COALESCE(S7.PLAYER,S8.PLAYER)
                WHEN S7.PLAYER IS NULL
                    THEN COALESCE(S8.PLAYER,S7.PLAYER)
    ELSE COALESCE(S6.PLAYER,S5.PLAYER)
END as NAME,
COALESCE(S5.TD,0) AS TD5,COALESCE(S6.TD,0) AS TD6,
COALESCE(S7.TD,0) AS TD7,COALESCE(S8.TD,0) AS TD8,
(COALESCE(S5.TD,0)+COALESCE(S6.TD,0)+COALESCE(S7.TD,0)+COALESCE(S8.TD,0)) AS TOTAL_TD FROM NFL.S2015 AS S5
RIGHT JOIN NFL.S2018 AS S8
ON S8.PLAYER = S5.PLAYER
RIGHT JOIN NFL.S2016 AS S6
ON S6.PLAYER = S8.PLAYER
RIGHT JOIN NFL.S2017 AS S7
ON S7.PLAYER = S6.PLAYER


#WHERE S5.TD>25 OR S6.TD>25 OR S7.TD>25 OR S8.TD>25 OR S5.TD>25 OR S5.TD>25 OR S7.TD>25 OR S8.TD>25 OR S9.TD>25 OR S50.TD>25 OR S51.TD>25
ORDER BY TOTAL_TD DESC



