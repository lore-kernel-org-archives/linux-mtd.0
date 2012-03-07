Received: from eu1sys200aog120.obsmtp.com ([207.126.144.149])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6L-0006bY-7R
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:14 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/18] nand/fsmc: Initialize the badblockbits to 7
Date: Wed, 7 Mar 2012 17:01:00 +0530
Message-ID: <5010b19c2f3d653dde4cd243aa901fc57f25f910.1331119143.git.vipin.kumar@st.com>
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
index 9e9d90b..8b5000c 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -970,6 +970,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->ecc.size = 512;
 	nand->options = pdata->options;
 	nand->select_chip = fsmc_select_chip;
+	nand->badblockbits = 7;
 
 	if (pdata->width == FSMC_NAND_BW16)
 		nand->options |= NAND_BUSWIDTH_16;
-- 
1.7.0.4
