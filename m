Received: from nssinet2.co-nss.co.jp ([150.96.0.5])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pMO5-0003h2-RT
	for <linux-mtd@lists.infradead.org>; Wed, 20 Aug 2003 07:24:06 +0100
Received: from nssnet.co-nss.co.jp (localhost [127.0.0.1])
	by nssinet2.co-nss.co.jp (8.9.3/3.7W) with ESMTP id PAA19212
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2003 15:09:36 +0900 (JST)
Message-Id: <200308200615.PAA22917@nssnet.co-nss.co.jp>
Date: Wed, 20 Aug 2003 15:24:03 +0900
From: Hiroaki KAMON <kamon@co-nss.co.jp>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: wrong mutex handler in amd_flash.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I found a problem in "amd_flash.c".  The kernel (TimeSys Linux) oops 
due to access of bad area.

The pointer "chips->mute" for spin_lock_bh() is not pointing the area 
in private structure, but local variable of amd_flash_probe().

Here's a patch to fix it.

Regards,
Hiroaki


Index: mtd/drivers/mtd/chips/amd_flash.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/amd_flash.c,v
retrieving revision 1.23
diff -u -r1.23 amd_flash.c
--- mtd/drivers/mtd/chips/amd_flash.c   12 Jun 2003 09:24:13 -0000      1.23
+++ mtd/drivers/mtd/chips/amd_flash.c   20 Aug 2003 05:37:58 -0000
@@ -688,7 +688,6 @@

        chips[0].start = 0;
        chips[0].state = FL_READY;
-       chips[0].mutex = &chips[0]._spinlock;
        temp.numchips = 1;
        for (size = mtd->size; size > 1; size >>= 1) {
                temp.chipshift++;
@@ -775,6 +774,7 @@
        for (i = 0; i < private->numchips; i++) {
                init_waitqueue_head(&private->chips[i].wq);
                spin_lock_init(&private->chips[i]._spinlock);
+               private->chips[i].mutex = &private->chips[i]._spinlock;
        }

        map->fldrv_priv = private;


---
Hiroaki KAMON   <kamon@co-nss.co.jp>

  Nissin Systems co.,ltd.
      Realtime Component Dept.  Engineer
        (Phone) +81-75-344-7950  (FAX) +81-75-344-7888
        Horikawa-douri Shijou-sagaru Higashigawa, Shimogyo-ku,
        Kyoto, 600-8482, JAPAN
