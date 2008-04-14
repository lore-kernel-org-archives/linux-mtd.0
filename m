Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlN4h-0006Ms-9g
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 11:42:16 +0000
Message-ID: <4803430D.2050201@users.sourceforge.net>
Date: Mon, 14 Apr 2008 13:42:05 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH] Fix return values of jffs2_block_check_erase
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Corrects the return values of the error paths so that a block
that failed to be erased is marked as bad instead of being reused.

Signed-off-by: Anders Grafström <grfstrm@users.sourceforge.net>
---
  fs/jffs2/erase.c |    7 ++++++-
  1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..23e9dd6 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -350,9 +350,11 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
  			   break;
  		} while(--retlen);
  		c->mtd->unpoint(c->mtd, ebuf, jeb->offset, c->sector_size);
-		if (retlen)
+		if (retlen) {
  			printk(KERN_WARNING "Newly-erased block contained word 0x%lx at offset 0x%08tx\n",
  			       *wordebuf, jeb->offset + c->sector_size-retlen*sizeof(*wordebuf));
+			return -EIO;
+		}
  		return 0;
  	}
   do_flash_read:
@@ -373,10 +375,12 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
  		ret = c->mtd->read(c->mtd, ofs, readlen, &retlen, ebuf);
  		if (ret) {
  			printk(KERN_WARNING "Read of newly-erased block at 0x%08x failed: %d. Putting on bad_list\n", ofs, ret);
+			ret = -EIO;
  			goto fail;
  		}
  		if (retlen != readlen) {
  			printk(KERN_WARNING "Short read from newly-erased block at 0x%08x. Wanted %d, got %zd\n", ofs, readlen, retlen);
+			ret = -EIO;
  			goto fail;
  		}
  		for (i=0; i<readlen; i += sizeof(unsigned long)) {
@@ -385,6 +389,7 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
  			if (*datum + 1) {
  				*bad_offset += i;
  				printk(KERN_WARNING "Newly-erased block contained word 0x%lx at offset 0x%08x\n", *datum, *bad_offset);
+				ret = -EIO;
  				goto fail;
  			}
  		}
-- 
1.5.4.4
