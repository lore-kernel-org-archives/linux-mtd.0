Received: from wa-out-1112.google.com ([209.85.146.182])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqRHV-0005nx-AX
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 05:40:17 -0500
Received: by wa-out-1112.google.com with SMTP id v33so535945wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 09 Nov 2007 02:40:06 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v752.3)
To: linux-mtd@lists.infradead.org
Message-Id: <2F7C27F9-291A-49B5-9BE3-9264F1DDFB27@gmail.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-4--598181713
From: Jared Hulbert <jaredeh@gmail.com>
Subject: [PATCH][MTD] adding physical address to point()
Date: Fri, 9 Nov 2007 02:41:06 -0800
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Apple-Mail-4--598181713
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

Adding the ability to get a physical address from point() in addition
to virtual address.  This physical address will be required for axfs
and cramfs with XIP.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
drivers/mtd/chips/cfi_cmdset_0001.c |   13 ++++++++-----
drivers/mtd/devices/mtdram.c        |   11 +++++++----
drivers/mtd/devices/phram.c         |   13 +++++++------
drivers/mtd/devices/pmc551.c        |   27 +++++++++++++++++----------
drivers/mtd/devices/slram.c         |   14 +++++++++-----
drivers/mtd/maps/uclinux.c          |    6 ++++--
drivers/mtd/mtdpart.c               |    8 ++++----
fs/jffs2/erase.c                    |    6 +++---
fs/jffs2/readinode.c                |    8 ++++----
fs/jffs2/scan.c                     |    6 +++---
include/linux/mtd/mtd.h             |    6 ++++--
include/linux/mtd/pmc551.h          |    5 +++--
12 files changed, 73 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/ 
cfi_cmdset_0001.c
index da851c2..a4ef81a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -82,8 +82,8 @@ static struct mtd_info *cfi_intelext_setup (struct  
mtd_info *);
static int cfi_intelext_partition_fixup(struct mtd_info *, struct  
cfi_private **);
static int cfi_intelext_point (struct mtd_info *mtd, loff_t from,  
size_t len,
-		     size_t *retlen, u_char **mtdbuf);
-static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char  
*addr, loff_t from,
+		     size_t *retlen, void **virt, resource_size_t *phys);
+static void cfi_intelext_unpoint (struct mtd_info *mtd, loff_t from,
			size_t len);
static int chip_ready (struct map_info *map, struct flchip *chip,  
unsigned long adr, int mode);
@@ -1216,7 +1216,8 @@ static int do_point_onechip (struct map_info  
*map, struct flchip *chip, loff_t a
	return ret;
}
-static int cfi_intelext_point (struct mtd_info *mtd, loff_t from,  
size_t len, size_t *retlen, u_char **mtdbuf)
+static int cfi_intelext_point (struct mtd_info *mtd, loff_t from,  
size_t len, size_t *retlen,
+		void **virt, resource_size_t *phys)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
@@ -1233,8 +1234,10 @@ static int cfi_intelext_point (struct mtd_info  
*mtd, loff_t from, size_t len, si
	chipnum = (from >> cfi->chipshift);
	ofs = from - (chipnum << cfi->chipshift);
-	*mtdbuf = (void *)map->virt + cfi->chips[chipnum].start + ofs;
+	*virt = map->virt + cfi->chips[chipnum].start + ofs;
	*retlen = 0;
+	if (phys)
+		*phys = map->phys + cfi->chips[chipnum].start + ofs;
	while (len) {
		unsigned long thislen;
@@ -1267,7 +1270,7 @@ static int cfi_intelext_point (struct mtd_info  
*mtd, loff_t from, size_t len, si
	return 0;
}
-static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char  
*addr, loff_t from, size_t len)
+static void cfi_intelext_unpoint (struct mtd_info *mtd, loff_t from,  
size_t len)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index e427c82..fe39a9d 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -47,18 +47,21 @@ static int ram_erase(struct mtd_info *mtd, struct  
erase_info *instr)
}
static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void **virt, resource_size_t *phys)
{
	if (from + len > mtd->size)
		return -EINVAL;
-	*mtdbuf = mtd->priv + from;
+	/* can we return a physical address with this driver? */
+	if (phys)
+		return -EINVAL;
+
+	*virt = mtd->priv + from;
	*retlen = len;
	return 0;
}
-static void ram_unpoint(struct mtd_info *mtd, u_char * addr, loff_t  
from,
-		size_t len)
+static void ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
{
}
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 56cc1ca..06d1052 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -57,20 +57,21 @@ static int phram_erase(struct mtd_info *mtd,  
struct erase_info *instr)
}
static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void **virt, resource_size_t *phys)
{
-	u_char *start = mtd->priv;
-
	if (from + len > mtd->size)
		return -EINVAL;
-	*mtdbuf = start + from;
+	/* can we return a physical address with this driver? */
+	if (phys)
+		return -EINVAL;
+
+	*virt = mtd->priv + from;
	*retlen = len;
	return 0;
}
-static void phram_unpoint(struct mtd_info *mtd, u_char *addr, loff_t  
from,
-		size_t len)
+static void phram_unpoint(struct mtd_info *mtd, loff_t from, size_t  
len)
{
}
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 7060a08..f82ba78 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -134,7 +134,8 @@ static int pmc551_erase(struct mtd_info *mtd,  
struct erase_info *instr)
	eoff_lo = end & (priv->asize - 1);
	soff_lo = instr->addr & (priv->asize - 1);
-	pmc551_point(mtd, instr->addr, instr->len, &retlen, &ptr);
+	pmc551_point(mtd, instr->addr, instr->len, &retlen,
+		     (void **)&ptr, NULL);
	if (soff_hi == eoff_hi || mtd->size == priv->asize) {
		/* The whole thing fits within one access, so just one shot
@@ -154,7 +155,8 @@ static int pmc551_erase(struct mtd_info *mtd,  
struct erase_info *instr)
			}
			soff_hi += priv->asize;
			pmc551_point(mtd, (priv->base_map0 | soff_hi),
-				     priv->asize, &retlen, &ptr);
+				     priv->asize, &retlen,
+				     (void **)&ptr, NULL);
		}
		memset(ptr, 0xff, eoff_lo);
	}
@@ -170,7 +172,7 @@ static int pmc551_erase(struct mtd_info *mtd,  
struct erase_info *instr)
}
static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
-			size_t * retlen, u_char ** mtdbuf)
+			size_t * retlen, void **virt, resource_size_t *phys)
{
	struct mypriv *priv = mtd->priv;
	u32 soff_hi;
@@ -188,6 +190,10 @@ static int pmc551_point(struct mtd_info *mtd,  
loff_t from, size_t len,
		return -EINVAL;
	}
+	/* can we return a physical address with this driver? */
+	if (phys)
+		return -EINVAL;
+
	soff_hi = from & ~(priv->asize - 1);
	soff_lo = from & (priv->asize - 1);
@@ -198,13 +204,12 @@ static int pmc551_point(struct mtd_info *mtd,  
loff_t from, size_t len,
		priv->curr_map0 = soff_hi;
	}
-	*mtdbuf = priv->start + soff_lo;
+	*virt = priv->start + soff_lo;
	*retlen = len;
	return 0;
}
-static void pmc551_unpoint(struct mtd_info *mtd, u_char * addr,  
loff_t from,
-			   size_t len)
+static void pmc551_unpoint(struct mtd_info *mtd, loff_t from, size_t  
len)
{
#ifdef CONFIG_MTD_PMC551_DEBUG
	printk(KERN_DEBUG "pmc551_unpoint()\n");
@@ -242,7 +247,7 @@ static int pmc551_read(struct mtd_info *mtd,  
loff_t from, size_t len,
	soff_lo = from & (priv->asize - 1);
	eoff_lo = end & (priv->asize - 1);
-	pmc551_point(mtd, from, len, retlen, &ptr);
+	pmc551_point(mtd, from, len, retlen, (void **)&ptr, NULL);
	if (soff_hi == eoff_hi) {
		/* The whole thing fits within one access, so just one shot
@@ -263,7 +268,8 @@ static int pmc551_read(struct mtd_info *mtd,  
loff_t from, size_t len,
				goto out;
			}
			soff_hi += priv->asize;
-			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr);
+			pmc551_point(mtd, soff_hi, priv->asize, retlen,
+			 	     (void **)&ptr, NULL);
		}
		memcpy(copyto, ptr, eoff_lo);
		copyto += eoff_lo;
@@ -308,7 +314,7 @@ static int pmc551_write(struct mtd_info *mtd,  
loff_t to, size_t len,
	soff_lo = to & (priv->asize - 1);
	eoff_lo = end & (priv->asize - 1);
-	pmc551_point(mtd, to, len, retlen, &ptr);
+	pmc551_point(mtd, to, len, retlen, (void **)&ptr, NULL);
	if (soff_hi == eoff_hi) {
		/* The whole thing fits within one access, so just one shot
@@ -329,7 +335,8 @@ static int pmc551_write(struct mtd_info *mtd,  
loff_t to, size_t len,
				goto out;
			}
			soff_hi += priv->asize;
-			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr);
+			pmc551_point(mtd, soff_hi, priv->asize, retlen,
+				     (void **)&ptr, NULL);
		}
		memcpy(ptr, copyfrom, eoff_lo);
		copyfrom += eoff_lo;
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index d293add..110884f 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -76,8 +76,8 @@ static char *map;
static slram_mtd_list_t *slram_mtdlist = NULL;
static int slram_erase(struct mtd_info *, struct erase_info *);
-static int slram_point(struct mtd_info *, loff_t, size_t, size_t *,  
u_char **);
-static void slram_unpoint(struct mtd_info *, u_char *, loff_t,	size_t);
+static int slram_point(struct mtd_info *, loff_t, size_t, size_t *,  
void **, resource_size_t *);
+static void slram_unpoint(struct mtd_info *, loff_t, size_t);
static int slram_read(struct mtd_info *, loff_t, size_t, size_t *,  
u_char *);
static int slram_write(struct mtd_info *, loff_t, size_t, size_t *,  
const u_char *);
@@ -104,19 +104,23 @@ static int slram_erase(struct mtd_info *mtd,  
struct erase_info *instr)
}
static int slram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void **virt, resource_size_t *phys)
{
	slram_priv_t *priv = mtd->priv;
+	/* can we return a physical address with this driver? */
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
-static void slram_unpoint(struct mtd_info *mtd, u_char *addr, loff_t  
from, size_t len)
+static void slram_unpoint(struct mtd_info *mtd, loff_t from, size_t  
len)
{
}
diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 14ffb1a..c42f4b8 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -40,10 +40,12 @@ struct mtd_partition uclinux_romfs[] = {
/ 
************************************************************************ 
****/
int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, u_char **mtdbuf)
+	size_t *retlen, void **virt, resource_size_t *phys)
{
	struct map_info *map = mtd->priv;
-	*mtdbuf = (u_char *) (map->virt + ((int) from));
+	*virt = map->virt + from;
+	if (phys)
+		*phys = map->phys + from;
	*retlen = len;
	return(0);
}
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6174a97..5f62018 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -68,7 +68,7 @@ static int part_read (struct mtd_info *mtd, loff_t  
from, size_t len,
}
static int part_point (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, u_char **buf)
+			size_t *retlen, void **virt, resource_size_t *phys)
{
	struct mtd_part *part = PART(mtd);
	if (from >= mtd->size)
@@ -76,14 +76,14 @@ static int part_point (struct mtd_info *mtd,  
loff_t from, size_t len,
	else if (from + len > mtd->size)
		len = mtd->size - from;
	return part->master->point (part->master, from + part->offset,
-				    len, retlen, buf);
+				    len, retlen, virt, phys);
}
-static void part_unpoint (struct mtd_info *mtd, u_char *addr, loff_t  
from, size_t len)
+static void part_unpoint (struct mtd_info *mtd, loff_t from, size_t  
len)
{
	struct mtd_part *part = PART(mtd);
-	part->master->unpoint (part->master, addr, from + part->offset, len);
+	part->master->unpoint (part->master, from + part->offset, len);
}
static int part_read_oob(struct mtd_info *mtd, loff_t from,
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..f6c6fe2 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -332,7 +332,7 @@ static int jffs2_block_check_erase(struct  
jffs2_sb_info *c, struct jffs2_erasebl
	if (c->mtd->point) {
		unsigned long *wordebuf;
-		ret = c->mtd->point(c->mtd, jeb->offset, c->sector_size, &retlen,  
(unsigned char **)&ebuf);
+		ret = c->mtd->point(c->mtd, jeb->offset, c->sector_size, &retlen,  
&ebuf, NULL);
		if (ret) {
			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
			goto do_flash_read;
@@ -340,7 +340,7 @@ static int jffs2_block_check_erase(struct  
jffs2_sb_info *c, struct jffs2_erasebl
		if (retlen < c->sector_size) {
			/* Don't muck about if it won't let us point to the whole erase  
sector */
			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n",  
retlen));
-			c->mtd->unpoint(c->mtd, ebuf, jeb->offset, retlen);
+			c->mtd->unpoint(c->mtd, jeb->offset, retlen);
			goto do_flash_read;
		}
		wordebuf = ebuf-sizeof(*wordebuf);
@@ -349,7 +349,7 @@ static int jffs2_block_check_erase(struct  
jffs2_sb_info *c, struct jffs2_erasebl
		   if (*++wordebuf != ~0)
			   break;
		} while(--retlen);
-		c->mtd->unpoint(c->mtd, ebuf, jeb->offset, c->sector_size);
+		c->mtd->unpoint(c->mtd, jeb->offset, c->sector_size);
		if (retlen)
			printk(KERN_WARNING "Newly-erased block contained word 0x%lx at  
offset 0x%08tx\n",
			       *wordebuf, jeb->offset + c->sector_size-retlen*sizeof 
(*wordebuf));
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 2eae5d2..d782ffa 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -62,10 +62,10 @@ static int check_node_data(struct jffs2_sb_info  
*c, struct jffs2_tmp_dnode_info
	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
	 * adding and jffs2_flash_read_end() interface. */
	if (c->mtd->point) {
-		err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
+		err = c->mtd->point(c->mtd, ofs, len, &retlen, (void **)&buffer,  
NULL);
		if (!err && retlen < tn->csize) {
			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u. 
\n", retlen, tn->csize);
-			c->mtd->unpoint(c->mtd, buffer, ofs, retlen);
+			c->mtd->unpoint(c->mtd, ofs, retlen);
		} else if (err)
			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
		else
@@ -99,7 +99,7 @@ static int check_node_data(struct jffs2_sb_info *c,  
struct jffs2_tmp_dnode_info
		kfree(buffer);
#ifndef __ECOS
	else
-		c->mtd->unpoint(c->mtd, buffer, ofs, len);
+		c->mtd->unpoint(c->mtd, ofs, len);
#endif
	if (crc != tn->data_crc) {
@@ -135,7 +135,7 @@ free_out:
		kfree(buffer);
#ifndef __ECOS
	else
-		c->mtd->unpoint(c->mtd, buffer, ofs, len);
+		c->mtd->unpoint(c->mtd, ofs, len);
#endif
	return err;
}
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 272872d..0b7edc8 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -97,11 +97,11 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
	size_t pointlen;
	if (c->mtd->point) {
-		ret = c->mtd->point (c->mtd, 0, c->mtd->size, &pointlen, &flashbuf);
+		ret = c->mtd->point(c->mtd, 0, c->mtd->size, &pointlen, (void **) 
&flashbuf, NULL);
		if (!ret && pointlen < c->mtd->size) {
			/* Don't muck about if it won't let us point to the whole flash */
			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n",  
pointlen));
-			c->mtd->unpoint(c->mtd, flashbuf, 0, pointlen);
+			c->mtd->unpoint(c->mtd, 0, pointlen);
			flashbuf = NULL;
		}
		if (ret)
@@ -267,7 +267,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
		kfree(flashbuf);
#ifndef __ECOS
	else
-		c->mtd->unpoint(c->mtd, flashbuf, 0, c->mtd->size);
+		c->mtd->unpoint(c->mtd, 0, c->mtd->size);
#endif
	if (s)
		kfree(s);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 783fc98..041ce23 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -143,10 +143,12 @@ struct mtd_info {
	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
	/* This stuff for eXecute-In-Place */
-	int (*point) (struct mtd_info *mtd, loff_t from, size_t len, size_t  
*retlen, u_char **mtdbuf);
+	/* phys is optional and may be set to NULL */
+	int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
+			size_t *retlen, void **virt, resource_size_t *phys);
	/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
-	void (*unpoint) (struct mtd_info *mtd, u_char * addr, loff_t from,  
size_t len);
+	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t  
*retlen, u_char *buf);
diff --git a/include/linux/mtd/pmc551.h b/include/linux/mtd/pmc551.h
index a7f6d20..fd139e9 100644
--- a/include/linux/mtd/pmc551.h
+++ b/include/linux/mtd/pmc551.h
@@ -36,8 +36,9 @@ struct mypriv {
   * Function Prototypes
   */
static int pmc551_erase(struct mtd_info *, struct erase_info *);
-static void pmc551_unpoint(struct mtd_info *, u_char *, loff_t,  
size_t);
-static int pmc551_point (struct mtd_info *mtd, loff_t from, size_t  
len, size_t *retlen, u_char **mtdbuf);
+static void pmc551_unpoint(struct mtd_info *, loff_t, size_t);
+static int pmc551_point (struct mtd_info *mtd, loff_t from, size_t  
len, size_t *retlen, void **virt,
+		resource_size_t *phys);
static int pmc551_read(struct mtd_info *, loff_t, size_t, size_t *,  
u_char *);
static int pmc551_write(struct mtd_info *, loff_t, size_t, size_t *,  
const u_char *);

--Apple-Mail-4--598181713
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; "><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">Adding the ability to get a physical address from point() in =
addition</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">to virtual address. =A0This physical address will be required =
for axfs</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">and cramfs with XIP.</SPAN></FONT></DIV><DIV style=3D"margin-top:=
 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: =
normal normal normal 12.8px/normal Arial; min-height: 15px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C"><BR></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#3E174C" =
face=3D"Arial" size=3D"3"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 12.8px;">Signed-off-by: Jared Hulbert =
&lt;</SPAN></FONT><A href=3D"mailto:jaredeh@gmail.com"><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"3"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 12.8px;"><FONT =
class=3D"Apple-style-span" =
color=3D"#0036C1">jaredeh@gmail.com</FONT></SPAN></FONT></A><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">&gt;</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">---</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">drivers/mtd/chips/cfi_cmdset_0001.c |=A0=A0 13 =
++++++++-----</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">drivers/mtd/devices/mtdram.c=A0 =A0 =A0 =A0 |=A0=A0 11 =
+++++++----</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">drivers/mtd/devices/phram.c=A0 =A0 =A0 =A0=A0 |=A0=A0 13 =
+++++++------</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">drivers/mtd/devices/pmc551.c=A0 =A0 =A0 =A0 |=A0=A0 27 =
+++++++++++++++++----------</SPAN></FONT></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">drivers/mtd/devices/slram.c=A0 =A0 =A0 =A0=A0 |=A0=A0 14 =
+++++++++-----</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">drivers/mtd/maps/uclinux.c=A0 =A0 =A0 =A0 =A0 |=A0 =A0 6 =
++++--</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">drivers/mtd/mtdpart.c=A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 |=A0 =A0 8 =
++++----</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">fs/jffs2/erase.c=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=A0 =A0 =
6 +++---</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">fs/jffs2/readinode.c=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=A0 =A0 8 =
++++----</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">fs/jffs2/scan.c=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 |=A0 =
=A0 6 +++---</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">include/linux/mtd/mtd.h=A0 =A0 =A0 =A0 =A0 =A0=A0 |=A0 =A0 6 =
++++--</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">include/linux/mtd/pmc551.h=A0 =A0 =A0 =A0 =A0 |=A0 =A0 5 =
+++--</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#3E174C" face=3D"Arial" =
size=3D"3"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
12.8px;">12 files changed, 73 insertions(+), 50 =
deletions(-)</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 12px/normal Helvetica; min-height: 14px; =
"><BR></DIV><DIV>diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c =
b/drivers/mtd/chips/cfi_cmdset_0001.c</DIV><DIV>index da851c2..a4ef81a =
100644</DIV><DIV>--- a/drivers/mtd/chips/cfi_cmdset_0001.c</DIV><DIV>+++ =
b/drivers/mtd/chips/cfi_cmdset_0001.c</DIV><DIV>@@ -82,8 +82,8 @@ static =
struct mtd_info *cfi_intelext_setup (struct mtd_info *);</DIV><DIV> =
static int cfi_intelext_partition_fixup(struct mtd_info *, struct =
cfi_private **);</DIV><DIV> static int cfi_intelext_point (struct =
mtd_info *mtd, loff_t from, size_t len,</DIV><DIV>-<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</SPAN>=A0=
 =A0=A0 size_t *retlen, u_char **mtdbuf);</DIV><DIV>-static void =
cfi_intelext_unpoint (struct mtd_info *mtd, u_char *addr, loff_t =
from,</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">=
		</SPAN>=A0 =A0=A0 size_t *retlen, void **virt, =
resource_size_t *phys);</DIV><DIV>+static void cfi_intelext_unpoint =
(struct mtd_info *mtd, loff_t from,</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>size_t len);</DIV><DIV> static int chip_ready (struct map_info =
*map, struct flchip *chip, unsigned long adr, int mode);</DIV><DIV>@@ =
-1216,7 +1216,8 @@ static int do_point_onechip (struct map_info *map, =
struct flchip *chip, loff_t a</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>return ret;</DIV><DIV> =
}</DIV><DIV>-static int cfi_intelext_point (struct mtd_info *mtd, loff_t =
from, size_t len, size_t *retlen, u_char **mtdbuf)</DIV><DIV>+static int =
cfi_intelext_point (struct mtd_info *mtd, loff_t from, size_t len, =
size_t *retlen,</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>void **virt, =
resource_size_t *phys)</DIV><DIV> {</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>struct =
map_info *map =3D mtd-&gt;priv;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>struct cfi_private *cfi =3D =
map-&gt;fldrv_priv;</DIV><DIV>@@ -1233,8 +1234,10 @@ static int =
cfi_intelext_point (struct mtd_info *mtd, loff_t from, size_t len, =
si</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>chipnum =3D (from &gt;&gt; cfi-&gt;chipshift);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>ofs =3D =
from - (chipnum &lt;&lt; cfi-&gt;chipshift);</DIV><DIV>-<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>*mtdbuf =3D=
 (void *)map-&gt;virt + cfi-&gt;chips[chipnum].start + =
ofs;</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>*virt =3D map-&gt;virt + cfi-&gt;chips[chipnum].start + =
ofs;</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>*retlen =3D 0;</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>if (phys)</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>*phys =3D map-&gt;phys + cfi-&gt;chips[chipnum].start + =
ofs;</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>while (len) {</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>unsigned long =
thislen;</DIV><DIV>@@ -1267,7 +1270,7 @@ static int cfi_intelext_point =
(struct mtd_info *mtd, loff_t from, size_t len, si</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>return =
0;</DIV><DIV> }</DIV><DIV>-static void cfi_intelext_unpoint (struct =
mtd_info *mtd, u_char *addr, loff_t from, size_t len)</DIV><DIV>+static =
void cfi_intelext_unpoint (struct mtd_info *mtd, loff_t from, size_t =
len)</DIV><DIV> {</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>struct map_info *map =3D =
mtd-&gt;priv;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>struct cfi_private *cfi =3D =
map-&gt;fldrv_priv;</DIV><DIV>diff --git a/drivers/mtd/devices/mtdram.c =
b/drivers/mtd/devices/mtdram.c</DIV><DIV>index e427c82..fe39a9d =
100644</DIV><DIV>--- a/drivers/mtd/devices/mtdram.c</DIV><DIV>+++ =
b/drivers/mtd/devices/mtdram.c</DIV><DIV>@@ -47,18 +47,21 @@ static int =
ram_erase(struct mtd_info *mtd, struct erase_info *instr)</DIV><DIV> =
}</DIV><DIV> static int ram_point(struct mtd_info *mtd, loff_t from, =
size_t len,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>size_t *retlen, u_char =
**mtdbuf)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>size_t *retlen, void =
**virt, resource_size_t *phys)</DIV><DIV> {</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>if (from =
+ len &gt; mtd-&gt;size)</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>return =
-EINVAL;</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*mtdbuf =3D mtd-&gt;priv + =
from;</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</SPAN>/* can we return a physical address with this driver? =
*/</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>if (phys)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>return =
-EINVAL;</DIV><DIV>+</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*virt =3D mtd-&gt;priv + =
from;</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>*retlen =3D len;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>return 0;</DIV><DIV> =
}</DIV><DIV>-static void ram_unpoint(struct mtd_info *mtd, u_char * =
addr, loff_t from,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>size_t =
len)</DIV><DIV>+static void ram_unpoint(struct mtd_info *mtd, loff_t =
from, size_t len)</DIV><DIV> {</DIV><DIV> }</DIV><DIV>diff --git =
a/drivers/mtd/devices/phram.c =
b/drivers/mtd/devices/phram.c</DIV><DIV>index 56cc1ca..06d1052 =
100644</DIV><DIV>--- a/drivers/mtd/devices/phram.c</DIV><DIV>+++ =
b/drivers/mtd/devices/phram.c</DIV><DIV>@@ -57,20 +57,21 @@ static int =
phram_erase(struct mtd_info *mtd, struct erase_info *instr)</DIV><DIV> =
}</DIV><DIV> static int phram_point(struct mtd_info *mtd, loff_t from, =
size_t len,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>size_t *retlen, u_char =
**mtdbuf)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>size_t *retlen, void =
**virt, resource_size_t *phys)</DIV><DIV> {</DIV><DIV>-<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>u_char =
*start =3D mtd-&gt;priv;</DIV><DIV>-</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>if (from =
+ len &gt; mtd-&gt;size)</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>return =
-EINVAL;</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*mtdbuf =3D start + =
from;</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</SPAN>/* can we return a physical address with this driver? =
*/</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>if (phys)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>return =
-EINVAL;</DIV><DIV>+</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*virt =3D mtd-&gt;priv + =
from;</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>*retlen =3D len;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>return 0;</DIV><DIV> =
}</DIV><DIV>-static void phram_unpoint(struct mtd_info *mtd, u_char =
*addr, loff_t from,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>size_t =
len)</DIV><DIV>+static void phram_unpoint(struct mtd_info *mtd, loff_t =
from, size_t len)</DIV><DIV> {</DIV><DIV> }</DIV><DIV>diff --git =
a/drivers/mtd/devices/pmc551.c =
b/drivers/mtd/devices/pmc551.c</DIV><DIV>index 7060a08..f82ba78 =
100644</DIV><DIV>--- a/drivers/mtd/devices/pmc551.c</DIV><DIV>+++ =
b/drivers/mtd/devices/pmc551.c</DIV><DIV>@@ -134,7 +134,8 @@ static int =
pmc551_erase(struct mtd_info *mtd, struct erase_info =
*instr)</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>eoff_lo =3D end &amp; =
(priv-&gt;asize - 1);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>soff_lo =3D instr-&gt;addr &amp; =
(priv-&gt;asize - 1);</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>pmc551_point(mtd, instr-&gt;addr, =
instr-&gt;len, &amp;retlen, &amp;ptr);</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>pmc551_point(mtd, instr-&gt;addr, instr-&gt;len, &amp;retlen, =
</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>=A0 =A0=A0 (void **)&amp;ptr, NULL);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>if =
(soff_hi =3D=3D eoff_hi || mtd-&gt;size =3D=3D priv-&gt;asize) =
{</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>/* The whole thing fits within one access, so just one =
shot</DIV><DIV>@@ -154,7 +155,8 @@ static int pmc551_erase(struct =
mtd_info *mtd, struct erase_info *instr)</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>}</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>soff_hi +=3D =
priv-&gt;asize;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>pmc551_point(mtd, =
(priv-&gt;base_map0 | soff_hi),</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">				</SPAN>=A0 =A0=A0 =
priv-&gt;asize, &amp;retlen, &amp;ptr);</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">				=
</SPAN>=A0 =A0=A0 priv-&gt;asize, &amp;retlen,</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">				=
</SPAN>=A0 =A0=A0 (void **)&amp;ptr, NULL);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>}</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>memset(ptr, 0xff, =
eoff_lo);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>}</DIV><DIV>@@ -170,7 +172,7 @@ =
static int pmc551_erase(struct mtd_info *mtd, struct erase_info =
*instr)</DIV><DIV> }</DIV><DIV> static int pmc551_point(struct mtd_info =
*mtd, loff_t from, size_t len,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>size_t * retlen, =
u_char ** mtdbuf)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>size_t * retlen, =
void **virt, resource_size_t *phys)</DIV><DIV> {</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>struct =
mypriv *priv =3D mtd-&gt;priv;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>u32 soff_hi;</DIV><DIV>@@ -188,6 =
+190,10 @@ static int pmc551_point(struct mtd_info *mtd, loff_t from, =
size_t len,</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>return =
-EINVAL;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>}</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>/* can we =
return a physical address with this driver? */</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>if =
(phys)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>return =
-EINVAL;</DIV><DIV>+</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>soff_hi =3D from &amp; =
~(priv-&gt;asize - 1);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>soff_lo =3D from &amp; =
(priv-&gt;asize - 1);</DIV><DIV>@@ -198,13 +204,12 @@ static int =
pmc551_point(struct mtd_info *mtd, loff_t from, size_t =
len,</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
	</SPAN>priv-&gt;curr_map0 =3D soff_hi;</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>}</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*mtdbuf =3D priv-&gt;start + =
soff_lo;</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*virt =3D priv-&gt;start + =
soff_lo;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*retlen =3D len;</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>return =
0;</DIV><DIV> }</DIV><DIV>-static void pmc551_unpoint(struct mtd_info =
*mtd, u_char * addr, loff_t from,</DIV><DIV>-<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>=A0=A0 size_t len)</DIV><DIV>+static void pmc551_unpoint(struct =
mtd_info *mtd, loff_t from, size_t len)</DIV><DIV> {</DIV><DIV> #ifdef =
CONFIG_MTD_PMC551_DEBUG</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>printk(KERN_DEBUG =
"pmc551_unpoint()\n");</DIV><DIV>@@ -242,7 +247,7 @@ static int =
pmc551_read(struct mtd_info *mtd, loff_t from, size_t =
len,</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>soff_lo =3D from &amp; (priv-&gt;asize - 1);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>eoff_lo =3D=
 end &amp; (priv-&gt;asize - 1);</DIV><DIV>-<SPAN class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</SPAN>pmc551_point(mtd, from, len, =
retlen, &amp;ptr);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>pmc551_point(mtd, from, len, =
retlen, (void **)&amp;ptr, NULL);</DIV><DIV><SPAN class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</SPAN>if (soff_hi =3D=3D eoff_hi) =
{</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>/* The whole thing fits within one access, so just one =
shot</DIV><DIV>@@ -263,7 +268,8 @@ static int pmc551_read(struct =
mtd_info *mtd, loff_t from, size_t len,</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">				=
</SPAN>goto out;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>}</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>soff_hi +=3D priv-&gt;asize;</DIV><DIV>-<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>pmc551_point(mtd, soff_hi, priv-&gt;asize, retlen, =
&amp;ptr);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>pmc551_point(mtd, =
soff_hi, priv-&gt;asize, retlen,</DIV><DIV>+<SPAN class=3D"Apple-tab-span"=
 style=3D"white-space:pre">			</SPAN> <SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>=A0 =A0=A0 =
(void **)&amp;ptr, NULL);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>}</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>memcpy(copyto, ptr, eoff_lo);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>copyto +=3D eoff_lo;</DIV><DIV>@@ -308,7 +314,7 @@ static int =
pmc551_write(struct mtd_info *mtd, loff_t to, size_t =
len,</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>soff_lo =3D to &amp; (priv-&gt;asize - 1);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>eoff_lo =3D=
 end &amp; (priv-&gt;asize - 1);</DIV><DIV>-<SPAN class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</SPAN>pmc551_point(mtd, to, len, =
retlen, &amp;ptr);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>pmc551_point(mtd, to, len, =
retlen, (void **)&amp;ptr, NULL);</DIV><DIV><SPAN class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</SPAN>if (soff_hi =3D=3D eoff_hi) =
{</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>/* The whole thing fits within one access, so just one =
shot</DIV><DIV>@@ -329,7 +335,8 @@ static int pmc551_write(struct =
mtd_info *mtd, loff_t to, size_t len,</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">				=
</SPAN>goto out;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>}</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>soff_hi +=3D priv-&gt;asize;</DIV><DIV>-<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>pmc551_point(mtd, soff_hi, priv-&gt;asize, retlen, =
&amp;ptr);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>pmc551_point(mtd, =
soff_hi, priv-&gt;asize, retlen,</DIV><DIV>+<SPAN class=3D"Apple-tab-span"=
 style=3D"white-space:pre">				</SPAN>=A0 =A0=A0 =
(void **)&amp;ptr, NULL);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>}</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>memcpy(ptr, copyfrom, eoff_lo);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>copyfrom +=3D eoff_lo;</DIV><DIV>diff --git =
a/drivers/mtd/devices/slram.c =
b/drivers/mtd/devices/slram.c</DIV><DIV>index d293add..110884f =
100644</DIV><DIV>--- a/drivers/mtd/devices/slram.c</DIV><DIV>+++ =
b/drivers/mtd/devices/slram.c</DIV><DIV>@@ -76,8 +76,8 @@ static char =
*map;</DIV><DIV> static slram_mtd_list_t *slram_mtdlist =3D =
NULL;</DIV><DIV> static int slram_erase(struct mtd_info *, struct =
erase_info *);</DIV><DIV>-static int slram_point(struct mtd_info *, =
loff_t, size_t, size_t *, u_char **);</DIV><DIV>-static void =
slram_unpoint(struct mtd_info *, u_char *, loff_t,<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>size_t);</DIV><DIV>+static int slram_point(struct mtd_info *, =
loff_t, size_t, size_t *, void **, resource_size_t *);</DIV><DIV>+static =
void slram_unpoint(struct mtd_info *, loff_t, size_t);</DIV><DIV> static =
int slram_read(struct mtd_info *, loff_t, size_t, size_t *, u_char =
*);</DIV><DIV> static int slram_write(struct mtd_info *, loff_t, size_t, =
size_t *, const u_char *);</DIV><DIV>@@ -104,19 +104,23 @@ static int =
slram_erase(struct mtd_info *mtd, struct erase_info *instr)</DIV><DIV> =
}</DIV><DIV> static int slram_point(struct mtd_info *mtd, loff_t from, =
size_t len,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>size_t *retlen, u_char =
**mtdbuf)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>size_t *retlen, void =
**virt, resource_size_t *phys)</DIV><DIV> {</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>slram_priv_t *priv =3D mtd-&gt;priv;</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>/* can we =
return a physical address with this driver? */</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>if =
(phys)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>return =
-EINVAL;</DIV><DIV>+</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>if (from + len &gt; =
mtd-&gt;size)</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>return =
-EINVAL;</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*mtdbuf =3D priv-&gt;start + =
from;</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</SPAN>*virt =3D priv-&gt;start + from;</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>*retlen =3D=
 len;</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>return(0);</DIV><DIV> }</DIV><DIV>-static void =
slram_unpoint(struct mtd_info *mtd, u_char *addr, loff_t from, size_t =
len)</DIV><DIV>+static void slram_unpoint(struct mtd_info *mtd, loff_t =
from, size_t len)</DIV><DIV> {</DIV><DIV> }</DIV><DIV>diff --git =
a/drivers/mtd/maps/uclinux.c =
b/drivers/mtd/maps/uclinux.c</DIV><DIV>index 14ffb1a..c42f4b8 =
100644</DIV><DIV>--- a/drivers/mtd/maps/uclinux.c</DIV><DIV>+++ =
b/drivers/mtd/maps/uclinux.c</DIV><DIV>@@ -40,10 +40,12 @@ struct =
mtd_partition uclinux_romfs[] =3D {</DIV><DIV> =
/*************************************************************************=
***/</DIV><DIV> int uclinux_point(struct mtd_info *mtd, loff_t from, =
size_t len,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>size_t *retlen, u_char =
**mtdbuf)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>size_t *retlen, void **virt, =
resource_size_t *phys)</DIV><DIV> {</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>struct =
map_info *map =3D mtd-&gt;priv;</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*mtdbuf =3D (u_char *) =
(map-&gt;virt + ((int) from));</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>*virt =3D map-&gt;virt + =
from;</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</SPAN>if (phys)</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>*phys =3D map-&gt;phys + =
from;</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>*retlen =3D len;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>return(0);</DIV><DIV> =
}</DIV><DIV>diff --git a/drivers/mtd/mtdpart.c =
b/drivers/mtd/mtdpart.c</DIV><DIV>index 6174a97..5f62018 =
100644</DIV><DIV>--- a/drivers/mtd/mtdpart.c</DIV><DIV>+++ =
b/drivers/mtd/mtdpart.c</DIV><DIV>@@ -68,7 +68,7 @@ static int part_read =
(struct mtd_info *mtd, loff_t from, size_t len,</DIV><DIV> }</DIV><DIV> =
static int part_point (struct mtd_info *mtd, loff_t from, size_t =
len,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
		</SPAN>size_t *retlen, u_char **buf)</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>size_t *retlen, void **virt, resource_size_t *phys)</DIV><DIV> =
{</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>struct mtd_part *part =3D PART(mtd);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>if (from =
&gt;=3D mtd-&gt;size)</DIV><DIV>@@ -76,14 +76,14 @@ static int =
part_point (struct mtd_info *mtd, loff_t from, size_t =
len,</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>else if (from + len &gt; mtd-&gt;size)</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>len =3D mtd-&gt;size - from;</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>return =
part-&gt;master-&gt;point (part-&gt;master, from + =
part-&gt;offset,</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">				</SPAN>=A0 =A0 =
len, retlen, buf);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">				</SPAN>=A0 =A0 =
len, retlen, virt, phys);</DIV><DIV> }</DIV><DIV>-static void =
part_unpoint (struct mtd_info *mtd, u_char *addr, loff_t from, size_t =
len)</DIV><DIV>+static void part_unpoint (struct mtd_info *mtd, loff_t =
from, size_t len)</DIV><DIV> {</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>struct mtd_part *part =3D =
PART(mtd);</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>part-&gt;master-&gt;unpoint =
(part-&gt;master, addr, from + part-&gt;offset, len);</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>part-&gt;master-&gt;unpoint (part-&gt;master, from + =
part-&gt;offset, len);</DIV><DIV> }</DIV><DIV> static int =
part_read_oob(struct mtd_info *mtd, loff_t from,</DIV><DIV>diff --git =
a/fs/jffs2/erase.c b/fs/jffs2/erase.c</DIV><DIV>index a1db918..f6c6fe2 =
100644</DIV><DIV>--- a/fs/jffs2/erase.c</DIV><DIV>+++ =
b/fs/jffs2/erase.c</DIV><DIV>@@ -332,7 +332,7 @@ static int =
jffs2_block_check_erase(struct jffs2_sb_info *c, struct =
jffs2_erasebl</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>if (c-&gt;mtd-&gt;point) =
{</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>unsigned long *wordebuf;</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>ret =3D =
c-&gt;mtd-&gt;point(c-&gt;mtd, jeb-&gt;offset, c-&gt;sector_size, =
&amp;retlen, (unsigned char **)&amp;ebuf);</DIV><DIV>+<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>ret =3D c-&gt;mtd-&gt;point(c-&gt;mtd, jeb-&gt;offset, =
c-&gt;sector_size, &amp;retlen, &amp;ebuf, NULL);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>if (ret) {</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>D1(printk(KERN_DEBUG "MTD point failed %d\n", =
ret));</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">=
			</SPAN>goto do_flash_read;</DIV><DIV>@@ -340,7 =
+340,7 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, =
struct jffs2_erasebl</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>if (retlen &lt; =
c-&gt;sector_size) {</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>/* Don't muck =
about if it won't let us point to the whole erase sector =
*/</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
	</SPAN>D1(printk(KERN_DEBUG "MTD point returned len too short: =
0x%zx\n", retlen));</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, ebuf, jeb-&gt;offset, =
retlen);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, jeb-&gt;offset, =
retlen);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>goto =
do_flash_read;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>}</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>wordebuf =3D ebuf-sizeof(*wordebuf);</DIV><DIV>@@ -349,7 +349,7 =
@@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct =
jffs2_erasebl</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>=A0=A0 if (*++wordebuf !=3D=
 ~0)</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
		</SPAN>=A0=A0 break;</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</SPAN>} =
while(--retlen);</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, ebuf, jeb-&gt;offset, =
c-&gt;sector_size);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, jeb-&gt;offset, =
c-&gt;sector_size);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>if =
(retlen)</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>printk(KERN_WARNING "Newly-erased block contained word 0x%lx at =
offset 0x%08tx\n",</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>=A0 =A0 =A0=A0 =
*wordebuf, jeb-&gt;offset + =
c-&gt;sector_size-retlen*sizeof(*wordebuf));</DIV><DIV>diff --git =
a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c</DIV><DIV>index =
2eae5d2..d782ffa 100644</DIV><DIV>--- =
a/fs/jffs2/readinode.c</DIV><DIV>+++ b/fs/jffs2/readinode.c</DIV><DIV>@@ =
-62,10 +62,10 @@ static int check_node_data(struct jffs2_sb_info *c, =
struct jffs2_tmp_dnode_info</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>/* TODO: instead, incapsulate =
point() stuff to jffs2_flash_read(),</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN> * adding =
and jffs2_flash_read_end() interface. */</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>if =
(c-&gt;mtd-&gt;point) {</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>err =3D =
c-&gt;mtd-&gt;point(c-&gt;mtd, ofs, len, &amp;retlen, =
&amp;buffer);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>err =3D =
c-&gt;mtd-&gt;point(c-&gt;mtd, ofs, len, &amp;retlen, (void =
**)&amp;buffer, NULL);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>if (!err &amp;&amp; =
retlen &lt; tn-&gt;csize) {</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>JFFS2_WARNING("MTD point returned len too short: %zu instead of =
%u.\n", retlen, tn-&gt;csize);</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, buffer, ofs, =
retlen);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, ofs, retlen);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</SPAN>} =
else if (err)</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>JFFS2_WARNING("MTD point failed: error code %d.\n", =
err);</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
	</SPAN>else</DIV><DIV>@@ -99,7 +99,7 @@ static int =
check_node_data(struct jffs2_sb_info *c, struct =
jffs2_tmp_dnode_info</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>kfree(buffer);</DIV><DIV> =
#ifndef __ECOS</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>else</DIV><DIV>-<SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, buffer, ofs, =
len);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">=
		</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, ofs, =
len);</DIV><DIV> #endif</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>if (crc !=3D tn-&gt;data_crc) =
{</DIV><DIV>@@ -135,7 +135,7 @@ free_out:</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>kfree(buffer);</DIV><DIV> #ifndef __ECOS</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>else</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, buffer, ofs, =
len);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">=
		</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, ofs, =
len);</DIV><DIV> #endif</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>return err;</DIV><DIV> =
}</DIV><DIV>diff --git a/fs/jffs2/scan.c =
b/fs/jffs2/scan.c</DIV><DIV>index 272872d..0b7edc8 100644</DIV><DIV>--- =
a/fs/jffs2/scan.c</DIV><DIV>+++ b/fs/jffs2/scan.c</DIV><DIV>@@ -97,11 =
+97,11 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>size_t =
pointlen;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>if (c-&gt;mtd-&gt;point) =
{</DIV><DIV>-<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>ret =3D c-&gt;mtd-&gt;point (c-&gt;mtd, 0, c-&gt;mtd-&gt;size, =
&amp;pointlen, &amp;flashbuf);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>ret =3D =
c-&gt;mtd-&gt;point(c-&gt;mtd, 0, c-&gt;mtd-&gt;size, &amp;pointlen, =
(void **)&amp;flashbuf, NULL);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>if (!ret &amp;&amp; =
pointlen &lt; c-&gt;mtd-&gt;size) {</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>/* Don't muck about if it won't let us point to the whole flash =
*/</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
	</SPAN>D1(printk(KERN_DEBUG "MTD point returned len too short: =
0x%zx\n", pointlen));</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, flashbuf, 0, =
pointlen);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, 0, pointlen);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</SPAN>flashbuf =3D NULL;</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>}</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>if (ret)</DIV><DIV>@@ -267,7 +267,7 @@ int =
jffs2_scan_medium(struct jffs2_sb_info *c)</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>kfree(flashbuf);</DIV><DIV> #ifndef __ECOS</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>else</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, flashbuf, 0, =
c-&gt;mtd-&gt;size);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		=
</SPAN>c-&gt;mtd-&gt;unpoint(c-&gt;mtd, 0, =
c-&gt;mtd-&gt;size);</DIV><DIV> #endif</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>if =
(s)</DIV><DIV><SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>kfree(s);</DIV><DIV>diff --git a/include/linux/mtd/mtd.h =
b/include/linux/mtd/mtd.h</DIV><DIV>index 783fc98..041ce23 =
100644</DIV><DIV>--- a/include/linux/mtd/mtd.h</DIV><DIV>+++ =
b/include/linux/mtd/mtd.h</DIV><DIV>@@ -143,10 +143,12 @@ struct =
mtd_info {</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>int (*erase) (struct mtd_info =
*mtd, struct erase_info *instr);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>/* This stuff for =
eXecute-In-Place */</DIV><DIV>-<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>int (*point) (struct mtd_info =
*mtd, loff_t from, size_t len, size_t *retlen, u_char =
**mtdbuf);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>/* phys is optional and may be =
set to NULL */</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>int (*point) (struct mtd_info =
*mtd, loff_t from, size_t len,</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</SPAN>size_t *retlen, =
void **virt, resource_size_t *phys);</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>/* We =
probably shouldn't allow XIP if the unpoint isn't a NULL =
*/</DIV><DIV>-<SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>void (*unpoint) (struct mtd_info *mtd, u_char * addr, loff_t =
from, size_t len);</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>void (*unpoint) (struct mtd_info =
*mtd, loff_t from, size_t len);</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>int (*read) (struct mtd_info =
*mtd, loff_t from, size_t len, size_t *retlen, u_char =
*buf);</DIV><DIV>diff --git a/include/linux/mtd/pmc551.h =
b/include/linux/mtd/pmc551.h</DIV><DIV>index a7f6d20..fd139e9 =
100644</DIV><DIV>--- a/include/linux/mtd/pmc551.h</DIV><DIV>+++ =
b/include/linux/mtd/pmc551.h</DIV><DIV>@@ -36,8 +36,9 @@ struct mypriv =
{</DIV><DIV>=A0 * Function Prototypes</DIV><DIV>=A0 */</DIV><DIV> static =
int pmc551_erase(struct mtd_info *, struct erase_info =
*);</DIV><DIV>-static void pmc551_unpoint(struct mtd_info *, u_char *, =
loff_t, size_t);</DIV><DIV>-static int pmc551_point (struct mtd_info =
*mtd, loff_t from, size_t len, size_t *retlen, u_char =
**mtdbuf);</DIV><DIV>+static void pmc551_unpoint(struct mtd_info *, =
loff_t, size_t);</DIV><DIV>+static int pmc551_point (struct mtd_info =
*mtd, loff_t from, size_t len, size_t *retlen, void =
**virt,</DIV><DIV>+<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>resource_size_t =
*phys);</DIV><DIV> static int pmc551_read(struct mtd_info *, loff_t, =
size_t, size_t *, u_char *);</DIV><DIV> static int pmc551_write(struct =
mtd_info *, loff_t, size_t, size_t *, const u_char *);</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
min-height: 14px; "></DIV></BODY></HTML>=

--Apple-Mail-4--598181713--
