Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYbVD-0003Kr-94
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 14:00:36 +0000
Received: by mail-wi0-f181.google.com with SMTP id n3so2051186wiv.14
 for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2014 07:00:13 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net
Subject: [PATCH] blackfin: don't set unused name in struct flash_platform_data
Date: Mon, 29 Sep 2014 15:59:59 +0200
Message-Id: <1411999199-7390-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Loading correct SPI driver (m25p80) is handled using modalias from the
struct spi_board_info. There is no point of setting name in this
platform_data, m25p80 ignores it anyway.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 arch/blackfin/mach-bf518/boards/ezbrd.c      | 1 -
 arch/blackfin/mach-bf518/boards/tcm-bf518.c  | 1 -
 arch/blackfin/mach-bf527/boards/ad7160eval.c | 1 -
 arch/blackfin/mach-bf527/boards/cm_bf527.c   | 1 -
 arch/blackfin/mach-bf527/boards/ezbrd.c      | 1 -
 arch/blackfin/mach-bf527/boards/ezkit.c      | 1 -
 arch/blackfin/mach-bf527/boards/tll6527m.c   | 1 -
 arch/blackfin/mach-bf533/boards/H8606.c      | 1 -
 arch/blackfin/mach-bf533/boards/blackstamp.c | 1 -
 arch/blackfin/mach-bf533/boards/cm_bf533.c   | 1 -
 arch/blackfin/mach-bf533/boards/ezkit.c      | 1 -
 arch/blackfin/mach-bf533/boards/stamp.c      | 1 -
 arch/blackfin/mach-bf537/boards/cm_bf537e.c  | 1 -
 arch/blackfin/mach-bf537/boards/cm_bf537u.c  | 1 -
 arch/blackfin/mach-bf537/boards/minotaur.c   | 1 -
 arch/blackfin/mach-bf537/boards/pnav10.c     | 1 -
 arch/blackfin/mach-bf537/boards/stamp.c      | 1 -
 arch/blackfin/mach-bf537/boards/tcm_bf537.c  | 1 -
 arch/blackfin/mach-bf538/boards/ezkit.c      | 1 -
 arch/blackfin/mach-bf548/boards/cm_bf548.c   | 1 -
 arch/blackfin/mach-bf548/boards/ezkit.c      | 1 -
 arch/blackfin/mach-bf561/boards/cm_bf561.c   | 1 -
 arch/blackfin/mach-bf609/boards/ezkit.c      | 1 -
 23 files changed, 23 deletions(-)

diff --git a/arch/blackfin/mach-bf518/boards/ezbrd.c b/arch/blackfin/mach-bf518/boards/ezbrd.c
index d022112..e12e883 100644
--- a/arch/blackfin/mach-bf518/boards/ezbrd.c
+++ b/arch/blackfin/mach-bf518/boards/ezbrd.c
@@ -180,7 +180,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf518/boards/tcm-bf518.c b/arch/blackfin/mach-bf518/boards/tcm-bf518.c
index 240d5cb..c304134 100644
--- a/arch/blackfin/mach-bf518/boards/tcm-bf518.c
+++ b/arch/blackfin/mach-bf518/boards/tcm-bf518.c
@@ -128,7 +128,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf527/boards/ad7160eval.c b/arch/blackfin/mach-bf527/boards/ad7160eval.c
index 00b3eb4..98ad4f9 100644
--- a/arch/blackfin/mach-bf527/boards/ad7160eval.c
+++ b/arch/blackfin/mach-bf527/boards/ad7160eval.c
@@ -256,7 +256,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf527/boards/cm_bf527.c b/arch/blackfin/mach-bf527/boards/cm_bf527.c
index 4e4f8b6..b24ceda 100644
--- a/arch/blackfin/mach-bf527/boards/cm_bf527.c
+++ b/arch/blackfin/mach-bf527/boards/cm_bf527.c
@@ -345,7 +345,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf527/boards/ezbrd.c b/arch/blackfin/mach-bf527/boards/ezbrd.c
index 0674fdc..f92c038 100644
--- a/arch/blackfin/mach-bf527/boards/ezbrd.c
+++ b/arch/blackfin/mach-bf527/boards/ezbrd.c
@@ -244,7 +244,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "sst25wf040",
diff --git a/arch/blackfin/mach-bf527/boards/ezkit.c b/arch/blackfin/mach-bf527/boards/ezkit.c
index e7ca793..439cb78 100644
--- a/arch/blackfin/mach-bf527/boards/ezkit.c
+++ b/arch/blackfin/mach-bf527/boards/ezkit.c
@@ -442,7 +442,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf527/boards/tll6527m.c b/arch/blackfin/mach-bf527/boards/tll6527m.c
index 22f876c..7ed6547 100644
--- a/arch/blackfin/mach-bf527/boards/tll6527m.c
+++ b/arch/blackfin/mach-bf527/boards/tll6527m.c
@@ -304,7 +304,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf533/boards/H8606.c b/arch/blackfin/mach-bf533/boards/H8606.c
index 01300f4..0c8ad43 100644
--- a/arch/blackfin/mach-bf533/boards/H8606.c
+++ b/arch/blackfin/mach-bf533/boards/H8606.c
@@ -151,7 +151,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf533/boards/blackstamp.c b/arch/blackfin/mach-bf533/boards/blackstamp.c
index 0ccf0cf..179155f 100644
--- a/arch/blackfin/mach-bf533/boards/blackstamp.c
+++ b/arch/blackfin/mach-bf533/boards/blackstamp.c
@@ -94,7 +94,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf533/boards/cm_bf533.c b/arch/blackfin/mach-bf533/boards/cm_bf533.c
index 4ef2fb0..4bf4a89 100644
--- a/arch/blackfin/mach-bf533/boards/cm_bf533.c
+++ b/arch/blackfin/mach-bf533/boards/cm_bf533.c
@@ -50,7 +50,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf533/boards/ezkit.c b/arch/blackfin/mach-bf533/boards/ezkit.c
index 3625e9e..5d2f7dd 100644
--- a/arch/blackfin/mach-bf533/boards/ezkit.c
+++ b/arch/blackfin/mach-bf533/boards/ezkit.c
@@ -201,7 +201,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf533/boards/stamp.c b/arch/blackfin/mach-bf533/boards/stamp.c
index 6ec3a79..8254213 100644
--- a/arch/blackfin/mach-bf533/boards/stamp.c
+++ b/arch/blackfin/mach-bf533/boards/stamp.c
@@ -167,7 +167,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf537/boards/cm_bf537e.c b/arch/blackfin/mach-bf537/boards/cm_bf537e.c
index 1e7290e..da69165 100644
--- a/arch/blackfin/mach-bf537/boards/cm_bf537e.c
+++ b/arch/blackfin/mach-bf537/boards/cm_bf537e.c
@@ -55,7 +55,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf537/boards/cm_bf537u.c b/arch/blackfin/mach-bf537/boards/cm_bf537u.c
index c7495dc..de05f7d 100644
--- a/arch/blackfin/mach-bf537/boards/cm_bf537u.c
+++ b/arch/blackfin/mach-bf537/boards/cm_bf537u.c
@@ -55,7 +55,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf537/boards/minotaur.c b/arch/blackfin/mach-bf537/boards/minotaur.c
index dd7bda0..b2c9938 100644
--- a/arch/blackfin/mach-bf537/boards/minotaur.c
+++ b/arch/blackfin/mach-bf537/boards/minotaur.c
@@ -149,7 +149,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf537/boards/pnav10.c b/arch/blackfin/mach-bf537/boards/pnav10.c
index 06a50dd..74d86d1 100644
--- a/arch/blackfin/mach-bf537/boards/pnav10.c
+++ b/arch/blackfin/mach-bf537/boards/pnav10.c
@@ -175,7 +175,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf537/boards/stamp.c b/arch/blackfin/mach-bf537/boards/stamp.c
index d5a4be8..b55355d 100644
--- a/arch/blackfin/mach-bf537/boards/stamp.c
+++ b/arch/blackfin/mach-bf537/boards/stamp.c
@@ -529,7 +529,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	/* .type = "m25p64", */
diff --git a/arch/blackfin/mach-bf537/boards/tcm_bf537.c b/arch/blackfin/mach-bf537/boards/tcm_bf537.c
index 6b988ad..bf5ec13 100644
--- a/arch/blackfin/mach-bf537/boards/tcm_bf537.c
+++ b/arch/blackfin/mach-bf537/boards/tcm_bf537.c
@@ -55,7 +55,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf538/boards/ezkit.c b/arch/blackfin/mach-bf538/boards/ezkit.c
index f4b5274..e09714c 100644
--- a/arch/blackfin/mach-bf538/boards/ezkit.c
+++ b/arch/blackfin/mach-bf538/boards/ezkit.c
@@ -508,7 +508,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf548/boards/cm_bf548.c b/arch/blackfin/mach-bf548/boards/cm_bf548.c
index 35fcdf8..af5b4a1 100644
--- a/arch/blackfin/mach-bf548/boards/cm_bf548.c
+++ b/arch/blackfin/mach-bf548/boards/cm_bf548.c
@@ -875,7 +875,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf548/boards/ezkit.c b/arch/blackfin/mach-bf548/boards/ezkit.c
index a19c151..77ed055 100644
--- a/arch/blackfin/mach-bf548/boards/ezkit.c
+++ b/arch/blackfin/mach-bf548/boards/ezkit.c
@@ -1061,7 +1061,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p16",
diff --git a/arch/blackfin/mach-bf561/boards/cm_bf561.c b/arch/blackfin/mach-bf561/boards/cm_bf561.c
index e862f78..89d3990 100644
--- a/arch/blackfin/mach-bf561/boards/cm_bf561.c
+++ b/arch/blackfin/mach-bf561/boards/cm_bf561.c
@@ -52,7 +52,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "m25p64",
diff --git a/arch/blackfin/mach-bf609/boards/ezkit.c b/arch/blackfin/mach-bf609/boards/ezkit.c
index 2d547b2..c600027 100644
--- a/arch/blackfin/mach-bf609/boards/ezkit.c
+++ b/arch/blackfin/mach-bf609/boards/ezkit.c
@@ -758,7 +758,6 @@ static struct mtd_partition bfin_spi_flash_partitions[] = {
 };
 
 static struct flash_platform_data bfin_spi_flash_data = {
-	.name = "m25p80",
 	.parts = bfin_spi_flash_partitions,
 	.nr_parts = ARRAY_SIZE(bfin_spi_flash_partitions),
 	.type = "w25q32",
-- 
1.8.4.5
