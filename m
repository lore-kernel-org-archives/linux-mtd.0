Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CmJ3A-0003u6-7l
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 16:50:43 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j05LoW9W017909
	for <linux-mtd@lists.infradead.org>; Wed, 5 Jan 2005 16:50:32 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j05LoWoD113940
	for <linux-mtd@lists.infradead.org>; Wed, 5 Jan 2005 16:50:32 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j05LoW93022837
	for <linux-mtd@lists.infradead.org>; Wed, 5 Jan 2005 16:50:32 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1104961832.15121.45.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Wed, 05 Jan 2005 15:50:32 -0600
Content-Transfer-Encoding: 7bit
Cc: tom_gall@vnet.ibm.com, sallyt@us.ibm.com
Subject: [PATCH] Add error checking to slram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Howdy,

The following patch fixes a couple issues I saw with the slram driver.

1) No error checking was being done at all.

2) There was no eraseblock size for slram, which made JFFS2 unhappy.

I think the phram driver might suffer from the eraseblock issue.  Also,
the current version of phram has another problem that this patch fixes
for slram.

Basically, the driver doesn't return shorted reads.  I had a problem
where -EINVAL was being returned on a read past the end of the device. 
Seemed fine at first glance, but it's not.

If JFFS2 is used on slram/phram, a dirent node (for example) can be
written to the very end of the device.  When get_inode_nodes reads off
the node it uses the union of the node types which caused the read to go
past the end of the device.  JFFS2 deals fine with shorted reads in that
case, but slram was returning -EINVAL which caused problems.  Once the
slram driver was fixed to do shorted reads, the problem went away.

Just thought I'd point that out if anyone dealing with phram is
listening.

Please take a look at the patch and commit if it looks good.  Comments
are always welcome too :).

thx,
josh

Signed-off-by: Josh Boyer <jdub@us.ibm.com>

--- mtd/drivers/mtd/devices/slram.c	2005-01-05 14:37:06.000000000 -0600
+++ mtd.jwb/drivers/mtd/devices/slram.c	2005-01-05 14:36:41.000000000 -0600
@@ -50,6 +50,7 @@
 #include <linux/mtd/mtd.h>
 
 #define SLRAM_MAX_DEVICES_PARAMS 6		/* 3 parameters / device */
+#define SLRAM_BLK_SZ 0x4000
 
 #define T(fmt, args...) printk(KERN_DEBUG fmt, ## args)
 #define E(fmt, args...) printk(KERN_NOTICE fmt, ## args)
@@ -108,6 +109,9 @@
 {
 	slram_priv_t *priv = mtd->priv;
 
+	if (from + len > mtd->size)
+		return -EINVAL;
+
 	*mtdbuf = priv->start + from;
 	*retlen = len;
 	return(0);
@@ -121,7 +125,13 @@
 		size_t *retlen, u_char *buf)
 {
 	slram_priv_t *priv = mtd->priv;
-	
+
+	if (from > mtd->size)
+		return -EINVAL;
+
+	if (from + len > mtd->size)
+		len = mtd->size - from;
+
 	memcpy(buf, priv->start + from, len);
 
 	*retlen = len;
@@ -133,6 +143,9 @@
 {
 	slram_priv_t *priv = mtd->priv;
 
+	if (to + len > mtd->size)
+		return -EINVAL;
+
 	memcpy(priv->start + to, buf, len);
 
 	*retlen = len;
@@ -188,7 +201,7 @@
 	(*curmtd)->mtdinfo->name = name;
 	(*curmtd)->mtdinfo->size = length;
 	(*curmtd)->mtdinfo->flags = MTD_CLEAR_BITS | MTD_SET_BITS |
-					MTD_WRITEB_WRITEABLE | MTD_VOLATILE;
+					MTD_WRITEB_WRITEABLE | MTD_VOLATILE | MTD_CAP_RAM;
         (*curmtd)->mtdinfo->erase = slram_erase;
 	(*curmtd)->mtdinfo->point = slram_point;
 	(*curmtd)->mtdinfo->unpoint = slram_unpoint;
@@ -196,7 +209,7 @@
 	(*curmtd)->mtdinfo->write = slram_write;
 	(*curmtd)->mtdinfo->owner = THIS_MODULE;
 	(*curmtd)->mtdinfo->type = MTD_RAM;
-	(*curmtd)->mtdinfo->erasesize = 0x0;
+	(*curmtd)->mtdinfo->erasesize = SLRAM_BLK_SZ;
 
 	if (add_mtd_device((*curmtd)->mtdinfo))	{
 		E("slram: Failed to register new device\n");
@@ -261,7 +274,7 @@
 	}
 	T("slram: devname=%s, devstart=0x%lx, devlength=0x%lx\n",
 			devname, devstart, devlength);
-	if ((devstart < 0) || (devlength < 0)) {
+	if ((devstart < 0) || (devlength < 0) || (devlength % SLRAM_BLK_SZ != 0)) {
 		E("slram: Illegal start / length parameter.\n");
 		return(-EINVAL);
 	}
