Received: from usausmgw01.spansion.com ([12.110.209.161])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VF1zp-0002fz-EV
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 13:10:46 +0000
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: cfi_cmdset_0002: write buffer cleanup
Date: Thu, 29 Aug 2013 17:14:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201308291714.31393.Gernot.Hoyler@spansion.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch cleans up the write buffer programing code for today's and next
generation flash devices. It removes classic word programing and uses
100% write buffer programing instead. Word programing is not recommended
any more for today's devices. In addition, the patch increases the timeout
value for write buffer program operations from 1 ms to 20 ms. Due to the
larger write buffer size of today's devices, the maximum program time has
become longer too and can now be more than 1 ms (e.g. Spansion S29GL-S).


Signed-off-by: Gernot Hoyler <Gernot.Hoyler@spansion.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   75 +++++++++++++++--------------------
 1 files changed, 32 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 89b9d68..b8f7b87 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1458,21 +1458,18 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 }
 
 
-/*
- * FIXME: interleaved mode not tested, and probably not supported!
- */
 static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    unsigned long adr, const u_char *buf,
 				    int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
-	/* see comments in do_write_oneword() regarding uWriteTimeo. */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	/* see comments in do_write_oneword() regarding uWriteTimeout, 20ms */
+	unsigned long uWriteTimeout = (HZ / 50) + 1;
 	int ret = -EIO;
 	unsigned long cmd_adr;
-	int z, words;
-	map_word datum;
+	int z, words, prolog, epilog, buflen = len;
+	map_word datum, pdat, edat;
 
 	adr += chip->start;
 	cmd_adr = adr;
@@ -1493,6 +1490,21 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, cmd_adr);
 
+	/* If start is not bus-aligned, prepend old contents of flash */
+	prolog = (adr & (map_bankwidth(map)-1));
+	if (prolog) {
+		adr -= prolog;
+		cmd_adr -= prolog;
+		len += prolog;
+		pdat = map_read(map, adr);
+	}
+	/* If end is not bus-aligned, append old contents of flash */
+	epilog = ((adr + len) & (map_bankwidth(map)-1));
+	if (epilog) {
+		len += map_bankwidth(map)-epilog;
+		edat = map_read(map, adr + len - map_bankwidth(map));
+	}
+
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 
@@ -1506,8 +1518,19 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	map_write(map, CMD(words - 1), cmd_adr);
 	/* Write data */
 	z = 0;
+	if (prolog) {
+		datum = map_word_load_partial(map, pdat, buf, prolog,
+			min_t(int, buflen, map_bankwidth(map) - prolog));
+		map_write(map, datum, adr);
+
+		z += map_bankwidth(map);
+		buf += map_bankwidth(map) - prolog;
+	}
 	while(z < words * map_bankwidth(map)) {
-		datum = map_word_load(map, buf);
+		if (epilog && z >= (words-1) * map_bankwidth(map))
+			datum = map_word_load_partial(map, edat, buf, 0, epilog);
+		else
+			datum = map_word_load(map, buf);
 		map_write(map, datum, adr + z);
 
 		z += map_bankwidth(map);
@@ -1598,36 +1621,12 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 	chipnum = to >> cfi->chipshift;
 	ofs = to  - (chipnum << cfi->chipshift);
 
-	/* If it's not bus-aligned, do the first word write */
-	if (ofs & (map_bankwidth(map)-1)) {
-		size_t local_len = (-ofs)&(map_bankwidth(map)-1);
-		if (local_len > len)
-			local_len = len;
-		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),
-					     local_len, retlen, buf);
-		if (ret)
-			return ret;
-		ofs += local_len;
-		buf += local_len;
-		len -= local_len;
-
-		if (ofs >> cfi->chipshift) {
-			chipnum ++;
-			ofs = 0;
-			if (chipnum == cfi->numchips)
-				return 0;
-		}
-	}
-
-	/* Write buffer is worth it only if more than one word to write... */
-	while (len >= map_bankwidth(map) * 2) {
+	while (len) {
 		/* We must not cross write block boundaries */
 		int size = wbufsize - (ofs & (wbufsize-1));
 
 		if (size > len)
 			size = len;
-		if (size % map_bankwidth(map))
-			size -= size % map_bankwidth(map);
 
 		ret = do_write_buffer(map, &cfi->chips[chipnum],
 				      ofs, buf, size);
@@ -1647,16 +1646,6 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 		}
 	}
 
-	if (len) {
-		size_t retlen_dregs = 0;
-
-		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),
-					     len, &retlen_dregs, buf);
-
-		*retlen += retlen_dregs;
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
1.7.4.2
