Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xOs5-00020R-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 08:59:00 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14x1oW-0001wd-00
	for linux-mtd@lists.infradead.org; Tue, 08 May 2001 08:21:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01050718392500.02834@dbm.wireless.net> 
References: <01050718392500.02834@dbm.wireless.net> 
To: Devin Butterfield <dbutter@wireless.net>
Cc: ipaq@handhelds.org, linux-mtd@lists.infradead.org
Subject: Re: [iPAQ] Sleep/resume problems, etc. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 08 May 2001 08:20:52 +0100
Message-ID: <3428.989306452@redhat.com>
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

dbutter@wireless.net said:
>  The other more serious problem (which seems to only be related to
> resuming  from deep sleep) is that the entire OS seems to become
> unresponsive  (processes will not run) after a resume and I'll see
> these messages on the  console:

> waiting for chip to be ready timed out in read. WSM status = e0021985
> Error reading node from 0x0030fa84: -5

The power cycle has reset the flash chip into read mode. The driver still 
thinks it's in status mode.

The chip driver's resume function needs to make sure the chip is in a known 
state, rather than assuming it'll still be in the same state it was before 
the sleep.

I'm sure I'd done this before. 

diff -u -r1.72 cfi_cmdset_0001.c
--- cfi_cmdset_0001.c	2001/03/26 13:51:15	1.72
+++ cfi_cmdset_0001.c	2001/05/08 07:19:12
@@ -1582,7 +1582,9 @@
 		spin_lock_bh(chip->mutex);
 		
 		if (chip->state == FL_PM_SUSPENDED) {
-			chip->state = chip->oldstate;
+			/* We need to force it back to a known state. */
+			cfi_write(map, CMD(0xff), cmd_addr);
+			chip->state = FL_READY;
 			wake_up(&chip->wq);
 		}
 


--
dwmw2
