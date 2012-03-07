Received: from eu1sys200aog105.obsmtp.com ([207.126.144.119])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6H-0006aO-7G
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:10 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/18] nand/fsmc: Read only 512 + 13 bytes for 8bit NAND
 devices
Date: Wed, 7 Mar 2012 17:00:58 +0530
Message-ID: <0cd134cccaff1fcde40d0535c263f63626f218a9.1331119143.git.vipin.kumar@st.com>
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

The ECC logic of FSMC works on 512 bytes data + 13 bytes ECC to generate error
indices of upto 8 incorrect bits. The FSMC driver reads 14 instead of 13 oob
bytes to accommodate for 16 bit device as well.

Unfortunately, the internal ecc state machine gets corrupted for 8 bit devices
reading 512 + 14 bytes of data resulting in error indices not getting reported.

Fix this by reading 14 bytes only for 16 bit devices

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 29be94c..5bc6410 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -717,7 +717,9 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 			 * to read at least 13 bytes even in case of 16 bit NAND
 			 * devices
 			 */
-			len = roundup(len, 2);
+			if (chip->options & NAND_BUSWIDTH_16)
+				len = roundup(len, 2);
+
 			chip->cmdfunc(mtd, NAND_CMD_READOOB, off, page);
 			chip->read_buf(mtd, oob + j, len);
 			j += len;
-- 
1.7.0.4
