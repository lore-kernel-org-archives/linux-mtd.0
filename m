Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FtQh3-0000EX-P0
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 11:02:19 -0400
Subject: Re: Current mtd tree is broken
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0606220454o52d99efes74eb86ba3fe02bd7@mail.gmail.com>
References: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
	<1150959173.4244.9.camel@sauron.oktetlabs.ru>
	<625fc13d0606220454o52d99efes74eb86ba3fe02bd7@mail.gmail.com>
Content-Type: multipart/mixed; boundary="=-oACt+IhCh18JfKNpY7/S"
Date: Thu, 22 Jun 2006 19:01:32 +0400
Message-Id: <1150988492.16043.32.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-oACt+IhCh18JfKNpY7/S
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Dear Josh,

On Thu, 2006-06-22 at 06:54 -0500, Josh Boyer wrote:
> I don't like that very much.  It's laziness.  An interface was added
> and working.  Someone changed the semantics of it, but didn't fix all
> the things effected.

the patch his attached and is also accessible at
http://git.infradead.org/?p=users/dedekind/dedekind-mtd-2.6.git;a=summary

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.

--=-oACt+IhCh18JfKNpY7/S
Content-Disposition: attachment; filename=writesize-02.diff
Content-Type: text/x-patch; name=writesize-02.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 0d43581..39edb82 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -357,6 +357,7 @@ struct mtd_info *cfi_cmdset_0001(struct 
 	mtd->resume  = cfi_intelext_resume;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
+	mtd->writesize = 1;
 
 	mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
 
diff --git a/drivers/mtd/chips/jedec.c b/drivers/mtd/chips/jedec.c
index c40b48d..2c3f019 100644
--- a/drivers/mtd/chips/jedec.c
+++ b/drivers/mtd/chips/jedec.c
@@ -256,6 +256,7 @@ static struct mtd_info *jedec_probe(stru
    MTD->name = map->name;
    MTD->type = MTD_NORFLASH;
    MTD->flags = MTD_CAP_NORFLASH;
+   MTD->writesize = 1;
    MTD->erasesize = SectorSize*(map->buswidth);
    //   printk("MTD->erasesize is %x\n",(unsigned int)MTD->erasesize);
    MTD->size = priv->size;
diff --git a/drivers/mtd/chips/map_absent.c b/drivers/mtd/chips/map_absent.c
index a611de9..ac01a94 100644
--- a/drivers/mtd/chips/map_absent.c
+++ b/drivers/mtd/chips/map_absent.c
@@ -64,7 +64,8 @@ static struct mtd_info *map_absent_probe
 	mtd->write 	= map_absent_write;
 	mtd->sync 	= map_absent_sync;
 	mtd->flags 	= 0;
-	mtd->erasesize = PAGE_SIZE;
+	mtd->erasesize  = PAGE_SIZE;
+	mtd->writesize  = 1;
 
 	__module_get(THIS_MODULE);
 	return mtd;
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 7639257..3a66680 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -71,6 +71,7 @@ #endif
 	mtd->write = mapram_write;
 	mtd->sync = mapram_nop;
 	mtd->flags = MTD_CAP_RAM;
+	mtd->writesize = 1;
 
 	mtd->erasesize = PAGE_SIZE;
  	while(mtd->size & (mtd->erasesize - 1))
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index bc6ee9e..1b328b1 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -47,6 +47,7 @@ static struct mtd_info *map_rom_probe(st
 	mtd->sync = maprom_nop;
 	mtd->flags = MTD_CAP_ROM;
 	mtd->erasesize = map->size;
+	mtd->writesize = 1;
 
 	__module_get(THIS_MODULE);
 	return mtd;
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 0d98c22..be3f1c1 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -324,6 +324,7 @@ static struct block2mtd_dev *add_device(
 
 	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
+	dev->mtd.writesize = 1;
 	dev->mtd.type = MTD_RAM;
 	dev->mtd.flags = MTD_CAP_RAM;
 	dev->mtd.erase = block2mtd_erase;
diff --git a/drivers/mtd/devices/ms02-nv.c b/drivers/mtd/devices/ms02-nv.c
index 4ab7670..08dfb89 100644
--- a/drivers/mtd/devices/ms02-nv.c
+++ b/drivers/mtd/devices/ms02-nv.c
@@ -225,6 +225,7 @@ static int __init ms02nv_init_one(ulong 
 	mtd->owner = THIS_MODULE;
 	mtd->read = ms02nv_read;
 	mtd->write = ms02nv_write;
+	mtd->writesize = 1;
 
 	ret = -EIO;
 	if (add_mtd_device(mtd)) {
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index a19480d..04271d0 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -478,6 +478,7 @@ add_dataflash(struct spi_device *spi, ch
 	device->name = (pdata && pdata->name) ? pdata->name : priv->name;
 	device->size = nr_pages * pagesize;
 	device->erasesize = pagesize;
+	device->writesize = pagesize;
 	device->owner = THIS_MODULE;
 	device->type = MTD_DATAFLASH;
 	device->flags = MTD_CAP_NORFLASH;
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index e09e416..6c7337f 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -151,6 +151,7 @@ static int register_device(char *name, u
 	new->mtd.owner = THIS_MODULE;
 	new->mtd.type = MTD_RAM;
 	new->mtd.erasesize = PAGE_SIZE;
+	new->mtd.writesize = 1;
 
 	ret = -EAGAIN;
 	if (add_mtd_device(&new->mtd)) {
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 666cce1..f620d74 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -778,7 +778,8 @@ #endif
                 mtd->type 	= MTD_RAM;
                 mtd->name 	= "PMC551 RAM board";
                 mtd->erasesize 	= 0x10000;
-		mtd->owner = THIS_MODULE;
+                mtd->writesize  = 1;
+                mtd->owner = THIS_MODULE;
 
                 if (add_mtd_device(mtd)) {
                         printk(KERN_NOTICE "pmc551: Failed to register new device\n");
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index b3f665e..542a0c0 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -209,6 +209,7 @@ static int register_device(char *name, u
 	(*curmtd)->mtdinfo->owner = THIS_MODULE;
 	(*curmtd)->mtdinfo->type = MTD_RAM;
 	(*curmtd)->mtdinfo->erasesize = SLRAM_BLK_SZ;
+	(*curmtd)->mtdinfo->writesize = 1;
 
 	if (add_mtd_device((*curmtd)->mtdinfo))	{
 		E("slram: Failed to register new device\n");

--=-oACt+IhCh18JfKNpY7/S--
