Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fctzG-0005xC-OJ
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 14:51:31 +0000
Subject: Patch "mtd: cfi_cmdset_0002: Change definition naming to retry write
 operation" has been added to the 4.14-stable tree
To: Joakim.Tjernlund@infinera.com, boris.brezillon@bootlin.com,
 boris.brezillon@free-electrons.com, chris.packham@alliedtelesis.co.nz,
 computersforpeace@gmail.com, cyrille.pitchen@wedev4u.fr, dwmw2@infradead.org,
 gregkh@linuxfoundation.org, ikegami@allied-telesis.co.jp,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com, richard@nod.at
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 10 Jul 2018 16:51:13 +0200
Message-ID: <153123427324075@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a note to let you know that I've just added the patch titled

    mtd: cfi_cmdset_0002: Change definition naming to retry write operation

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-cfi_cmdset_0002-change-definition-naming-to-retry-write-operation.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 85a82e28b023de9b259a86824afbd6ba07bd6475 Mon Sep 17 00:00:00 2001
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Date: Wed, 30 May 2018 18:32:27 +0900
Subject: mtd: cfi_cmdset_0002: Change definition naming to retry write operation

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

commit 85a82e28b023de9b259a86824afbd6ba07bd6475 upstream.

The definition can be used for other program and erase operations also.
So change the naming to MAX_RETRIES from MAX_WORD_RETRIES.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/mtd/chips/cfi_cmdset_0002.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -42,7 +42,7 @@
 #define AMD_BOOTLOC_BUG
 #define FORCE_WORD_WRITE 0
 
-#define MAX_WORD_RETRIES 3
+#define MAX_RETRIES 3
 
 #define SST49LF004B	        0x0060
 #define SST49LF040B	        0x0050
@@ -1647,7 +1647,7 @@ static int __xipram do_write_oneword(str
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_WORD_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES)
 			goto retry;
 
 		ret = -EIO;
@@ -2106,7 +2106,7 @@ retry:
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_WORD_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES)
 			goto retry;
 
 		ret = -EIO;


Patches currently in stable-queue which might be from ikegami@allied-telesis.co.jp are

queue-4.14/mtd-cfi_cmdset_0002-change-erase-functions-to-retry-for-error.patch
queue-4.14/mtd-cfi_cmdset_0002-change-erase-functions-to-check-chip-good-only.patch
queue-4.14/mtd-cfi_cmdset_0002-change-definition-naming-to-retry-write-operation.patch
