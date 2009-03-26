Received: from smtp117.sbc.mail.sp1.yahoo.com ([69.147.64.90])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmkNo-0001wI-MR
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 07:52:19 +0000
From: David Brownell <david-b@pacbell.net>
To: Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [patch/rfc 2.6.29 2/2] MTD: support driver model updates
Date: Thu, 26 Mar 2009 00:42:50 -0700
References: <200903260039.34013.david-b@pacbell.net>
In-Reply-To: <200903260039.34013.david-b@pacbell.net>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200903260042.50236.david-b@pacbell.net>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: Kay Sievers <kay.sievers@vrfy.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Follow-on patch to the previous driver model patch for the MTD
framework.  This one makes various MTD drivers connect to the
driver model tree, so /sys/devices/virtual/mtd/* nodes are no
longer present ... mostly drivers used on boards I have handy.

Based on a patch from Kay Sievers.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/devices/m25p80.c        |    2 ++
 drivers/mtd/devices/mtd_dataflash.c |    2 ++
 drivers/mtd/maps/omap_nor.c         |    2 ++
 drivers/mtd/maps/physmap.c          |    1 +
 drivers/mtd/maps/plat-ram.c         |    1 +
 drivers/mtd/nand/davinci_nand.c     |    2 ++
 drivers/mtd/nand/mxc_nand.c         |    1 +
 drivers/mtd/onenand/omap2.c         |    2 ++
 8 files changed, 13 insertions(+)

--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -678,6 +678,8 @@ static int __devinit m25p_probe(struct s
 		flash->mtd.erasesize = info->sector_size;
 	}
 
+	flash->mtd.dev.parent = &spi->dev;
+
 	dev_info(&spi->dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)flash->mtd.size >> 10);
 
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -670,6 +670,8 @@ add_dataflash_otp(struct spi_device *spi
 	device->write = dataflash_write;
 	device->priv = priv;
 
+	device->dev.parent = &spi->dev;
+
 	if (revision >= 'c')
 		otp_tag = otp_setup(device, revision);
 
--- a/drivers/mtd/maps/omap_nor.c
+++ b/drivers/mtd/maps/omap_nor.c
@@ -115,6 +115,8 @@ static int __init omapflash_probe(struct
 	}
 	info->mtd->owner = THIS_MODULE;
 
+	info->mtd->dev.parent = &pdev->dev;
+
 #ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(info->mtd, part_probes, &info->parts, 0);
 	if (err > 0)
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -147,6 +147,7 @@ static int physmap_flash_probe(struct pl
 			devices_found++;
 		}
 		info->mtd[i]->owner = THIS_MODULE;
+		info->mtd[i]->dev.parent = &dev->dev;
 	}
 
 	if (devices_found == 1) {
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -224,6 +224,7 @@ static int platram_probe(struct platform
 	}
 
 	info->mtd->owner = THIS_MODULE;
+	info->mtd->dev.parent = &pdev->dev;
 
 	platram_setrw(info, PLATRAM_RW);
 
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -358,6 +358,8 @@ static int __init nand_davinci_probe(str
 	info->mtd.name		= dev_name(&pdev->dev);
 	info->mtd.owner		= THIS_MODULE;
 
+	info->mtd.dev.parent	= &pdev->dev;
+
 	info->chip.IO_ADDR_R	= vaddr;
 	info->chip.IO_ADDR_W	= vaddr;
 	info->chip.chip_delay	= 0;
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -866,6 +866,7 @@ static int __init mxcnd_probe(struct pla
 	mtd = &host->mtd;
 	mtd->priv = this;
 	mtd->owner = THIS_MODULE;
+	mtd->dev.parent = &pdev->dev;
 
 	/* 50 us command delay time */
 	this->chip_delay = 5;
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -672,6 +672,8 @@ static int __devinit omap2_onenand_probe
 	c->mtd.priv = &c->onenand;
 	c->mtd.owner = THIS_MODULE;
 
+	c->mtd.dev.parent = &pdev->dev;
+
 	if (c->dma_channel >= 0) {
 		struct onenand_chip *this = &c->onenand;
 
