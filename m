Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15pFeq-0006Yk-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2001 22:03:52 +0100
Message-ID: <20011004141252.A25182@recycle.lbl.gov>
Date: Thu, 4 Oct 2001 14:12:52 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: Russ Dill <Russ.Dill@asu.edu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: No clean _or_ dirty blocks to GC from!
References: <20011004093533.A25013@recycle.lbl.gov> <1002226435.27652.21.camel@russ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1002226435.27652.21.camel@russ>; from Russ Dill on Thu, Oct 04, 2001 at 01:13:54PM -0700
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

On Thu, Oct 04, 2001 at 01:13:54PM -0700, Russ Dill wrote:
> On Thu, 2001-10-04 at 09:35, Larry Doolittle wrote:
> > This is really strange.  I go through the following steps:
> > 
> > 0. Run linux-2.4.9-ac10-rmk2-np1 with latest CVS MTD/JFFS2 on a
                                     ^^^^^^^^^^^^^^^^^^^^^^^^^
> >    StrongARM with Intel 28F320B3B Flash.  /dev/mtd2 is a 1M partition.
> 
> there were some mismerges of mtd in 2.4.9-rmk2-np1 iirc, I had a problem
> of mount in checkroot.sh getting stuck in a D state. I would go to a
> newer kernel, or grab the latest mtd and put it in the kernel.

The linux-2.4.9-ac10-rmk2-np1 had its drivers/mtd, fs/jffs2, and
include/linux/mtd directories deleted, and replaced with those from CVS.
Finally, include/linux/jffs2*.h were copied over.  Is there something that
I could have mis-merged?  

Is there an obvious way to troubleshoot the mount process?  I have
a trace of the mount after giving a "echo 9 >/proc/sys/kernel/printk"
but it's kinda long.  Each block is correctly summarized, here are
the first two:
Block at 0x00000000: free 0x0000e540, dirty 0x00000000, used 0x00001ac0
Block at 0x00010000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
and of course 0x00020000 through 0x000f0000 are just like 0x00010000.

Oddly, that last run did _not_ give the "No clean _or_ dirty blocks to
GC from!" message.  printk levels 6 and 7 reproducibly give it, but
levels 8 and 9 do not.  printk levels 5 and lower are silent.  Is there
a thread synchronization issue, maybe?

     - Larry
