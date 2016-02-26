Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZFzE-0001Oh-BO
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 10:51:05 +0000
Received: by mail-lf0-x234.google.com with SMTP id l143so50909091lfe.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 02:50:43 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cyril Bur <cyrilbur@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2] mtd: bcm47xxsflash: use ioremap_cache() instead of
 KSEG0ADDR()
Date: Fri, 26 Feb 2016 11:50:28 +0100
Message-Id: <1456483828-5583-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
References: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Brian Norris <computersforpeace@gmail.com>

Using KSEG0ADDR makes code highly MIPS dependent and not portable.
Thanks to the fix a68f376 ("MIPS: io.h: Define `ioremap_cache'") we can
use ioremap_cache which is generic and supported on MIPS as well now.

KSEG0ADDR was translating 0x1c000000 into 0x9c000000. With ioremap_cache
we use MIPS's __ioremap (and then remap_area_pages). This results in
different address (e.g. 0xc0080000) but it still should be cached as
expected and it was successfully tested with BCM47186B0.

Other than that drivers/bcma/driver_chipcommon_sflash.c nicely setups a
struct resource for access window, but we wren't using it. Use it now
and drop duplicated info.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V2:
1) Use ioremap_cache as we already have commit a68f376 in l2-mtd
2) Add iounmap to the error path
3) Update commit message
---
 drivers/bcma/driver_chipcommon_sflash.c     |  1 -
 drivers/mtd/devices/bcm47xxsflash.c         | 29 ++++++++++++++++++++++++-----
 drivers/mtd/devices/bcm47xxsflash.h         |  3 ++-
 include/linux/bcma/bcma_driver_chipcommon.h |  1 -
 4 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/bcma/driver_chipcommon_sflash.c b/drivers/bcma/driver_chipcommon_sflash.c
index 7e11ef4..5534cbc 100644
--- a/drivers/bcma/driver_chipcommon_sflash.c
+++ b/drivers/bcma/driver_chipcommon_sflash.c
@@ -145,7 +145,6 @@ int bcma_sflash_init(struct bcma_drv_cc *cc)
 		return -ENOTSUPP;
 	}
 
-	sflash->window = BCMA_SOC_FLASH2;
 	sflash->blocksize = e->blocksize;
 	sflash->numblocks = e->numblocks;
 	sflash->size = sflash->blocksize * sflash->numblocks;
diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 347bb83..1c65c15 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -2,6 +2,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/ioport.h>
 #include <linux/mtd/mtd.h>
 #include <linux/platform_device.h>
 #include <linux/bcma/bcma.h>
@@ -109,8 +110,7 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if ((from + len) > mtd->size)
 		return -EINVAL;
 
-	memcpy_fromio(buf, (void __iomem *)KSEG0ADDR(b47s->window + from),
-		      len);
+	memcpy_fromio(buf, b47s->window + from, len);
 	*retlen = len;
 
 	return len;
@@ -275,15 +275,33 @@ static void bcm47xxsflash_bcma_cc_write(struct bcm47xxsflash *b47s, u16 offset,
 
 static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 {
-	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct bcma_sflash *sflash = dev_get_platdata(dev);
 	struct bcm47xxsflash *b47s;
+	struct resource *res;
 	int err;
 
-	b47s = devm_kzalloc(&pdev->dev, sizeof(*b47s), GFP_KERNEL);
+	b47s = devm_kzalloc(dev, sizeof(*b47s), GFP_KERNEL);
 	if (!b47s)
 		return -ENOMEM;
 	sflash->priv = b47s;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "invalid resource\n");
+		return -EINVAL;
+	}
+	if (!devm_request_mem_region(dev, res->start, resource_size(res),
+				     res->name)) {
+		dev_err(dev, "can't request region for resource %pR\n", res);
+		return -EBUSY;
+	}
+	b47s->window = ioremap_cache(res->start, resource_size(res));
+	if (!b47s->window) {
+		dev_err(dev, "ioremap failed for resource %pR\n", res);
+		return -ENOMEM;
+	}
+
 	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
 	b47s->cc_read = bcm47xxsflash_bcma_cc_read;
 	b47s->cc_write = bcm47xxsflash_bcma_cc_write;
@@ -297,7 +315,6 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 		break;
 	}
 
-	b47s->window = sflash->window;
 	b47s->blocksize = sflash->blocksize;
 	b47s->numblocks = sflash->numblocks;
 	b47s->size = sflash->size;
@@ -306,6 +323,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 	err = mtd_device_parse_register(&b47s->mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		iounmap(b47s->window);
 		return err;
 	}
 
@@ -321,6 +339,7 @@ static int bcm47xxsflash_bcma_remove(struct platform_device *pdev)
 	struct bcm47xxsflash *b47s = sflash->priv;
 
 	mtd_device_unregister(&b47s->mtd);
+	iounmap(b47s->window);
 
 	return 0;
 }
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index fe93daf..1564b62 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -65,7 +65,8 @@ struct bcm47xxsflash {
 
 	enum bcm47xxsflash_type type;
 
-	u32 window;
+	void __iomem *window;
+
 	u32 blocksize;
 	u16 numblocks;
 	u32 size;
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index db51a6f..03e6fea 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -583,7 +583,6 @@ struct mtd_info;
 
 struct bcma_sflash {
 	bool present;
-	u32 window;
 	u32 blocksize;
 	u16 numblocks;
 	u32 size;
-- 
1.8.4.5
