From: Viresh KUMAR <viresh.kumar@st.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH 29/74] Newly erased page read workaround
Date: Mon, 30 Aug 2010 16:13:57 +0530
Message-Id: <14ef1688494a02866ccc4aef068a296530708c98.1283161023.git.viresh.kumar@st.com>
In-Reply-To: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
References: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
In-Reply-To: <cover.1283161023.git.viresh.kumar@st.com>
References: <cover.1283161023.git.viresh.kumar@st.com>
Cc: pratyush.anand@st.com, Viresh Kumar <viresh.kumar@st.com>,
	vipulkumar.samar@st.com, bhupesh.sharma@st.com,
	armando.visconti@st.com, Vipin Kumar <vipin.kumar@st.com>,
	shiraz.hashim@st.com, rajeev-dlh.kumar@st.com, deepak.sikri@st.com
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
---
 drivers/mtd/nand/spear_nand.c |   28 ++++++++++++++++++++++------
 1 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spear_nand.c b/drivers/mtd/nand/spear_nand.c
index da9661b..5a31bde 100644
--- a/drivers/mtd/nand/spear_nand.c
+++ b/drivers/mtd/nand/spear_nand.c
@@ -381,7 +381,7 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	struct spear_nand_data *host = container_of(mtd,
 					struct spear_nand_data, mtd);
 	struct fsmc_eccplace *ecc_place = host->ecc_place;
-	int i, j, s, stat, eccsize = chip->ecc.size;
+	int i, j, k, s, stat, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	int eccsteps = chip->ecc.steps;
 	u8 *p = buf;
@@ -421,11 +421,27 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
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
