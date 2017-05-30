Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFdoW-0007PC-FR
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 09:51:46 +0000
Received: by mail-qt0-x241.google.com with SMTP id l39so11717234qtb.1
 for <linux-mtd@lists.infradead.org>; Tue, 30 May 2017 02:51:22 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Tue, 30 May 2017 11:51:21 +0200
Message-ID: <CAJbz7-3BzFyJ6+EZo-Rs9mbRGgBHHFYvGB=_uzO-76wmJ4aBiw@mail.gmail.com>
Subject: [PATCH v2 2/3] mtd:nor:ppb_unlock: don't use empty part of array
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to increment 'sectors' during walk over all sectors
in the case of the sectors inside the unlocking area. It can only lead to
out of sectors error for big chips.

Signed-off-by: Honza Petrous <jpetrous@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 62a1004..29a0b7f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2671,6 +2671,14 @@ static int __maybe_unused cfi_ppb_unlock(struct
mtd_info *mtd, loff_t ofs,
             sect[sectors].locked = do_ppb_xxlock(
                 map, &cfi->chips[chipnum], adr, 0,
                 DO_XXLOCK_ONEBLOCK_GETLOCK);
+
+            sectors++;
+            if (sectors >= MAX_SECTORS) {
+                printk(KERN_ERR "Only %d sectors for PPB locking supported!\n",
+                       MAX_SECTORS);
+                kfree(sect);
+                return -EINVAL;
+            }
         }

         adr += size;
@@ -2680,14 +2688,6 @@ static int __maybe_unused cfi_ppb_unlock(struct
mtd_info *mtd, loff_t ofs,
         if (offset == regions[i].offset + size * regions[i].numblocks)
             i++;

-        sectors++;
-        if (sectors >= MAX_SECTORS) {
-            printk(KERN_ERR "Only %d sectors for PPB locking supported!\n",
-                   MAX_SECTORS);
-            kfree(sect);
-            return -EINVAL;
-        }
-
         if (adr >> cfi->chipshift) {
             adr = 0;
             chipnum++;
-- 
2.9.3
