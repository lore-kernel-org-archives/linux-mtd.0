Received: from mail-pd0-f182.google.com ([209.85.192.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8ot2-0004MD-Ve
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 09:58:06 +0000
Received: by mail-pd0-f182.google.com with SMTP id r10so2578459pdi.27
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 02:57:43 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: diskonchip: Fix incorrect placement of __initdata
Date: Mon, 12 Aug 2013 15:10:47 +0530
Message-Id: <1376300447-7126-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

__initdata should be placed between the variable name and equal
sign for the variable to be placed in the intended section.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/diskonchip.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index eaa3c29..b68a495 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -38,7 +38,7 @@
 #define CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS 0
 #endif
 
-static unsigned long __initdata doc_locations[] = {
+static unsigned long doc_locations[] __initdata = {
 #if defined (__alpha__) || defined(__i386__) || defined(__x86_64__)
 #ifdef CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH
 	0xfffc8000, 0xfffca000, 0xfffcc000, 0xfffce000,
-- 
1.7.9.5
