Received: from coderock.org ([193.77.147.115] helo=trashy.coderock.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CjltL-0000d3-SJ
	for linux-mtd@lists.infradead.org; Wed, 29 Dec 2004 17:02:12 -0500
Date: Wed, 29 Dec 2004 23:02:06 +0100
From: Domen Puncer <domen@coderock.org>
To: dwmw2@redhat.com
Message-ID: <20041229220206.GD26245@nd47.coderock.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
Subject: [patch] mtd: remove void * casts
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removes casts of (void *) pointers.
I can send split up patches if you want.


 drivers/mtd/chips/jedec.c         |   14 +++---
 drivers/mtd/chips/map_ram.c       |    6 +-
 drivers/mtd/chips/map_rom.c       |    2 
 drivers/mtd/devices/doc1000.c     |    4 -
 drivers/mtd/devices/doc2000.c     |   28 ++++++-------
 drivers/mtd/devices/doc2001.c     |   24 +++++------
 drivers/mtd/devices/doc2001plus.c |   28 ++++++-------
 drivers/mtd/devices/ms02-nv.c     |    6 +-
 drivers/mtd/devices/mtdram.c      |    4 -
 drivers/mtd/devices/phram.c       |    8 +--
 drivers/mtd/devices/pmc551.c      |   10 ++--
 drivers/mtd/devices/slram.c       |    8 +--
 drivers/mtd/maps/ocelot.c         |    2 
 drivers/mtd/maps/uclinux.c        |    4 -
 drivers/mtd/mtdchar.c             |   10 ++--
 drivers/mtd/nand/diskonchip.c     |   80 +++++++++++++++++++-------------------
 drivers/mtd/nand/s3c2410.c        |   10 ++--
 17 files changed, 124 insertions(+), 124 deletions(-)


Signed-off-by: Domen Puncer <domen@coderock.org>

diff -pruNX dontdiff c/drivers/mtd/chips/jedec.c a/drivers/mtd/chips/jedec.c
--- c/drivers/mtd/chips/jedec.c	2004-08-17 11:45:06.000000000 +0200
+++ a/drivers/mtd/chips/jedec.c	2004-12-29 22:58:36.000000000 +0100
@@ -529,7 +529,7 @@ static int jedec_probe32(struct map_info
 static int jedec_read(struct mtd_info *mtd, loff_t from, size_t len, 
 		      size_t *retlen, u_char *buf)
 {
-   struct map_info *map = (struct map_info *)mtd->priv;
+   struct map_info *map = mtd->priv;
    
    map_copy_from(map, buf, from, len);
    *retlen = len;
@@ -541,8 +541,8 @@ static int jedec_read(struct mtd_info *m
 static int jedec_read_banked(struct mtd_info *mtd, loff_t from, size_t len, 
 			     size_t *retlen, u_char *buf)
 {
-   struct map_info *map = (struct map_info *)mtd->priv;
-   struct jedec_private *priv = (struct jedec_private *)map->fldrv_priv;
+   struct map_info *map = mtd->priv;
+   struct jedec_private *priv = map->fldrv_priv;
 
    *retlen = 0;
    while (len > 0)
@@ -593,8 +593,8 @@ static int flash_erase(struct mtd_info *
    unsigned long NoTime = 0;
    unsigned long start = instr->addr, len = instr->len;
    unsigned int I;
-   struct map_info *map = (struct map_info *)mtd->priv;
-   struct jedec_private *priv = (struct jedec_private *)map->fldrv_priv;
+   struct map_info *map = mtd->priv;
+   struct jedec_private *priv = map->fldrv_priv;
 
    // Verify the arguments..
    if (start + len > mtd->size ||
@@ -800,8 +800,8 @@ static int flash_write(struct mtd_info *
    #define flread(x) map_read8(map,base+(off&((1<<chip->addrshift)-1))+((x)<<chip->addrshift))
    #define flwrite(v,x) map_write8(map,v,base+(off&((1<<chip->addrshift)-1))+((x)<<chip->addrshift))
    
-   struct map_info *map = (struct map_info *)mtd->priv;
-   struct jedec_private *priv = (struct jedec_private *)map->fldrv_priv;
+   struct map_info *map = mtd->priv;
+   struct jedec_private *priv = map->fldrv_priv;
    unsigned long base;
    unsigned long off;
    size_t save_len = len;
diff -pruNX dontdiff c/drivers/mtd/chips/map_ram.c a/drivers/mtd/chips/map_ram.c
--- c/drivers/mtd/chips/map_ram.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/chips/map_ram.c	2004-12-29 22:58:36.000000000 +0100
@@ -83,7 +83,7 @@ static struct mtd_info *map_ram_probe(st
 
 static int mapram_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
-	struct map_info *map = (struct map_info *)mtd->priv;
+	struct map_info *map = mtd->priv;
 
 	map_copy_from(map, buf, from, len);
 	*retlen = len;
@@ -92,7 +92,7 @@ static int mapram_read (struct mtd_info 
 
 static int mapram_write (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
 {
-	struct map_info *map = (struct map_info *)mtd->priv;
+	struct map_info *map = mtd->priv;
 
 	map_copy_to(map, to, buf, len);
 	*retlen = len;
@@ -103,7 +103,7 @@ static int mapram_erase (struct mtd_info
 {
 	/* Yeah, it's inefficient. Who cares? It's faster than a _real_
 	   flash erase. */
-	struct map_info *map = (struct map_info *)mtd->priv;
+	struct map_info *map = mtd->priv;
 	map_word allff;
 	unsigned long i;
 
diff -pruNX dontdiff c/drivers/mtd/chips/map_rom.c a/drivers/mtd/chips/map_rom.c
--- c/drivers/mtd/chips/map_rom.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/chips/map_rom.c	2004-12-29 22:58:36.000000000 +0100
@@ -57,7 +57,7 @@ static struct mtd_info *map_rom_probe(st
 
 static int maprom_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
-	struct map_info *map = (struct map_info *)mtd->priv;
+	struct map_info *map = mtd->priv;
 
 	map_copy_from(map, buf, from, len);
 	*retlen = len;
diff -pruNX dontdiff c/drivers/mtd/devices/doc1000.c a/drivers/mtd/devices/doc1000.c
--- c/drivers/mtd/devices/doc1000.c	2004-02-04 04:44:04.000000000 +0100
+++ a/drivers/mtd/devices/doc1000.c	2004-12-29 22:58:36.000000000 +0100
@@ -207,7 +207,7 @@ int flashcard_read (struct mtd_info *mtd
 
 int flashcard_write (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
 {
-	struct mypriv *priv = (struct mypriv *)mtd->priv;
+	struct mypriv *priv = mtd->priv;
  	u_char *endaddr, *startaddr;
 	register u_char *pageaddr;
 	u_char device = to >> priv->devshift;
@@ -529,7 +529,7 @@ int __init init_doc1000(void)
 
 	memset(mymtd,0,sizeof(struct mtd_info));
 
-	mymtd->priv = (void *) kmalloc (sizeof(struct mypriv), GFP_KERNEL);
+	mymtd->priv = kmalloc (sizeof(struct mypriv), GFP_KERNEL);
 	if (!mymtd->priv)
 	  {
 	    kfree(mymtd);
diff -pruNX dontdiff c/drivers/mtd/devices/doc2000.c a/drivers/mtd/devices/doc2000.c
--- c/drivers/mtd/devices/doc2000.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/devices/doc2000.c	2004-12-29 22:58:36.000000000 +0100
@@ -527,26 +527,26 @@ static const char im_name[] = "DoC2k_ini
  */
 static void DoC2k_init(struct mtd_info *mtd)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	struct DiskOnChip *old = NULL;
 	int maxchips;
 
 	/* We must avoid being called twice for the same device. */
 
 	if (doc2klist)
-		old = (struct DiskOnChip *) doc2klist->priv;
+		old = doc2klist->priv;
 
 	while (old) {
 		if (DoC2k_is_alias(old, this)) {
 			printk(KERN_NOTICE
 			       "Ignoring DiskOnChip 2000 at 0x%lX - already configured\n",
 			       this->physadr);
-			iounmap((void *) this->virtadr);
+			iounmap(this->virtadr);
 			kfree(mtd);
 			return;
 		}
 		if (old->nextdoc)
-			old = (struct DiskOnChip *) old->nextdoc->priv;
+			old = old->nextdoc->priv;
 		else
 			old = NULL;
 	}
@@ -573,7 +573,7 @@ static void DoC2k_init(struct mtd_info *
 	default:
 		printk("Unknown ChipID 0x%02x\n", this->ChipID);
 		kfree(mtd);
-		iounmap((void *) this->virtadr);
+		iounmap(this->virtadr);
 		return;
 	}
 
@@ -612,7 +612,7 @@ static void DoC2k_init(struct mtd_info *
 
 	if (!this->totlen) {
 		kfree(mtd);
-		iounmap((void *) this->virtadr);
+		iounmap(this->virtadr);
 	} else {
 		this->nextdoc = doc2klist;
 		doc2klist = mtd;
@@ -633,7 +633,7 @@ static int doc_read(struct mtd_info *mtd
 static int doc_read_ecc(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t * retlen, u_char * buf, u_char * eccbuf, struct nand_oobinfo *oobsel)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem *docptr = this->virtadr;
 	struct Nand *mychip;
 	unsigned char syndrome[6];
@@ -790,7 +790,7 @@ static int doc_write_ecc(struct mtd_info
 			 size_t * retlen, const u_char * buf,
 			 u_char * eccbuf, struct nand_oobinfo *oobsel)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	int di; /* Yes, DI is a hangover from when I was disassembling the binary driver */
 	void __iomem *docptr = this->virtadr;
 	volatile char dummy;
@@ -1033,7 +1033,7 @@ static int doc_writev_ecc(struct mtd_inf
 static int doc_read_oob(struct mtd_info *mtd, loff_t ofs, size_t len,
 			size_t * retlen, u_char * buf)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	int len256 = 0, ret;
 	struct Nand *mychip;
 
@@ -1091,7 +1091,7 @@ static int doc_read_oob(struct mtd_info 
 static int doc_write_oob_nolock(struct mtd_info *mtd, loff_t ofs, size_t len,
 				size_t * retlen, const u_char * buf)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	int len256 = 0;
 	void __iomem *docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[ofs >> this->chipshift];
@@ -1194,7 +1194,7 @@ static int doc_write_oob_nolock(struct m
 static int doc_write_oob(struct mtd_info *mtd, loff_t ofs, size_t len,
  			 size_t * retlen, const u_char * buf)
 {
- 	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
+ 	struct DiskOnChip *this = mtd->priv;
  	int ret;
 
  	down(&this->lock);
@@ -1206,7 +1206,7 @@ static int doc_write_oob(struct mtd_info
 
 static int doc_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	__u32 ofs = instr->addr;
 	__u32 len = instr->len;
 	volatile int dummy;
@@ -1288,12 +1288,12 @@ static void __exit cleanup_doc2000(void)
 	struct DiskOnChip *this;
 
 	while ((mtd = doc2klist)) {
-		this = (struct DiskOnChip *) mtd->priv;
+		this = mtd->priv;
 		doc2klist = this->nextdoc;
 
 		del_mtd_device(mtd);
 
-		iounmap((void *) this->virtadr);
+		iounmap(this->virtadr);
 		kfree(this->chips);
 		kfree(mtd);
 	}
diff -pruNX dontdiff c/drivers/mtd/devices/doc2001.c a/drivers/mtd/devices/doc2001.c
--- c/drivers/mtd/devices/doc2001.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/devices/doc2001.c	2004-12-29 22:58:36.000000000 +0100
@@ -335,23 +335,23 @@ static const char im_name[] = "DoCMil_in
  */
 static void DoCMil_init(struct mtd_info *mtd)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	struct DiskOnChip *old = NULL;
 
 	/* We must avoid being called twice for the same device. */
 	if (docmillist)
-		old = (struct DiskOnChip *)docmillist->priv;
+		old = docmillist->priv;
 
 	while (old) {
 		if (DoCMil_is_alias(this, old)) {
 			printk(KERN_NOTICE "Ignoring DiskOnChip Millennium at "
 			       "0x%lX - already configured\n", this->physadr);
-			iounmap((void *)this->virtadr);
+			iounmap(this->virtadr);
 			kfree(mtd);
 			return;
 		}
 		if (old->nextdoc)
-			old = (struct DiskOnChip *)old->nextdoc->priv;
+			old = old->nextdoc->priv;
 		else
 			old = NULL;
 	}
@@ -392,7 +392,7 @@ static void DoCMil_init(struct mtd_info 
 
 	if (!this->totlen) {
 		kfree(mtd);
-		iounmap((void *)this->virtadr);
+		iounmap(this->virtadr);
 	} else {
 		this->nextdoc = docmillist;
 		docmillist = mtd;
@@ -416,7 +416,7 @@ static int doc_read_ecc (struct mtd_info
 	int i, ret;
 	volatile char dummy;
 	unsigned char syndrome[6];
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem *docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[from >> (this->chipshift)];
 
@@ -542,7 +542,7 @@ static int doc_write_ecc (struct mtd_inf
 {
 	int i,ret = 0;
 	volatile char dummy;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem *docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[to >> (this->chipshift)];
 
@@ -677,7 +677,7 @@ static int doc_read_oob(struct mtd_info 
 	int i;
 #endif
 	volatile char dummy;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem *docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[ofs >> this->chipshift];
 
@@ -729,7 +729,7 @@ static int doc_write_oob(struct mtd_info
 #endif
 	volatile char dummy;
 	int ret = 0;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem *docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[ofs >> this->chipshift];
 
@@ -796,7 +796,7 @@ static int doc_write_oob(struct mtd_info
 int doc_erase (struct mtd_info *mtd, struct erase_info *instr)
 {
 	volatile char dummy;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	__u32 ofs = instr->addr;
 	__u32 len = instr->len;
 	void __iomem *docptr = this->virtadr;
@@ -868,12 +868,12 @@ static void __exit cleanup_doc2001(void)
 	struct DiskOnChip *this;
 
 	while ((mtd=docmillist)) {
-		this = (struct DiskOnChip *)mtd->priv;
+		this = mtd->priv;
 		docmillist = this->nextdoc;
 			
 		del_mtd_device(mtd);
 			
-		iounmap((void *)this->virtadr);
+		iounmap(this->virtadr);
 		kfree(this->chips);
 		kfree(mtd);
 	}
diff -pruNX dontdiff c/drivers/mtd/devices/doc2001plus.c a/drivers/mtd/devices/doc2001plus.c
--- c/drivers/mtd/devices/doc2001plus.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/devices/doc2001plus.c	2004-12-29 22:58:36.000000000 +0100
@@ -190,7 +190,7 @@ static int DoC_SelectFloor(void __iomem 
    may not want it */
 static unsigned int DoC_GetDataOffset(struct mtd_info *mtd, loff_t *from)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 
 	if (this->interleave) {
 		unsigned int ofs = *from & 0x3ff;
@@ -458,24 +458,24 @@ static const char im_name[] = "DoCMilPlu
  */
 static void DoCMilPlus_init(struct mtd_info *mtd)
 {
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	struct DiskOnChip *old = NULL;
 
 	/* We must avoid being called twice for the same device. */
 	if (docmilpluslist)
-		old = (struct DiskOnChip *)docmilpluslist->priv;
+		old = docmilpluslist->priv;
 
 	while (old) {
 		if (DoCMilPlus_is_alias(this, old)) {
 			printk(KERN_NOTICE "Ignoring DiskOnChip Millennium "
 				"Plus at 0x%lX - already configured\n",
 				this->physadr);
-			iounmap((void *)this->virtadr);
+			iounmap(this->virtadr);
 			kfree(mtd);
 			return;
 		}
 		if (old->nextdoc)
-			old = (struct DiskOnChip *)old->nextdoc->priv;
+			old = old->nextdoc->priv;
 		else
 			old = NULL;
 	}
@@ -514,7 +514,7 @@ static void DoCMilPlus_init(struct mtd_i
 
 	if (!this->totlen) {
 		kfree(mtd);
-		iounmap((void *)this->virtadr);
+		iounmap(this->virtadr);
 	} else {
 		this->nextdoc = docmilpluslist;
 		docmilpluslist = mtd;
@@ -530,7 +530,7 @@ static int doc_dumpblk(struct mtd_info *
 {
 	int i;
 	loff_t fofs;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem * docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[from >> (this->chipshift)];
 	unsigned char *bp, buf[1056];
@@ -615,7 +615,7 @@ static int doc_read_ecc(struct mtd_info 
 	volatile char dummy;
 	loff_t fofs;
 	unsigned char syndrome[6];
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem * docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[from >> (this->chipshift)];
 
@@ -754,7 +754,7 @@ static int doc_write_ecc(struct mtd_info
 	int i, before, ret = 0;
 	loff_t fto;
 	volatile char dummy;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem * docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[to >> (this->chipshift)];
 
@@ -880,7 +880,7 @@ static int doc_read_oob(struct mtd_info 
 			size_t *retlen, u_char *buf)
 {
 	loff_t fofs, base;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem * docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[ofs >> this->chipshift];
 	size_t i, size, got, want;
@@ -958,7 +958,7 @@ static int doc_write_oob(struct mtd_info
 {
 	volatile char dummy;
 	loff_t fofs, base;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	void __iomem * docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[ofs >> this->chipshift];
 	size_t i, size, got, want;
@@ -1058,7 +1058,7 @@ static int doc_write_oob(struct mtd_info
 int doc_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	volatile char dummy;
-	struct DiskOnChip *this = (struct DiskOnChip *)mtd->priv;
+	struct DiskOnChip *this = mtd->priv;
 	__u32 ofs = instr->addr;
 	__u32 len = instr->len;
 	void __iomem * docptr = this->virtadr;
@@ -1134,12 +1134,12 @@ static void __exit cleanup_doc2001plus(v
 	struct DiskOnChip *this;
 
 	while ((mtd=docmilpluslist)) {
-		this = (struct DiskOnChip *)mtd->priv;
+		this = mtd->priv;
 		docmilpluslist = this->nextdoc;
 			
 		del_mtd_device(mtd);
 			
-		iounmap((void *)this->virtadr);
+		iounmap(this->virtadr);
 		kfree(this->chips);
 		kfree(mtd);
 	}
diff -pruNX dontdiff c/drivers/mtd/devices/ms02-nv.c a/drivers/mtd/devices/ms02-nv.c
--- c/drivers/mtd/devices/ms02-nv.c	2004-08-17 11:45:06.000000000 +0200
+++ a/drivers/mtd/devices/ms02-nv.c	2004-12-29 22:58:36.000000000 +0100
@@ -59,7 +59,7 @@ static struct mtd_info *root_ms02nv_mtd;
 static int ms02nv_read(struct mtd_info *mtd, loff_t from,
 			size_t len, size_t *retlen, u_char *buf)
 {
-	struct ms02nv_private *mp = (struct ms02nv_private *)mtd->priv;
+	struct ms02nv_private *mp = mtd->priv;
 
 	if (from + len > mtd->size)
 		return -EINVAL;
@@ -73,7 +73,7 @@ static int ms02nv_read(struct mtd_info *
 static int ms02nv_write(struct mtd_info *mtd, loff_t to,
 			size_t len, size_t *retlen, const u_char *buf)
 {
-	struct ms02nv_private *mp = (struct ms02nv_private *)mtd->priv;
+	struct ms02nv_private *mp = mtd->priv;
 
 	if (to + len > mtd->size)
 		return -EINVAL;
@@ -265,7 +265,7 @@ err_out_mod_res:
 static void __exit ms02nv_remove_one(void)
 {
 	struct mtd_info *mtd = root_ms02nv_mtd;
-	struct ms02nv_private *mp = (struct ms02nv_private *)mtd->priv;
+	struct ms02nv_private *mp = mtd->priv;
 
 	root_ms02nv_mtd = mp->next;
 
diff -pruNX dontdiff c/drivers/mtd/devices/mtdram.c a/drivers/mtd/devices/mtdram.c
--- c/drivers/mtd/devices/mtdram.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/devices/mtdram.c	2004-12-29 22:58:36.000000000 +0100
@@ -158,7 +158,7 @@ static int __init init_mtdram(void)
   void *addr;
   int err;
   /* Allocate some memory */
-   mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+   mtd_info = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
    if (!mtd_info)
      return -ENOMEM;
    
@@ -191,7 +191,7 @@ static int __init init_mtdram(void)
   void *addr;
   int err;
   /* Allocate some memory */
-   mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+   mtd_info = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
    if (!mtd_info)
      return -ENOMEM;
 
diff -pruNX dontdiff c/drivers/mtd/devices/phram.c a/drivers/mtd/devices/phram.c
--- c/drivers/mtd/devices/phram.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/devices/phram.c	2004-12-29 22:58:36.000000000 +0100
@@ -41,7 +41,7 @@ static LIST_HEAD(phram_list);
 
 static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	u_char *start = (u_char *)mtd->priv;
+	u_char *start = mtd->priv;
 
 	if (instr->addr + instr->len > mtd->size)
 		return -EINVAL;
@@ -63,7 +63,7 @@ static int phram_erase(struct mtd_info *
 static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char **mtdbuf)
 {
-	u_char *start = (u_char *)mtd->priv;
+	u_char *start = mtd->priv;
 
 	if (from + len > mtd->size)
 		return -EINVAL;
@@ -80,7 +80,7 @@ static void phram_unpoint(struct mtd_inf
 static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
-	u_char *start = (u_char *)mtd->priv;
+	u_char *start = mtd->priv;
 
 	if (from + len > mtd->size)
 		return -EINVAL;
@@ -94,7 +94,7 @@ static int phram_read(struct mtd_info *m
 static int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
-	u_char *start = (u_char *)mtd->priv;
+	u_char *start = mtd->priv;
 
 	if (to + len > mtd->size)
 		return -EINVAL;
diff -pruNX dontdiff c/drivers/mtd/devices/pmc551.c a/drivers/mtd/devices/pmc551.c
--- c/drivers/mtd/devices/pmc551.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/devices/pmc551.c	2004-12-29 22:58:36.000000000 +0100
@@ -113,7 +113,7 @@ static struct mtd_info *pmc551list;
 
 static int pmc551_erase (struct mtd_info *mtd, struct erase_info *instr)
 {
-        struct mypriv *priv = (struct mypriv *)mtd->priv;
+        struct mypriv *priv = mtd->priv;
         u32 soff_hi, soff_lo; /* start address offset hi/lo */
         u32 eoff_hi, eoff_lo; /* end address offset hi/lo */
         unsigned long end;
@@ -176,7 +176,7 @@ out:
 
 static int pmc551_point (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char **mtdbuf)
 {
-        struct mypriv *priv = (struct mypriv *)mtd->priv;
+        struct mypriv *priv = mtd->priv;
         u32 soff_hi;
         u32 soff_lo;
 
@@ -217,7 +217,7 @@ static void pmc551_unpoint (struct mtd_i
 
 static int pmc551_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
-        struct mypriv *priv = (struct mypriv *)mtd->priv;
+        struct mypriv *priv = mtd->priv;
         u32 soff_hi, soff_lo; /* start address offset hi/lo */
         u32 eoff_hi, eoff_lo; /* end address offset hi/lo */
         unsigned long end;
@@ -279,7 +279,7 @@ out:
 
 static int pmc551_write (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
 {
-        struct mypriv *priv = (struct mypriv *)mtd->priv;
+        struct mypriv *priv = mtd->priv;
         u32 soff_hi, soff_lo; /* start address offset hi/lo */
         u32 eoff_hi, eoff_lo; /* end address offset hi/lo */
         unsigned long end;
@@ -820,7 +820,7 @@ static void __exit cleanup_pmc551(void)
 	struct mypriv *priv;
 
 	while((mtd=pmc551list)) {
-		priv = (struct mypriv *)mtd->priv;
+		priv = mtd->priv;
 		pmc551list = priv->nextpmc551;
 		
 		if(priv->start) {
diff -pruNX dontdiff c/drivers/mtd/devices/slram.c a/drivers/mtd/devices/slram.c
--- c/drivers/mtd/devices/slram.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/devices/slram.c	2004-12-29 22:58:36.000000000 +0100
@@ -106,7 +106,7 @@ static int slram_erase(struct mtd_info *
 static int slram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char **mtdbuf)
 {
-	slram_priv_t *priv = (slram_priv_t *)mtd->priv;
+	slram_priv_t *priv = mtd->priv;
 
 	*mtdbuf = priv->start + from;
 	*retlen = len;
@@ -120,7 +120,7 @@ static void slram_unpoint(struct mtd_inf
 static int slram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
-	slram_priv_t *priv = (slram_priv_t *)mtd->priv;
+	slram_priv_t *priv = mtd->priv;
 	
 	memcpy(buf, priv->start + from, len);
 
@@ -131,7 +131,7 @@ static int slram_read(struct mtd_info *m
 static int slram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
-	slram_priv_t *priv = (slram_priv_t *)mtd->priv;
+	slram_priv_t *priv = mtd->priv;
 
 	memcpy(priv->start + to, buf, len);
 
@@ -161,7 +161,7 @@ static int register_device(char *name, u
 	if ((*curmtd)->mtdinfo)	{
 		memset((char *)(*curmtd)->mtdinfo, 0, sizeof(struct mtd_info));
 		(*curmtd)->mtdinfo->priv =
-			(void *)kmalloc(sizeof(slram_priv_t), GFP_KERNEL);
+			kmalloc(sizeof(slram_priv_t), GFP_KERNEL);
 		
 		if (!(*curmtd)->mtdinfo->priv) {
 			kfree((*curmtd)->mtdinfo);
diff -pruNX dontdiff c/drivers/mtd/maps/ocelot.c a/drivers/mtd/maps/ocelot.c
--- c/drivers/mtd/maps/ocelot.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/maps/ocelot.c	2004-12-29 22:58:36.000000000 +0100
@@ -28,7 +28,7 @@ static struct mtd_info *nvram_mtd;
 
 static void ocelot_ram_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
 {
-        struct map_info *map = (struct map_info *)mtd->priv;
+        struct map_info *map = mtd->priv;
 	size_t done = 0;
 
 	/* If we use memcpy, it does word-wide writes. Even though we told the 
diff -pruNX dontdiff c/drivers/mtd/maps/uclinux.c a/drivers/mtd/maps/uclinux.c
--- c/drivers/mtd/maps/uclinux.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/maps/uclinux.c	2004-12-29 22:58:36.000000000 +0100
@@ -47,7 +47,7 @@ struct mtd_partition uclinux_romfs[] = {
 int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
 	size_t *retlen, u_char **mtdbuf)
 {
-	struct map_info *map = (struct map_info *) mtd->priv;
+	struct map_info *map = mtd->priv;
 	*mtdbuf = (u_char *) (map->virt + ((int) from));
 	*retlen = len;
 	return(0);
@@ -81,7 +81,7 @@ int __init uclinux_mtd_init(void)
 	mtd = do_map_probe("map_ram", mapp);
 	if (!mtd) {
 		printk("uclinux[mtd]: failed to find a mapping?\n");
-		iounmap((void *) mapp->virt);
+		iounmap(mapp->virt);
 		return(-ENXIO);
 	}
 		
diff -pruNX dontdiff c/drivers/mtd/mtdchar.c a/drivers/mtd/mtdchar.c
--- c/drivers/mtd/mtdchar.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/mtdchar.c	2004-12-29 22:58:36.000000000 +0100
@@ -61,7 +61,7 @@ static inline void mtdchar_devfs_exit(vo
 
 static loff_t mtd_lseek (struct file *file, loff_t offset, int orig)
 {
-	struct mtd_info *mtd=(struct mtd_info *)file->private_data;
+	struct mtd_info *mtd = file->private_data;
 
 	switch (orig) {
 	case 0:
@@ -134,7 +134,7 @@ static int mtd_close(struct inode *inode
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MTD_close\n");
 
-	mtd = (struct mtd_info *)file->private_data;
+	mtd = file->private_data;
 	
 	if (mtd->sync)
 		mtd->sync(mtd);
@@ -151,7 +151,7 @@ static int mtd_close(struct inode *inode
 
 static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t *ppos)
 {
-	struct mtd_info *mtd = (struct mtd_info *)file->private_data;
+	struct mtd_info *mtd = file->private_data;
 	size_t retlen=0;
 	size_t total_retlen=0;
 	int ret=0;
@@ -210,7 +210,7 @@ static ssize_t mtd_read(struct file *fil
 
 static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count,loff_t *ppos)
 {
-	struct mtd_info *mtd = (struct mtd_info *)file->private_data;
+	struct mtd_info *mtd = file->private_data;
 	char *kbuf;
 	size_t retlen;
 	size_t total_retlen=0;
@@ -276,7 +276,7 @@ static void mtdchar_erase_callback (stru
 static int mtd_ioctl(struct inode *inode, struct file *file,
 		     u_int cmd, u_long arg)
 {
-	struct mtd_info *mtd = (struct mtd_info *)file->private_data;
+	struct mtd_info *mtd = file->private_data;
 	void __user *argp = (void __user *)arg;
 	int ret = 0;
 	u_long size;
diff -pruNX dontdiff c/drivers/mtd/nand/diskonchip.c a/drivers/mtd/nand/diskonchip.c
--- c/drivers/mtd/nand/diskonchip.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/nand/diskonchip.c	2004-12-29 22:58:36.000000000 +0100
@@ -308,7 +308,7 @@ static inline int DoC_WaitReady(struct d
 static void doc2000_write_byte(struct mtd_info *mtd, u_char datum)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 
 	if(debug)printk("write_byte %02x\n", datum);
@@ -319,7 +319,7 @@ static void doc2000_write_byte(struct mt
 static u_char doc2000_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	u_char ret;
 
@@ -334,7 +334,7 @@ static void doc2000_writebuf(struct mtd_
 			     const u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 	if (debug)printk("writebuf of %d bytes: ", len);
@@ -350,7 +350,7 @@ static void doc2000_readbuf(struct mtd_i
 			    u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
  	int i;
 
@@ -365,7 +365,7 @@ static void doc2000_readbuf_dword(struct
 			    u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
  	int i;
 
@@ -386,7 +386,7 @@ static int doc2000_verifybuf(struct mtd_
 			      const u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 
@@ -399,7 +399,7 @@ static int doc2000_verifybuf(struct mtd_
 static uint16_t __init doc200x_ident_chip(struct mtd_info *mtd, int nr)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 	uint16_t ret;
 
 	doc200x_select_chip(mtd, nr);
@@ -441,7 +441,7 @@ static uint16_t __init doc200x_ident_chi
 static void __init doc2000_count_chips(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 	uint16_t mfrid;
 	int i;
 
@@ -462,7 +462,7 @@ static void __init doc2000_count_chips(s
 
 static int doc200x_wait(struct mtd_info *mtd, struct nand_chip *this, int state)
 {
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 
 	int status;
 	
@@ -477,7 +477,7 @@ static int doc200x_wait(struct mtd_info 
 static void doc2001_write_byte(struct mtd_info *mtd, u_char datum)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 
 	WriteDOC(datum, docptr, CDSNSlowIO);
@@ -488,7 +488,7 @@ static void doc2001_write_byte(struct mt
 static u_char doc2001_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 
 	//ReadDOC(docptr, CDSNSlowIO);
@@ -503,7 +503,7 @@ static void doc2001_writebuf(struct mtd_
 			     const u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 
@@ -517,7 +517,7 @@ static void doc2001_readbuf(struct mtd_i
 			    u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 
@@ -535,7 +535,7 @@ static int doc2001_verifybuf(struct mtd_
 			     const u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 
@@ -555,7 +555,7 @@ static int doc2001_verifybuf(struct mtd_
 static u_char doc2001plus_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	u_char ret;
 
@@ -570,7 +570,7 @@ static void doc2001plus_writebuf(struct 
 			     const u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 
@@ -587,7 +587,7 @@ static void doc2001plus_readbuf(struct m
 			    u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 
@@ -617,7 +617,7 @@ static int doc2001plus_verifybuf(struct 
 			     const u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 
@@ -643,7 +643,7 @@ static int doc2001plus_verifybuf(struct 
 static void doc2001plus_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int floor = 0;
 
@@ -669,7 +669,7 @@ static void doc2001plus_select_chip(stru
 static void doc200x_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int floor = 0;
 
@@ -696,7 +696,7 @@ static void doc200x_select_chip(struct m
 static void doc200x_hwcontrol(struct mtd_info *mtd, int cmd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 
 	switch(cmd) {
@@ -734,7 +734,7 @@ static void doc200x_hwcontrol(struct mtd
 static void doc2001plus_command (struct mtd_info *mtd, unsigned command, int column, int page_addr)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 
 	/*
@@ -838,7 +838,7 @@ static void doc2001plus_command (struct 
 static int doc200x_dev_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 
 	if (DoC_is_MillenniumPlus(doc)) {
@@ -876,7 +876,7 @@ static int doc200x_block_bad(struct mtd_
 static void doc200x_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 
 	/* Prime the ECC engine */
@@ -895,7 +895,7 @@ static void doc200x_enable_hwecc(struct 
 static void doc2001plus_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 
 	/* Prime the ECC engine */
@@ -916,7 +916,7 @@ static int doc200x_calculate_ecc(struct 
 				 unsigned char *ecc_code)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	int i;
 	int emptymatch = 1;
@@ -974,7 +974,7 @@ static int doc200x_correct_data(struct m
 {
 	int i, ret = 0;
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
         void __iomem *docptr = doc->virtadr;
 	volatile u_char dummy;
 	int emptymatch = 1;
@@ -1062,7 +1062,7 @@ static int __init find_media_headers(str
 				     const char *id, int findmirror)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 	unsigned offs, end = (MAX_MEDIAHEADER_SCAN << this->phys_erase_shift);
 	int ret;
 	size_t retlen;
@@ -1105,7 +1105,7 @@ static inline int __init nftl_partscan(s
 				struct mtd_partition *parts)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 	int ret = 0;
 	u_char *buf;
 	struct NFTLMediaHeader *mh;
@@ -1201,7 +1201,7 @@ static inline int __init inftl_partscan(
 				 struct mtd_partition *parts)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 	int ret = 0;
 	u_char *buf;
 	struct INFTLMediaHeader *mh;
@@ -1326,7 +1326,7 @@ static int __init nftl_scan_bbt(struct m
 {
 	int ret, numparts;
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 	struct mtd_partition parts[2];
 
 	memset((char *) parts, 0, sizeof(parts));
@@ -1365,7 +1365,7 @@ static int __init inftl_scan_bbt(struct 
 {
 	int ret, numparts;
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 	struct mtd_partition parts[5];
 
 	if (this->numchips > doc->chips_per_floor) {
@@ -1424,7 +1424,7 @@ static int __init inftl_scan_bbt(struct 
 static inline int __init doc2000_init(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 
 	this->write_byte = doc2000_write_byte;
 	this->read_byte = doc2000_read_byte;
@@ -1442,7 +1442,7 @@ static inline int __init doc2000_init(st
 static inline int __init doc2001_init(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 
 	this->write_byte = doc2001_write_byte;
 	this->read_byte = doc2001_read_byte;
@@ -1474,7 +1474,7 @@ static inline int __init doc2001_init(st
 static inline int __init doc2001plus_init(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	struct doc_priv *doc = (void *)this->priv;
+	struct doc_priv *doc = this->priv;
 
 	this->write_byte = NULL;
 	this->read_byte = doc2001plus_read_byte;
@@ -1596,7 +1596,7 @@ static inline int __init doc_probe(unsig
 		unsigned char oldval;
 		unsigned char newval;
 		nand = mtd->priv;
-		doc = (void *)nand->priv;
+		doc = nand->priv;
 		/* Use the alias resolution register to determine if this is
 		   in fact the same DOC aliased to a new address.  If writes
 		   to one chip's alias resolution register change the value on
@@ -1645,10 +1645,10 @@ static inline int __init doc_probe(unsig
 	nand->bbt_td		= (struct nand_bbt_descr *) (doc + 1);
 	nand->bbt_md		= nand->bbt_td + 1;
 
-	mtd->priv		= (void *) nand;
+	mtd->priv		= nand;
 	mtd->owner		= THIS_MODULE;
 
-	nand->priv		= (void *) doc;
+	nand->priv		= doc;
 	nand->select_chip	= doc200x_select_chip;
 	nand->hwcontrol		= doc200x_hwcontrol;
 	nand->dev_ready		= doc200x_dev_ready;
@@ -1711,11 +1711,11 @@ static void release_nanddoc(void)
 
 	for (mtd = doclist; mtd; mtd = nextmtd) {
 		nand = mtd->priv;
-		doc = (void *)nand->priv;
+		doc = nand->priv;
 
 		nextmtd = doc->nextdoc;
 		nand_release(mtd);
-		iounmap((void *)doc->virtadr);
+		iounmap(doc->virtadr);
 		kfree(mtd);
 	}
 }
diff -pruNX dontdiff c/drivers/mtd/nand/s3c2410.c a/drivers/mtd/nand/s3c2410.c
--- c/drivers/mtd/nand/s3c2410.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/mtd/nand/s3c2410.c	2004-12-29 22:58:36.000000000 +0100
@@ -117,12 +117,12 @@ static struct s3c2410_nand_info *s3c2410
 
 static struct s3c2410_nand_info *to_nand_info(struct device *dev)
 {
-	return (struct s3c2410_nand_info *)dev_get_drvdata(dev);
+	return dev_get_drvdata(dev);
 }
 
 static struct s3c2410_platform_nand *to_nand_plat(struct device *dev)
 {
-	return (struct s3c2410_platform_nand *)dev->platform_data;
+	return dev->platform_data;
 }
 
 /* timing calculations */
@@ -205,7 +205,7 @@ static void s3c2410_nand_select_chip(str
 	struct nand_chip *this = mtd->priv;
 	unsigned long cur;
 
-	nmtd = (struct s3c2410_nand_mtd *)this->priv;
+	nmtd = this->priv;
 	info = nmtd->info;
 
 	cur = readl(info->regs + S3C2410_NFCONF);
@@ -424,14 +424,14 @@ static int s3c2410_nand_calculate_ecc(st
 
 static void s3c2410_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *this = (struct nand_chip *)mtd->priv;
+	struct nand_chip *this = mtd->priv;
 	readsb(this->IO_ADDR_R, buf, len);
 }
 
 static void s3c2410_nand_write_buf(struct mtd_info *mtd,
 				   const u_char *buf, int len)
 {
-	struct nand_chip *this = (struct nand_chip *)mtd->priv;
+	struct nand_chip *this = mtd->priv;
 	writesb(this->IO_ADDR_W, buf, len);
 }
 
