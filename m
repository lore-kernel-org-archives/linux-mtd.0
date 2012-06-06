Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScGkP-00018f-3V
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 13:58:05 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH] of: mtd: nuke useless const qualifier
Date: Wed,  6 Jun 2012 16:59:21 +0300
Message-Id: <1338991161-18176-1-git-send-email-dedekind1@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Stefan Roese <sr@denx.de>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch does the following:
 -const int of_get_nand_ecc_mode(struct device_node *np)
 +int of_get_nand_ecc_mode(struct device_node *np)

because:
1. it is probably just a typo?
2. it causes warnings like this when people assing the returned
   value to an 'int' variable:
   include/linux/of_mtd.h:14:18: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]

Remove also the unnecessary "extern" qualifier to be consistent with other
declarations in this file.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/of/of_mtd.c    |    2 +-
 include/linux/of_mtd.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index e7cad62..a27ec94 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -32,7 +32,7 @@ static const char *nand_ecc_modes[] = {
  * The function gets ecc mode string from property 'nand-ecc-mode',
  * and return its index in nand_ecc_modes table, or errno in error case.
  */
-const int of_get_nand_ecc_mode(struct device_node *np)
+int of_get_nand_ecc_mode(struct device_node *np)
 {
 	const char *pm;
 	int err, i;
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index bae1b60..ed7f267 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -11,7 +11,7 @@
 
 #ifdef CONFIG_OF_MTD
 #include <linux/of.h>
-extern const int of_get_nand_ecc_mode(struct device_node *np);
+int of_get_nand_ecc_mode(struct device_node *np);
 int of_get_nand_bus_width(struct device_node *np);
 bool of_get_nand_on_flash_bbt(struct device_node *np);
 #endif
-- 
1.7.10
