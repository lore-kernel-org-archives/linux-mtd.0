Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GnaJ7-0008Du-6l
	for linux-mtd@lists.infradead.org; Fri, 24 Nov 2006 07:37:36 -0500
Date: Fri, 24 Nov 2006 15:42:10 +0300
From: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: Lazily BBT construction
Message-ID: <20061124154210.6303c9fe@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Description:
This is the implementation of lazy BBT construction. It introduces
a new config option that allows to construct BBT(bad block table)
lazily for NAND chips with memory based BBT.
The main goal of the feature introduced is to decrease boot time.
How it works: BBT is filled only when we check if block is bad. NAND is
scanned and BBT entries is constructed from topmost unscanned block to
requested.
By default BBT is constructed during boot. To enable lazily
construction NAND_LAZY_BBT bit should be set in options field of
structure nand_chip.

 drivers/mtd/mtdpart.c       |    6 ++
 drivers/mtd/nand/Kconfig    |    8 +++
 drivers/mtd/nand/nand_bbt.c |   93 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h    |   17 ++++++++
 4 files changed, 124 insertions(+)

Index: mtd-2.6/drivers/mtd/nand/nand_bbt.c
===================================================================
--- mtd-2.6.orig/drivers/mtd/nand/nand_bbt.c
+++ mtd-2.6/drivers/mtd/nand/nand_bbt.c
@@ -358,6 +358,80 @@ static int scan_block_fast(struct mtd_in
 	return 0;
 }
 
+#ifdef CONFIG_MTD_NAND_LAZY_BBT
+/**
+ * scan_oob_range - [GENERIC] Create a specified region of bad block table by scanning the device
+ * @mtd:	MTD device structure
+ * @buf:	temporary buffer
+ * @startblock:	start of the scanned region - (start real block) * 2
+ * @endblock:	end of the scanned region - (end real block) * 2
+ *
+ * Create a specified region of bad block table by scanning the device
+ * for the given good/bad block identify pattern
+ */
+static inline int scan_oob_range(struct mtd_info *mtd, uint8_t *buf, int startblock, int endblock)
+{
+	struct nand_chip *this = mtd->priv;
+	int i;
+	int len = this->len;
+	int scanlen = this->scanlen;
+	size_t readlen = this->readlen;
+	struct nand_bbt_descr *bd = this->badblock_pattern;
+	loff_t from = startblock << (this->bbt_erase_shift - 1);
+
+	/* Note that startblock and endblock is 2 * (real blocks) here, see i+=2
+	 * below as it makes shifting and masking less painful */
+	for (i = startblock; i <= endblock;) {
+		int ret;
+
+		if (bd->options & NAND_BBT_SCANALLPAGES)
+			ret = scan_block_full(mtd, bd, from, buf, readlen,
+						scanlen, len);
+		else
+			ret = scan_block_fast(mtd, bd, from, buf, len);
+
+		if (ret < 0)
+			return ret;
+
+		if (ret) {
+			this->bbt[i >> 3] |= 0x03 << (i & 0x6);
+			printk("Bad eraseblock %d at 0x%08x\n",
+			       i >> 1, (unsigned int)from);
+			mtd->ecc_stats.badblocks++;
+		}
+
+		i += 2;
+		from += (1 << this->bbt_erase_shift);
+	}
+	return 0;
+}
+
+/**
+ * construct_bbt_up_to - [GENERIC] Fill BBT entries
+ * @mtd:    MTD device structure
+ * @inblock:    examined block
+ *
+ * Fill BBT entries for blocks that equal or less inblock and that wasn't scanned yet.
+ * If inblock have already scanned just do nothing. Before call this function
+ * make sure that inblock is valid!!!
+ */
+static inline int construct_bbt_up_to(struct mtd_info *mtd, uint8_t *buf, int inblock)
+{
+	struct nand_chip *this = mtd->priv;
+	int startblock = this->top_unscanned_block;
+	int endblock = inblock, ret;
+
+	if((startblock) && (endblock < startblock))
+		return 0;	/* We've already scanned this block */
+
+	ret = scan_oob_range(mtd, buf, startblock, endblock);
+	if (!ret)
+		this->top_unscanned_block = endblock + 2;
+
+	return ret;
+}
+#endif
+
 /**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
  * @mtd:	MTD device structure
@@ -399,6 +473,17 @@ static int create_bbt(struct mtd_info *m
 		readlen = len * mtd->writesize;
 	}
 
+#ifdef CONFIG_MTD_NAND_LAZY_BBT
+	this->len = len;
+	this->scanlen = scanlen;
+	this->readlen = readlen;
+
+	if(!this->bbt_td && (this->options & NAND_LAZY_BBT))
+		/* Flash based BBT wasn't requested. Lazily construct memory based BBT.
+		 Skip scan for now */
+		return 0;
+#endif
+
 	if (chip == -1) {
 		/* Note that numblocks is 2 * (real numblocks) here, see i+=2
 		 * below as it makes shifting and masking less painful */
@@ -1204,6 +1289,14 @@ int nand_isbad_bbt(struct mtd_info *mtd,
 
 	/* Get block number * 2 */
 	block = (int)(offs >> (this->bbt_erase_shift - 1));
+#ifdef CONFIG_MTD_NAND_LAZY_BBT
+	/* Fill up BBT to requested block */
+	if(!this->bbt_td && (this->options & NAND_LAZY_BBT))
+		if(construct_bbt_up_to(mtd, this->buffers->lbbtbuf, block))
+			/* Some IO error has happened during OOB read!
+			   Return block is bad */
+			return 1;
+#endif
 	res = (this->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
 	DEBUG(MTD_DEBUG_LEVEL2, "nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
Index: mtd-2.6/drivers/mtd/mtdpart.c
===================================================================
--- mtd-2.6.orig/drivers/mtd/mtdpart.c
+++ mtd-2.6/drivers/mtd/mtdpart.c
@@ -458,6 +458,11 @@ int add_mtd_partitions(struct mtd_info *
 		}
 
 		slave->mtd.ecclayout = master->ecclayout;
+
+#ifndef CONFIG_MTD_NAND_LAZY_BBT
+		/* Don't check all partition blocks during partition registration.
+		   !!! ecc_stats is uninitialized after registration.
+		   TODO: correctly initialize ecc_stats */
 		if (master->block_isbad) {
 			uint32_t offs = 0;
 
@@ -468,6 +473,7 @@ int add_mtd_partitions(struct mtd_info *
 				offs += slave->mtd.erasesize;
 			}
 		}
+#endif
 
 		if(parts[i].mtdp)
 		{	/* store the object pointer (caller may or may not register it */
Index: mtd-2.6/include/linux/mtd/nand.h
===================================================================
--- mtd-2.6.orig/include/linux/mtd/nand.h
+++ mtd-2.6/include/linux/mtd/nand.h
@@ -189,6 +189,12 @@ typedef enum {
 /* This option is defined if the board driver allocates its own buffers
    (e.g. because it needs them DMA-coherent */
 #define NAND_OWN_BUFFERS	0x00040000
+
+#ifdef CONFIG_MTD_NAND_LAZY_BBT
+/* This option enables lazily BBT construction. */
+#define NAND_LAZY_BBT		0x00080000
+#endif
+
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
 #define NAND_CONTROLLER_ALLOC	0x80000000
@@ -295,6 +301,9 @@ struct nand_buffers {
 	uint8_t	ecccalc[NAND_MAX_OOBSIZE];
 	uint8_t	ecccode[NAND_MAX_OOBSIZE];
 	uint8_t databuf[NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE];
+#ifdef CONFIG_MTD_NAND_LAZY_BBT
+	uint8_t	lbbtbuf[NAND_MAX_OOBSIZE];
+#endif
 };
 
 /**
@@ -408,6 +417,14 @@ struct nand_chip {
 
 	struct nand_bbt_descr	*badblock_pattern;
 
+#ifdef CONFIG_MTD_NAND_LAZY_BBT
+	/* Lazily BBT */
+	int32_t  	       len;
+	int32_t  	       scanlen;
+	size_t		       readlen;
+	int32_t  	       top_unscanned_block;
+#endif
+
 	void		*priv;
 };
 
Index: mtd-2.6/drivers/mtd/nand/Kconfig
===================================================================
--- mtd-2.6.orig/drivers/mtd/nand/Kconfig
+++ mtd-2.6/drivers/mtd/nand/Kconfig
@@ -23,6 +23,14 @@ config MTD_NAND_VERIFY_WRITE
 	  device thinks the write was successful, a bit could have been
 	  flipped accidentally due to device wear or something else.
 
+config MTD_NAND_LAZY_BBT
+	bool "Construct BBT lazily"
+	depends on MTD_NAND
+	help
+	  This allow construct BBT lazily.
+	  To enable this feature set NAND_LAZY_BBT bit in options field
+	  of struct nand_chip.
+
 config MTD_NAND_ECC_SMC
 	bool "NAND ECC Smart Media byte order"
 	depends on MTD_NAND
