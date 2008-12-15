Received: from acsinet11.oracle.com ([141.146.126.233])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCMzZ-0003WD-Jh
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 23:36:49 +0000
Message-ID: <4946E9FA.6030607@oracle.com>
Date: Mon, 15 Dec 2008 15:36:26 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH -next] mtd: fix m25p80 printk formats
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
In-Reply-To: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, akpm <akpm@linux-foundation.org>,
	linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings:

build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:172: warning: format '%d' expects type 'int', but argument 4 has type 'uint64_t'
build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:236: warning: format '%d' expects type 'int', but argument 6 has type 'uint64_t'
build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:680: warning: format '%d' expects type 'int', but argument 5 has type 'uint64_t'
build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:683: warning: format '%.8x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:683: warning: format '%u' expects type 'unsigned int', but argument 4 has type 'uint64_t'
build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:693: warning: format '%.8x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:724: warning: format '%.8x' expects type 'unsigned int', but argument 4 has type 'uint64_t'
build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:724: warning: format '%.8x' expects type 'unsigned int', but argument 5 has type 'uint64_t'
build-r7150.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/m25p80.c:724: warning: format '%u' expects type 'unsigned int', but argument 6 has type 'uint64_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/devices/m25p80.c |   34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

--- linux-next-20081215.orig/drivers/mtd/devices/m25p80.c
+++ linux-next-20081215/drivers/mtd/devices/m25p80.c
@@ -169,9 +169,9 @@ static int wait_till_ready(struct m25p *
  */
 static int erase_chip(struct m25p *flash)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dKiB\n",
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %lluKiB\n",
 			dev_name(&flash->spi->dev), __func__,
-			flash->mtd.size / 1024);
+			(unsigned long long)flash->mtd.size / 1024);
 
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -233,9 +233,9 @@ static int m25p80_erase(struct mtd_info 
 	struct m25p *flash = mtd_to_m25p(mtd);
 	u32 addr,len;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %d\n",
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %u\n",
 			dev_name(&flash->spi->dev), __func__, "at",
-			(u32)instr->addr, instr->len);
+			(u32)instr->addr, (u32)instr->len);
 
 	/* sanity checks */
 	if (instr->addr + instr->len > flash->mtd.size)
@@ -677,24 +677,26 @@ static int __devinit m25p_probe(struct s
 		flash->mtd.erasesize = info->sector_size;
 	}
 
-	dev_info(&spi->dev, "%s (%d Kbytes)\n", info->name,
-			flash->mtd.size / 1024);
+	dev_info(&spi->dev, "%s (%llu Kbytes)\n", info->name,
+			(unsigned long long)flash->mtd.size / 1024);
 
 	DEBUG(MTD_DEBUG_LEVEL2,
-		"mtd .name = %s, .size = 0x%.8x (%uMiB) "
+		"mtd .name = %s, .size = 0x%.8llx (%lluMiB) "
 			".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
 		flash->mtd.name,
-		flash->mtd.size, flash->mtd.size / (1024*1024),
+		(unsigned long long)flash->mtd.size,
+		(unsigned long long)flash->mtd.size / (1024*1024),
 		flash->mtd.erasesize, flash->mtd.erasesize / 1024,
 		flash->mtd.numeraseregions);
 
 	if (flash->mtd.numeraseregions)
 		for (i = 0; i < flash->mtd.numeraseregions; i++)
 			DEBUG(MTD_DEBUG_LEVEL2,
-				"mtd.eraseregions[%d] = { .offset = 0x%.8x, "
+				"mtd.eraseregions[%d] = { .offset = 0x%.8llx, "
 				".erasesize = 0x%.8x (%uKiB), "
-				".numblocks = %d }\n",
-				i, flash->mtd.eraseregions[i].offset,
+				".numblocks = %d }\n", i,
+				(unsigned long long)
+				  flash->mtd.eraseregions[i].offset,
 				flash->mtd.eraseregions[i].erasesize,
 				flash->mtd.eraseregions[i].erasesize / 1024,
 				flash->mtd.eraseregions[i].numblocks);
@@ -722,12 +724,12 @@ static int __devinit m25p_probe(struct s
 		if (nr_parts > 0) {
 			for (i = 0; i < nr_parts; i++) {
 				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
-					"{.name = %s, .offset = 0x%.8x, "
-						".size = 0x%.8x (%uKiB) }\n",
+					"{.name = %s, .offset = 0x%.8llx, "
+						".size = 0x%.8llx (%lluKiB) }\n",
 					i, parts[i].name,
-					parts[i].offset,
-					parts[i].size,
-					parts[i].size / 1024);
+					(unsigned long long)parts[i].offset,
+					(unsigned long long)parts[i].size,
+					(unsigned long long)(parts[i].size / 1024));
 			}
 			flash->partitioned = 1;
 			return add_mtd_partitions(&flash->mtd, parts, nr_parts);
