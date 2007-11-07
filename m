Received: from mu-out-0910.google.com ([209.85.134.189])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ipgjk-0003i9-4T
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 03:58:19 -0500
Received: by mu-out-0910.google.com with SMTP id i2so3967645mue
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 00:58:07 -0800 (PST)
Message-ID: <fe810cf0711070058obc3c3fdm4a34f956e5ff4a96@mail.gmail.com>
Date: Wed, 7 Nov 2007 11:58:07 +0300
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: linux-mtd@lists.infradead.org, nico@cam.org
Subject: [PATCH] [CFI] Prevent erase command invocation on suspended chip
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

while running stress tests we have met cfi_cmdset_0001.c driver issue.
Working on multipartitional devices with erase suspend on write
feature enabled it is possible to get erase operation invoked on chip
with suspended erase. get_chip() looses information about earlier
suspended erase and new erase operation gets issued. New erase
operations report successful completion, but blocks remain dirty
causing, for example, JFFS2 error messages like:

...
Newly-erased block contained word 0x20031985 at offset 0x00200000
Newly-erased block contained word 0x20031985 at offset 0x00280000
Newly-erased block contained word 0x20031985 at offset 0x00240000
...


The patch below fixes that issue.

Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>

diff -uNr a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-06 11:40:24.000000000 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-06 20:37:03.000000000 +0300
@@ -795,6 +795,7 @@
 static int get_chip(struct map_info *map, struct flchip *chip,
unsigned long adr, int mode)
 {
 	int ret;
+	DECLARE_WAITQUEUE(wait, current);

  retry:
 	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING
@@ -851,6 +852,20 @@
 			spin_unlock(contender->mutex);
 		}

+		/* Check if we already have suspended erase
+		 * on this chip. Sleep. */
+		if (mode == FL_ERASING && shared->erasing
+		    && shared->erasing->oldstate == FL_ERASING) {
+			spin_unlock(&shared->lock);
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			spin_unlock(chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			spin_lock(chip->mutex);
+			goto retry;
+		}
+
 		/* We now own it */
 		shared->writing = chip;
 		if (mode == FL_ERASING)
