Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1THGU1-0006aG-HL
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2012 15:58:38 +0000
From: <dinguyen@altera.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?q?=5BPATCH=20v2=202/2=5D=20nand/denali=3A=20add=20a=20DT=20driver?=
Date: Thu, 27 Sep 2012 10:58:06 -0600
Message-ID: <1348765086-27286-3-git-send-email-dinguyen@altera.com>
In-Reply-To: <1348765086-27286-1-git-send-email-dinguyen@altera.com>
References: <1348765086-27286-1-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, dinh.linux@gmail.com,
 Jamie Iles <jamie@jamieiles.com>, Dinh Nguyen <dinguyen@altera.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Dinh Nguyen <dinguyen@altera.com>

Add a device tree version of the Denali NAND driver. Based
on an original patch from Jamie Iles to add a MMIO version
of this driver.

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Cc: Jamie Iles <jamie@jamieiles.com>
---
 .../devicetree/bindings/mtd/denali-nand.txt        |   23 +++
 drivers/mtd/nand/Kconfig                           |    9 +-
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/denali.h                          |    1 +
 drivers/mtd/nand/denali_dt.c                       |  167 ++++++++++++++=
++++++
 5 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/denali-nand.txt
 create mode 100644 drivers/mtd/nand/denali_dt.c

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Docu=
mentation/devicetree/bindings/mtd/denali-nand.txt
new file mode 100644
index 0000000..b04d03a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -0,0 +1,23 @@
+* Denali NAND controller
+
+Required properties:
+  - compatible : should be "denali,denali-nand-dt"
+  - reg : should contain registers location and length for data and reg.
+  - reg-names: Should contain the reg names "nand_data" and "denali_reg"
+  - interrupts : The interrupt number.
+  - dm-mask : DMA bit mask
+
+The device tree may optionally contain sub-nodes describing partitions o=
f the
+address space. See partition.txt for more detail.
+
+Examples:
+
+nand: nand@ff900000 {
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	compatible =3D "denali,denali-nand-dt";
+	reg =3D <0xff900000 0x100000>, <0xffb80000 0x10000>;
+	reg-names =3D "nand_data", "denali_reg";
+	interrupts =3D <0 144 4>;
+	dma-mask =3D <0xffffffff>;
+};
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f5659c1..2f6ace3 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -78,7 +78,14 @@ config MTD_NAND_DENALI_PCI
         help
           Enable the driver for NAND flash on Intel Moorestown, using th=
e
           Denali NAND controller core.
-=20
+
+config MTD_NAND_DENALI_DT
+	tristate "Support Denali NAND controller as a DT device"
+	depends on HAVE_CLK && MTD_NAND_DENALI
+	help
+	  Enable the driver for NAND flash on platforms using a Denali NAND
+	  controller as a DT device.
+
 config MTD_NAND_DENALI_SCRATCH_REG_ADDR
         hex "Denali NAND size scratch register address"
         default "0xFF108018"
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 0b3c9e2..50d6970 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+=3D ams-delta.o
 obj-$(CONFIG_MTD_NAND_AUTCPU12)		+=3D autcpu12.o
 obj-$(CONFIG_MTD_NAND_DENALI)		+=3D denali.o
 obj-$(CONFIG_MTD_NAND_DENALI_PCI)	+=3D denali_pci.o
+obj-$(CONFIG_MTD_NAND_DENALI_DT)	+=3D denali_dt.o
 obj-$(CONFIG_MTD_NAND_AU1550)		+=3D au1550nd.o
 obj-$(CONFIG_MTD_NAND_BF5XX)		+=3D bf5xx_nand.o
 obj-$(CONFIG_MTD_NAND_PPCHAMELEONEVB)	+=3D ppchameleonevb.o
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index e5aa995..cec5712 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -466,6 +466,7 @@ struct nand_buf {
=20
 #define INTEL_CE4100	1
 #define INTEL_MRST	2
+#define DT		3
=20
 struct denali_nand_info {
 	struct mtd_info mtd;
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
new file mode 100644
index 0000000..fbabbaa
--- /dev/null
+++ b/drivers/mtd/nand/denali_dt.c
@@ -0,0 +1,167 @@
+/*
+ * NAND Flash Controller Device Driver for DT
+ *
+ * Copyright =C2=A9 2011, Picochip.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ */
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+#include "denali.h"
+
+struct denali_dt {
+	struct denali_nand_info	denali;
+	struct clk		*clk;
+};
+
+static void __iomem *request_and_map(struct device *dev,
+				     const struct resource *res)
+{
+	void __iomem *ptr;
+
+	if (!devm_request_mem_region(dev, res->start, resource_size(res),
+				     "denali-dt")) {
+		dev_err(dev, "unable to request %s\n", res->name);
+		return NULL;
+	}
+
+	ptr =3D devm_ioremap_nocache(dev, res->start, resource_size(res));
+	if (!res)
+		dev_err(dev, "ioremap_nocache of %s failed!", res->name);
+
+	return ptr;
+}
+
+static const struct of_device_id denali_nand_dt_ids[] =3D {
+		{ .compatible =3D "denali,denali-nand-dt" },
+		{ /* sentinel */ }
+	};
+
+MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
+
+static u64 denali_dma_mask;
+
+static int __devinit denali_dt_probe(struct platform_device *ofdev)
+{
+	struct resource *denali_reg, *nand_data;
+	struct denali_dt *dt;
+	struct denali_nand_info *denali;
+	int ret;
+	const struct of_device_id *of_id;
+
+	of_id =3D of_match_device(denali_nand_dt_ids, &ofdev->dev);
+	if (of_id) {
+		ofdev->id_entry =3D of_id->data;
+	} else {
+		pr_err("Failed to find the right device id.\n");
+		return -ENOMEM;
+	}
+
+	dt =3D devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	if (!dt)
+		return -ENOMEM;
+	denali =3D &dt->denali;
+
+	denali_reg =3D platform_get_resource_byname(ofdev, IORESOURCE_MEM, "den=
ali_reg");
+	nand_data =3D platform_get_resource_byname(ofdev, IORESOURCE_MEM, "nand=
_data");
+	if (!denali_reg || !nand_data) {
+		dev_err(&ofdev->dev, "resources not completely defined\n");
+		return -EINVAL;
+	}
+
+	denali->platform =3D DT;
+	denali->dev =3D &ofdev->dev;
+	denali->irq =3D platform_get_irq(ofdev, 0);
+	if (denali->irq < 0) {
+		dev_err(&ofdev->dev, "no irq defined\n");
+		return -ENXIO;
+	}
+
+	denali->flash_reg =3D request_and_map(&ofdev->dev, denali_reg);
+	if (!denali->flash_reg)
+		return -ENOMEM;
+
+	denali->flash_mem =3D request_and_map(&ofdev->dev, nand_data);
+	if (!denali->flash_mem)
+		return -ENOMEM;
+
+	if (!of_property_read_u32(ofdev->dev.of_node,
+		"dma-mask", (u32 *)&denali_dma_mask)) {
+		denali->dev->dma_mask =3D &denali_dma_mask;
+	} else {
+		denali->dev->dma_mask =3D NULL;
+	}
+
+	dt->clk =3D clk_get(&ofdev->dev, NULL);
+	if (IS_ERR(dt->clk)) {
+		dev_err(&ofdev->dev, "no clk available\n");
+		return PTR_ERR(dt->clk);
+	}
+	clk_prepare_enable(dt->clk);
+
+	ret =3D denali_init(denali);
+	if (ret)
+		goto out_disable_clk;
+
+	platform_set_drvdata(ofdev, dt);
+	return 0;
+
+out_disable_clk:
+	clk_disable_unprepare(dt->clk);
+	clk_put(dt->clk);
+
+	return ret;
+}
+
+static int __devexit denali_dt_remove(struct platform_device *ofdev)
+{
+	struct denali_dt *dt =3D platform_get_drvdata(ofdev);
+
+	denali_remove(&dt->denali);
+	clk_disable(dt->clk);
+	clk_put(dt->clk);
+
+	return 0;
+}
+
+static struct platform_driver denali_dt_driver =3D {
+	.probe		=3D denali_dt_probe,
+	.remove		=3D __devexit_p(denali_dt_remove),
+	.driver		=3D {
+		.name	=3D "denali-nand-dt",
+		.owner	=3D THIS_MODULE,
+		.of_match_table	=3D of_match_ptr(denali_nand_dt_ids),
+	},
+};
+
+static int __init denali_init_dt(void)
+{
+	return platform_driver_register(&denali_dt_driver);
+}
+module_init(denali_init_dt);
+
+static void __exit denali_exit_dt(void)
+{
+	platform_driver_unregister(&denali_dt_driver);
+}
+module_exit(denali_exit_dt);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jamie Iles");
+MODULE_DESCRIPTION("DT driver for Denali NAND controller");
--=20
1.7.9.5
