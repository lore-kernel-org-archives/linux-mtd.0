Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjgUR-0006Vm-AL
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 22:43:12 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/nand: Spansion S30MLxxxP support
Date: Thu, 12 Aug 2010 15:42:38 -0700
Message-ID: <1281652958-2354-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@broadcom.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some Spansion chips have a method for determining eraseblock size that
is incompatible with similar ID chips of other sizes. This implements
some heuristic detection of these differences.

Note that I am unsure about the wraparound nature of the ID string here.
I have not been able to fully test this with the physical chip.
Essentially, the rule is correct, but the ID string detection may fail
here. Let me know if anyone can fix this.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7473..66f4412 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2899,6 +2899,17 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
+		if (*maf_id == NAND_MFR_AMD && id_data[5] == 0x01 &&
+				id_data[6] == 0x01)
+			mtd->erasesize = (128 * 1024) << ((id_data[3] & 0x03)
+					<< 1);
 	}
 
 	/* Try to identify manufacturer */
-- 
1.7.0.4
