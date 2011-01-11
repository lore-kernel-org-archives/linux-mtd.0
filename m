Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PccU2-0001u1-U8
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 11:33:51 +0000
Received: by mail-fx0-f49.google.com with SMTP id 19so19231252fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jan 2011 03:33:50 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 4/5] CRIS: stop checking for MTD_CONCAT
Date: Tue, 11 Jan 2011 14:33:38 +0300
Message-Id: <1294745619-7142-4-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	linux-cris-kernel@axis.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As MTD_CONCAT support is becoming an integral part of MTD core,
there is no need for it's special treatment. So stop checking for
MTD_CONCAT availability.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Stefan Roese <sr@denx.de>
Cc: linux-cris-kernel@axis.com
---
 arch/cris/Kconfig                         |    1 -
 arch/cris/arch-v10/drivers/axisflashmap.c |    6 ------
 arch/cris/arch-v32/drivers/Kconfig        |    1 -
 arch/cris/arch-v32/drivers/axisflashmap.c |    6 ------
 4 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/arch/cris/Kconfig b/arch/cris/Kconfig
index 613e628..e05bd2f 100644
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@ -277,7 +277,6 @@ config ETRAX_AXISFLASHMAP
 	select MTD_CHAR
 	select MTD_BLOCK
 	select MTD_PARTITIONS
-	select MTD_CONCAT
 	select MTD_COMPLEX_MAPPINGS
 	help
 	  This option enables MTD mapping of flash devices.  Needed to use
diff --git a/arch/cris/arch-v10/drivers/axisflashmap.c b/arch/cris/arch-v10/drivers/axisflashmap.c
index b207970..ed708e1 100644
--- a/arch/cris/arch-v10/drivers/axisflashmap.c
+++ b/arch/cris/arch-v10/drivers/axisflashmap.c
@@ -234,7 +234,6 @@ static struct mtd_info *flash_probe(void)
 	}
 
 	if (mtd_cse0 && mtd_cse1) {
-#ifdef CONFIG_MTD_CONCAT
 		struct mtd_info *mtds[] = { mtd_cse0, mtd_cse1 };
 
 		/* Since the concatenation layer adds a small overhead we
@@ -246,11 +245,6 @@ static struct mtd_info *flash_probe(void)
 		 */
 		mtd_cse = mtd_concat_create(mtds, ARRAY_SIZE(mtds),
 					    "cse0+cse1");
-#else
-		printk(KERN_ERR "%s and %s: Cannot concatenate due to kernel "
-		       "(mis)configuration!\n", map_cse0.name, map_cse1.name);
-		mtd_cse = NULL;
-#endif
 		if (!mtd_cse) {
 			printk(KERN_ERR "%s and %s: Concatenation failed!\n",
 			       map_cse0.name, map_cse1.name);
diff --git a/arch/cris/arch-v32/drivers/Kconfig b/arch/cris/arch-v32/drivers/Kconfig
index a2dd740..1633b12 100644
--- a/arch/cris/arch-v32/drivers/Kconfig
+++ b/arch/cris/arch-v32/drivers/Kconfig
@@ -406,7 +406,6 @@ config ETRAX_AXISFLASHMAP
 	select MTD_CHAR
 	select MTD_BLOCK
 	select MTD_PARTITIONS
-	select MTD_CONCAT
 	select MTD_COMPLEX_MAPPINGS
 	help
 	  This option enables MTD mapping of flash devices.  Needed to use
diff --git a/arch/cris/arch-v32/drivers/axisflashmap.c b/arch/cris/arch-v32/drivers/axisflashmap.c
index 51e1e85..3d75125 100644
--- a/arch/cris/arch-v32/drivers/axisflashmap.c
+++ b/arch/cris/arch-v32/drivers/axisflashmap.c
@@ -275,7 +275,6 @@ static struct mtd_info *flash_probe(void)
 	}
 
 	if (count > 1) {
-#ifdef CONFIG_MTD_CONCAT
 		/* Since the concatenation layer adds a small overhead we
 		 * could try to figure out if the chips in cse0 and cse1 are
 		 * identical and reprobe the whole cse0+cse1 window. But since
@@ -284,11 +283,6 @@ static struct mtd_info *flash_probe(void)
 		 * complicating the probing procedure.
 		 */
 		mtd_total = mtd_concat_create(mtds, count, "cse0+cse1");
-#else
-		printk(KERN_ERR "%s and %s: Cannot concatenate due to kernel "
-		       "(mis)configuration!\n", map_cse0.name, map_cse1.name);
-		mtd_toal = NULL;
-#endif
 		if (!mtd_total) {
 			printk(KERN_ERR "%s and %s: Concatenation failed!\n",
 				map_cse0.name, map_cse1.name);
-- 
1.7.2.3
