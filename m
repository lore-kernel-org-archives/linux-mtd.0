Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hXV-0002mS-Gs
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:18:26 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH v2 06/13] nand/fsmc: Initialize the badblockbits to 7
Date: Wed, 14 Mar 2012 11:47:12 +0530
Message-ID: <900367e4195091bb17bbba2f996680b9d0bece16.1331705527.git.vipin.kumar@st.com>
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

Ideally, the block should have 0xff written on the bad block position. Any value
other than 0xff implies a bad block. In practical situations, there can be
bit flips in the oob area as well which means that a block with 0x7f being read
at bad block position may imply a bad block but it is infact only a bit flip in
the bad block byte.

To resolve this problem, the block is marked as good if number of high bits is
greater than or equal to badblockbits (initialized to 7)

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 745db62..bfc924f 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -802,6 +802,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->ecc.size = 512;
 	nand->options = pdata->options;
 	nand->select_chip = fsmc_select_chip;
+	nand->badblockbits = 7;
 
 	if (pdata->width == FSMC_NAND_BW16)
 		nand->options |= NAND_BUSWIDTH_16;
-- 
1.7.0.4
