Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAf2F-0003N5-66
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 15:04:47 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 3/3] mtd: nand: sunxi: Support ECC maximization
Date: Wed,  8 Jun 2016 17:04:24 +0200
Message-Id: <1465398264-8202-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Setup the maximum ECC config when NAND_ECC_MAXIMIZE is set.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 8dfcb65..21dad0b 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1814,6 +1814,35 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
 	if (!data)
 		return -ENOMEM;
 
+	if (ecc->options & NAND_ECC_MAXIMIZE) {
+		int bytes;
+
+		ecc->size = 1024;
+		nsectors = mtd->writesize / ecc->size;
+
+		/* Reserve 2 bytes for the BBM */
+		bytes = (mtd->oobsize - 2) / nsectors;
+
+		/* 4 non-ECC bytes are added before each ECC bytes section */
+		bytes -= 4;
+
+		/* and bytes has to be even. */
+		if (bytes % 2)
+			bytes--;
+
+		ecc->strength = bytes * 8 / fls(8 * ecc->size);
+
+		for (i = 0; i < ARRAY_SIZE(strengths); i++) {
+			if (strengths[i] > ecc->strength)
+				break;
+		}
+
+		if (!i)
+			ecc->strength = 0;
+		else
+			ecc->strength = strengths[i - 1];
+	}
+
 	if (ecc->size != 512 && ecc->size != 1024)
 		return -EINVAL;
 
-- 
2.7.4
