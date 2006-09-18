Received: from moutng.kundenserver.de ([212.227.126.186])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GPEcP-00030j-1o
	for linux-mtd@lists.infradead.org; Mon, 18 Sep 2006 09:36:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by comm-neu.esd (Postfix) with ESMTP id 81B58108048
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Sep 2006 10:33:40 +0200 (CEST)
Received: from comm-neu.esd ([127.0.0.1])
	by localhost (comm [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 11020-02 for <linux-mtd@lists.infradead.org>;
	Mon, 18 Sep 2006 10:33:40 +0200 (CEST)
Received: from debby.esd (debby.esd [10.0.0.190])
	by comm-neu.esd (Postfix) with ESMTP id 01E7D108047
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Sep 2006 10:33:40 +0200 (CEST)
From: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: probing issue when using physmap platform device
Date: Mon, 18 Sep 2006 10:33:36 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200609181033.36353.matthias.fuchs@esd-electronics.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

below you find my implementation of the platform device code for a physmapped 
flash part on a CPCI405 board. As I understood this is the recommended way to 
add memory mapped flash to platforms instead of adding maps to 
drivers/mtd/maps.

All tests were done with 2.6.18-rc7.

When using the code on a board with two SST39VF1601 flashes everything is 
fine. Here is the bootlog:

physmap platform flash device: 00400000 at ffc00000
CFI: Found no physmap-flash.0 device at location zero
Found: SST 39VF1601
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
physmap-flash.0: Found 1 x16 devices at 0x200000 in 16-bit bank
number of JEDEC chips: 2
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
Using physmap partition information
Creating 4 MTD partitions on "physmap-flash.0":
0x00000000-0x00100000 : "kernel"
0x00100000-0x00280000 : "initrd"
0x00280000-0x003c0000 : "data"
0x003c0000-0x00400000 : "u-boot"

When I use the same code on a board with 8MB flash (2 x SST39CF3201),
SST49LF080A devices are detected. This might be the case because the product 
ids of the two devices are identical in the last byte.

physmap platform flash device: 00800000 at ff800000
Found: SST 49LF080A
physmap-flash.0: Found 2 x8 devices at 0x0 in 16-bit bank
physmap-flash.0: Found 2 x8 devices at 0x400000 in 16-bit bank
number of JEDEC chips: 2
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
Using physmap partition information
Creating 4 MTD partitions on "physmap-flash.0":
0x00000000-0x00140000 : "kernel"
0x00140000-0x002c0000 : "initrd"
0x002c0000-0x007c0000 : "data"
mtd: partition "data" extends beyond the end of device "physmap-flash.0" -- 
size truncated to 0x140000
0x007c0000-0x00800000 : "u-boot"
mtd: partition "u-boot" is out of reach -- disabled

I can avoid this issue by enabling the "Flash chip driver advanced config 
options" and selecting nothing but 16-bit buswidth and 1-chip interleave.
Is there any other way to get it work correctly?

physmap platform flash device: 00800000 at ff800000
Found: SST 39VF3201
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
physmap-flash.0: Found 1 x16 devices at 0x400000 in 16-bit bank
number of JEDEC chips: 2
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
Using physmap partition information
Creating 4 MTD partitions on "physmap-flash.0":
0x00000000-0x00140000 : "kernel"
0x00140000-0x002c0000 : "initrd"
0x002c0000-0x007c0000 : "data"
0x007c0000-0x00800000 : "u-boot"

The patch I used to add the SST39CF3201 can be found below. I posted it a 
while ago to the list.

Matthias

diff --git a/arch/ppc/platforms/4xx/cpci405.c 
b/arch/ppc/platforms/4xx/cpci405.c
index 3674309..0cefb86 100644
--- a/arch/ppc/platforms/4xx/cpci405.c
+++ b/arch/ppc/platforms/4xx/cpci405.c
@@ -26,6 +26,9 @@ #include <linux/serial_core.h>
 #include <asm/ocp.h>
 #include <asm/ibm_ocp_pci.h>
 #include <platforms/4xx/ibm405gp.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/physmap.h>

 #ifdef CONFIG_GEN_RTC
 void *cpci405_nvram;
@@ -108,6 +111,101 @@ #endif
        }
 }

+
+#ifdef CONFIG_MTD_PHYSMAP
+#define P0_KERNEL_SIZE_MIN 0x100000
+#define P0_KERNEL_SIZE_MAX 0x140000
+#define P1_INITRD_SIZE    0x180000
+#define P3_UBOOT_SIZE     0x040000
+
+#define CPCI405_MTD_BANKWIDTH 2
+
+#ifdef CONFIG_MTD_PARTITIONS
+/*
+ * CPCI405 default flash partitioning:
+ * mtd0: kernel  1024k (1280k for board with more than 4m of flash)
+ * mtd1: ramdisk 1536k
+ * mtd2: data    >=1280k
+ * mtd3: u-boot  256k
+ */
+static struct mtd_partition cpci405_flash_partitions[] = {
+       {
+               .name = "kernel",
+               .offset = 0,
+               .size = P0_KERNEL_SIZE_MIN
+       },
+       {
+               .name = "initrd",
+               .offset = MTDPART_OFS_APPEND,
+               .size = P1_INITRD_SIZE
+       },
+       {
+               .name = "data",
+               .offset = MTDPART_OFS_APPEND,
+                /* size of partition 2 will be calculated at
+                  runtime dependent on the total flash size
+               */
+       },
+       {
+               .name = "u-boot",
+               .offset = MTDPART_OFS_APPEND,
+               .size = P3_UBOOT_SIZE
+       }
+};
+#endif
+
+static struct physmap_flash_data cpci405_physmap_flash_data = {
+       .width          = CPCI405_MTD_BANKWIDTH,
+#ifdef CONFIG_MTD_PARTITIONS
+       .nr_parts       = ARRAY_SIZE(cpci405_flash_partitions),
+       .parts          = cpci405_flash_partitions,
+#endif
+};
+
+static struct resource cpci405_physmap_flash_resource = {
+       .flags          = IORESOURCE_MEM,
+};
+
+static struct platform_device cpci405_physmap_flash = {
+       .name           = "physmap-flash",
+       .id             = 0,
+       .dev            = {
+               .platform_data  = &cpci405_physmap_flash_data,
+       },
+       .num_resources  = 1,
+       .resource       = &cpci405_physmap_flash_resource,
+};
+
+static int __init
+cpci405_setup_mtd(void)
+{
+       bd_t *bd = (bd_t *)&__res;
+
+#ifdef CONFIG_MTD_PARTITIONS
+       /* Adjust kernel partition when we have a huge flash */
+       if (bd->bi_flashsize > 0x400000) {
+               cpci405_flash_partitions[0].size = P0_KERNEL_SIZE_MAX;
+       }
+
+       /* Adjust data partition to use the remaining flash */
+       cpci405_flash_partitions[2].size = bd->bi_flashsize -
+               cpci405_flash_partitions[0].size -
+               P1_INITRD_SIZE - P3_UBOOT_SIZE;
+#endif
+
+       cpci405_physmap_flash_resource.start = bd->bi_flashstart;
+       cpci405_physmap_flash_resource.end = bd->bi_flashstart + 
bd->bi_flashsiz
e - 1;
+
+       if (platform_device_register(&cpci405_physmap_flash) < 0) {
+               printk("TEST: platform_device_register() failed\n");
+       }
+
+       return 0;
+}
+arch_initcall(cpci405_setup_mtd);
+#endif /* CONFIG_MTD_PHYSMAP */
+
+
 void __init
 cpci405_setup_arch(void)
 {
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 8f39d0a..6fa3b7d 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -146,6 +146,7 @@ #define SST29LE512  0x003d
 #define SST39LF800     0x2781
 #define SST39LF160     0x2782
 #define SST39VF1601    0x234b
+#define SST39VF3201    0x235b
 #define SST39LF512     0x00D4
 #define SST39LF010     0x00D5
 #define SST39LF020     0x00D6
@@ -1482,6 +1483,22 @@ static const struct amd_flash_info jedec
                }

        }, {
+               .mfr_id         = MANUFACTURER_SST,     /* should be CFI */
+               .dev_id         = SST39VF3201,
+               .name           = "SST 39VF3201",
+               .uaddr          = {
+                       [0] = MTD_UADDR_0x5555_0x2AAA,  /* x8 */
+                       [1] = MTD_UADDR_0x5555_0x2AAA   /* x16 */
+               },
+               .DevSize        = SIZE_4MiB,
+               .CmdSet         = P_ID_AMD_STD,
+               .NumEraseRegions= 2,
+               .regions        = {
+                       ERASEINFO(0x1000,512),
+                       ERASEINFO(0x1000,512)
+               }
+
+       }, {
                .mfr_id         = MANUFACTURER_ST,      /* FIXME - CFI device? 
*
/
                .dev_id         = M29W800DT,
                .name           = "ST M29W800DT",
