Received: from smtp2.mail.ru ([94.100.176.130])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1gS9-0000h7-2X
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 16:28:18 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND 2/2] MTD: autcpu12-nvram: Convert driver to
 platform_device
Date: Wed, 15 Aug 2012 20:28:06 +0400
Message-Id: <1345048086-15709-2-git-send-email-shc_work@mail.ru>
In-Reply-To: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
References: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Because we can have a single kernel to support multiple machines, we
need to make loading specific drivers for the target platform only.
For this, driver is converted to the platform driver.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/mach-clps711x/autcpu12.c |   19 +++++
 drivers/mtd/maps/Kconfig          |    2 +-
 drivers/mtd/maps/autcpu12-nvram.c |  150 ++++++++++++++++++++-----------------
 3 files changed, 101 insertions(+), 70 deletions(-)

diff --git a/arch/arm/mach-clps711x/autcpu12.c b/arch/arm/mach-clps711x/autcpu12.c
index 3fb79a1..3287191 100644
--- a/arch/arm/mach-clps711x/autcpu12.c
+++ b/arch/arm/mach-clps711x/autcpu12.c
@@ -23,6 +23,8 @@
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/platform_device.h>
 
 #include <mach/hardware.h>
 #include <asm/sizes.h>
@@ -62,9 +64,26 @@ void __init autcpu12_map_io(void)
         iotable_init(autcpu12_io_desc, ARRAY_SIZE(autcpu12_io_desc));
 }
 
+static struct resource autcpu12_nvram_resource[] __initdata = {
+	DEFINE_RES_MEM_NAMED(AUTCPU12_PHYS_NVRAM, SZ_128K, "SRAM"),
+};
+
+static struct platform_device autcpu12_nvram_pdev __initdata = {
+	.name		= "autcpu12_nvram",
+	.id		= -1,
+	.resource	= autcpu12_nvram_resource,
+	.num_resources	= ARRAY_SIZE(autcpu12_nvram_resource),
+};
+
+static void __init autcpu12_init(void)
+{
+	platform_device_register(&autcpu12_nvram_pdev);
+}
+
 MACHINE_START(AUTCPU12, "autronix autcpu12")
 	/* Maintainer: Thomas Gleixner */
 	.atag_offset	= 0x20000,
+	.init_machine	= autcpu12_init,
 	.map_io		= autcpu12_map_io,
 	.init_irq	= clps711x_init_irq,
 	.timer		= &clps711x_timer,
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 5ba2458..283f922 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -373,7 +373,7 @@ config MTD_FORTUNET
 	  have such a board, say 'Y'.
 
 config MTD_AUTCPU12
-	tristate "NV-RAM mapping AUTCPU12 board"
+	bool "NV-RAM mapping AUTCPU12 board"
 	depends on ARCH_AUTCPU12
 	help
 	  This enables access to the NV-RAM on autronix autcpu12 board.
diff --git a/drivers/mtd/maps/autcpu12-nvram.c b/drivers/mtd/maps/autcpu12-nvram.c
index 0598d52..6f9ab62 100644
--- a/drivers/mtd/maps/autcpu12-nvram.c
+++ b/drivers/mtd/maps/autcpu12-nvram.c
@@ -15,44 +15,57 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
  */
+#include <linux/sizes.h>
 
-#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
-#include <linux/ioport.h>
 #include <linux/init.h>
-#include <asm/io.h>
-#include <asm/sizes.h>
-#include <mach/hardware.h>
-#include <mach/autcpu12.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-
-
-static struct mtd_info *sram_mtd;
 
-struct map_info autcpu12_sram_map = {
-	.name = "SRAM",
-	.size = 32768,
-	.bankwidth = 4,
-	.phys = 0x12000000,
+struct autcpu12_nvram_priv {
+	struct mtd_info *mtd;
+	struct map_info map;
 };
 
-static int __init init_autcpu12_sram (void)
+static int __devinit autcpu12_nvram_probe(struct platform_device *pdev)
 {
 	map_word tmp, save0, save1;
+	struct resource *res;
+	struct autcpu12_nvram_priv *priv;
 	int err;
 
-	autcpu12_sram_map.virt = ioremap(0x12000000, SZ_128K);
-	if (!autcpu12_sram_map.virt) {
-		printk("Failed to ioremap autcpu12 NV-RAM space\n");
-		err = -EIO;
+	priv = devm_kzalloc(&pdev->dev,
+			    sizeof(struct autcpu12_nvram_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "failed to get memory resource\n");
+		err = -ENOENT;
 		goto out;
 	}
-	simple_map_init(&autcpu12_sram_map);
+
+	priv->map.bankwidth	= 4;
+	priv->map.phys		= res->start;
+	priv->map.size		= resource_size(res);
+	priv->map.virt		= devm_request_and_ioremap(&pdev->dev, res);
+	strcpy((char *)priv->map.name, res->name);
+	if (!priv->map.virt) {
+		dev_err(&pdev->dev, "failed to remap mem resource\n");
+		err = -EBUSY;
+		goto out;
+	}
+
+	simple_map_init(&priv->map);
 
 	/*
 	 * Check for 32K/128K
@@ -62,67 +75,66 @@ static int __init init_autcpu12_sram (void)
 	 * Read	and check result on ofs 0x0
 	 * Restore contents
 	 */
-	save0 = map_read(&autcpu12_sram_map, 0);
-	save1 = map_read(&autcpu12_sram_map, 0x10000);
+	save0 = map_read(&priv->map, 0);
+	save1 = map_read(&priv->map, 0x10000);
 	tmp.x[0] = ~save0.x[0];
-	map_write(&autcpu12_sram_map, tmp, 0x10000);
-	/* if we find this pattern on 0x0, we have 32K size
-	 * restore contents and exit
-	 */
-	tmp = map_read(&autcpu12_sram_map, 0);
-	if (!map_word_equal(&autcpu12_sram_map, tmp, save0)) {
-		map_write(&autcpu12_sram_map, save0, 0x0);
-		goto map;
-	}
-	/* We have a 128K found, restore 0x10000 and set size
-	 * to 128K
-	 */
-	map_write(&autcpu12_sram_map, save1, 0x10000);
-	autcpu12_sram_map.size = SZ_128K;
-
-map:
-	sram_mtd = do_map_probe("map_ram", &autcpu12_sram_map);
-	if (!sram_mtd) {
-		printk("NV-RAM probe failed\n");
+	map_write(&priv->map, tmp, 0x10000);
+	tmp = map_read(&priv->map, 0);
+	/* if we find this pattern on 0x0, we have 32K size */
+	if (!map_word_equal(&priv->map, tmp, save0)) {
+		map_write(&priv->map, save0, 0x0);
+		priv->map.size = SZ_32K;
+	} else
+		map_write(&priv->map, save1, 0x10000);
+
+	priv->mtd = do_map_probe("map_ram", &priv->map);
+	if (!priv->mtd) {
+		dev_err(&pdev->dev, "probing failed\n");
 		err = -ENXIO;
-		goto out_ioremap;
+		goto out;
 	}
 
-	sram_mtd->owner = THIS_MODULE;
-	sram_mtd->erasesize = 16;
-
-	if (mtd_device_register(sram_mtd, NULL, 0)) {
-		printk("NV-RAM device addition failed\n");
-		err = -ENOMEM;
-		goto out_probe;
+	priv->mtd->owner	= THIS_MODULE;
+	priv->mtd->erasesize	= 16;
+	priv->mtd->dev.parent	= &pdev->dev;
+	if (!mtd_device_register(priv->mtd, NULL, 0)) {
+		dev_info(&pdev->dev,
+			 "NV-RAM device size %ldKiB registered on AUTCPU12\n",
+			 priv->map.size / SZ_1K);
+		return 0;
 	}
 
-	printk("NV-RAM device size %ldKiB registered on AUTCPU12\n",autcpu12_sram_map.size/SZ_1K);
-
-	return 0;
-
-out_probe:
-	map_destroy(sram_mtd);
-	sram_mtd = 0;
+	map_destroy(priv->mtd);
+	dev_err(&pdev->dev, "NV-RAM device addition failed\n");
+	err = -ENOMEM;
 
-out_ioremap:
-	iounmap((void *)autcpu12_sram_map.virt);
 out:
+	devm_kfree(&pdev->dev, priv);
+
 	return err;
 }
 
-static void __exit cleanup_autcpu12_maps(void)
+static int __devexit autcpu12_nvram_remove(struct platform_device *pdev)
 {
-	if (sram_mtd) {
-		mtd_device_unregister(sram_mtd);
-		map_destroy(sram_mtd);
-		iounmap((void *)autcpu12_sram_map.virt);
-	}
+	struct autcpu12_nvram_priv *priv = platform_get_drvdata(pdev);
+
+	mtd_device_unregister(priv->mtd);
+	map_destroy(priv->mtd);
+	devm_kfree(&pdev->dev, priv);
+
+	return 0;
 }
 
-module_init(init_autcpu12_sram);
-module_exit(cleanup_autcpu12_maps);
+static struct platform_driver autcpu12_nvram_driver = {
+	.driver		= {
+		.name	= "autcpu12_nvram",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= autcpu12_nvram_probe,
+	.remove		= __devexit_p(autcpu12_nvram_remove),
+};
+module_platform_driver(autcpu12_nvram_driver);
 
 MODULE_AUTHOR("Thomas Gleixner");
-MODULE_DESCRIPTION("autcpu12 NV-RAM map driver");
+MODULE_DESCRIPTION("autcpu12 NVRAM map driver");
 MODULE_LICENSE("GPL");
-- 
1.7.8.6
