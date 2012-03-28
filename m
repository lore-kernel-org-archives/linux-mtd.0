Received: from mail160.messagelabs.com ([216.82.253.99])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SCxNy-0006uQ-Uj
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2012 18:14:20 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] sh: Use the plat_nand default partition parser
Date: Wed, 28 Mar 2012 11:14:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201203281114.04557.hartleys@visionengravers.com>
Cc: lethal@linux-sh.org, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
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
Cc: Paul Mundt <lethal@linux-sh.org>

---

diff --git a/arch/sh/boards/mach-migor/setup.c b/arch/sh/boards/mach-migor/setup.c
index ff6f69c..de3e0f6 100644
--- a/arch/sh/boards/mach-migor/setup.c
+++ b/arch/sh/boards/mach-migor/setup.c
@@ -187,7 +187,6 @@ static struct platform_nand_data migor_nand_flash_data = {
 		.partitions = migor_nand_flash_partitions,
 		.nr_partitions = ARRAY_SIZE(migor_nand_flash_partitions),
 		.chip_delay = 20,
-		.part_probe_types = (const char *[]) { "cmdlinepart", NULL },
 	},
 	.ctrl = {
 		.dev_ready = migor_nand_flash_ready,
