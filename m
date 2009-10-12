Received: from gateway-1237.mvista.com ([63.81.120.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MxU8R-0003yR-B6
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 23:17:03 +0000
Date: Mon, 12 Oct 2009 16:16:37 -0700
From: "Mark A. Greer" <mgreer@mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Add bad block table overrides to Davinci NAND driver
Message-ID: <20091012231637.GA21098@mag.az.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: khilman@deeprootsystems.com, Davinci-linux-open-source@linux.davincidsp.com,
	sudhakar.raj@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mark A. Greer <mgreer@mvista.com>

The existing NAND infrastructure allows the default main and
mirror bad block tables to be overridden in nand_default_bbt().
However, the davinci_nand driver does not support this.  Add
that support by adding fields to the davinci driver's platform
data so platform code can pass in their own bbt's and make the
davinci_nand driver honor them.

Signed-off-by: Mark A. Greer <mgreer@mvista.com>
Signed-off-by: Kevin Hilman <khilman@deeprootsystems.com>
CC: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
---
Applies cleanly to git://git.infradead.org/mtd-2.6.git

Tested in the Linux ARM/Davinci tree,
git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci.git

 arch/arm/mach-davinci/include/mach/nand.h |    4 ++++
 drivers/mtd/nand/davinci_nand.c           |    2 ++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-davinci/include/mach/nand.h b/arch/arm/mach-davinci/include/mach/nand.h
index b520c4b..b2ad809 100644
--- a/arch/arm/mach-davinci/include/mach/nand.h
+++ b/arch/arm/mach-davinci/include/mach/nand.h
@@ -79,6 +79,10 @@ struct davinci_nand_pdata {		/* platform_data */
 
 	/* e.g. NAND_BUSWIDTH_16 or NAND_USE_FLASH_BBT */
 	unsigned		options;
+
+	/* Main and mirror bbt descriptor overrides */
+	struct nand_bbt_descr	*bbt_td;
+	struct nand_bbt_descr	*bbt_md;
 };
 
 #endif	/* __ARCH_ARM_DAVINCI_NAND_H */
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 68cc924..fe3eba8 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -591,6 +591,8 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 
 	/* options such as NAND_USE_FLASH_BBT or 16-bit widths */
 	info->chip.options	= pdata->options;
+	info->chip.bbt_td	= pdata->bbt_td;
+	info->chip.bbt_md	= pdata->bbt_md;
 
 	info->ioaddr		= (uint32_t __force) vaddr;
 
-- 
1.6.3.3.220.g609a0
