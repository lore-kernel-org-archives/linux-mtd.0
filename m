Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PnvJI-0000Wq-3j
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:53:29 +0000
Subject: [PATCH] Simplify write buffer size calculation by using
	mtd->writebufsize.
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 11 Feb 2011 16:53:26 +0100
Message-ID: <20110211155302.25154.10206.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Anatolij Gustschin <agust@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch applies on top of "[PATCH 2/2] mtd: cfi: fix writebufsize initialization" by Anatolij Gustschin <agust@denx.de>.


Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   13 ++++++-------
 drivers/mtd/chips/cfi_cmdset_0002.c |    3 +--
 drivers/mtd/chips/cfi_cmdset_0020.c |   16 ++++++++--------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 178f87b..7d6a752 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1643,23 +1643,23 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
 }
 
 
-static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
+static int __xipram do_write_buffer(struct mtd_info *mtd, struct flchip *chip,
 				    unsigned long adr, const struct kvec **pvec,
 				    unsigned long *pvec_seek, int len)
 {
+	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word status, write_cmd, datum;
 	unsigned long cmd_adr;
-	int ret, wbufsize, word_gap, words;
+	int ret, word_gap, words;
 	const struct kvec *vec;
 	unsigned long vec_seek;
 	unsigned long initial_adr;
 	int initial_len = len;
 
-	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 	adr += chip->start;
 	initial_adr = adr;
-	cmd_adr = adr & ~(wbufsize-1);
+	cmd_adr = adr & ~(mtd->writebufsize - 1);
 
 	/* Let's determine this according to the interleave only once */
 	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
@@ -1807,7 +1807,6 @@ static int cfi_intelext_writev (struct mtd_info *mtd, const struct kvec *vecs,
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	int wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 	int ret = 0;
 	int chipnum;
 	unsigned long ofs, vec_seek, i;
@@ -1826,11 +1825,11 @@ static int cfi_intelext_writev (struct mtd_info *mtd, const struct kvec *vecs,
 
 	do {
 		/* We must not cross write block boundaries */
-		int size = wbufsize - (ofs & (wbufsize-1));
+		int size = mtd->writebufsize - (ofs & (mtd->writebufsize - 1));
 
 		if (size > len)
 			size = len;
-		ret = do_write_buffer(map, &cfi->chips[chipnum],
+		ret = do_write_buffer(mtd, &cfi->chips[chipnum],
 				      ofs, &vecs, &vec_seek, size);
 		if (ret)
 			return ret;
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 7e9c4e9..27e7787 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1492,7 +1492,6 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	int wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 	int ret = 0;
 	int chipnum;
 	unsigned long ofs;
@@ -1528,7 +1527,7 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Write buffer is worth it only if more than one word to write... */
 	while (len >= map_bankwidth(map) * 2) {
 		/* We must not cross write block boundaries */
-		int size = wbufsize - (ofs & (wbufsize-1));
+		int size = mtd->writebufsize - (ofs & (mtd->writebufsize - 1));
 
 		if (size > len)
 			size = len;
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index ed56ad3..fdce65c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -419,22 +419,22 @@ static int cfi_staa_read (struct mtd_info *mtd, loff_t from, size_t len, size_t
 	return ret;
 }
 
-static inline int do_write_buffer(struct map_info *map, struct flchip *chip,
+static inline int do_write_buffer(struct mtd_info *mtd, struct flchip *chip,
 				  unsigned long adr, const u_char *buf, int len)
 {
+	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word status, status_OK;
 	unsigned long cmd_adr, timeo;
 	DECLARE_WAITQUEUE(wait, current);
-	int wbufsize, z;
+	int z;
 
         /* M58LW064A requires bus alignment for buffer wriets -- saw */
         if (adr & (map_bankwidth(map)-1))
             return -EINVAL;
 
-        wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
         adr += chip->start;
-	cmd_adr = adr & ~(wbufsize-1);
+	cmd_adr = adr & ~(mtd->writebufsize - 1);
 
 	/* Let's determine this according to the interleave only once */
         status_OK = CMD(0x80);
@@ -610,7 +610,6 @@ static int cfi_staa_write_buffers (struct mtd_info *mtd, loff_t to,
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	int wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 	int ret = 0;
 	int chipnum;
 	unsigned long ofs;
@@ -624,19 +623,20 @@ static int cfi_staa_write_buffers (struct mtd_info *mtd, loff_t to,
 
 #ifdef DEBUG_CFI_FEATURES
 	printk("%s: map_bankwidth(map)[%x]\n", __func__, map_bankwidth(map));
-	printk("%s: chipnum[%x] wbufsize[%x]\n", __func__, chipnum, wbufsize);
+	printk(KERN_DEBUG "%s: chipnum[%x] mtd->writebufsize[%x]\n", __func__,
+	       chipnum, mtd->writebufsize);
 	printk("%s: ofs[%x] len[%x]\n", __func__, ofs, len);
 #endif
 
         /* Write buffer is worth it only if more than one word to write... */
         while (len > 0) {
 		/* We must not cross write block boundaries */
-		int size = wbufsize - (ofs & (wbufsize-1));
+		int size = mtd->writebufsize - (ofs & (mtd->writebufsize - 1));
 
                 if (size > len)
                     size = len;
 
-                ret = do_write_buffer(map, &cfi->chips[chipnum],
+		ret = do_write_buffer(mtd, &cfi->chips[chipnum],
 				      ofs, buf, size);
 		if (ret)
 			return ret;
