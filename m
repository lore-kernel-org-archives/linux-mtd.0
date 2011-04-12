Received: from smtp-out-051.synserver.de ([212.40.185.51]
	helo=smtp-out-049.synserver.de)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9jny-000439-Qi
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 20:03:19 +0000
From: Lars-Peter Clausen <lars@metafoo.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/2] ARM: s3c2440: GTA02: Disable hardware ECC by default
Date: Tue, 12 Apr 2011 21:47:52 +0200
Message-Id: <1302637672-25339-2-git-send-email-lars@metafoo.de>
In-Reply-To: <1302637672-25339-1-git-send-email-lars@metafoo.de>
References: <1302637672-25339-1-git-send-email-lars@metafoo.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
	Lars-Peter Clausen <lars@metafoo.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Early versions of uboot used for the GTA02 flashed the NAND with ECC information
incompatible to s3c2440 hardware ECC. Disable hardware error correction by
default, unless the bootloader explicitly enables it.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/arm/mach-s3c2440/mach-gta02.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2440/mach-gta02.c b/arch/arm/mach-s3c2440/mach-gta02.c
index 0db2411..b14d91f 100644
--- a/arch/arm/mach-s3c2440/mach-gta02.c
+++ b/arch/arm/mach-s3c2440/mach-gta02.c
@@ -445,6 +445,7 @@ static struct s3c2410_platform_nand __initdata gta02_nand_info = {
 	.twrph1		= 15,
 	.nr_sets	= ARRAY_SIZE(gta02_nand_sets),
 	.sets		= gta02_nand_sets,
+	.software_ecc	= 1,
 };
 
 
@@ -563,6 +564,14 @@ static void gta02_poweroff(void)
 	pcf50633_reg_set_bit_mask(gta02_pcf, PCF50633_REG_OOCSHDWN, 1, 1);
 }
 
+static int __init hardware_ecc_setup(char *str)
+{
+	if (str && str[0] == '1')
+		gta02_nand_info.software_ecc = 0;
+	return 1;
+}
+__setup("hardware_ecc=", hardware_ecc_setup);
+
 static void __init gta02_machine_init(void)
 {
 	/* Set the panic callback to turn AUX LED on or off. */
-- 
1.7.2.5
