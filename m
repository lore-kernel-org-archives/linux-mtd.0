Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFdoO-0007OS-QB
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 09:51:41 +0000
Received: by mail-qk0-x241.google.com with SMTP id y128so11358789qka.3
 for <linux-mtd@lists.infradead.org>; Tue, 30 May 2017 02:51:16 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Tue, 30 May 2017 11:51:14 +0200
Message-ID: <CAJbz7-1FTiDiA3Mjs4hxaZXBCc-qcTYdmWZ6DqnVVYrqohEyrA@mail.gmail.com>
Subject: [PATCH v2 1/3] mtd:nor:ppb_unlock: fix locking of the utmost required
 sector
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

When used Persistent Protection Bits (PPB) unlocking of cfi_cmdset_0002.c
the last sector remains unlocked regardless of its previous state
because of late increment of 'sectors' variable. Flip the code fixes it.

Signed-off-by: Honza Petrous <jpetrous@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 56aa6b7..62a1004 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2680,14 +2680,6 @@ static int __maybe_unused cfi_ppb_unlock(struct
mtd_info *mtd, loff_t ofs,
         if (offset == regions[i].offset + size * regions[i].numblocks)
             i++;

-        if (adr >> cfi->chipshift) {
-            adr = 0;
-            chipnum++;
-
-            if (chipnum >= cfi->numchips)
-                break;
-        }
-
         sectors++;
         if (sectors >= MAX_SECTORS) {
             printk(KERN_ERR "Only %d sectors for PPB locking supported!\n",
@@ -2695,6 +2687,14 @@ static int __maybe_unused cfi_ppb_unlock(struct
mtd_info *mtd, loff_t ofs,
             kfree(sect);
             return -EINVAL;
         }
+
+        if (adr >> cfi->chipshift) {
+            adr = 0;
+            chipnum++;
+
+            if (chipnum >= cfi->numchips)
+                break;
+        }
     }

     /* Now unlock the whole chip */
-- 
2.9.3
