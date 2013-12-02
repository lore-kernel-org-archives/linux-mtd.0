Received: from mail-qe0-x22f.google.com ([2607:f8b0:400d:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnJHq-00032i-BC
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 02:31:02 +0000
Received: by mail-qe0-f47.google.com with SMTP id t7so12466042qeb.20
 for <linux-mtd@lists.infradead.org>; Sun, 01 Dec 2013 18:30:40 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: tests: mtd_nandecctest: Use IS_ENABLED() macro
Date: Mon,  2 Dec 2013 00:30:27 -0200
Message-Id: <1385951427-18909-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Using the IS_ENABLED() macro can make the code shorter and simpler.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/tests/mtd_nandecctest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 7010660..e579f90 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -19,7 +19,7 @@
  * or detected.
  */
 
-#if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
+#if IS_ENABLED(CONFIG_MTD_NAND)
 
 struct nand_ecc_test {
 	const char *name;
-- 
1.8.1.2
