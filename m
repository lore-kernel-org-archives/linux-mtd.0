Received: from qmail1.ispname.net
	([64.19.9.36] helo=ispname.net ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 151rFH-0007wP-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2001 16:05:19 +0100
Message-ID: <B1F74F3AD483D2119F80004005A19948357F12@Server01.accelent.com>
From: Cliff Brake <cbrake@accelent.com>
To: linux-mtd@lists.infradead.org
Subject: erase timeout
Date: Mon, 21 May 2001 11:15:20 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Using Intel Strataflash, I occasionally get the following error during linux
boot usually when remounting a jffs2 filesystem as r/w:

"waiting for erase to complete timed out."

making the following change seems to fix the problem:

=================================================
--- cfi_cmdset_0001.c	Thu May 17 15:23:17 2001
+++ cfi_cmdset_0001_cliff.c	Mon May 21 11:01:07 2001
@@ -1021,7 +1021,7 @@
 			spin_unlock_bh(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ*2); /* FIXME */
+//			timeo = jiffies + (HZ*2); /* FIXME */
 			spin_lock_bh(chip->mutex);
 			continue;
 		}
=================================================

The Intel datasheet lists the block erase time maximum as 5sec and the
errata lists the maximum erase time as high as 25s for some parts.  Is the
above change correct?

Thanks,
Cliff
