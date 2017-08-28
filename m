Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmFMf-0003uR-50
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 08:25:47 +0000
Received: by mail-pg0-x242.google.com with SMTP id r133so5841523pgr.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Aug 2017 01:25:23 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: constify mtd_partition
Date: Mon, 28 Aug 2017 13:54:57 +0530
Message-Id: <4039663983bf372bd802549ef313ff1e466ed18a.1503908316.git.arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_partition are not supposed to change at runtime.
Functions 'mtd_device_parse_register' working with const mtd_partition
provided by <linux/mtd/mtd.h>. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/devices/lart.c      | 2 +-
 drivers/mtd/maps/cfi_flagadm.c  | 2 +-
 drivers/mtd/maps/impa7.c        | 2 +-
 drivers/mtd/maps/netsc520.c     | 2 +-
 drivers/mtd/maps/nettel.c       | 2 +-
 drivers/mtd/maps/sbc_gxx.c      | 2 +-
 drivers/mtd/maps/ts5500_flash.c | 2 +-
 drivers/mtd/maps/uclinux.c      | 2 +-
 drivers/mtd/nand/ams-delta.c    | 2 +-
 drivers/mtd/nand/cmx270_nand.c  | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 268aae4..555b944 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -583,7 +583,7 @@ static int flash_write (struct mtd_info *mtd,loff_t to,size_t len,size_t *retlen
 	}
 };
 
-static struct mtd_partition lart_partitions[] = {
+static const struct mtd_partition lart_partitions[] = {
 	/* blob */
 	{
 		.name	= "blob",
diff --git a/drivers/mtd/maps/cfi_flagadm.c b/drivers/mtd/maps/cfi_flagadm.c
index d504b3d..70f4886 100644
--- a/drivers/mtd/maps/cfi_flagadm.c
+++ b/drivers/mtd/maps/cfi_flagadm.c
@@ -61,7 +61,7 @@
 		.bankwidth =	2,
 };
 
-static struct mtd_partition flagadm_parts[] = {
+static const struct mtd_partition flagadm_parts[] = {
 	{
 		.name =		"Bootloader",
 		.offset	=	FLASH_PARTITION0_ADDR,
diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index 15bbda0..a0b8fa7 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -47,7 +47,7 @@
 /*
  * MTD partitioning stuff
  */
-static struct mtd_partition partitions[] =
+static const struct mtd_partition partitions[] =
 {
 	{
 		.name = "FileSystem",
diff --git a/drivers/mtd/maps/netsc520.c b/drivers/mtd/maps/netsc520.c
index 81dc259..b0517b1 100644
--- a/drivers/mtd/maps/netsc520.c
+++ b/drivers/mtd/maps/netsc520.c
@@ -52,7 +52,7 @@
 /* partition_info gives details on the logical partitions that the split the
  * single flash device into. If the size if zero we use up to the end of the
  * device. */
-static struct mtd_partition partition_info[]={
+static const struct mtd_partition partition_info[] = {
     {
 	    .name = "NetSc520 boot kernel",
 	    .offset = 0,
diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
index a577ef8..729579f 100644
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -107,7 +107,7 @@
 	.bankwidth = AMD_BUSWIDTH,
 };
 
-static struct mtd_partition nettel_amd_partitions[] = {
+static const struct mtd_partition nettel_amd_partitions[] = {
 	{
 		.name = "SnapGear BIOS config",
 		.offset = 0x000e0000,
diff --git a/drivers/mtd/maps/sbc_gxx.c b/drivers/mtd/maps/sbc_gxx.c
index 556a2df..8df181f 100644
--- a/drivers/mtd/maps/sbc_gxx.c
+++ b/drivers/mtd/maps/sbc_gxx.c
@@ -87,7 +87,7 @@ Intel StrataFlash (28F320/28F640) in x8 mode.
 /* partition_info gives details on the logical partitions that the split the
  * single flash device into. If the size if zero we use up to the end of the
  * device. */
-static struct mtd_partition partition_info[]={
+static const struct mtd_partition partition_info[] = {
     { .name = "SBC-GXx flash boot partition",
       .offset = 0,
       .size =   BOOT_PARTITION_SIZE_KiB*1024 },
diff --git a/drivers/mtd/maps/ts5500_flash.c b/drivers/mtd/maps/ts5500_flash.c
index 9969fed..8f177e0 100644
--- a/drivers/mtd/maps/ts5500_flash.c
+++ b/drivers/mtd/maps/ts5500_flash.c
@@ -43,7 +43,7 @@
 	.phys = WINDOW_ADDR
 };
 
-static struct mtd_partition ts5500_partitions[] = {
+static const struct mtd_partition ts5500_partitions[] = {
 	{
 		.name = "Drive A",
 		.offset = 0,
diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 00a8190..aef030c 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -49,7 +49,7 @@ struct map_info uclinux_ram_map = {
 
 /****************************************************************************/
 
-static struct mtd_partition uclinux_romfs[] = {
+static const struct mtd_partition uclinux_romfs[] = {
 	{ .name = "ROMfs" }
 };
 
diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index 5d6c26f..6cba2e4 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -41,7 +41,7 @@
  * Define partitions for flash devices
  */
 
-static struct mtd_partition partition_info[] = {
+static const struct mtd_partition partition_info[] = {
 	{ .name		= "Kernel",
 	  .offset	= 0,
 	  .size		= 3 * SZ_1M + SZ_512K },
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 949b940..12a92b3 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -42,7 +42,7 @@
 /*
  * Define static partitions for flash device
  */
-static struct mtd_partition partition_info[] = {
+static const struct mtd_partition partition_info[] = {
 	[0] = {
 		.name	= "cmx270-0",
 		.offset	= 0,
-- 
1.9.1
