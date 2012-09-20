Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEccQ-0008HS-8Z
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 09:00:23 +0000
Received: by bkcji2 with SMTP id ji2so959592bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 02:00:20 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: bcm47xxsflash: just use memcpy_fromio for reading
Date: Thu, 20 Sep 2012 11:00:25 +0200
Message-Id: <1348131625-24349-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
It doesn't generate any errors on normal compilation, but I wasn't able
to test it with "verify". This tool defeated me ;/

First I cloned dedekind/maintaining.git but it didn't run because or
lacking aiaiai.

So I've cloned dedekind/aiaiai.git.

Then I had to move aiaiai to ~/git/aiaiai to let "verify" find it.

So I was able to use verify:
time ./verify ../l2-mtd/ mips-bcm47xx_defconfig < ../l2-mtd/0001-mtd-bcm47xxsflash-just-use-memcpy-for-reading.patch
but it didn't work because patch was already applied. My bad, but... it
took 2m17.277s to verify to realize that. And that magic commit/message
wasn't helpful:
Failed to apply patch(es) with git am on top of:
0f1afc8 Quick fixes - applied by aiaiai

So I've removed patch from my tree, and tried again. This time it took
3m14.398s just to display:
[2012-09-20 10:39:10] aiaiai-make-kernel: Program "aiaiai-locker" is required but not found in PATH

I just wanted to add ~/git/aiaiai to my $PATH, but noticed it doesn't contain
aiaiai-locker anyway... I gave up :|

I appreciate your work on additional quality tools, but apart from good
code it also need to be easy-usable to make ppl use it :|
---
 drivers/mtd/devices/bcm47xxsflash.c |   31 ++-----------------------------
 1 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index a328872..dd650db 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -14,41 +14,14 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			      size_t *retlen, u_char *buf)
 {
 	struct bcma_sflash *sflash = mtd->priv;
-	size_t bytes_read = 0;
-	__iomem u8 *src = (__iomem u8 *)KSEG0ADDR(sflash->window + from);
-	int i;
-	size_t unaligned_before, unaligned_after;
 
 	/* Check address range */
 	if ((from + len) > mtd->size)
 		return -EINVAL;
 
-	unaligned_before = from & 0x3;
-	unaligned_after = (from + len) & 0x3;
+	memcpy_fromio(buf, (void *)KSEG0ADDR(sflash->window + from), len);
 
-	for (i = 0; i < unaligned_before; i++) {
-		*buf = readb(src);
-		buf++;
-		src++;
-		bytes_read++;
-	}
-	for (i = from - unaligned_before; i < from + len - unaligned_after;
-	     i += 4) {
-		*(u32 *)buf = readl(src);
-		buf += 4;
-		src += 4;
-		bytes_read += 4;
-	}
-	for (i = 0; i < unaligned_after; i++) {
-		*buf = readb(src);
-		buf++;
-		src++;
-		bytes_read++;
-	}
-
-	*retlen = bytes_read;
-
-	return 0;
+	return len;
 }
 
 static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
-- 
1.7.7
