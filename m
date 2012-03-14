Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hXO-0002kX-FT
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:18:19 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH v2 03/13] nand/fsmc: Correct the multiline comment format
Date: Wed, 14 Mar 2012 11:47:09 +0530
Message-ID: <e52d591cfda34e78382297213de880e0b081ff60.1331705527.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sr@denx.de, Vipin Kumar <vipin.kumar@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com
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
index ac45b41..fb2cc8b 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -545,10 +545,10 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
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
