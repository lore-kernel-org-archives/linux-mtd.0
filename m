Received: from mail-pb0-f45.google.com ([209.85.160.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WECdK-0007Su-Gi
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 06:52:23 +0000
Received: by mail-pb0-f45.google.com with SMTP id un15so11953926pbc.32
 for <linux-mtd@lists.infradead.org>; Thu, 13 Feb 2014 22:51:55 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: nand: s3c2410: Trivial cleanup in header file
Date: Fri, 14 Feb 2014 12:16:38 +0530
Message-Id: <1392360398-6650-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, computersforpeace@gmail.com, trivial@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 436d42c61c3e ("ARM: samsung: move platform_data definitions")
moved the files to the current location but forgot to remove the pointer
to its previous location. Clean it up. While at it also add the header
file protection macros appropriately.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 include/linux/platform_data/mtd-nand-s3c2410.h |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/platform_data/mtd-nand-s3c2410.h b/include/linux/platform_data/mtd-nand-s3c2410.h
index b64115fa93a4..36bb92172f47 100644
--- a/include/linux/platform_data/mtd-nand-s3c2410.h
+++ b/include/linux/platform_data/mtd-nand-s3c2410.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/nand.h
- *
+/*
  * Copyright (c) 2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
@@ -10,6 +9,9 @@
  * published by the Free Software Foundation.
 */
 
+#ifndef __MTD_NAND_S3C2410_H
+#define __MTD_NAND_S3C2410_H
+
 /**
  * struct s3c2410_nand_set - define a set of one or more nand chips
  * @disable_ecc:	Entirely disable ECC - Dangerous
@@ -65,3 +67,5 @@ struct s3c2410_platform_nand {
  * it with the s3c_device_nand. This allows @nand to be __initdata.
 */
 extern void s3c_nand_set_platdata(struct s3c2410_platform_nand *nand);
+
+#endif /*__MTD_NAND_S3C2410_H */
-- 
1.7.9.5
