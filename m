Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Om6lz-0006hS-F0
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2010 15:11:21 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd/nand: Spansion S30MLxxxP support
Date: Thu, 19 Aug 2010 08:11:02 -0700
Message-ID: <1282230662-25388-1-git-send-email-norris@broadcom.com>
In-Reply-To: <4C6BDA0E.2080404@spansion.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: gernot.hoyler@spansion.com, Kevin Cernekee <cernekee@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the help, I will add that.

I also don't know how I got confused thinking that the ID trails with
0x01 instead of 0x00. I think the following patch is a little more
robust. We need to be sure that chips don't accidentally get
misdetected as ORNAND.

Brian

---------------------------------------------------------------------

Some Spansion chips have a method for determining eraseblock size that
is incompatible with similar ID chips of other sizes. This implements
some heuristic detection of these differences.

This patch checks for a 5-byte ID with trailing zeros as well as a
512-byte page size to ensure that chips are not misdetected as the
S30MLxxxP ORNAND series.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7473..8bdcf64 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2899,6 +2899,18 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		mtd->writesize = type->pagesize;
 		mtd->oobsize = mtd->writesize / 32;
 		busw = type->options & NAND_BUSWIDTH_16;
+
+		/*
+		 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
+		 * some Spansion chips have erasesize that conflicts with size
+		 * listed in nand_ids table
+		 * Data sheet (5 byte ID): Spansion S30ML-P ORNAND (p.39)
+		 */
+		if (*maf_id == NAND_MFR_AMD && id_data[4] != 0x00 &&
+				id_data[5] == 0x00 && id_data[6] == 0x00 &&
+				id_data[7] == 0x00 && mtd->writesize == 512)
+			mtd->erasesize = (128 * 1024) << ((id_data[3] & 0x03)
+					<< 1);
 	}
 
 	/* Try to identify manufacturer */
-- 
1.7.0.4
