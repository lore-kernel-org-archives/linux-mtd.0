Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp9wr-0007t4-Cy
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 14:11:42 -0400
Date: Mon, 26 Jul 2004 19:11:34 +0100
From: Ben Dooks <ben-=mtd@fluff.org>
To: Ben Dooks <ben-mtd@fluff.org>
Message-ID: <20040726181134.GF7414@home.fluff.org>
References: <20040726145639.GE7414@home.fluff.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20040726145639.GE7414@home.fluff.org>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Suspend on 2.6.7-rc1 with mtd-snapshot-20040718
Reply-To: Ben Dooks <ben@fluff.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2004 at 03:56:39PM +0100, Ben Dooks wrote:
> I have a 2.6.7-rc2 kernel (PXA255) with a newish mtd
> snapshot applied, and I have a problem with suspend-to-ram
> with the mtdblockd and ntfld not going to sleep, and causing
> the suspend to fail.
> 
> The kernel outputs the following:
> 
> stopping tasks failed (1 tasks remaining)
> Restarting tasks...<6> Strange, mtdblockd not stopped
> 
> I guess mtdblockd isn't going to sleep when
> requested, and is therefore causing the power
> management to abort. Is there a fix in the newer
> releases, or do I need to investiage this problem
> further?

I added the attached patch, and at least the system
can now suspend and resume, but is this the right
solution?

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="blkdev.patch"

Index: drivers/mtd/mtd_blkdevs.c
===================================================================
RCS file: /var/lib/cvs/linux-2.6/kernel/drivers/mtd/mtd_blkdevs.c,v
retrieving revision 1.2
diff -u -r1.2 mtd_blkdevs.c
--- drivers/mtd/mtd_blkdevs.c	19 Jul 2004 16:23:59 -0000	1.2
+++ drivers/mtd/mtd_blkdevs.c	26 Jul 2004 18:10:05 -0000
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/suspend.h>
 #include <linux/list.h>
 #include <linux/fs.h>
 #include <linux/mtd/blktrans.h>
@@ -111,6 +112,12 @@
 			spin_unlock_irq(rq->queue_lock);
 
 			schedule();
+
+			if (current->flags & PF_FREEZE) {
+				printk(KERN_DEBUG "mtdblockd: sleeping\n");
+				refrigerator(0);
+			}
+
 			remove_wait_queue(&tr->blkcore_priv->thread_wq, &wait);
 
 			spin_lock_irq(rq->queue_lock);

--EeQfGwPcQSOJBaQU--
