Received: from mail132.messagelabs.com ([216.82.242.115])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SCxNR-0006cm-3y
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2012 18:13:46 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] blackfin: Use the plat_nand default partition parser
Date: Wed, 28 Mar 2012 11:13:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201203281113.19827.hartleys@visionengravers.com>
Cc: vapier@gentoo.org, uclinux-dist-devel@blackfin.uclinux.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the default partition parser, cmdlinepart, provided by the plat_nand driver.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Mike Frysinger <vapier@gentoo.org>

---

diff --git a/arch/blackfin/mach-bf561/boards/acvilon.c b/arch/blackfin/mach-bf561/boards/acvilon.c
index f6ffd6f..0b74218 100644
--- a/arch/blackfin/mach-bf561/boards/acvilon.c
+++ b/arch/blackfin/mach-bf561/boards/acvilon.c
@@ -248,8 +248,6 @@ static struct platform_device bfin_uart0_device = {
 
 #if defined(CONFIG_MTD_NAND_PLATFORM) || defined(CONFIG_MTD_NAND_PLATFORM_MODULE)
 
-const char *part_probes[] = { "cmdlinepart", NULL };
-
 static struct mtd_partition bfin_plat_nand_partitions[] = {
 	{
 	 .name = "params(nand)",
@@ -289,7 +287,6 @@ static struct platform_nand_data bfin_plat_nand_data = {
 	.chip = {
 		 .nr_chips = 1,
 		 .chip_delay = 30,
-		 .part_probe_types = part_probes,
 		 .partitions = bfin_plat_nand_partitions,
 		 .nr_partitions = ARRAY_SIZE(bfin_plat_nand_partitions),
 		 },
