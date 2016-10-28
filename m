Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0DlU-0006Qq-3B
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 20:28:37 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/5] mtd: nand: set bb_per_lun and blocks_per_lun for ONFI
 compliant chips
Date: Fri, 28 Oct 2016 15:27:44 -0500
Message-ID: <1477686464-7437-6-git-send-email-zach.brown@ni.com>
In-Reply-To: <1477686464-7437-1-git-send-email-zach.brown@ni.com>
References: <1477686464-7437-1-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ONFI compliant chips contain the values for the bb_per_lun and
blocks_per_lun fields in the parameter page. When the ONFI paged is
retrieved/parsed the chip's fields are set by the corresponding fields
in the param page.

Signed-off-by: Zach Brown <zach.brown@ni.com>
---
 drivers/mtd/nand/nand_base.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ed8dc89..c4ced91 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3619,6 +3619,11 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	if (p->jedec_id == NAND_MFR_MICRON)
 		nand_onfi_detect_micron(chip, p);
 
+	if (p->bb_per_lun)
+		chip->bb_per_lun = p->bb_per_lun;
+	if (p->blocks_per_lun)
+		chip->blocks_per_lun = p->blocks_per_lun;
+
 	return 1;
 }
 
-- 
2.7.4
