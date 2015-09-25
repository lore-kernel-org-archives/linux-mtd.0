Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfUhG-0004Ix-Gn
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 15:14:03 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?q?Bean=20Huo=20=E9=9C=8D=E6=96=8C=E6=96=8C=20=28beanhuo=29?=
 <beanhuo@micron.com>,
 =?UTF-8?q?Karl=20Zhang=20=E5=BC=A0=E5=8F=8C=E9=94=A3=20=28karlzhang=29?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 2/5] mtd: nand: return -EROFS in case of power-cut emulation
Date: Fri, 25 Sep 2015 17:09:15 +0200
Message-Id: <1443193758-22071-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that we are able to emulate power-cuts, we should differentiate the
power-cut emulation and input/output error cases to let the MTD user
decide what it should do.
EROFS was chosen to mimic what's done in UBI when a power-cut emulation
occurs.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a621814..223aabdb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1951,6 +1951,9 @@ static int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
 
 	status = chip->waitfunc(mtd, chip);
 
+	if (unlikely(status & NAND_STATUS_POWER_CUT))
+		return -EROFS;
+
 	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }
 
@@ -2009,6 +2012,8 @@ static int nand_write_oob_syndrome(struct mtd_info *mtd,
 
 	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
 	status = chip->waitfunc(mtd, chip);
+	if (unlikely(status & NAND_STATUS_POWER_CUT))
+		return -EROFS;
 
 	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }
@@ -2442,6 +2447,9 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			status = chip->errstat(mtd, chip, FL_WRITING, status,
 					       page);
 
+		if (unlikely(status & NAND_STATUS_POWER_CUT))
+			return -EROFS;
+
 		if (status & NAND_STATUS_FAIL)
 			return -EIO;
 	} else {
@@ -2868,7 +2876,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    int allowbbt)
 {
-	int page, status, pages_per_block, ret, chipnr;
+	int page, status = 0, pages_per_block, ret, chipnr;
 	struct nand_chip *chip = mtd->priv;
 	loff_t len;
 
@@ -2958,7 +2966,12 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 
 erase_exit:
 
-	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;
+	if (instr->state == MTD_ERASE_DONE)
+		ret = 0;
+	else if (unlikely(status & NAND_STATUS_POWER_CUT))
+		ret = -EROFS;
+	else
+		ret = -EIO;
 
 	/* Deselect and wake up anyone waiting on the device */
 	chip->select_chip(mtd, -1);
-- 
1.9.1
