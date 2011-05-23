Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORMv-0002TB-Rd
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:10 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:09 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/62] arm/mtd/gemini: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:48 +0100
Message-Id: <1306142623-24952-8-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, dwmw2@infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/arm/mach-gemini/board-wbd111.c |    7 +------
 arch/arm/mach-gemini/board-wbd222.c |    7 +------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-gemini/board-wbd111.c b/arch/arm/mach-gemini/board-wbd111.c
index af7b68a..88cc422 100644
--- a/arch/arm/mach-gemini/board-wbd111.c
+++ b/arch/arm/mach-gemini/board-wbd111.c
@@ -84,7 +84,6 @@ static struct sys_timer wbd111_timer = {
 	.init	= gemini_timer_init,
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
 static struct mtd_partition wbd111_partitions[] = {
 	{
 		.name		= "RedBoot",
@@ -116,11 +115,7 @@ static struct mtd_partition wbd111_partitions[] = {
 		.mask_flags	= MTD_WRITEABLE,
 	}
 };
-#define wbd111_num_partitions	ARRAY_SIZE(wbd111_partitions)
-#else
-#define wbd111_partitions	NULL
-#define wbd111_num_partitions	0
-#endif /* CONFIG_MTD_PARTITIONS */
+#define wbd111_num_partitions  ARRAY_SIZE(wbd111_partitions)
 
 static void __init wbd111_init(void)
 {
diff --git a/arch/arm/mach-gemini/board-wbd222.c b/arch/arm/mach-gemini/board-wbd222.c
index 99e5bbe..3a22034 100644
--- a/arch/arm/mach-gemini/board-wbd222.c
+++ b/arch/arm/mach-gemini/board-wbd222.c
@@ -84,7 +84,6 @@ static struct sys_timer wbd222_timer = {
 	.init	= gemini_timer_init,
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
 static struct mtd_partition wbd222_partitions[] = {
 	{
 		.name		= "RedBoot",
@@ -116,11 +115,7 @@ static struct mtd_partition wbd222_partitions[] = {
 		.mask_flags	= MTD_WRITEABLE,
 	}
 };
-#define wbd222_num_partitions	ARRAY_SIZE(wbd222_partitions)
-#else
-#define wbd222_partitions	NULL
-#define wbd222_num_partitions	0
-#endif /* CONFIG_MTD_PARTITIONS */
+#define wbd222_num_partitions  ARRAY_SIZE(wbd222_partitions)
 
 static void __init wbd222_init(void)
 {
-- 
1.7.4.4
