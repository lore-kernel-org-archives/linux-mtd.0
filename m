Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AuKZO-00080P-Fi
	for linux-mtd@lists.infradead.org; Sat, 21 Feb 2004 00:00:34 +0000
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AuKZM-0005bL-00
	for <linux-mtd@lists.infradead.org>; Sat, 21 Feb 2004 01:00:32 +0100
Received: from mail.cambridgetechgroup.com ([80.177.250.58])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-mtd@lists.infradead.org>; Sat Feb 21 00:00:32 2004
Received: from john-news2 by mail.cambridgetechgroup.com with local (Gmexim
	0.1 (Debian))        id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat Feb 21 00:00:32 2004
To: linux-mtd@lists.infradead.org
From: "John Hall" <john-news2@cambridgetechgroup.com>
Date: Fri, 20 Feb 2004 16:38:38 -0000
Message-ID: <51eb.4036380e.d3c8b@irwin2.crw.uk.net>
Sender: news <news@sea.gmane.org>
Subject: Patch: fix suspend/resume on cfi_cmdset_00xx.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I found a bug in cfi_cmdset_0001.c when doing suspend and resume on my
board. The suspend function overwrites the oldstate member of the
cfi_private struct, which seems to break things.

The identical bug exists in 0002 and 0020 too. The following patch is for
all three.

Regards,
John

--- mtd/drivers/mtd/chips/cfi_cmdset_0001.c Wed Feb 11 10:03:56 2004
+++ mtd-jdh/drivers/mtd/chips/cfi_cmdset_0001.c Fri Feb 20 16:32:44 2004
@@ -1608,6 +1608,7 @@
 {
  struct map_info *map = mtd->priv;
  struct cfi_private *cfi = map->fldrv_priv;
+ flstate_t oldstates[cfi->numchips];
  int i;
  struct flchip *chip;
  int ret = 0;
@@ -1623,7 +1624,7 @@
   case FL_CFI_QUERY:
   case FL_JEDEC_QUERY:
    if (chip->oldstate == FL_READY) {
-    chip->oldstate = chip->state;
+    oldstates[i] = chip->state;
     chip->state = FL_PM_SUSPENDED;
     /* No need to wake_up() on this state change -
      * as the whole point is that nobody can do anything
@@ -1632,6 +1633,7 @@
    }
    break;
   default:
+   printk(KERN_ALERT "cfi_cmdset_0001: disallowing suspend\n");
    ret = -EAGAIN;
   case FL_PM_SUSPENDED:
    break;
@@ -1651,7 +1653,7 @@
     /* No need to force it into a known state here,
        because we're returning failure, and it didn't
        get power cycled */
-    chip->state = chip->oldstate;
+    chip->state = oldstates[i];
     wake_up(&chip->wq);
    }
    spin_unlock(chip->mutex);
--- mtd/drivers/mtd/chips/cfi_cmdset_0002.c Wed Feb 11 10:03:58 2004
+++ mtd-jdh/drivers/mtd/chips/cfi_cmdset_0002.c Fri Feb 20 16:32:44 2004
@@ -1975,6 +1975,7 @@
 {
  struct map_info *map = mtd->priv;
  struct cfi_private *cfi = map->fldrv_priv;
+ flstate_t oldstates[cfi->numchips];
  int i;
  struct flchip *chip;
  int ret = 0;
@@ -1989,7 +1990,7 @@
   case FL_STATUS:
   case FL_CFI_QUERY:
   case FL_JEDEC_QUERY:
-   chip->oldstate = chip->state;
+   oldstates[i] = chip->state;
    chip->state = FL_PM_SUSPENDED;
    /* No need to wake_up() on this state change -
     * as the whole point is that nobody can do anything
@@ -2014,7 +2015,7 @@
    cfi_spin_lock(chip->mutex);

    if (chip->state == FL_PM_SUSPENDED) {
-    chip->state = chip->oldstate;
+    chip->state = oldstates[i];
     wake_up(&chip->wq);
    }
    cfi_spin_unlock(chip->mutex);
--- mtd/drivers/mtd/chips/cfi_cmdset_0020.c Wed Feb 11 10:03:58 2004
+++ mtd-jdh/drivers/mtd/chips/cfi_cmdset_0020.c Fri Feb 20 16:32:44 2004
@@ -1319,6 +1319,7 @@
 {
  struct map_info *map = mtd->priv;
  struct cfi_private *cfi = map->fldrv_priv;
+ flstate_t oldstates[cfi->numchips];
  int i;
  struct flchip *chip;
  int ret = 0;
@@ -1333,7 +1334,7 @@
   case FL_STATUS:
   case FL_CFI_QUERY:
   case FL_JEDEC_QUERY:
-   chip->oldstate = chip->state;
+   oldstates[i] = chip->state;
    chip->state = FL_PM_SUSPENDED;
    /* No need to wake_up() on this state change -
     * as the whole point is that nobody can do anything
@@ -1361,7 +1362,7 @@
     /* No need to force it into a known state here,
        because we're returning failure, and it didn't
        get power cycled */
-    chip->state = chip->oldstate;
+    chip->state = oldstates[i];
     wake_up(&chip->wq);
    }
    spin_unlock_bh(chip->mutex);
