Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFdoY-0007Pv-36
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 09:51:52 +0000
Received: by mail-qk0-x241.google.com with SMTP id y128so11359186qka.3
 for <linux-mtd@lists.infradead.org>; Tue, 30 May 2017 02:51:29 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Tue, 30 May 2017 11:51:27 +0200
Message-ID: <CAJbz7-3yAaWNntReedFHt8Gn7c8hpTZp8yBmN1YrNA+f1NeMEw@mail.gmail.com>
Subject: [PATCH v2 3/3] mtd:nor:ppb_unlock: remove repeated chip unlock
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

The Persistent Protection Bits (PPB) locking of cfi_cmdset_0002.c
doesn't support per-sector-unlocking, so any unlock request
unlocks the whole chip. Because of that limitation the driver
does the unlock in three steps:
 1) remember all locked sector
 2) do the whole chip unlock
 3) lock back only the necessary sectors

Unfortunately in step 2 (unlocking the chip) there is used
cfi_varsize_frob() for per-sector unlock, what ends up
in multiple chip unlocking calls (exactly the chip unlock
is called for every sector in the unlock area) even the only one
unlock per chip is enough.

Also optimized processing only inside necessary chip array in case
of multi-chip setting.

Signed-off-by: Honza Petrous <jpetrous@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 29a0b7f..22a27c8 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2531,7 +2531,7 @@ static int cfi_atmel_unlock(struct mtd_info
*mtd, loff_t ofs, uint64_t len)
  */

 struct ppb_lock {
-    struct flchip *chip;
+    int chipid;
     loff_t offset;
     int locked;
 };
@@ -2635,6 +2635,8 @@ static int __maybe_unused cfi_ppb_unlock(struct
mtd_info *mtd, loff_t ofs,
     int i;
     int sectors;
     int ret;
+    int fromchip;
+    int tochip;

     /*
      * PPB unlocking always unlocks all sectors of the flash chip.
@@ -2656,6 +2658,8 @@ static int __maybe_unused cfi_ppb_unlock(struct
mtd_info *mtd, loff_t ofs,
     sectors = 0;
     offset = 0;
     length = mtd->size;
+    fromchip = ofs >> cfi->chipshift;
+    tochip = (ofs + len - 1) >> cfi->chipshift;

     while (length) {
         int size = regions[i].erasesize;
@@ -2676,8 +2680,8 @@ static int __maybe_unused cfi_ppb_unlock(struct
mtd_info *mtd, loff_t ofs,
             if (sectors >= MAX_SECTORS) {
                 printk(KERN_ERR "Only %d sectors for PPB locking supported!\n",
                        MAX_SECTORS);
-                kfree(sect);
-                return -EINVAL;
+                ret = -EINVAL;
+                goto out;
             }
         }

@@ -2697,12 +2701,13 @@ static int __maybe_unused
cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
         }
     }

-    /* Now unlock the whole chip */
-    ret = cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
-                   DO_XXLOCK_ONEBLOCK_UNLOCK);
-    if (ret) {
-        kfree(sect);
-        return ret;
+    /* Now unlock the all necessary chips (full unlock) */
+    for (chipnum = fromchip; chipnum <= tochip; chipnum++) {
+        ret = do_ppb_xxlock(map, &cfi->chips[chipnum],
+                    0, 1 << cfi->chipshift,
+                    DO_XXLOCK_ONEBLOCK_UNLOCK);
+        if (ret)
+            goto out;
     }

     /*
@@ -2710,11 +2715,14 @@ static int __maybe_unused
cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
      * We need to re-lock all previously locked sectors.
      */
     for (i = 0; i < sectors; i++) {
-        if (sect[i].locked)
-            do_ppb_xxlock(map, sect[i].chip, sect[i].offset, 0,
+        if (sect[i].locked &&
+            (sect[i].chipid >= fromchip && sect[i].chipid <= tochip))
+            do_ppb_xxlock(map, &cfi->chips[sect[i].chipid],
+                      sect[i].offset, 0,
                       DO_XXLOCK_ONEBLOCK_LOCK);
     }

+out:
     kfree(sect);
     return ret;
 }
-- 
2.9.3
