Received: from ms-smtp-01.nyroc.rr.com ([24.92.226.148])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19E8CL-0003qU-7N
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 14:46:05 +0100
From: "Dave Ellis" <dge@sixnetio.com>
To: "'Hans_Peter Urbanek'" <Hans-Peter.Urbanek.extern@icn.siemens.de>
Date: Fri, 9 May 2003 09:46:04 -0400
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E4EE@NT>
MIME-Version: 1.0
In-Reply-To: <3EBB9EDF.A1DE0AE9@icn.siemens.de>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
cc: Linux-MTD <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 and kupdated
Reply-To: dge@sixnetio.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-05-09 at 13:28, Hans_Peter Urbanek wrote:
> In order not to wait up to five seconds for `kupdated' to become
> active again, I made a change in `jffs2_do_reserve_space'
> fs/jffs2/nodemgmt.c that wakes `kupdated' immediately ...

I am using the patch below for this problem. I have both
RAM and NAND FLASH using JFFS2, and I don't want kupdated
flushing the NAND write cache too often, so I do the
erase immediately instead of waking kupdated.

I only do the immediate erase for RAM devices so that any
clever scheduling for the FLASH devices still works.

A RAM erase is unlikely to schedule() or fail, but I kept
the code to unlock the erase_completion_lock and return
-EAGAIN just in case. It seemed safer to work as much like
the original code as possible.

Dave Ellis

diff -Naur old/nodemgmt.c new/nodemgmt.c
--- nodemgmt.c.orig	Fri May  9 09:16:48 2003
+++ nodemgmt.c	Fri May  9 09:13:00 2003
@@ -240,6 +240,22 @@
 			   us. We do them ourselves right now. */
 			jffs2_erase_pending_blocks(c);
 #else
+
+			/* It is possible to write to a RAM based device
+			 * so quickly that letting kupdate do the
erasing
+			 * (every 5 seconds by default) can cause _LONG_
+			 * delays here. Instead do the erase right here.
+			 */
+			if (c->mtd->type == MTD_RAM) {
+
spin_unlock_bh(&c->erase_completion_lock);
+				jffs2_erase_pending_blocks(c);
+				spin_lock_bh(&c->erase_completion_lock);
+				/* An erase may have failed, decreasing
the
+				   amount of free space available. So we
must
+				   restart from the beginning */
+				return -EAGAIN;
+			}
+
 			set_current_state(TASK_INTERRUPTIBLE);
 			add_wait_queue(&c->erase_wait, &wait);
 			D1(printk(KERN_DEBUG "Waiting for erases to
complete. erasing_blocks is %d. (erasableempty: %s, erasingempty: %s,
erasependingempty: %s)\n", 
