Received: from protonic.xs4all.nl ([83.163.252.89])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wxvol-00064p-17
 for linux-mtd@lists.infradead.org; Fri, 20 Jun 2014 10:13:11 +0000
From: David Jander <david@protonic.nl>
To: linux-mtd@lists.infradead.org
Subject: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung E-die SLC
 NAND
Date: Fri, 20 Jun 2014 12:12:17 +0200
Message-Id: <1403259137-22171-1-git-send-email-david@protonic.nl>
Cc: sjhill@realitydiluted.com, tglx@linutronix.de,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, David Jander <david@protonic.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Samsung E-die SLC NAND doesn't support partial writes anymore and there
seems to be no other way of detecting this than looking at bits 0 & 1
of the 5th ID byte. Those bits were "reserved" and 00 for all older
chips. On E-die chips, "01" seems to indicate 21nm feature size. This
patch assumes that all later revisions (if they will ever come) will have
this characteristic as well and disables sub-page writes in this case.

Signed-off-by: David Jander <david@protonic.nl>
---
 drivers/mtd/nand/nand_base.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 41167e9..e68e0c7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3468,6 +3468,16 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 			mtd->oobsize = 32 * mtd->writesize >> 9;
 		}
 
+		/*
+		 * Samsung E-die SLC NAND doesn't support partial writes
+		 * anymore. The only way to distinguish this die-revision
+		 * is by checking bits 0 and 1 of id_data[4], which seem
+		 * to indicate feature size (previous => 00, 21nm => 01).
+		 */
+		if (id_data[0] == NAND_MFR_SAMSUNG && nand_is_slc(chip) &&
+				(id_data[4] & 0x03) /* 21nm or newer */) {
+			chip->options |= NAND_NO_SUBPAGE_WRITE;
+		}
 	}
 }
 
-- 
1.9.1
