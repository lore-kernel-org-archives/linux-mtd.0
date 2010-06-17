Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OPKsD-0001G8-Nm
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2010 19:35:38 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: nand_ids.c: added two entries for NAND chips
Date: Thu, 17 Jun 2010 12:35:11 -0700
Message-ID: <1276803311-6361-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Included the basic size info for NAND chips with ID of 0xAD or
0xD7. The first can be found in Hynix HY27SF161G2M, while the
second can be found in Micron MT29F64G08 and the Samsung K9LBG08U0D
(among others). Also, some 64 Gbit (or larger) chips identify as
0xD7 because they contain multiple smaller 32 Gbit chips. I
assume it's safe to classify these under the 32 Gbit listing.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_ids.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 89907ed..a04b891 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -85,6 +85,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"NAND 128MiB 3,3V 8-bit",	0xD1, 0, 128, 0, LP_OPTIONS},
 	{"NAND 128MiB 1,8V 16-bit",	0xB1, 0, 128, 0, LP_OPTIONS16},
 	{"NAND 128MiB 3,3V 16-bit",	0xC1, 0, 128, 0, LP_OPTIONS16},
+	{"NAND 128MiB 1,8V 16-bit",     0xAD, 0, 128, 0, LP_OPTIONS16},
 
 	/* 2 Gigabit */
 	{"NAND 256MiB 1,8V 8-bit",	0xAA, 0, 256, 0, LP_OPTIONS},
@@ -110,6 +111,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
 	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
 
+	/* 32 Gigabit */
+	{"NAND 4GiB 3,3V 8-bit",	0xD7, 0, 4096, 0, LP_OPTIONS16},
+
 	/*
 	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
 	 * have a strange page/block layout !  The chosen minimum erasesize is
-- 
1.7.1
