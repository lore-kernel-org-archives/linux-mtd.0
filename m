Received: from eu1sys200aog106.obsmtp.com ([207.126.144.121])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsUQ6-0008UE-T0
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 06:11:27 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <Artem.Bityutskiy@nokia.com>, <David.Woodhouse@intel.com>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH] Newly erased page read workaround
Date: Thu, 24 Feb 2011 11:40:16 +0530
Message-ID: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, Viresh Kumar <viresh.kumar@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vipin Kumar <vipin.kumar@st.com>

A newly erased page contains ff in data as well as spare area. While reading an
erased page, the read out ecc from spare area does not match the ecc generated
by fsmc ecc hardware accelarator. This is because ecc of data ff ff is not ff
ff. This leads to errors when jffs2 fs erases and reads back the pages to
ensure consistency.

This patch adds a software workaround to ensure that the ecc check is not
performed for erased pages. An erased page is checked by checking data as ff ff.

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
Acked-by: Linus Walleij <linus.walleij@stericsson.com>
---
 drivers/mtd/nand/fsmc_nand.c |   28 ++++++++++++++++++++++------
 1 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 205b10b..7df270a 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -420,7 +420,7 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	struct fsmc_nand_data *host = container_of(mtd,
 					struct fsmc_nand_data, mtd);
 	struct fsmc_eccplace *ecc_place = host->ecc_place;
-	int i, j, s, stat, eccsize = chip->ecc.size;
+	int i, j, k, s, stat, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	int eccsteps = chip->ecc.steps;
 	uint8_t *p = buf;
@@ -460,11 +460,27 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 		memcpy(&ecc_code[i], oob, 13);
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 
-		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
-		if (stat < 0)
-			mtd->ecc_stats.failed++;
-		else
-			mtd->ecc_stats.corrected += stat;
+		/*
+		 * This is a temporary erase check. A newly erased page read
+		 * would result in an ecc error because the oob data is also
+		 * erased to FF and the calculated ecc for an FF data is not
+		 * FF..FF.
+		 * This is a workaround to skip performing correction in case
+		 * data is FF..FF
+		 */
+		for (k = 0; k < eccsize; k++) {
+			if (*(p + k) != 0xff)
+				break;
+		}
+
+		if (k < eccsize) {
+			stat = chip->ecc.correct(mtd, p, &ecc_code[i],
+					&ecc_calc[i]);
+			if (stat < 0)
+				mtd->ecc_stats.failed++;
+			else
+				mtd->ecc_stats.corrected += stat;
+		}
 	}
 
 	return 0;
-- 
1.7.2.2
