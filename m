Message-Id: <201003112205.o2BM5bN3013306@imap1.linux-foundation.org>
Subject: [patch 2/2] bitops: rename for_each_bit() to for_each_set_bit(): mtd
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Thu, 11 Mar 2010 14:05:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: sfr@canb.auug.org.au, dedekind@infradead.org, akinobu.mita@gmail.com,
	adobriyan@gmail.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, davem@davemloft.net, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Akinobu Mita <akinobu.mita@gmail.com>

Rename for_each_bit to for_each_set_bit in the kernel source tree.  To
permit for_each_clear_bit(), should that ever be added.

Suggested-by: Alexey Dobriyan <adobriyan@gmail.com>
Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Russell King <rmk@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/sm_ftl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/sm_ftl.c~bitops-rename-for_each_bit-to-for_each_set_bit-mtd drivers/mtd/sm_ftl.c
--- a/drivers/mtd/sm_ftl.c~bitops-rename-for_each_bit-to-for_each_set_bit-mtd
+++ a/drivers/mtd/sm_ftl.c
@@ -937,7 +937,7 @@ int sm_cache_flush(struct sm_ftl *ftl)
 
 
 	/* Try to read all unread areas of the cache block*/
-	for_each_bit(sector_num, &ftl->cache_data_invalid_bitmap,
+	for_each_set_bit(sector_num, &ftl->cache_data_invalid_bitmap,
 		ftl->block_size / SM_SECTOR_SIZE) {
 
 		if (!sm_read_sector(ftl,
_
