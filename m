Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHJcf-0005r7-E1
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 23:05:38 +0000
Received: by mail-pa0-x235.google.com with SMTP id yy13so178214091pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 15:05:16 -0800 (PST)
Date: Thu, 7 Jan 2016 15:05:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH] mtd: bcm47xxsflash: use devm_ioremap_nocache() instead of
 KSEG0ADDR()
Message-ID: <20160107230513.GL109450@google.com>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
 <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

drivers/bcma/driver_chipcommon_sflash.c already nicely sets us up a
struct resource for this window, but we just aren't using it. Use it
now!

This removes some (implicit) MIPS dependencies and makes the code more
portable, whether we need it or not :)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
On Thu, Jan 07, 2016 at 09:06:50PM +0000, Maciej W. Rozycki wrote:
> On Wed, 4 Nov 2015, Brian Norris wrote:
> > > I think we're not really supposed to use KSEG0ADDR anyway. What about
> > > replacing it with ioremap_nocache?

OK, done! Compile tested only.

 drivers/bcma/driver_chipcommon_sflash.c     |  1 -
 drivers/mtd/devices/bcm47xxsflash.c         | 30 +++++++++++++++++++++++------
 drivers/mtd/devices/bcm47xxsflash.h         |  3 ++-
 include/linux/bcma/bcma_driver_chipcommon.h |  1 -
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/bcma/driver_chipcommon_sflash.c b/drivers/bcma/driver_chipcommon_sflash.c
index 7e11ef4cb7db..5534cbcc222f 100644
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
index 347bb83db864..ce6b7e51569d 100644
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
@@ -275,15 +275,34 @@ static void bcm47xxsflash_bcma_cc_write(struct bcm47xxsflash *b47s, u16 offset,
 
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
+	b47s->window = devm_ioremap_nocache(dev, res->start,
+					    resource_size(res));
+	if (!b47s->window) {
+		dev_err(dev, "ioremap failed for resource %pR\n", res);
+		return -ENOMEM;
+	}
+
 	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
 	b47s->cc_read = bcm47xxsflash_bcma_cc_read;
 	b47s->cc_write = bcm47xxsflash_bcma_cc_write;
@@ -297,11 +316,10 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 		break;
 	}
 
-	b47s->window = sflash->window;
 	b47s->blocksize = sflash->blocksize;
 	b47s->numblocks = sflash->numblocks;
 	b47s->size = sflash->size;
-	bcm47xxsflash_fill_mtd(b47s, &pdev->dev);
+	bcm47xxsflash_fill_mtd(b47s, dev);
 
 	err = mtd_device_parse_register(&b47s->mtd, probes, NULL, NULL, 0);
 	if (err) {
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index fe93daf4f489..1564b62b412e 100644
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
index db51a6ffb7d6..03e6fea9e9ce 100644
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
2.6.0.rc2.230.g3dd15c0
