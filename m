Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MpTzR-0003so-88
	for linux-mtd@lists.infradead.org; Sun, 20 Sep 2009 21:30:42 +0000
Date: Sun, 20 Sep 2009 23:28:24 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] ARM Nomadik: use new OneNand name and pdata
Message-ID: <d22509d683d17011ba497a62617fe65bad314b9b.1253481164.git.rubini@
	unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
References: <cover.1253481164.git.rubini@unipv.it>
In-Reply-To: <cover.1253481164.git.rubini@unipv.it>
Cc: STEricsson_nomadik_linux@list.st.com, andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alessandro Rubini <rubini@unipv.it>

This enables the onenand with the new platform device name.
Moreover, it fixes a related typo that doesn't deserve a
separate patch.

Signed-off-by: Alessandro Rubini <rubini@unipv.it>
Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
---
 arch/arm/mach-nomadik/board-nhk8815.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-nomadik/board-nhk8815.c b/arch/arm/mach-nomadik/board-nhk8815.c
index 6bfd537..781b915 100644
--- a/arch/arm/mach-nomadik/board-nhk8815.c
+++ b/arch/arm/mach-nomadik/board-nhk8815.c
@@ -18,6 +18,7 @@
 #include <linux/gpio.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
+#include <linux/mtd/onenand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 #include <asm/sizes.h>
@@ -142,7 +143,7 @@ static struct mtd_partition nhk8815_onenand_partitions[] = {
 	}
 };
 
-static struct flash_platform_data nhk8815_onenand_data = {
+static struct onenand_platform_data nhk8815_onenand_data = {
 	.parts		= nhk8815_onenand_partitions,
 	.nr_parts	= ARRAY_SIZE(nhk8815_onenand_partitions),
 };
@@ -156,7 +157,7 @@ static struct resource nhk8815_onenand_resource[] = {
 };
 
 static struct platform_device nhk8815_onenand_device = {
-	.name		= "onenand",
+	.name		= "onenand-flash",
 	.id		= -1,
 	.dev		= {
 		.platform_data	= &nhk8815_onenand_data,
@@ -167,10 +168,10 @@ static struct platform_device nhk8815_onenand_device = {
 
 static void __init nhk8815_onenand_init(void)
 {
-#ifdef CONFIG_ONENAND
+#ifdef CONFIG_MTD_ONENAND
        /* Set up SMCS0 for OneNand */
-       writel(0x000030db, FSMC_BCR0);
-       writel(0x02100551, FSMC_BTR0);
+	writel(0x000030db, FSMC_BCR(0));
+	writel(0x02100551, FSMC_BTR(0));
 #endif
 }
 
-- 
1.6.0.2
