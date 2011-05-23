Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROs-0002TQ-L5
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:23 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:26:10 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 59/62] mtd: convert remaining users to mtd_device_register()
Date: Mon, 23 May 2011 10:23:40 +0100
Message-Id: <1306142623-24952-60-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The older add_mtd_device()/add_mtd_partitions() and their removal
counterparts will soon be gone.  Replace uses with mtd_device_register()
and mtd_device_unregister().

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/devices/block2mtd.c     |    4 ++--
 drivers/mtd/devices/doc2000.c       |    4 ++--
 drivers/mtd/devices/doc2001.c       |    4 ++--
 drivers/mtd/devices/doc2001plus.c   |    4 ++--
 drivers/mtd/devices/lart.c          |    9 +++++----
 drivers/mtd/devices/ms02-nv.c       |    4 ++--
 drivers/mtd/devices/mtdram.c        |    5 ++---
 drivers/mtd/devices/phram.c         |    4 ++--
 drivers/mtd/devices/pmc551.c        |    6 +++---
 drivers/mtd/devices/slram.c         |    4 ++--
 drivers/mtd/maps/amd76xrom.c        |    4 ++--
 drivers/mtd/maps/autcpu12-nvram.c   |    4 ++--
 drivers/mtd/maps/bcm963xx-flash.c   |    6 +++---
 drivers/mtd/maps/cdb89712.c         |   12 ++++++------
 drivers/mtd/maps/ceiva.c            |    6 +++---
 drivers/mtd/maps/cfi_flagadm.c      |    4 ++--
 drivers/mtd/maps/ck804xrom.c        |    4 ++--
 drivers/mtd/maps/dbox2-flash.c      |    4 ++--
 drivers/mtd/maps/dilnetpc.c         |    9 +++++----
 drivers/mtd/maps/dmv182.c           |    4 ++--
 drivers/mtd/maps/esb2rom.c          |    4 ++--
 drivers/mtd/maps/fortunet.c         |    7 ++++---
 drivers/mtd/maps/ichxrom.c          |    4 ++--
 drivers/mtd/maps/integrator-flash.c |    6 +++---
 drivers/mtd/maps/l440gx.c           |    4 ++--
 drivers/mtd/maps/mbx860.c           |    6 +++---
 drivers/mtd/maps/netsc520.c         |    4 ++--
 drivers/mtd/maps/nettel.c           |   12 ++++++------
 drivers/mtd/maps/octagon-5066.c     |    4 ++--
 drivers/mtd/maps/pci.c              |    4 ++--
 drivers/mtd/maps/pcmciamtd.c        |    4 ++--
 drivers/mtd/maps/pmcmsp-flash.c     |    6 +++---
 drivers/mtd/maps/rpxlite.c          |    4 ++--
 drivers/mtd/maps/sbc_gxx.c          |    4 ++--
 drivers/mtd/maps/sc520cdp.c         |    8 ++++----
 drivers/mtd/maps/scb2_flash.c       |    6 +++---
 drivers/mtd/maps/solutionengine.c   |   12 ++++++------
 drivers/mtd/maps/sun_uflash.c       |    4 ++--
 drivers/mtd/maps/ts5500_flash.c     |    4 ++--
 drivers/mtd/maps/tsunami_flash.c    |    4 ++--
 drivers/mtd/maps/vmax301.c          |    4 ++--
 drivers/mtd/maps/vmu-flash.c        |    4 ++--
 drivers/mtd/maps/wr_sbc82xx_flash.c |   15 +++++++++------
 drivers/mtd/nand/alauda.c           |    4 ++--
 drivers/mtd/nand/ams-delta.c        |    4 ++--
 drivers/mtd/nand/au1550nd.c         |    3 ++-
 drivers/mtd/nand/autcpu12.c         |   16 ++++++++--------
 drivers/mtd/nand/cmx270_nand.c      |    2 +-
 drivers/mtd/nand/denali.c           |    4 ++--
 drivers/mtd/nand/gpio.c             |    4 ++--
 drivers/mtd/nand/nandsim.c          |    4 +++-
 drivers/mtd/nand/nuc900_nand.c      |    4 ++--
 drivers/mtd/nand/pasemi_nand.c      |    2 +-
 drivers/mtd/nand/rtc_from4.c        |    3 ++-
 drivers/mtd/nand/sh_flctl.c         |    2 +-
 drivers/mtd/nand/sm_common.c        |    2 +-
 drivers/mtd/nand/spia.c             |    2 +-
 drivers/mtd/onenand/onenand_sim.c   |    3 ++-
 drivers/mtd/ubi/gluebi.c            |    6 +++---
 drivers/net/sfc/mtd.c               |    6 +++---
 60 files changed, 160 insertions(+), 150 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 97183c8..b78f231 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -294,7 +294,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 	dev->mtd.priv = dev;
 	dev->mtd.owner = THIS_MODULE;
 
-	if (add_mtd_device(&dev->mtd)) {
+	if (mtd_device_register(&dev->mtd, NULL, 0)) {
 		/* Device didn't get added, so free the entry */
 		goto devinit_err;
 	}
@@ -465,7 +465,7 @@ static void __devexit block2mtd_exit(void)
 	list_for_each_safe(pos, next, &blkmtd_device_list) {
 		struct block2mtd_dev *dev = list_entry(pos, typeof(*dev), list);
 		block2mtd_sync(&dev->mtd);
-		del_mtd_device(&dev->mtd);
+		mtd_device_unregister(&dev->mtd);
 		INFO("mtd%d: [%s] removed", dev->mtd.index,
 				dev->mtd.name + strlen("block2mtd: "));
 		list_del(&dev->list);
diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index 5bf5f46..f7fbf60 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -597,7 +597,7 @@ void DoC2k_init(struct mtd_info *mtd)
 		doc2klist = mtd;
 		mtd->size = this->totlen;
 		mtd->erasesize = this->erasesize;
-		add_mtd_device(mtd);
+		mtd_device_register(mtd, NULL, 0);
 		return;
 	}
 }
@@ -1185,7 +1185,7 @@ static void __exit cleanup_doc2000(void)
 		this = mtd->priv;
 		doc2klist = this->nextdoc;
 
-		del_mtd_device(mtd);
+		mtd_device_unregister(mtd);
 
 		iounmap(this->virtadr);
 		kfree(this->chips);
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index 0990f78..241192f 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -376,7 +376,7 @@ void DoCMil_init(struct mtd_info *mtd)
 		this->nextdoc = docmillist;
 		docmillist = mtd;
 		mtd->size  = this->totlen;
-		add_mtd_device(mtd);
+		mtd_device_register(mtd, NULL, 0);
 		return;
 	}
 }
@@ -826,7 +826,7 @@ static void __exit cleanup_doc2001(void)
 		this = mtd->priv;
 		docmillist = this->nextdoc;
 
-		del_mtd_device(mtd);
+		mtd_device_unregister(mtd);
 
 		iounmap(this->virtadr);
 		kfree(this->chips);
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 8b36fa7..09ae0ad 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -499,7 +499,7 @@ void DoCMilPlus_init(struct mtd_info *mtd)
 		docmilpluslist = mtd;
 		mtd->size  = this->totlen;
 		mtd->erasesize = this->erasesize;
-		add_mtd_device(mtd);
+		mtd_device_register(mtd, NULL, 0);
 		return;
 	}
 }
@@ -1091,7 +1091,7 @@ static void __exit cleanup_doc2001plus(void)
 		this = mtd->priv;
 		docmilpluslist = this->nextdoc;
 
-		del_mtd_device(mtd);
+		mtd_device_unregister(mtd);
 
 		iounmap(this->virtadr);
 		kfree(this->chips);
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 4b829f9..772a0ff 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -684,9 +684,10 @@ static int __init lart_flash_init (void)
 #endif
 
 #ifndef HAVE_PARTITIONS
-   result = add_mtd_device (&mtd);
+   result = mtd_device_register(&mtd, NULL, 0);
 #else
-   result = add_mtd_partitions (&mtd,lart_partitions, ARRAY_SIZE(lart_partitions));
+   result = mtd_device_register(&mtd, lart_partitions,
+                                ARRAY_SIZE(lart_partitions));
 #endif
 
    return (result);
@@ -695,9 +696,9 @@ static int __init lart_flash_init (void)
 static void __exit lart_flash_exit (void)
 {
 #ifndef HAVE_PARTITIONS
-   del_mtd_device (&mtd);
+   mtd_device_unregister(&mtd);
 #else
-   del_mtd_partitions (&mtd);
+   mtd_device_unregister(&mtd);
 #endif
 }
 
diff --git a/drivers/mtd/devices/ms02-nv.c b/drivers/mtd/devices/ms02-nv.c
index 6a9a24a..8423fb6 100644
--- a/drivers/mtd/devices/ms02-nv.c
+++ b/drivers/mtd/devices/ms02-nv.c
@@ -220,7 +220,7 @@ static int __init ms02nv_init_one(ulong addr)
 	mtd->writesize = 1;
 
 	ret = -EIO;
-	if (add_mtd_device(mtd)) {
+	if (mtd_device_register(mtd, NULL, 0)) {
 		printk(KERN_ERR
 			"ms02-nv: Unable to register MTD device, aborting!\n");
 		goto err_out_csr_res;
@@ -262,7 +262,7 @@ static void __exit ms02nv_remove_one(void)
 
 	root_ms02nv_mtd = mp->next;
 
-	del_mtd_device(mtd);
+	mtd_device_unregister(mtd);
 
 	release_resource(mp->resource.csr);
 	kfree(mp->resource.csr);
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 1483e18..2562689 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -104,7 +104,7 @@ static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
 static void __exit cleanup_mtdram(void)
 {
 	if (mtd_info) {
-		del_mtd_device(mtd_info);
+		mtd_device_unregister(mtd_info);
 		vfree(mtd_info->priv);
 		kfree(mtd_info);
 	}
@@ -133,9 +133,8 @@ int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
 	mtd->read = ram_read;
 	mtd->write = ram_write;
 
-	if (add_mtd_device(mtd)) {
+	if (mtd_device_register(mtd, NULL, 0))
 		return -EIO;
-	}
 
 	return 0;
 }
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 8d28fa0..23423bd 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -115,7 +115,7 @@ static void unregister_devices(void)
 	struct phram_mtd_list *this, *safe;
 
 	list_for_each_entry_safe(this, safe, &phram_list, list) {
-		del_mtd_device(&this->mtd);
+		mtd_device_unregister(&this->mtd);
 		iounmap(this->mtd.priv);
 		kfree(this->mtd.name);
 		kfree(this);
@@ -153,7 +153,7 @@ static int register_device(char *name, unsigned long start, unsigned long len)
 	new->mtd.writesize = 1;
 
 	ret = -EAGAIN;
-	if (add_mtd_device(&new->mtd)) {
+	if (mtd_device_register(&new->mtd, NULL, 0)) {
 		pr_err("Failed to register new device\n");
 		goto out2;
 	}
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 41b8cdc..ecff765 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -798,7 +798,7 @@ static int __init init_pmc551(void)
 		mtd->writesize = 1;
 		mtd->owner = THIS_MODULE;
 
-		if (add_mtd_device(mtd)) {
+		if (mtd_device_register(mtd, NULL, 0)) {
 			printk(KERN_NOTICE "pmc551: Failed to register new device\n");
 			pci_iounmap(PCI_Device, priv->start);
 			kfree(mtd->priv);
@@ -806,7 +806,7 @@ static int __init init_pmc551(void)
 			break;
 		}
 
-		/* Keep a reference as the add_mtd_device worked */
+		/* Keep a reference as the mtd_device_register worked */
 		pci_dev_get(PCI_Device);
 
 		printk(KERN_NOTICE "Registered pmc551 memory device.\n");
@@ -856,7 +856,7 @@ static void __exit cleanup_pmc551(void)
 		pci_dev_put(priv->dev);
 
 		kfree(mtd->priv);
-		del_mtd_device(mtd);
+		mtd_device_unregister(mtd);
 		kfree(mtd);
 		found++;
 	}
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 592016a..e585263 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -210,7 +210,7 @@ static int register_device(char *name, unsigned long start, unsigned long length
 	(*curmtd)->mtdinfo->erasesize = SLRAM_BLK_SZ;
 	(*curmtd)->mtdinfo->writesize = 1;
 
-	if (add_mtd_device((*curmtd)->mtdinfo))	{
+	if (mtd_device_register((*curmtd)->mtdinfo, NULL, 0))	{
 		E("slram: Failed to register new device\n");
 		iounmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
 		kfree((*curmtd)->mtdinfo->priv);
@@ -231,7 +231,7 @@ static void unregister_devices(void)
 
 	while (slram_mtdlist) {
 		nextitem = slram_mtdlist->next;
-		del_mtd_device(slram_mtdlist->mtdinfo);
+		mtd_device_unregister(slram_mtdlist->mtdinfo);
 		iounmap(((slram_priv_t *)slram_mtdlist->mtdinfo->priv)->start);
 		kfree(slram_mtdlist->mtdinfo->priv);
 		kfree(slram_mtdlist->mtdinfo);
diff --git a/drivers/mtd/maps/amd76xrom.c b/drivers/mtd/maps/amd76xrom.c
index 92de7e3..e2875d6 100644
--- a/drivers/mtd/maps/amd76xrom.c
+++ b/drivers/mtd/maps/amd76xrom.c
@@ -82,7 +82,7 @@ static void amd76xrom_cleanup(struct amd76xrom_window *window)
 		if (map->rsrc.parent) {
 			release_resource(&map->rsrc);
 		}
-		del_mtd_device(map->mtd);
+		mtd_device_unregister(map->mtd);
 		map_destroy(map->mtd);
 		list_del(&map->list);
 		kfree(map);
@@ -262,7 +262,7 @@ static int __devinit amd76xrom_init_one (struct pci_dev *pdev,
 
 		/* Now that the mtd devices is complete claim and export it */
 		map->mtd->owner = THIS_MODULE;
-		if (add_mtd_device(map->mtd)) {
+		if (mtd_device_register(map->mtd, NULL, 0)) {
 			map_destroy(map->mtd);
 			map->mtd = NULL;
 			goto out;
diff --git a/drivers/mtd/maps/autcpu12-nvram.c b/drivers/mtd/maps/autcpu12-nvram.c
index 5366418..e5bfd0e 100644
--- a/drivers/mtd/maps/autcpu12-nvram.c
+++ b/drivers/mtd/maps/autcpu12-nvram.c
@@ -88,7 +88,7 @@ map:
 	sram_mtd->owner = THIS_MODULE;
 	sram_mtd->erasesize = 16;
 
-	if (add_mtd_device(sram_mtd)) {
+	if (mtd_device_register(sram_mtd, NULL, 0)) {
 		printk("NV-RAM device addition failed\n");
 		err = -ENOMEM;
 		goto out_probe;
@@ -111,7 +111,7 @@ out:
 static void __exit cleanup_autcpu12_maps(void)
 {
 	if (sram_mtd) {
-		del_mtd_device(sram_mtd);
+		mtd_device_unregister(sram_mtd);
 		map_destroy(sram_mtd);
 		iounmap((void *)autcpu12_sram_map.virt);
 	}
diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
index 1f30495..608967f 100644
--- a/drivers/mtd/maps/bcm963xx-flash.c
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -224,8 +224,8 @@ probe_ok:
 		goto err_probe;
 	}
 
-	return add_mtd_partitions(bcm963xx_mtd_info, parsed_parts,
-						parsed_nr_parts);
+	return mtd_device_register(bcm963xx_mtd_info, parsed_parts,
+				   parsed_nr_parts);
 
 err_probe:
 	iounmap(bcm963xx_map.virt);
@@ -235,7 +235,7 @@ err_probe:
 static int bcm963xx_remove(struct platform_device *pdev)
 {
 	if (bcm963xx_mtd_info) {
-		del_mtd_partitions(bcm963xx_mtd_info);
+		mtd_device_unregister(bcm963xx_mtd_info);
 		map_destroy(bcm963xx_mtd_info);
 	}
 
diff --git a/drivers/mtd/maps/cdb89712.c b/drivers/mtd/maps/cdb89712.c
index 8d92d8d..c29cbf8 100644
--- a/drivers/mtd/maps/cdb89712.c
+++ b/drivers/mtd/maps/cdb89712.c
@@ -75,7 +75,7 @@ static int __init init_cdb89712_flash (void)
 
 	flash_mtd->owner = THIS_MODULE;
 
-	if (add_mtd_device(flash_mtd)) {
+	if (mtd_device_register(flash_mtd, NULL, 0)) {
 		printk("FLASH device addition failed\n");
 		err = -ENOMEM;
 		goto out_probe;
@@ -141,7 +141,7 @@ static int __init init_cdb89712_sram (void)
 	sram_mtd->owner = THIS_MODULE;
 	sram_mtd->erasesize = 16;
 
-	if (add_mtd_device(sram_mtd)) {
+	if (mtd_device_register(sram_mtd, NULL, 0)) {
 		printk("SRAM device addition failed\n");
 		err = -ENOMEM;
 		goto out_probe;
@@ -209,7 +209,7 @@ static int __init init_cdb89712_bootrom (void)
 	bootrom_mtd->owner = THIS_MODULE;
 	bootrom_mtd->erasesize = 0x10000;
 
-	if (add_mtd_device(bootrom_mtd)) {
+	if (mtd_device_register(bootrom_mtd, NULL, 0)) {
 		printk("BootROM device addition failed\n");
 		err = -ENOMEM;
 		goto out_probe;
@@ -249,21 +249,21 @@ static int __init init_cdb89712_maps(void)
 static void __exit cleanup_cdb89712_maps(void)
 {
 	if (sram_mtd) {
-		del_mtd_device(sram_mtd);
+		mtd_device_unregister(sram_mtd);
 		map_destroy(sram_mtd);
 		iounmap((void *)cdb89712_sram_map.virt);
 		release_resource (&cdb89712_sram_resource);
 	}
 
 	if (flash_mtd) {
-		del_mtd_device(flash_mtd);
+		mtd_device_unregister(flash_mtd);
 		map_destroy(flash_mtd);
 		iounmap((void *)cdb89712_flash_map.virt);
 		release_resource (&cdb89712_flash_resource);
 	}
 
 	if (bootrom_mtd) {
-		del_mtd_device(bootrom_mtd);
+		mtd_device_unregister(bootrom_mtd);
 		map_destroy(bootrom_mtd);
 		iounmap((void *)cdb89712_bootrom_map.virt);
 		release_resource (&cdb89712_bootrom_resource);
diff --git a/drivers/mtd/maps/ceiva.c b/drivers/mtd/maps/ceiva.c
index 23f551d..06f9c98 100644
--- a/drivers/mtd/maps/ceiva.c
+++ b/drivers/mtd/maps/ceiva.c
@@ -224,7 +224,7 @@ static void __exit clps_destroy_mtd(struct clps_info *clps, struct mtd_info *mtd
 {
 	int i;
 
-	del_mtd_partitions(mtd);
+	mtd_device_unregister(mtd);
 
 	if (mtd != clps[0].mtd)
 		mtd_concat_destroy(mtd);
@@ -292,11 +292,11 @@ static void __init clps_locate_partitions(struct mtd_info *mtd)
 	if (nr_parts == 0) {
 		printk(KERN_NOTICE "clps flash: no partition info "
 			"available, registering whole flash\n");
-		add_mtd_device(mtd);
+		mtd_device_register(mtd, NULL, 0);
 	} else {
 		printk(KERN_NOTICE "clps flash: using %s partition "
 			"definition\n", part_type);
-		add_mtd_partitions(mtd, parsed_parts, nr_parts);
+		mtd_device_register(mtd, parsed_parts, nr_parts);
 	}
 
 	/* Always succeeds. */
diff --git a/drivers/mtd/maps/cfi_flagadm.c b/drivers/mtd/maps/cfi_flagadm.c
index f71343c..d16fc9d 100644
--- a/drivers/mtd/maps/cfi_flagadm.c
+++ b/drivers/mtd/maps/cfi_flagadm.c
@@ -107,7 +107,7 @@ static int __init init_flagadm(void)
 	mymtd = do_map_probe("cfi_probe", &flagadm_map);
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
-		add_mtd_partitions(mymtd, flagadm_parts, PARTITION_COUNT);
+		mtd_device_register(mymtd, flagadm_parts, PARTITION_COUNT);
 		printk(KERN_NOTICE "FlagaDM flash device initialized\n");
 		return 0;
 	}
@@ -119,7 +119,7 @@ static int __init init_flagadm(void)
 static void __exit cleanup_flagadm(void)
 {
 	if (mymtd) {
-		del_mtd_partitions(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 	if (flagadm_map.virt) {
diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index 5fdb7b2..3d0e762 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -94,7 +94,7 @@ static void ck804xrom_cleanup(struct ck804xrom_window *window)
 		if (map->rsrc.parent)
 			release_resource(&map->rsrc);
 
-		del_mtd_device(map->mtd);
+		mtd_device_unregister(map->mtd);
 		map_destroy(map->mtd);
 		list_del(&map->list);
 		kfree(map);
@@ -291,7 +291,7 @@ static int __devinit ck804xrom_init_one (struct pci_dev *pdev,
 
 		/* Now that the mtd devices is complete claim and export it */
 		map->mtd->owner = THIS_MODULE;
-		if (add_mtd_device(map->mtd)) {
+		if (mtd_device_register(map->mtd, NULL, 0)) {
 			map_destroy(map->mtd);
 			map->mtd = NULL;
 			goto out;
diff --git a/drivers/mtd/maps/dbox2-flash.c b/drivers/mtd/maps/dbox2-flash.c
index cfacfa6..85bdece 100644
--- a/drivers/mtd/maps/dbox2-flash.c
+++ b/drivers/mtd/maps/dbox2-flash.c
@@ -93,7 +93,7 @@ static int __init init_dbox2_flash(void)
 		mymtd->owner = THIS_MODULE;
 
                 /* Create MTD devices for each partition. */
-	        add_mtd_partitions(mymtd, partition_info, NUM_PARTITIONS);
+		mtd_device_register(mymtd, partition_info, NUM_PARTITIONS);
 
 		return 0;
 	}
@@ -105,7 +105,7 @@ static int __init init_dbox2_flash(void)
 static void __exit cleanup_dbox2_flash(void)
 {
 	if (mymtd) {
-		del_mtd_partitions(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 	if (dbox2_flash_map.virt) {
diff --git a/drivers/mtd/maps/dilnetpc.c b/drivers/mtd/maps/dilnetpc.c
index 0713e3a..3e393f0 100644
--- a/drivers/mtd/maps/dilnetpc.c
+++ b/drivers/mtd/maps/dilnetpc.c
@@ -450,7 +450,7 @@ static int __init init_dnpc(void)
 	partition_info[2].mtdp = &lowlvl_parts[1];
 	partition_info[3].mtdp = &lowlvl_parts[3];
 
-	add_mtd_partitions(mymtd, partition_info, NUM_PARTITIONS);
+	mtd_device_register(mymtd, partition_info, NUM_PARTITIONS);
 
 	/*
 	** now create a virtual MTD device by concatenating the for partitions
@@ -463,7 +463,8 @@ static int __init init_dnpc(void)
 		** we do not supply mtd pointers in higlvl_partition_info, so
 		** add_mtd_partitions() will register the devices.
 		*/
-		add_mtd_partitions(merged_mtd, higlvl_partition_info, NUM_HIGHLVL_PARTITIONS);
+		mtd_device_register(merged_mtd, higlvl_partition_info,
+				    NUM_HIGHLVL_PARTITIONS);
 	}
 
 	return 0;
@@ -472,12 +473,12 @@ static int __init init_dnpc(void)
 static void __exit cleanup_dnpc(void)
 {
 	if(merged_mtd) {
-		del_mtd_partitions(merged_mtd);
+		mtd_device_unregister(merged_mtd);
 		mtd_concat_destroy(merged_mtd);
 	}
 
 	if (mymtd) {
-		del_mtd_partitions(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 	if (dnpc_map.virt) {
diff --git a/drivers/mtd/maps/dmv182.c b/drivers/mtd/maps/dmv182.c
index d171674..6538ac6 100644
--- a/drivers/mtd/maps/dmv182.c
+++ b/drivers/mtd/maps/dmv182.c
@@ -120,7 +120,7 @@ static int __init init_svme182(void)
 		   this_mtd->size >> 20, FLASH_BASE_ADDR);
 
 	this_mtd->owner = THIS_MODULE;
-	add_mtd_partitions(this_mtd, partitions, num_parts);
+	mtd_device_register(this_mtd, partitions, num_parts);
 
 	return 0;
 }
@@ -129,7 +129,7 @@ static void __exit cleanup_svme182(void)
 {
 	if (this_mtd)
 	{
-		del_mtd_partitions(this_mtd);
+		mtd_device_unregister(this_mtd);
 		map_destroy(this_mtd);
 	}
 
diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index 4feb750..08322b1 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -128,7 +128,7 @@ static void esb2rom_cleanup(struct esb2rom_window *window)
 	list_for_each_entry_safe(map, scratch, &window->maps, list) {
 		if (map->rsrc.parent)
 			release_resource(&map->rsrc);
-		del_mtd_device(map->mtd);
+		mtd_device_unregister(map->mtd);
 		map_destroy(map->mtd);
 		list_del(&map->list);
 		kfree(map);
@@ -352,7 +352,7 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 
 		/* Now that the mtd devices is complete claim and export it */
 		map->mtd->owner = THIS_MODULE;
-		if (add_mtd_device(map->mtd)) {
+		if (mtd_device_register(map->mtd, NULL, 0)) {
 			map_destroy(map->mtd);
 			map->mtd = NULL;
 			goto out;
diff --git a/drivers/mtd/maps/fortunet.c b/drivers/mtd/maps/fortunet.c
index 1e43124..956e2e4 100644
--- a/drivers/mtd/maps/fortunet.c
+++ b/drivers/mtd/maps/fortunet.c
@@ -243,8 +243,9 @@ static int __init init_fortunet(void)
 					&map_regions[ix].map_info);
 			}
 			map_regions[ix].mymtd->owner = THIS_MODULE;
-			add_mtd_partitions(map_regions[ix].mymtd,
-				map_regions[ix].parts,map_regions_parts[ix]);
+			mtd_device_register(map_regions[ix].mymtd,
+					    map_regions[ix].parts,
+					    map_regions_parts[ix]);
 		}
 	}
 	if(iy)
@@ -261,7 +262,7 @@ static void __exit cleanup_fortunet(void)
 		{
 			if( map_regions[ix].mymtd )
 			{
-				del_mtd_partitions( map_regions[ix].mymtd );
+				mtd_device_unregister(map_regions[ix].mymtd);
 				map_destroy( map_regions[ix].mymtd );
 			}
 			iounmap((void *)map_regions[ix].map_info.virt);
diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
index 1337a41..6689dcb 100644
--- a/drivers/mtd/maps/ichxrom.c
+++ b/drivers/mtd/maps/ichxrom.c
@@ -67,7 +67,7 @@ static void ichxrom_cleanup(struct ichxrom_window *window)
 	list_for_each_entry_safe(map, scratch, &window->maps, list) {
 		if (map->rsrc.parent)
 			release_resource(&map->rsrc);
-		del_mtd_device(map->mtd);
+		mtd_device_unregister(map->mtd);
 		map_destroy(map->mtd);
 		list_del(&map->list);
 		kfree(map);
@@ -287,7 +287,7 @@ static int __devinit ichxrom_init_one (struct pci_dev *pdev,
 
 		/* Now that the mtd devices is complete claim and export it */
 		map->mtd->owner = THIS_MODULE;
-		if (add_mtd_device(map->mtd)) {
+		if (mtd_device_register(map->mtd, NULL, 0)) {
 			map_destroy(map->mtd);
 			map->mtd = NULL;
 			goto out;
diff --git a/drivers/mtd/maps/integrator-flash.c b/drivers/mtd/maps/integrator-flash.c
index e22ff5a..a97bbcf 100644
--- a/drivers/mtd/maps/integrator-flash.c
+++ b/drivers/mtd/maps/integrator-flash.c
@@ -221,7 +221,7 @@ static int armflash_probe(struct platform_device *dev)
 
 	err = parse_mtd_partitions(info->mtd, probes, &info->parts, 0);
 	if (err > 0) {
-		err = add_mtd_partitions(info->mtd, info->parts, err);
+		err = mtd_device_register(info->mtd, info->parts, err);
 		if (err)
 			printk(KERN_ERR
 			       "mtd partition registration failed: %d\n", err);
@@ -237,7 +237,7 @@ static int armflash_probe(struct platform_device *dev)
 	 */
  cleanup:
 	if (info->mtd) {
-		del_mtd_partitions(info->mtd);
+		mtd_device_unregister(info->mtd);
 		if (info->mtd != info->subdev[0].mtd)
 			mtd_concat_destroy(info->mtd);
 	}
@@ -263,7 +263,7 @@ static int armflash_remove(struct platform_device *dev)
 
 	if (info) {
 		if (info->mtd) {
-			del_mtd_partitions(info->mtd);
+			mtd_device_unregister(info->mtd);
 			if (info->mtd != info->subdev[0].mtd)
 				mtd_concat_destroy(info->mtd);
 		}
diff --git a/drivers/mtd/maps/l440gx.c b/drivers/mtd/maps/l440gx.c
index 9e05450..dd0360b 100644
--- a/drivers/mtd/maps/l440gx.c
+++ b/drivers/mtd/maps/l440gx.c
@@ -138,7 +138,7 @@ static int __init init_l440gx(void)
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
 
-		add_mtd_device(mymtd);
+		mtd_device_register(mymtd, NULL, 0);
 		return 0;
 	}
 
@@ -148,7 +148,7 @@ static int __init init_l440gx(void)
 
 static void __exit cleanup_l440gx(void)
 {
-	del_mtd_device(mymtd);
+	mtd_device_unregister(mymtd);
 	map_destroy(mymtd);
 
 	iounmap(l440gx_map.virt);
diff --git a/drivers/mtd/maps/mbx860.c b/drivers/mtd/maps/mbx860.c
index 0eb5a7c..93fa56c 100644
--- a/drivers/mtd/maps/mbx860.c
+++ b/drivers/mtd/maps/mbx860.c
@@ -69,8 +69,8 @@ static int __init init_mbx(void)
 	mymtd = do_map_probe("jedec_probe", &mbx_map);
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
-		add_mtd_device(mymtd);
-                add_mtd_partitions(mymtd, partition_info, NUM_PARTITIONS);
+		mtd_device_register(mymtd, NULL, 0);
+		mtd_device_register(mymtd, partition_info, NUM_PARTITIONS);
 		return 0;
 	}
 
@@ -81,7 +81,7 @@ static int __init init_mbx(void)
 static void __exit cleanup_mbx(void)
 {
 	if (mymtd) {
-		del_mtd_device(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 	if (mbx_map.virt) {
diff --git a/drivers/mtd/maps/netsc520.c b/drivers/mtd/maps/netsc520.c
index c0cb319..81dc259 100644
--- a/drivers/mtd/maps/netsc520.c
+++ b/drivers/mtd/maps/netsc520.c
@@ -116,14 +116,14 @@ static int __init init_netsc520(void)
 	}
 
 	mymtd->owner = THIS_MODULE;
-	add_mtd_partitions( mymtd, partition_info, NUM_PARTITIONS );
+	mtd_device_register(mymtd, partition_info, NUM_PARTITIONS);
 	return 0;
 }
 
 static void __exit cleanup_netsc520(void)
 {
 	if (mymtd) {
-		del_mtd_partitions(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 	if (netsc520_map.virt) {
diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
index a97133e..eadcfff 100644
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -383,13 +383,13 @@ static int __init nettel_init(void)
 		/* No BIOS regions when AMD boot */
 		num_intel_partitions -= 2;
 	}
-	rc = add_mtd_partitions(intel_mtd, nettel_intel_partitions,
-		num_intel_partitions);
+	rc = mtd_device_register(intel_mtd, nettel_intel_partitions,
+				 num_intel_partitions);
 #endif
 
 	if (amd_mtd) {
-		rc = add_mtd_partitions(amd_mtd, nettel_amd_partitions,
-			num_amd_partitions);
+		rc = mtd_device_register(amd_mtd, nettel_amd_partitions,
+					 num_amd_partitions);
 	}
 
 #ifdef CONFIG_MTD_CFI_INTELEXT
@@ -419,7 +419,7 @@ static void __exit nettel_cleanup(void)
 	unregister_reboot_notifier(&nettel_notifier_block);
 #endif
 	if (amd_mtd) {
-		del_mtd_partitions(amd_mtd);
+		mtd_device_unregister(amd_mtd);
 		map_destroy(amd_mtd);
 	}
 	if (nettel_mmcrp) {
@@ -432,7 +432,7 @@ static void __exit nettel_cleanup(void)
 	}
 #ifdef CONFIG_MTD_CFI_INTELEXT
 	if (intel_mtd) {
-		del_mtd_partitions(intel_mtd);
+		mtd_device_unregister(intel_mtd);
 		map_destroy(intel_mtd);
 	}
 	if (nettel_intel_map.virt) {
diff --git a/drivers/mtd/maps/octagon-5066.c b/drivers/mtd/maps/octagon-5066.c
index 23fe178..807ac2a 100644
--- a/drivers/mtd/maps/octagon-5066.c
+++ b/drivers/mtd/maps/octagon-5066.c
@@ -175,7 +175,7 @@ void cleanup_oct5066(void)
 	int i;
 	for (i=0; i<2; i++) {
 		if (oct5066_mtd[i]) {
-			del_mtd_device(oct5066_mtd[i]);
+			mtd_device_unregister(oct5066_mtd[i]);
 			map_destroy(oct5066_mtd[i]);
 		}
 	}
@@ -220,7 +220,7 @@ static int __init init_oct5066(void)
 			oct5066_mtd[i] = do_map_probe("map_rom", &oct5066_map[i]);
 		if (oct5066_mtd[i]) {
 			oct5066_mtd[i]->owner = THIS_MODULE;
-			add_mtd_device(oct5066_mtd[i]);
+			mtd_device_register(oct5066_mtd[i], NULL, 0);
 		}
 	}
 
diff --git a/drivers/mtd/maps/pci.c b/drivers/mtd/maps/pci.c
index 48f4cf5..1d005a3 100644
--- a/drivers/mtd/maps/pci.c
+++ b/drivers/mtd/maps/pci.c
@@ -313,7 +313,7 @@ mtd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto release;
 
 	mtd->owner = THIS_MODULE;
-	add_mtd_device(mtd);
+	mtd_device_register(mtd, NULL, 0);
 
 	pci_set_drvdata(dev, mtd);
 
@@ -336,7 +336,7 @@ mtd_pci_remove(struct pci_dev *dev)
 	struct mtd_info *mtd = pci_get_drvdata(dev);
 	struct map_pci_info *map = mtd->priv;
 
-	del_mtd_device(mtd);
+	mtd_device_unregister(mtd);
 	map_destroy(mtd);
 	map->exit(dev, map);
 	kfree(map);
diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 33dc2829..bbe168b 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -630,7 +630,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 		dev->pcmcia_map.copy_to = pcmcia_copy_to;
 	}
 
-	if(add_mtd_device(mtd)) {
+	if (mtd_device_register(mtd, NULL, 0)) {
 		map_destroy(mtd);
 		dev->mtd_info = NULL;
 		dev_err(&dev->p_dev->dev,
@@ -669,7 +669,7 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
 	DEBUG(3, "link=0x%p", link);
 
 	if(dev->mtd_info) {
-		del_mtd_device(dev->mtd_info);
+		mtd_device_unregister(dev->mtd_info);
 		dev_info(&dev->p_dev->dev, "mtd%d: Removing\n",
 			 dev->mtd_info->index);
 		map_destroy(dev->mtd_info);
diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index 64aea6a..744ca5c 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -173,7 +173,7 @@ static int __init init_msp_flash(void)
 		msp_flash[i] = do_map_probe("cfi_probe", &msp_maps[i]);
 		if (msp_flash[i]) {
 			msp_flash[i]->owner = THIS_MODULE;
-			add_mtd_partitions(msp_flash[i], msp_parts[i], pcnt);
+			mtd_device_register(msp_flash[i], msp_parts[i], pcnt);
 		} else {
 			printk(KERN_ERR "map probe failed for flash\n");
 			ret = -ENXIO;
@@ -188,7 +188,7 @@ static int __init init_msp_flash(void)
 
 cleanup_loop:
 	while (i--) {
-		del_mtd_partitions(msp_flash[i]);
+		mtd_device_unregister(msp_flash[i]);
 		map_destroy(msp_flash[i]);
 		kfree(msp_maps[i].name);
 		iounmap(msp_maps[i].virt);
@@ -207,7 +207,7 @@ static void __exit cleanup_msp_flash(void)
 	int i;
 
 	for (i = 0; i < fcnt; i++) {
-		del_mtd_partitions(msp_flash[i]);
+		mtd_device_unregister(msp_flash[i]);
 		map_destroy(msp_flash[i]);
 		iounmap((void *)msp_maps[i].virt);
 
diff --git a/drivers/mtd/maps/rpxlite.c b/drivers/mtd/maps/rpxlite.c
index 3e3ef53..ed88225 100644
--- a/drivers/mtd/maps/rpxlite.c
+++ b/drivers/mtd/maps/rpxlite.c
@@ -36,7 +36,7 @@ static int __init init_rpxlite(void)
 	mymtd = do_map_probe("cfi_probe", &rpxlite_map);
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
-		add_mtd_device(mymtd);
+		mtd_device_register(mymtd, NULL, 0);
 		return 0;
 	}
 
@@ -47,7 +47,7 @@ static int __init init_rpxlite(void)
 static void __exit cleanup_rpxlite(void)
 {
 	if (mymtd) {
-		del_mtd_device(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 	if (rpxlite_map.virt) {
diff --git a/drivers/mtd/maps/sbc_gxx.c b/drivers/mtd/maps/sbc_gxx.c
index 04b2781..556a2df 100644
--- a/drivers/mtd/maps/sbc_gxx.c
+++ b/drivers/mtd/maps/sbc_gxx.c
@@ -182,7 +182,7 @@ static struct mtd_info *all_mtd;
 static void cleanup_sbc_gxx(void)
 {
 	if( all_mtd ) {
-		del_mtd_partitions( all_mtd );
+		mtd_device_unregister(all_mtd);
 		map_destroy( all_mtd );
 	}
 
@@ -223,7 +223,7 @@ static int __init init_sbc_gxx(void)
 	all_mtd->owner = THIS_MODULE;
 
 	/* Create MTD devices for each partition. */
-	add_mtd_partitions(all_mtd, partition_info, NUM_PARTITIONS );
+	mtd_device_register(all_mtd, partition_info, NUM_PARTITIONS);
 
 	return 0;
 }
diff --git a/drivers/mtd/maps/sc520cdp.c b/drivers/mtd/maps/sc520cdp.c
index 4d8aaaf..8fead8e 100644
--- a/drivers/mtd/maps/sc520cdp.c
+++ b/drivers/mtd/maps/sc520cdp.c
@@ -266,10 +266,10 @@ static int __init init_sc520cdp(void)
 		/* Combine the two flash banks into a single MTD device & register it: */
 		merged_mtd = mtd_concat_create(mymtd, 2, "SC520CDP Flash Banks #0 and #1");
 		if(merged_mtd)
-			add_mtd_device(merged_mtd);
+			mtd_device_register(merged_mtd, NULL, 0);
 	}
 	if(devices_found == 3) /* register the third (DIL-Flash) device */
-		add_mtd_device(mymtd[2]);
+		mtd_device_register(mymtd[2], NULL, 0);
 	return(devices_found ? 0 : -ENXIO);
 }
 
@@ -278,11 +278,11 @@ static void __exit cleanup_sc520cdp(void)
 	int i;
 
 	if (merged_mtd) {
-		del_mtd_device(merged_mtd);
+		mtd_device_unregister(merged_mtd);
 		mtd_concat_destroy(merged_mtd);
 	}
 	if (mymtd[2])
-		del_mtd_device(mymtd[2]);
+		mtd_device_unregister(mymtd[2]);
 
 	for (i = 0; i < NUM_FLASH_BANKS; i++) {
 		if (mymtd[i])
diff --git a/drivers/mtd/maps/scb2_flash.c b/drivers/mtd/maps/scb2_flash.c
index 7e329f0..d88c842 100644
--- a/drivers/mtd/maps/scb2_flash.c
+++ b/drivers/mtd/maps/scb2_flash.c
@@ -180,7 +180,7 @@ scb2_flash_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 
 	scb2_mtd->owner = THIS_MODULE;
 	if (scb2_fixup_mtd(scb2_mtd) < 0) {
-		del_mtd_device(scb2_mtd);
+		mtd_device_unregister(scb2_mtd);
 		map_destroy(scb2_mtd);
 		iounmap(scb2_ioaddr);
 		if (!region_fail)
@@ -192,7 +192,7 @@ scb2_flash_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	       (unsigned long long)scb2_mtd->size,
 	       (unsigned long long)(SCB2_WINDOW - scb2_mtd->size));
 
-	add_mtd_device(scb2_mtd);
+	mtd_device_register(scb2_mtd, NULL, 0);
 
 	return 0;
 }
@@ -207,7 +207,7 @@ scb2_flash_remove(struct pci_dev *dev)
 	if (scb2_mtd->lock)
 		scb2_mtd->lock(scb2_mtd, 0, scb2_mtd->size);
 
-	del_mtd_device(scb2_mtd);
+	mtd_device_unregister(scb2_mtd);
 	map_destroy(scb2_mtd);
 
 	iounmap(scb2_ioaddr);
diff --git a/drivers/mtd/maps/solutionengine.c b/drivers/mtd/maps/solutionengine.c
index 0eb41d9..cbf6bad 100644
--- a/drivers/mtd/maps/solutionengine.c
+++ b/drivers/mtd/maps/solutionengine.c
@@ -89,7 +89,7 @@ static int __init init_soleng_maps(void)
 	eprom_mtd = do_map_probe("map_rom", &soleng_eprom_map);
 	if (eprom_mtd) {
 		eprom_mtd->owner = THIS_MODULE;
-		add_mtd_device(eprom_mtd);
+		mtd_device_register(eprom_mtd, NULL, 0);
 	}
 
 	nr_parts = parse_mtd_partitions(flash_mtd, probes, &parsed_parts, 0);
@@ -104,9 +104,9 @@ static int __init init_soleng_maps(void)
 #endif /* CONFIG_MTD_SUPERH_RESERVE */
 
 	if (nr_parts > 0)
-		add_mtd_partitions(flash_mtd, parsed_parts, nr_parts);
+		mtd_device_register(flash_mtd, parsed_parts, nr_parts);
 	else
-		add_mtd_device(flash_mtd);
+		mtd_device_register(flash_mtd, NULL, 0);
 
 	return 0;
 }
@@ -114,14 +114,14 @@ static int __init init_soleng_maps(void)
 static void __exit cleanup_soleng_maps(void)
 {
 	if (eprom_mtd) {
-		del_mtd_device(eprom_mtd);
+		mtd_device_unregister(eprom_mtd);
 		map_destroy(eprom_mtd);
 	}
 
 	if (parsed_parts)
-		del_mtd_partitions(flash_mtd);
+		mtd_device_unregister(flash_mtd);
 	else
-		del_mtd_device(flash_mtd);
+		mtd_device_unregister(flash_mtd);
 	map_destroy(flash_mtd);
 }
 
diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index 3f1cb32..2d66234 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -101,7 +101,7 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
 
 	up->mtd->owner = THIS_MODULE;
 
-	add_mtd_device(up->mtd);
+	mtd_device_register(up->mtd, NULL, 0);
 
 	dev_set_drvdata(&op->dev, up);
 
@@ -126,7 +126,7 @@ static int __devexit uflash_remove(struct platform_device *op)
 	struct uflash_dev *up = dev_get_drvdata(&op->dev);
 
 	if (up->mtd) {
-		del_mtd_device(up->mtd);
+		mtd_device_unregister(up->mtd);
 		map_destroy(up->mtd);
 	}
 	if (up->map.virt) {
diff --git a/drivers/mtd/maps/ts5500_flash.c b/drivers/mtd/maps/ts5500_flash.c
index e02dfa9..d1d671d 100644
--- a/drivers/mtd/maps/ts5500_flash.c
+++ b/drivers/mtd/maps/ts5500_flash.c
@@ -89,7 +89,7 @@ static int __init init_ts5500_map(void)
 	}
 
 	mymtd->owner = THIS_MODULE;
-	add_mtd_partitions(mymtd, ts5500_partitions, NUM_PARTITIONS);
+	mtd_device_register(mymtd, ts5500_partitions, NUM_PARTITIONS);
 
 	return 0;
 
@@ -102,7 +102,7 @@ err2:
 static void __exit cleanup_ts5500_map(void)
 {
 	if (mymtd) {
-		del_mtd_partitions(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 
diff --git a/drivers/mtd/maps/tsunami_flash.c b/drivers/mtd/maps/tsunami_flash.c
index 77a8bfc..1de390e 100644
--- a/drivers/mtd/maps/tsunami_flash.c
+++ b/drivers/mtd/maps/tsunami_flash.c
@@ -76,7 +76,7 @@ static void __exit  cleanup_tsunami_flash(void)
 	struct mtd_info *mtd;
 	mtd = tsunami_flash_mtd;
 	if (mtd) {
-		del_mtd_device(mtd);
+		mtd_device_unregister(mtd);
 		map_destroy(mtd);
 	}
 	tsunami_flash_mtd = 0;
@@ -97,7 +97,7 @@ static int __init init_tsunami_flash(void)
 	}
 	if (tsunami_flash_mtd) {
 		tsunami_flash_mtd->owner = THIS_MODULE;
-		add_mtd_device(tsunami_flash_mtd);
+		mtd_device_register(tsunami_flash_mtd, NULL, 0);
 		return 0;
 	}
 	return -ENXIO;
diff --git a/drivers/mtd/maps/vmax301.c b/drivers/mtd/maps/vmax301.c
index 6adaa6a..5e68de7 100644
--- a/drivers/mtd/maps/vmax301.c
+++ b/drivers/mtd/maps/vmax301.c
@@ -138,7 +138,7 @@ static void __exit cleanup_vmax301(void)
 
 	for (i=0; i<2; i++) {
 		if (vmax_mtd[i]) {
-			del_mtd_device(vmax_mtd[i]);
+			mtd_device_unregister(vmax_mtd[i]);
 			map_destroy(vmax_mtd[i]);
 		}
 	}
@@ -176,7 +176,7 @@ static int __init init_vmax301(void)
 			vmax_mtd[i] = do_map_probe("map_rom", &vmax_map[i]);
 		if (vmax_mtd[i]) {
 			vmax_mtd[i]->owner = THIS_MODULE;
-			add_mtd_device(vmax_mtd[i]);
+			mtd_device_register(vmax_mtd[i], NULL, 0);
 		}
 	}
 
diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 4afc167..3a04b07 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -563,7 +563,7 @@ static void vmu_queryblocks(struct mapleq *mq)
 		goto fail_cache_create;
 	part_cur->pcache = pcache;
 
-	error = add_mtd_device(mtd_cur);
+	error = mtd_device_register(mtd_cur, NULL, 0);
 	if (error)
 		goto fail_mtd_register;
 
@@ -709,7 +709,7 @@ static void __devexit vmu_disconnect(struct maple_device *mdev)
 	for (x = 0; x < card->partitions; x++) {
 		mpart = ((card->mtd)[x]).priv;
 		mpart->mdev = NULL;
-		del_mtd_device(&((card->mtd)[x]));
+		mtd_device_unregister(&((card->mtd)[x]));
 		kfree(((card->parts)[x]).name);
 	}
 	kfree(card->parts);
diff --git a/drivers/mtd/maps/wr_sbc82xx_flash.c b/drivers/mtd/maps/wr_sbc82xx_flash.c
index 933a2b6..901ce96 100644
--- a/drivers/mtd/maps/wr_sbc82xx_flash.c
+++ b/drivers/mtd/maps/wr_sbc82xx_flash.c
@@ -132,17 +132,20 @@ static int __init init_sbc82xx_flash(void)
 		nr_parts = parse_mtd_partitions(sbcmtd[i], part_probes,
 						&sbcmtd_parts[i], 0);
 		if (nr_parts > 0) {
-			add_mtd_partitions (sbcmtd[i], sbcmtd_parts[i], nr_parts);
+			mtd_device_register(sbcmtd[i], sbcmtd_parts[i],
+					    nr_parts);
 			continue;
 		}
 
 		/* No partitioning detected. Use default */
 		if (i == 2) {
-			add_mtd_device(sbcmtd[i]);
+			mtd_device_register(sbcmtd[i], NULL, 0);
 		} else if (i == bigflash) {
-			add_mtd_partitions (sbcmtd[i], bigflash_parts, ARRAY_SIZE(bigflash_parts));
+			mtd_device_register(sbcmtd[i], bigflash_parts,
+					    ARRAY_SIZE(bigflash_parts));
 		} else {
-			add_mtd_partitions (sbcmtd[i], smallflash_parts, ARRAY_SIZE(smallflash_parts));
+			mtd_device_register(sbcmtd[i], smallflash_parts,
+					    ARRAY_SIZE(smallflash_parts));
 		}
 	}
 	return 0;
@@ -157,9 +160,9 @@ static void __exit cleanup_sbc82xx_flash(void)
 			continue;
 
 		if (i<2 || sbcmtd_parts[i])
-			del_mtd_partitions(sbcmtd[i]);
+			mtd_device_unregister(sbcmtd[i]);
 		else
-			del_mtd_device(sbcmtd[i]);
+			mtd_device_unregister(sbcmtd[i]);
 
 		kfree(sbcmtd_parts[i]);
 		map_destroy(sbcmtd[i]);
diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
index 8691e04..eb40ea8 100644
--- a/drivers/mtd/nand/alauda.c
+++ b/drivers/mtd/nand/alauda.c
@@ -120,7 +120,7 @@ static void alauda_delete(struct kref *kref)
 	struct alauda *al = container_of(kref, struct alauda, kref);
 
 	if (al->mtd) {
-		del_mtd_device(al->mtd);
+		mtd_device_unregister(al->mtd);
 		kfree(al->mtd);
 	}
 	usb_put_dev(al->dev);
@@ -592,7 +592,7 @@ static int alauda_init_media(struct alauda *al)
 	mtd->priv = al;
 	mtd->owner = THIS_MODULE;
 
-	err = add_mtd_device(mtd);
+	err = mtd_device_register(mtd, NULL, 0);
 	if (err) {
 		err = -ENFILE;
 		goto error;
diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index bc65bf7..78017eb 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -235,8 +235,8 @@ static int __devinit ams_delta_init(struct platform_device *pdev)
 	}
 
 	/* Register the partitions */
-	add_mtd_partitions(ams_delta_mtd, partition_info,
-			   ARRAY_SIZE(partition_info));
+	mtd_device_register(ams_delta_mtd, partition_info,
+			    ARRAY_SIZE(partition_info));
 
 	goto out;
 
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 5d513b5..e7767ee 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -581,7 +581,8 @@ static int __init au1xxx_nand_init(void)
 	}
 
 	/* Register the partitions */
-	add_mtd_partitions(au1550_mtd, partition_info, ARRAY_SIZE(partition_info));
+	mtd_device_register(au1550_mtd, partition_info,
+			    ARRAY_SIZE(partition_info));
 
 	return 0;
 
diff --git a/drivers/mtd/nand/autcpu12.c b/drivers/mtd/nand/autcpu12.c
index 0911cf0..eddc9a2 100644
--- a/drivers/mtd/nand/autcpu12.c
+++ b/drivers/mtd/nand/autcpu12.c
@@ -185,20 +185,20 @@ static int __init autcpu12_init(void)
 	/* Register the partitions */
 	switch (autcpu12_mtd->size) {
 		case SZ_16M:
-			add_mtd_partitions(autcpu12_mtd, partition_info16k,
-					   NUM_PARTITIONS16K);
+			mtd_device_register(autcpu12_mtd, partition_info16k,
+					    NUM_PARTITIONS16K);
 			break;
 		case SZ_32M:
-			add_mtd_partitions(autcpu12_mtd, partition_info32k,
-					   NUM_PARTITIONS32K);
+			mtd_device_register(autcpu12_mtd, partition_info32k,
+					    NUM_PARTITIONS32K);
 			break;
 		case SZ_64M:
-			add_mtd_partitions(autcpu12_mtd, partition_info64k,
-					   NUM_PARTITIONS64K);
+			mtd_device_register(autcpu12_mtd, partition_info64k,
+					    NUM_PARTITIONS64K);
 			break;
 		case SZ_128M:
-			add_mtd_partitions(autcpu12_mtd, partition_info128k,
-					   NUM_PARTITIONS128K);
+			mtd_device_register(autcpu12_mtd, partition_info128k,
+					    NUM_PARTITIONS128K);
 			break;
 		default:
 			printk("Unsupported SmartMedia device\n");
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 6e64952..6fc043a 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -238,7 +238,7 @@ static int __init cmx270_init(void)
 
 	/* Register the partitions */
 	pr_notice("Using %s partition definition\n", part_type);
-	ret = add_mtd_partitions(cmx270_nand_mtd, mtd_parts, mtd_parts_nb);
+	ret = mtd_device_register(cmx270_nand_mtd, mtd_parts, mtd_parts_nb);
 	if (ret)
 		goto err_scan;
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 4633f09..7dc330f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1664,7 +1664,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto failed_req_irq;
 	}
 
-	ret = add_mtd_device(&denali->mtd);
+	ret = mtd_device_register(&denali->mtd, NULL, 0);
 	if (ret) {
 		dev_err(&dev->dev, "Spectra: Failed to register MTD: %d\n",
 				ret);
@@ -1696,7 +1696,7 @@ static void denali_pci_remove(struct pci_dev *dev)
 	struct denali_nand_info *denali = pci_get_drvdata(dev);
 
 	nand_release(&denali->mtd);
-	del_mtd_device(&denali->mtd);
+	mtd_device_unregister(&denali->mtd);
 
 	denali_irq_cleanup(dev->irq, denali);
 
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 0cde618..2c2060b 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -316,8 +316,8 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
 					   gpiomtd->mtd_info.size);
 
-	add_mtd_partitions(&gpiomtd->mtd_info, gpiomtd->plat.parts,
-			   gpiomtd->plat.num_parts);
+	mtd_device_register(&gpiomtd->mtd_info, gpiomtd->plat.parts,
+			    gpiomtd->plat.num_parts);
 	platform_set_drvdata(dev, gpiomtd);
 
 	return 0;
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 893d95b..357e8c5 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2383,7 +2383,9 @@ static int __init ns_init_module(void)
 		goto err_exit;
 
 	/* Register NAND partitions */
-	if ((retval = add_mtd_partitions(nsmtd, &nand->partitions[0], nand->nbparts)) != 0)
+	retval = mtd_device_register(nsmtd, &nand->partitions[0],
+				     nand->nbparts);
+	if (retval != 0)
 		goto err_exit;
 
         return 0;
diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 6eddf73..9c30a0b 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -321,8 +321,8 @@ static int __devinit nuc900_nand_probe(struct platform_device *pdev)
 		goto fail3;
 	}
 
-	add_mtd_partitions(&(nuc900_nand->mtd), partitions,
-						ARRAY_SIZE(partitions));
+	mtd_device_register(&(nuc900_nand->mtd), partitions,
+			    ARRAY_SIZE(partitions));
 
 	platform_set_drvdata(pdev, nuc900_nand);
 
diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 20bfe5f..b1aa41b 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -163,7 +163,7 @@ static int __devinit pasemi_nand_probe(struct platform_device *ofdev)
 		goto out_lpc;
 	}
 
-	if (add_mtd_device(pasemi_nand_mtd)) {
+	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		printk(KERN_ERR "pasemi_nand: Unable to register MTD device\n");
 		err = -ENODEV;
 		goto out_lpc;
diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index 67440b5..c9f9127 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -580,7 +580,8 @@ static int __init rtc_from4_init(void)
 #endif
 
 	/* Register the partitions */
-	ret = add_mtd_partitions(rtc_from4_mtd, partition_info, NUM_PARTITIONS);
+	ret = mtd_device_register(rtc_from4_mtd, partition_info,
+				  NUM_PARTITIONS);
 	if (ret)
 		goto err_3;
 
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 81bbb5e..93b1f74 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -867,7 +867,7 @@ static int __devinit flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	add_mtd_partitions(flctl_mtd, pdata->parts, pdata->nr_parts);
+	mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
 
 	return 0;
 
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index 57cc80c..b6332e8 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -139,7 +139,7 @@ int sm_register_device(struct mtd_info *mtd, int smartmedia)
 	if (ret)
 		return ret;
 
-	return add_mtd_device(mtd);
+	return mtd_device_register(mtd, NULL, 0);
 }
 EXPORT_SYMBOL_GPL(sm_register_device);
 
diff --git a/drivers/mtd/nand/spia.c b/drivers/mtd/nand/spia.c
index 0cc6d0a..bef76cd 100644
--- a/drivers/mtd/nand/spia.c
+++ b/drivers/mtd/nand/spia.c
@@ -149,7 +149,7 @@ static int __init spia_init(void)
 	}
 
 	/* Register the partitions */
-	add_mtd_partitions(spia_mtd, partition_info, NUM_PARTITIONS);
+	mtd_device_register(spia_mtd, partition_info, NUM_PARTITIONS);
 
 	/* Return happy */
 	return 0;
diff --git a/drivers/mtd/onenand/onenand_sim.c b/drivers/mtd/onenand/onenand_sim.c
index 5ef3bd5..85399e3 100644
--- a/drivers/mtd/onenand/onenand_sim.c
+++ b/drivers/mtd/onenand/onenand_sim.c
@@ -539,7 +539,8 @@ static int __init onenand_sim_init(void)
 		return -ENXIO;
 	}
 
-	add_mtd_partitions(&info->mtd, info->parts, ARRAY_SIZE(os_partitions));
+	mtd_device_register(&info->mtd, info->parts,
+			    ARRAY_SIZE(os_partitions));
 
 	return 0;
 }
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 9aa8158..941bc3c 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -365,7 +365,7 @@ static int gluebi_create(struct ubi_device_info *di,
 			vi->vol_id);
 	mutex_unlock(&devices_mutex);
 
-	if (add_mtd_device(mtd)) {
+	if (mtd_device_register(mtd, NULL, 0)) {
 		err_msg("cannot add MTD device");
 		kfree(mtd->name);
 		kfree(gluebi);
@@ -407,7 +407,7 @@ static int gluebi_remove(struct ubi_volume_info *vi)
 		return err;
 
 	mtd = &gluebi->mtd;
-	err = del_mtd_device(mtd);
+	err = mtd_device_unregister(mtd);
 	if (err) {
 		err_msg("cannot remove fake MTD device %d, UBI device %d, "
 			"volume %d, error %d", mtd->index, gluebi->ubi_num,
@@ -524,7 +524,7 @@ static void __exit ubi_gluebi_exit(void)
 		int err;
 		struct mtd_info *mtd = &gluebi->mtd;
 
-		err = del_mtd_device(mtd);
+		err = mtd_device_unregister(mtd);
 		if (err)
 			err_msg("error %d while removing gluebi MTD device %d, "
 				"UBI device %d, volume %d - ignoring", err,
diff --git a/drivers/net/sfc/mtd.c b/drivers/net/sfc/mtd.c
index e646bfc..b630448 100644
--- a/drivers/net/sfc/mtd.c
+++ b/drivers/net/sfc/mtd.c
@@ -216,7 +216,7 @@ static void efx_mtd_remove_partition(struct efx_mtd_partition *part)
 	int rc;
 
 	for (;;) {
-		rc = del_mtd_device(&part->mtd);
+		rc = mtd_device_unregister(&part->mtd);
 		if (rc != -EBUSY)
 			break;
 		ssleep(1);
@@ -268,7 +268,7 @@ static int efx_mtd_probe_device(struct efx_nic *efx, struct efx_mtd *efx_mtd)
 		part->mtd.write = efx_mtd->ops->write;
 		part->mtd.sync = efx_mtd_sync;
 
-		if (add_mtd_device(&part->mtd))
+		if (mtd_device_register(&part->mtd, NULL, 0))
 			goto fail;
 	}
 
@@ -280,7 +280,7 @@ fail:
 		--part;
 		efx_mtd_remove_partition(part);
 	}
-	/* add_mtd_device() returns 1 if the MTD table is full */
+	/* mtd_device_register() returns 1 if the MTD table is full */
 	return -ENOMEM;
 }
 
-- 
1.7.4.4
