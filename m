Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VxWQi-000151-4Z
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2013 06:34:24 +0000
Received: by mail-pa0-f49.google.com with SMTP id kx10so11295853pab.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Dec 2013 22:34:00 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: orion: Cleanup mtd-orion_nand.h header
Date: Mon, 30 Dec 2013 12:00:21 +0530
Message-Id: <1388385021-1881-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1388385021-1881-1-git-send-email-sachin.kamat@linaro.org>
References: <1388385021-1881-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, computersforpeace@gmail.com, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit c02cecb92ed4 ("ARM: orion: move platform_data definitions")
moved the file to the current location but forgot to remove the pointer
to its previous location. Clean it up. While at it also change the header
file protection macros appropriately.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 include/linux/platform_data/mtd-orion_nand.h |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/platform_data/mtd-orion_nand.h b/include/linux/platform_data/mtd-orion_nand.h
index 9f3c180834d1..a7ce77c7c1a8 100644
--- a/include/linux/platform_data/mtd-orion_nand.h
+++ b/include/linux/platform_data/mtd-orion_nand.h
@@ -1,13 +1,11 @@
 /*
- * arch/arm/plat-orion/include/plat/orion_nand.h
- *
  * This file is licensed under the terms of the GNU General Public
  * License version 2.  This program is licensed "as is" without any
  * warranty of any kind, whether express or implied.
  */
 
-#ifndef __PLAT_ORION_NAND_H
-#define __PLAT_ORION_NAND_H
+#ifndef __MTD_ORION_NAND_H
+#define __MTD_ORION_NAND_H
 
 /*
  * Device bus NAND private data
-- 
1.7.9.5
