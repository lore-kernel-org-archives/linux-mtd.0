Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sem4E-0001Cj-Sw
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 11:48:55 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <artem.bityutskiy@linux.intel.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 04/10] ARM: OMAP2+: gpmc-nand: update resource with memory
Date: Wed, 13 Jun 2012 17:03:20 +0530
Message-ID: <46d32cd55bdd26ae724ff5ec206520e222137627.1339586624.git.afzal@ti.com>
In-Reply-To: <cover.1339586624.git.afzal@ti.com>
References: <cover.1339586624.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: ivan.djelic@parrot.com, Afzal Mohammed <afzal@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently omap nand driver uses a field in platform data - phys_base
for passing the address space allocated by gpmc for nand. Use struct
resource instead. With this change omap nand driver has to get
address space from memory resource.

This helps in smooth migration of gpmc to driver.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/mach-omap2/gpmc-nand.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
index d4e803c..c0320d2 100644
--- a/arch/arm/mach-omap2/gpmc-nand.c
+++ b/arch/arm/mach-omap2/gpmc-nand.c
@@ -90,12 +90,14 @@ int __init gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data)
 	gpmc_nand_device.dev.platform_data = gpmc_nand_data;
 
 	err = gpmc_cs_request(gpmc_nand_data->cs, NAND_IO_SIZE,
-				&gpmc_nand_data->phys_base);
+				(unsigned long *)&gpmc_nand_resource.start);
 	if (err < 0) {
 		dev_err(dev, "Cannot request GPMC CS\n");
 		return err;
 	}
 
+	gpmc_nand_resource.end = gpmc_nand_resource.start + NAND_IO_SIZE - 1;
+
 	 /* Set timings in GPMC */
 	err = omap2_nand_gpmc_retime(gpmc_nand_data);
 	if (err < 0) {
-- 
1.7.10.2
