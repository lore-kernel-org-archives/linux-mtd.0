Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWAsl-0005jY-Te
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 01:29:02 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v5 1/6] mtd: rawnand: marvell: Handle on-die ECC
Date: Fri, 22 Jun 2018 13:28:30 +1200
Message-Id: <20180622012835.17874-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180622012835.17874-1-chris.packham@alliedtelesis.co.nz>
References: <20180622012835.17874-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From the controllers point of view this is the same as no or
software only ECC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---

Notes:
    Changes in v2:
    - New
    Changes in v3:
    - Add review from Boris
    Changes in v4:
    - None
    Changes in v5:
    - None

 drivers/mtd/nand/raw/marvell_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index ebb1d141b900..ba6889bbe802 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2157,6 +2157,7 @@ static int marvell_nand_ecc_init(struct mtd_info *mtd,
 		break;
 	case NAND_ECC_NONE:
 	case NAND_ECC_SOFT:
+	case NAND_ECC_ON_DIE:
 		if (!nfc->caps->is_nfcv2 && mtd->writesize != SZ_512 &&
 		    mtd->writesize != SZ_2K) {
 			dev_err(nfc->dev, "NFCv1 cannot write %d bytes pages\n",
-- 
2.17.1
