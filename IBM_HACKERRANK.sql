SELECT
  c.`name`,
  COALESCE(SUM(e.views), 0)  AS total_views,
  COALESCE(SUM(e.clicks), 0) AS total_clicks,
  CAST(
    CASE
      WHEN COALESCE(SUM(e.views), 0) = 0 THEN 0
      ELSE (COALESCE(SUM(e.clicks), 0) * 100.0) / COALESCE(SUM(e.views), 0)
    END AS DECIMAL(10,2)
  ) AS engagement_rate
FROM campaigns AS c
LEFT JOIN engagements AS e
  ON e.campaign_id = c.id
WHERE c.is_active = 1
GROUP BY c.id, c.`name`
ORDER BY engagement_rate DESC, c.`name` ASC;


----------------------------------------------------------------
def countSuspiciousPairs(timestamps, timeWindow):
    arr = sorted(timestamps)      # put times in order
    n = len(arr)
    r = 0                         # right pointer (window end)
    total = 0                     # answer

    for i in range(n):            # i = left pointer (window start)
        if r < i + 1:             # make sure r is to the right of i
            r = i + 1
        # push r right while the difference is small enough
        while r < n and arr[r] - arr[i] <= timeWindow:
            r += 1
        # now r is one step too far; valid partners are i+1 ... r-1
        total += (r - i - 1)

    return total
------------------------------------------------------------------ 