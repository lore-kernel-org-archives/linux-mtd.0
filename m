Received: from eu1sys200aog113.obsmtp.com ([207.126.144.135])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6J-0006at-7P
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:12 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/18] nand/fsmc: Correct the multiline comment format
Date: Wed, 7 Mar 2012 17:00:57 +0530
Message-ID: <7c94ac6623c184eab7ee02f353dcba1ea064481e.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index e9b2265..29be94c 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -713,10 +713,10 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 			group++;
 
 			/*
-			* length is intentionally kept a higher multiple of 2
-			* to read at least 13 bytes even in case of 16 bit NAND
-			* devices
-			*/
+			 * length is intentionally kept a higher multiple of 2
+			 * to read at least 13 bytes even in case of 16 bit NAND
+			 * devices
+			 */
 			len = roundup(len, 2);
 			chip->cmdfunc(mtd, NAND_CMD_READOOB, off, page);
 			chip->read_buf(mtd, oob + j, len);
-- 
1.7.0.4
