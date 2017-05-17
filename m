Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAtL2-0006ie-I1
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 07:25:42 +0000
Received: by mail-qk0-x243.google.com with SMTP id u75so528764qka.1
 for <linux-mtd@lists.infradead.org>; Wed, 17 May 2017 00:25:19 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Wed, 17 May 2017 09:25:18 +0200
Message-ID: <CAJbz7-1KY0h=f8HgnfZGKtG8CYTK+S+Qb9BR7mwSk2U35cRtVg@mail.gmail.com>
Subject: [PATCH] mtd:nor:ppb_unlock: remove repeated chip unlock
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org
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

Signed-off-by: Honza Petrous <jpetrous@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 56aa6b7..53c842a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2534,8 +2534,10 @@ struct ppb_lock {
     struct flchip *chip;
     loff_t offset;
     int locked;
+    unsigned int erasesize;
 };

+#define MAX_CHIPS            16
 #define MAX_SECTORS            512

 #define DO_XXLOCK_ONEBLOCK_LOCK        ((void *)1)
@@ -2628,11 +2630,12 @@ static int __maybe_unused
cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
     struct ppb_lock *sect;
+    struct ppb_lock *chips;
     unsigned long adr;
     loff_t offset;
     uint64_t length;
     int chipnum;
-    int i;
+    int i, j;
     int sectors;
     int ret;

@@ -2642,15 +2645,19 @@ static int __maybe_unused
cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
      * first check the locking status of all sectors and save
      * it for future use.
      */
-    sect = kzalloc(MAX_SECTORS * sizeof(struct ppb_lock), GFP_KERNEL);
+    sect = kzalloc((MAX_SECTORS + MAX_CHIPS) * sizeof(struct ppb_lock),
+            GFP_KERNEL);
     if (!sect)
         return -ENOMEM;

+    chips = &sect[MAX_SECTORS];
+
     /*
      * This code to walk all sectors is a slightly modified version
      * of the cfi_varsize_frob() code.
      */
     i = 0;
+    j = -1;
     chipnum = 0;
     adr = 0;
     sectors = 0;
@@ -2671,6 +2678,18 @@ static int __maybe_unused cfi_ppb_unlock(struct
mtd_info *mtd, loff_t ofs,
             sect[sectors].locked = do_ppb_xxlock(
                 map, &cfi->chips[chipnum], adr, 0,
                 DO_XXLOCK_ONEBLOCK_GETLOCK);
+        } else {
+            if (j < 0 || chips[j].chip != &cfi->chips[chipnum]) {
+                j++;
+                if (j >= MAX_CHIPS) {
+                    printk(KERN_ERR "Only %d chips for PPB locking
supported!\n",
+                           MAX_CHIPS);
+                    kfree(sect);
+                    return -EINVAL;
+                }
+                chips[j].chip = &cfi->chips[chipnum];
+                chips[j].erasesize = size;
+            }
         }

         adr += size;
@@ -2697,12 +2716,14 @@ static int __maybe_unused
cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
         }
     }

-    /* Now unlock the whole chip */
-    ret = cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
-                   DO_XXLOCK_ONEBLOCK_UNLOCK);
-    if (ret) {
-        kfree(sect);
-        return ret;
+    /* Now unlock all involved chip(s) */
+    for (i = 0; i <= j; i++) {
+        ret = do_ppb_xxlock(map, chips[i].chip, 0, chips[i].erasesize,
+                    DO_XXLOCK_ONEBLOCK_UNLOCK);
+        if (ret) {
+            kfree(sect);
+            return ret;
+        }
     }

     /*
-- 
2.9.3
