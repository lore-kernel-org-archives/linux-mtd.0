Received: from law11-f101.law11.hotmail.com ([64.4.17.101] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aecax-0000bN-6M
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2004 16:01:15 +0000
From: "J B" <mad_flasher@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 08 Jan 2004 09:58:47 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <Law11-F1010bEISOrtI0006703e@hotmail.com>
cc: dwmw2@infradead.org
Subject: [PATCH] Trivial: cleanup sizeof use
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When kmallocing and memsetting variables, most of the mtd code uses the 
following use of sizeof:

struct mtd_info *info = NULL;
...
info = kmalloc(sizeof(*info), GFP_KERNEL);

as opposed to:

info = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);

IMHO, the sizeof(*info) approach is better since if the type of info ever 
changes, the sizeof still works correctly.  And its less typing ;).

The following patch cleanups up the useage of sizeof to be consistent.  The 
patch is against the latest mtd cvs tree.  Apply if you like.

j

diff -Naur --exclude CVS mtd.cvs/drivers/mtd/devices/blkmtd-25.c 
mtd/drivers/mtd/devices/blkmtd-25.c
--- mtd.cvs/drivers/mtd/devices/blkmtd-25.c	2003-07-16 01:48:27.000000000 
-0500
+++ mtd/drivers/mtd/devices/blkmtd-25.c	2004-01-08 09:23:31.000000000 -0600
@@ -657,13 +657,13 @@
		return NULL;
	}

-	dev = kmalloc(sizeof(struct blkmtd_dev), GFP_KERNEL);
+	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
	if(dev == NULL) {
		blkdev_put(bdev, BDEV_RAW);
		return NULL;
	}

-	memset(dev, 0, sizeof(struct blkmtd_dev));
+	memset(dev, 0, sizeof(*dev));
	if(!readonly) {
		init_MUTEX(&dev->wrbuf_mutex);
	}
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/devices/blkmtd.c 
mtd/drivers/mtd/devices/blkmtd.c
--- mtd.cvs/drivers/mtd/devices/blkmtd.c	2003-06-27 10:10:35.000000000 -0500
+++ mtd/drivers/mtd/devices/blkmtd.c	2004-01-08 09:24:52.000000000 -0600
@@ -836,11 +836,11 @@

	DEBUG(1, "blkmtd: devname = %s\n", bdevname(kdev));

-	dev = kmalloc(sizeof(struct blkmtd_dev), GFP_KERNEL);
+	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
	if(dev == NULL)
		return NULL;

-	memset(dev, 0, sizeof(struct blkmtd_dev));
+	memset(dev, 0, sizeof(*dev));
	if(alloc_kiovec(1, &dev->rd_buf)) {
		err("cant allocate read iobuf");
		goto devinit_err;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/devices/docprobe.c 
mtd/drivers/mtd/devices/docprobe.c
--- mtd.cvs/drivers/mtd/devices/docprobe.c	2003-12-03 04:19:57.000000000 
-0600
+++ mtd/drivers/mtd/devices/docprobe.c	2004-01-08 09:26:52.000000000 -0600
@@ -266,8 +266,8 @@

		this = (struct DiskOnChip *)(&mtd[1]);

-		memset((char *)mtd,0, sizeof(struct mtd_info));
-		memset((char *)this, 0, sizeof(struct DiskOnChip));
+		memset((char *)mtd,0, sizeof(*mtd));
+		memset((char *)this, 0, sizeof(*this));

		mtd->priv = this;
		this->virtadr = docptr;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/devices/mtdram.c 
mtd/drivers/mtd/devices/mtdram.c
--- mtd.cvs/drivers/mtd/devices/mtdram.c	2003-05-21 10:15:07.000000000 -0500
+++ mtd/drivers/mtd/devices/mtdram.c	2004-01-08 09:28:23.000000000 -0600
@@ -159,7 +159,7 @@
   void *addr;
   int err;
   /* Allocate some memory */
-   mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info), 
GFP_KERNEL);
+   mtd_info = (struct mtd_info *)kmalloc(sizeof(*mtd_info), GFP_KERNEL);
    if (!mtd_info)
      return -ENOMEM;

@@ -192,7 +192,7 @@
   void *addr;
   int err;
   /* Allocate some memory */
-   mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info), 
GFP_KERNEL);
+   mtd_info = (struct mtd_info *)kmalloc(sizeof(*mtd_info), GFP_KERNEL);
    if (!mtd_info)
      return -ENOMEM;

diff -Naur --exclude CVS mtd.cvs/drivers/mtd/devices/phram.c 
mtd/drivers/mtd/devices/phram.c
--- mtd.cvs/drivers/mtd/devices/phram.c	2003-08-21 12:52:30.000000000 -0500
+++ mtd/drivers/mtd/devices/phram.c	2004-01-08 09:33:41.000000000 -0600
@@ -131,11 +131,11 @@
	if (!new)
		goto out0;

-	new->mtdinfo = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+	new->mtdinfo = kmalloc(sizeof(*(new->mtd_info)), GFP_KERNEL);
	if (!new->mtdinfo)
		goto out1;

-	memset(new->mtdinfo, 0, sizeof(struct mtd_info));
+	memset(new->mtdinfo, 0, sizeof(*(new->mtd_info)));

	ret = -EIO;
	new->mtdinfo->priv = ioremap(start, len);
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/devices/pmc551.c 
mtd/drivers/mtd/devices/pmc551.c
--- mtd.cvs/drivers/mtd/devices/pmc551.c	2003-06-23 07:24:01.000000000 -0500
+++ mtd/drivers/mtd/devices/pmc551.c	2004-01-08 09:34:38.000000000 -0600
@@ -719,15 +719,15 @@
			msize = length;
		}

-                mtd = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+                mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
                 if (!mtd) {
                         printk(KERN_NOTICE "pmc551: Cannot allocate new MTD 
device.\n");
                         break;
                 }

-                memset(mtd, 0, sizeof(struct mtd_info));
+                memset(mtd, 0, sizeof(*mtd));

-                priv = kmalloc (sizeof(struct mypriv), GFP_KERNEL);
+                priv = kmalloc (sizeof(*priv), GFP_KERNEL);
                 if (!priv) {
                         printk(KERN_NOTICE "pmc551: Cannot allocate new MTD 
device.\n");
                         kfree(mtd);
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/ftl.c mtd/drivers/mtd/ftl.c
--- mtd.cvs/drivers/mtd/ftl.c	2003-08-11 04:00:44.000000000 -0500
+++ mtd/drivers/mtd/ftl.c	2004-01-08 09:12:50.000000000 -0600
@@ -352,7 +352,7 @@
     /* Is there a free erase slot? Always in MTD. */


-    erase=kmalloc(sizeof(struct erase_info), GFP_KERNEL);
+    erase=kmalloc(sizeof(*erase), GFP_KERNEL);
     if (!erase)
             return -ENOMEM;

diff -Naur --exclude CVS mtd.cvs/drivers/mtd/inftlmount.c 
mtd/drivers/mtd/inftlmount.c
--- mtd.cvs/drivers/mtd/inftlmount.c	2003-06-26 02:31:36.000000000 -0500
+++ mtd/drivers/mtd/inftlmount.c	2004-01-08 09:13:59.000000000 -0600
@@ -119,7 +119,7 @@
			 * We've already processed one. So we just check if
			 * this one is the same as the first one we found.
			 */
-			if (memcmp(mh, buf, sizeof(struct INFTLMediaHeader))) {
+			if (memcmp(mh, buf, sizeof(*mh))) {
				printk(KERN_WARNING "INFTL: Media Headers at "
					"0x%x and 0x%x disagree.\n",
					inftl->MediaUnit * inftl->EraseSize,
@@ -143,7 +143,7 @@
		 * This is the first we've seen.
		 * Copy the media header structure into place.
		 */
-		memcpy(mh, buf, sizeof(struct INFTLMediaHeader));
+		memcpy(mh, buf, sizeof(*mh));
		mh->NoOfBootImageBlocks = le32_to_cpu(mh->NoOfBootImageBlocks);
		mh->NoOfBinaryPartitions = le32_to_cpu(mh->NoOfBinaryPartitions);
		mh->NoOfBDTLPartitions = le32_to_cpu(mh->NoOfBDTLPartitions);
@@ -413,7 +413,7 @@
	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_formatblock(inftl=0x%x,"
		"block=%d)\n", (int)inftl, block);

-	memset(instr, 0, sizeof(struct erase_info));
+	memset(instr, 0, sizeof(*instr));

	/* FIXME: Shouldn't we be setting the 'discarded' flag to zero
	   _first_? */
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/maps/integrator-flash.c 
mtd/drivers/mtd/maps/integrator-flash.c
--- mtd.cvs/drivers/mtd/maps/integrator-flash.c	2003-10-11 
05:00:31.000000000 -0500
+++ mtd/drivers/mtd/maps/integrator-flash.c	2004-01-08 09:36:22.000000000 
-0600
@@ -77,13 +77,13 @@
	int err;
	void *base;

-	info = kmalloc(sizeof(struct armflash_info), GFP_KERNEL);
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
	if (!info) {
		err = -ENOMEM;
		goto out;
	}

-	memset(info, 0, sizeof(struct armflash_info));
+	memset(info, 0, sizeof(*info));

	info->plat = plat;
	if (plat && plat->init) {
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/maps/sun_uflash.c 
mtd/drivers/mtd/maps/sun_uflash.c
--- mtd.cvs/drivers/mtd/maps/sun_uflash.c	2003-05-20 15:59:32.000000000 
-0500
+++ mtd/drivers/mtd/maps/sun_uflash.c	2004-01-08 09:37:55.000000000 -0600
@@ -81,7 +81,7 @@
		return -ENODEV;
	}

-	if(0 == (pdev = kmalloc(sizeof(struct uflash_dev), GFP_KERNEL))) {
+	if(0 == (pdev = kmalloc(sizeof(*pdev), GFP_KERNEL))) {
		printk("%s: unable to kmalloc new device\n", UFLASH_DEVNAME);
		return(-ENOMEM);
	}
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/mtdblock.c 
mtd/drivers/mtd/mtdblock.c
--- mtd.cvs/drivers/mtd/mtdblock.c	2003-10-04 12:14:14.000000000 -0500
+++ mtd/drivers/mtd/mtdblock.c	2004-01-08 09:08:26.000000000 -0600
@@ -274,7 +274,7 @@
	}

	/* OK, it's not open. Create cache info for it */
-	mtdblk = kmalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
+	mtdblk = kmalloc(sizeof(*mtdblk), GFP_KERNEL);
	if (!mtdblk)
		return -ENOMEM;

diff -Naur --exclude CVS mtd.cvs/drivers/mtd/mtdconcat.c 
mtd/drivers/mtd/mtdconcat.c
--- mtd.cvs/drivers/mtd/mtdconcat.c	2003-06-30 06:01:26.000000000 -0500
+++ mtd/drivers/mtd/mtdconcat.c	2004-01-08 09:16:29.000000000 -0600
@@ -451,7 +451,7 @@
	}

	/* make a local copy of instr to avoid modifying the caller's struct */
-	erase = kmalloc(sizeof (struct erase_info), GFP_KERNEL);
+	erase = kmalloc(sizeof (*erase), GFP_KERNEL);

	if (!erase)
		return -ENOMEM;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/nand/autcpu12.c 
mtd/drivers/mtd/nand/autcpu12.c
--- mtd.cvs/drivers/mtd/nand/autcpu12.c	2003-07-11 10:12:29.000000000 -0500
+++ mtd/drivers/mtd/nand/autcpu12.c	2004-01-08 09:39:31.000000000 -0600
@@ -169,8 +169,8 @@
	this = (struct nand_chip *) (&autcpu12_mtd[1]);

	/* Initialize structures */
-	memset((char *) autcpu12_mtd, 0, sizeof(struct mtd_info));
-	memset((char *) this, 0, sizeof(struct nand_chip));
+	memset((char *) autcpu12_mtd, 0, sizeof(*autcpu12_mtd));
+	memset((char *) this, 0, sizeof(*this));

	/* Link the private data with the MTD structure */
	autcpu12_mtd->priv = this;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/nand/edb7312.c 
mtd/drivers/mtd/nand/edb7312.c
--- mtd.cvs/drivers/mtd/nand/edb7312.c	2003-07-11 10:12:29.000000000 -0500
+++ mtd/drivers/mtd/nand/edb7312.c	2004-01-08 09:40:13.000000000 -0600
@@ -154,8 +154,8 @@
	this = (struct nand_chip *) (&ep7312_mtd[1]);

	/* Initialize structures */
-	memset((char *) ep7312_mtd, 0, sizeof(struct mtd_info));
-	memset((char *) this, 0, sizeof(struct nand_chip));
+	memset((char *) ep7312_mtd, 0, sizeof(*ep7312_mtd));
+	memset((char *) this, 0, sizeof(*this));

	/* Link the private data with the MTD structure */
	ep7312_mtd->priv = this;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/nand/spia.c 
mtd/drivers/mtd/nand/spia.c
--- mtd.cvs/drivers/mtd/nand/spia.c	2003-07-11 10:12:29.000000000 -0500
+++ mtd/drivers/mtd/nand/spia.c	2004-01-08 09:40:41.000000000 -0600
@@ -119,8 +119,8 @@
	this = (struct nand_chip *) (&spia_mtd[1]);

	/* Initialize structures */
-	memset((char *) spia_mtd, 0, sizeof(struct mtd_info));
-	memset((char *) this, 0, sizeof(struct nand_chip));
+	memset((char *) spia_mtd, 0, sizeof(*spia_mtd));
+	memset((char *) this, 0, sizeof(*this));

	/* Link the private data with the MTD structure */
	spia_mtd->priv = this;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/nand/toto.c 
mtd/drivers/mtd/nand/toto.c
--- mtd.cvs/drivers/mtd/nand/toto.c	2003-10-21 05:04:58.000000000 -0500
+++ mtd/drivers/mtd/nand/toto.c	2004-01-08 09:41:10.000000000 -0600
@@ -134,8 +134,8 @@
	this = (struct nand_chip *) (&toto_mtd[1]);

	/* Initialize structures */
-	memset((char *) toto_mtd, 0, sizeof(struct mtd_info));
-	memset((char *) this, 0, sizeof(struct nand_chip));
+	memset((char *) toto_mtd, 0, sizeof(*toto_mtd));
+	memset((char *) this, 0, sizeof(*this));

	/* Link the private data with the MTD structure */
	toto_mtd->priv = this;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/nand/tx4925ndfmc.c 
mtd/drivers/mtd/nand/tx4925ndfmc.c
--- mtd.cvs/drivers/mtd/nand/tx4925ndfmc.c	2003-11-04 16:59:11.000000000 
-0600
+++ mtd/drivers/mtd/nand/tx4925ndfmc.c	2004-01-08 09:41:52.000000000 -0600
@@ -341,8 +341,8 @@
	this = (struct nand_chip *) (&tx4925ndfmc_mtd[1]);

	/* Initialize structures */
-	memset((char *) tx4925ndfmc_mtd, 0, sizeof(struct mtd_info));
-	memset((char *) this, 0, sizeof(struct nand_chip));
+	memset((char *) tx4925ndfmc_mtd, 0, sizeof(*tx4925ndfmc_mtd));
+	memset((char *) this, 0, sizeof(*this));

	/* Link the private data with the MTD structure */
	tx4925ndfmc_mtd->priv = this;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/nand/tx4938ndfmc.c 
mtd/drivers/mtd/nand/tx4938ndfmc.c
--- mtd.cvs/drivers/mtd/nand/tx4938ndfmc.c	2003-11-04 16:59:11.000000000 
-0600
+++ mtd/drivers/mtd/nand/tx4938ndfmc.c	2004-01-08 09:42:21.000000000 -0600
@@ -336,8 +336,8 @@
	this = (struct nand_chip *) (&tx4938ndfmc_mtd[1]);

	/* Initialize structures */
-	memset((char *) tx4938ndfmc_mtd, 0, sizeof(struct mtd_info));
-	memset((char *) this, 0, sizeof(struct nand_chip));
+	memset((char *) tx4938ndfmc_mtd, 0, sizeof(*tx4938ndfmc_mtd));
+	memset((char *) this, 0, sizeof(*this));

	/* Link the private data with the MTD structure */
	tx4938ndfmc_mtd->priv = this;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/nftlcore.c 
mtd/drivers/mtd/nftlcore.c
--- mtd.cvs/drivers/mtd/nftlcore.c	2003-06-23 07:00:08.000000000 -0500
+++ mtd/drivers/mtd/nftlcore.c	2004-01-08 09:09:53.000000000 -0600
@@ -48,7 +48,7 @@

	DEBUG(MTD_DEBUG_LEVEL1, "NFTL: add_mtd for %s\n", mtd->name);

-	nftl = kmalloc(sizeof(struct NFTLrecord), GFP_KERNEL);
+	nftl = kmalloc(sizeof(*nftl), GFP_KERNEL);

	if (!nftl) {
		printk(KERN_WARNING "NFTL: out of memory for data structures\n");
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/nftlmount.c 
mtd/drivers/mtd/nftlmount.c
--- mtd.cvs/drivers/mtd/nftlmount.c	2003-05-21 05:54:10.000000000 -0500
+++ mtd/drivers/mtd/nftlmount.c	2004-01-08 09:11:02.000000000 -0600
@@ -124,7 +124,7 @@
		if (boot_record_count) {
			/* We've already processed one. So we just check if
			   this one is the same as the first one we found */
-			if (memcmp(mh, buf, sizeof(struct NFTLMediaHeader))) {
+			if (memcmp(mh, buf, sizeof(*mh))) {
				printk(KERN_NOTICE "NFTL Media Headers at 0x%x and 0x%x disagree.\n",
				       nftl->MediaUnit * nftl->EraseSize, block * nftl->EraseSize);
				/* if (debug) Print both side by side */
@@ -146,7 +146,7 @@
		}

		/* This is the first we've seen. Copy the media header structure into 
place */
-		memcpy(mh, buf, sizeof(struct NFTLMediaHeader));
+		memcpy(mh, buf, sizeof(*mh));

		/* Do some sanity checks on it */
		if (mh->UnitSizeFactor == 0) {
@@ -304,7 +304,7 @@
		uci.WearInfo = cpu_to_le32(0);
	}

-	memset(instr, 0, sizeof(struct erase_info));
+	memset(instr, 0, sizeof(*instr));

	/* XXX: use async erase interface, XXX: test return code */
	instr->addr = block * nftl->EraseSize;
diff -Naur --exclude CVS mtd.cvs/drivers/mtd/redboot.c 
mtd/drivers/mtd/redboot.c
--- mtd.cvs/drivers/mtd/redboot.c	2003-06-25 11:08:10.000000000 -0500
+++ mtd/drivers/mtd/redboot.c	2004-01-08 09:11:38.000000000 -0600
@@ -88,7 +88,7 @@
		if (!redboot_checksum(&buf[i]))
			break;

-		new_fl = kmalloc(sizeof(struct fis_list), GFP_KERNEL);
+		new_fl = kmalloc(sizeof(*new_fl), GFP_KERNEL);
		namelen += strlen(buf[i].name)+1;
		if (!new_fl) {
			ret = -ENOMEM;

_________________________________________________________________
Expand your wine savvy — and get some great new recipes — at MSN Wine. 
http://wine.msn.com
