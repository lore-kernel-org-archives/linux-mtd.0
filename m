Received: from h-67-102-66-132.snfccasy.covad.net ([67.102.66.132]
	helo=hheld.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwkXd-0003XK-0U
	for linux-mtd@lists.infradead.org; Sat, 01 Jul 2006 14:50:16 -0400
Received: from [206.15.76.194] (HELO RudiDell)
	by hheld.com (CommuniGate Pro SMTP 4.3.7)
	with ESMTPS id 788870 for linux-mtd@lists.infradead.org;
	Sat, 01 Jul 2006 11:19:44 -0700
From: "David Byron" <dbyron@hheld.com>
To: <linux-mtd@lists.infradead.org>
Subject: initializing chip->wq in cfi_cmdset_0002.c
Date: Sat, 1 Jul 2006 11:18:02 -0700
Message-ID: <001101c69d3a$b12f2a00$6534800a@RudiDell>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Reply-To: dbyron@hheld.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using cfi_cmdset_0002.c to access a flash chip and I ran into an oops
from trying to dereference a null pointer.  I found a fix for it, but I feel
like there must be something I don't understand.  Seems like other folks
would have run into this as well.

The crash comes with the call to wake_up(&chip->wq) on the last line of
put_chip.  I can't see anywhere that this data structure is initialized.  I
looked at some of the other cfi_cmdset* files and decided that

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9885726..8a390b3 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -320,6 +320,7 @@ #endif
 		cfi->chips[i].word_write_time =
1<<cfi->cfiq->WordWriteTimeoutTyp;
 		cfi->chips[i].buffer_write_time =
1<<cfi->cfiq->BufWriteTimeoutTyp;
 		cfi->chips[i].erase_time =
1<<cfi->cfiq->BlockEraseTimeoutTyp;
+		init_waitqueue_head(&cfi->chips[i].wq);
 	}
 
 	map->fldrv = &cfi_amdstd_chipdrv;

was a good place to initialize.  It fixes the oops for me.  Can someone
confirm that this makes sense?

Thanks much.

-DB
