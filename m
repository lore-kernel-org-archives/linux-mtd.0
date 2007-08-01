Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGDDD-0004Zh-Ia
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 08:22:15 -0400
Date: Wed, 1 Aug 2007 13:55:36 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070801115535.GA2747@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
Cc: dhowells <dhowells@redhat.com>, Carsten Otte <cotte@de.ibm.com>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 31 July 2007 12:55:23 -0700, Jared Hulbert wrote:
> 
> > The problem with this is that it expects the caller to 'know' that the
> > mtd device it's using is in fact a partition.
> 
> Oh I hadn't considered that a device could not be a partition and
> still have physaddr be relavant.  Can it?

part->master should fit the bill.

Worse, your patch guesses that mtd->priv is actually a
(struct map_info *).  I don't want to be around when that guess goes
wrong.  No cookies for you today.

> > If we have to do this, I'd
> > rather see it done generically.
> 
> Okay.  Can you give me a little nudge in the right direction?
>
> > Jörn is probably right that it should be
> > available from (whatever replaces) the point() method.

point() doesn't have to be replaced.  My completely untested and
uncompiled patch below adds another parameter to point() to return the
physical address in.  Parameter is optional and only cfi_cmdset_0001.c
currently allows it.

The patch also changes the virtual parameter from (u_char **) to
(void __iomem **).  Not sure whether that makes sense.  So no cookies
for me either.

Jörn

-- 
They laughed at Galileo.  They laughed at Copernicus.  They laughed at
Columbus. But remember, they also laughed at Bozo the Clown.
-- unknown

--- point_phys/include/linux/mtd/mtd.h~point_phys	2007-05-16 02:01:55.000000000 +0200
+++ point_phys/include/linux/mtd/mtd.h	2007-08-01 13:49:30.000000000 +0200
@@ -136,10 +136,14 @@ struct mtd_info {
 	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
 
 	/* This stuff for eXecute-In-Place */
-	int (*point) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char **mtdbuf);
+	/* phys is optional and may be set to NULL */
+	int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
+			size_t *retlen, void __iomem **virt,
+			resource_size_t *phys);
 
 	/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
-	void (*unpoint) (struct mtd_info *mtd, u_char * addr, loff_t from, size_t len);
+	void (*unpoint) (struct mtd_info *mtd, void *addr, loff_t from,
+			size_t len);
 
 
 	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
--- point_phys/drivers/mtd/chips/cfi_cmdset_0001.c~point_phys	2007-05-16 02:01:27.000000000 +0200
+++ point_phys/drivers/mtd/chips/cfi_cmdset_0001.c	2007-08-01 13:42:05.000000000 +0200
@@ -81,7 +81,7 @@ static struct mtd_info *cfi_intelext_set
 static int cfi_intelext_partition_fixup(struct mtd_info *, struct cfi_private **);
 
 static int cfi_intelext_point (struct mtd_info *mtd, loff_t from, size_t len,
-		     size_t *retlen, u_char **mtdbuf);
+		     size_t *retlen, void __iomem**virt, resource_size_t *phys);
 static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char *addr, loff_t from,
 			size_t len);
 
@@ -1162,7 +1162,8 @@ static int do_point_onechip (struct map_
 	return ret;
 }
 
-static int cfi_intelext_point (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char **mtdbuf)
+static int cfi_intelext_point (struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, void __iomem **virt, resource_size_t *phys)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -1173,7 +1174,9 @@ static int cfi_intelext_point (struct mt
 	if (!map->virt || (from + len > mtd->size))
 		return -EINVAL;
 
-	*mtdbuf = (void *)map->virt + from;
+	*virt = map->virt + from;
+	if (phys)
+		*phys = map->phys + from;
 	*retlen = 0;
 
 	/* Now lock the chip(s) to POINT state */
--- point_phys/drivers/mtd/mtdpart.c~point_phys	2007-05-16 02:01:27.000000000 +0200
+++ point_phys/drivers/mtd/mtdpart.c	2007-08-01 13:37:22.000000000 +0200
@@ -68,7 +68,8 @@ static int part_read (struct mtd_info *m
 }
 
 static int part_point (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, u_char **buf)
+			size_t *retlen, void __iomem **virt,
+			resource_size_t *phys)
 {
 	struct mtd_part *part = PART(mtd);
 	if (from >= mtd->size)
@@ -76,7 +77,7 @@ static int part_point (struct mtd_info *
 	else if (from + len > mtd->size)
 		len = mtd->size - from;
 	return part->master->point (part->master, from + part->offset,
-				    len, retlen, buf);
+				    len, retlen, virt, phys);
 }
 
 static void part_unpoint (struct mtd_info *mtd, u_char *addr, loff_t from, size_t len)
--- point_phys/drivers/mtd/devices/pmc551.c~point_phys	2007-07-10 16:28:31.000000000 +0200
+++ point_phys/drivers/mtd/devices/pmc551.c	2007-08-01 13:32:50.000000000 +0200
@@ -134,7 +134,7 @@ static int pmc551_erase(struct mtd_info 
 	eoff_lo = end & (priv->asize - 1);
 	soff_lo = instr->addr & (priv->asize - 1);
 
-	pmc551_point(mtd, instr->addr, instr->len, &retlen, &ptr);
+	pmc551_point(mtd, instr->addr, instr->len, &retlen, &ptr, NULL);
 
 	if (soff_hi == eoff_hi || mtd->size == priv->asize) {
 		/* The whole thing fits within one access, so just one shot
@@ -154,7 +154,7 @@ static int pmc551_erase(struct mtd_info 
 			}
 			soff_hi += priv->asize;
 			pmc551_point(mtd, (priv->base_map0 | soff_hi),
-				     priv->asize, &retlen, &ptr);
+				     priv->asize, &retlen, &ptr, NULL);
 		}
 		memset(ptr, 0xff, eoff_lo);
 	}
@@ -170,12 +170,16 @@ static int pmc551_erase(struct mtd_info 
 }
 
 static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
-			size_t * retlen, u_char ** mtdbuf)
+		size_t * retlen, void __iomem **virt, resource_size_t *phys)
 {
 	struct mypriv *priv = mtd->priv;
 	u32 soff_hi;
 	u32 soff_lo;
 
+	/* anyone needing this has to fix the driver, sorry */
+	if (phys)
+		return -EINVAL;
+
 #ifdef CONFIG_MTD_PMC551_DEBUG
 	printk(KERN_DEBUG "pmc551_point(%ld, %ld)\n", (long)from, (long)len);
 #endif
@@ -198,7 +202,7 @@ static int pmc551_point(struct mtd_info 
 		priv->curr_map0 = soff_hi;
 	}
 
-	*mtdbuf = priv->start + soff_lo;
+	*virt = priv->start + soff_lo;
 	*retlen = len;
 	return 0;
 }
@@ -242,7 +246,7 @@ static int pmc551_read(struct mtd_info *
 	soff_lo = from & (priv->asize - 1);
 	eoff_lo = end & (priv->asize - 1);
 
-	pmc551_point(mtd, from, len, retlen, &ptr);
+	pmc551_point(mtd, from, len, retlen, &ptr, NULL);
 
 	if (soff_hi == eoff_hi) {
 		/* The whole thing fits within one access, so just one shot
@@ -263,7 +267,7 @@ static int pmc551_read(struct mtd_info *
 				goto out;
 			}
 			soff_hi += priv->asize;
-			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr);
+			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr, NULL);
 		}
 		memcpy(copyto, ptr, eoff_lo);
 		copyto += eoff_lo;
@@ -308,7 +312,7 @@ static int pmc551_write(struct mtd_info 
 	soff_lo = to & (priv->asize - 1);
 	eoff_lo = end & (priv->asize - 1);
 
-	pmc551_point(mtd, to, len, retlen, &ptr);
+	pmc551_point(mtd, to, len, retlen, &ptr, NULL);
 
 	if (soff_hi == eoff_hi) {
 		/* The whole thing fits within one access, so just one shot
@@ -329,7 +333,7 @@ static int pmc551_write(struct mtd_info 
 				goto out;
 			}
 			soff_hi += priv->asize;
-			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr);
+			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr, NULL);
 		}
 		memcpy(ptr, copyfrom, eoff_lo);
 		copyfrom += eoff_lo;
--- point_phys/drivers/mtd/devices/phram.c~point_phys	2007-02-12 11:33:26.000000000 +0100
+++ point_phys/drivers/mtd/devices/phram.c	2007-08-01 13:34:18.000000000 +0200
@@ -57,14 +57,17 @@ static int phram_erase(struct mtd_info *
 }
 
 static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void __iomem **virt, resource_size_t *phys)
 {
 	u_char *start = mtd->priv;
 
+	if (phys)
+		return -EINVAL; /* FIXME */
+
 	if (from + len > mtd->size)
 		return -EINVAL;
 
-	*mtdbuf = start + from;
+	*virt = start + from;
 	*retlen = len;
 	return 0;
 }
--- point_phys/drivers/mtd/devices/mtdram.c~point_phys	2006-10-13 15:58:41.000000000 +0200
+++ point_phys/drivers/mtd/devices/mtdram.c	2007-08-01 13:34:57.000000000 +0200
@@ -47,12 +47,12 @@ static int ram_erase(struct mtd_info *mt
 }
 
 static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void __iomem **virt, resource_size_t *phys)
 {
 	if (from + len > mtd->size)
 		return -EINVAL;
 
-	*mtdbuf = mtd->priv + from;
+	*virt = mtd->priv + from;
 	*retlen = len;
 	return 0;
 }
--- point_phys/drivers/mtd/devices/slram.c~point_phys	2007-02-19 23:16:28.000000000 +0100
+++ point_phys/drivers/mtd/devices/slram.c	2007-08-01 13:35:33.000000000 +0200
@@ -104,14 +104,17 @@ static int slram_erase(struct mtd_info *
 }
 
 static int slram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void __iomem **virt, resource_size_t *phys)
 {
 	slram_priv_t *priv = mtd->priv;
 
+	if (phys)
+		return -EINVAL;
+
 	if (from + len > mtd->size)
 		return -EINVAL;
 
-	*mtdbuf = priv->start + from;
+	*virt = priv->start + from;
 	*retlen = len;
 	return(0);
 }
--- point_phys/drivers/mtd/maps/uclinux.c~point_phys	2007-07-10 16:28:31.000000000 +0200
+++ point_phys/drivers/mtd/maps/uclinux.c	2007-08-01 13:39:22.000000000 +0200
@@ -40,10 +40,12 @@ struct mtd_partition uclinux_romfs[] = {
 /****************************************************************************/
 
 int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, u_char **mtdbuf)
+	size_t *retlen, void __iomem **virt, resource_size_t *phys)
 {
 	struct map_info *map = mtd->priv;
-	*mtdbuf = (u_char *) (map->virt + ((int) from));
+	*virt = map->virt + from;
+	if (phys)
+		*phys = map->phys + from;
 	*retlen = len;
 	return(0);
 }
--- point_phys/fs/jffs2/scan.c~point_phys	2007-05-16 02:01:39.000000000 +0200
+++ point_phys/fs/jffs2/scan.c	2007-08-01 13:40:37.000000000 +0200
@@ -97,7 +97,7 @@ int jffs2_scan_medium(struct jffs2_sb_in
 	size_t pointlen;
 
 	if (c->mtd->point) {
-		ret = c->mtd->point (c->mtd, 0, c->mtd->size, &pointlen, &flashbuf);
+		ret = c->mtd->point (c->mtd, 0, c->mtd->size, &pointlen, &flashbuf, NULL);
 		if (!ret && pointlen < c->mtd->size) {
 			/* Don't muck about if it won't let us point to the whole flash */
 			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", pointlen));
--- point_phys/fs/jffs2/readinode.c~point_phys	2007-07-10 16:28:35.000000000 +0200
+++ point_phys/fs/jffs2/readinode.c	2007-08-01 13:41:34.000000000 +0200
@@ -62,7 +62,7 @@ static int check_node_data(struct jffs2_
 	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
 	 * adding and jffs2_flash_read_end() interface. */
 	if (c->mtd->point) {
-		err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
+		err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer, NULL);
 		if (!err && retlen < tn->csize) {
 			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
 			c->mtd->unpoint(c->mtd, buffer, ofs, len);
