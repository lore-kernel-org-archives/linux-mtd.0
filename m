Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15pZ74-0008Dg-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Oct 2001 18:50:18 +0100
Message-ID: <20011005105919.A28963@recycle.lbl.gov>
Date: Fri, 5 Oct 2001 10:59:19 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: No clean _or_ dirty blocks to GC from!
References: <20011004160202.A25776@recycle.lbl.gov> <20011004093533.A25013@recycle.lbl.gov> <1002226435.27652.21.camel@russ> <20011004160202.A25776@recycle.lbl.gov> <15283.1002287554@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <15283.1002287554@redhat.com>; from David Woodhouse on Fri, Oct 05, 2001 at 02:12:34PM +0100
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

> > 3. Don't trigger the GC on mount unless there is something to do. 
> 
> The first thing the thread does on mount is sleep anyway. I'm not sure why 
> it's getting woken.

It doesn't exactly get woken, it just has insomnia.  :-)
This one-liner "fixes" it for me.

      - Larry

--- background.c.orig	Fri Oct  5 10:56:36 2001
+++ background.c	Fri Oct  5 10:56:50 2001
@@ -118,6 +118,7 @@
 		if (!thread_should_wake(c)) {
                         set_current_state (TASK_INTERRUPTIBLE);
 			D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread sleeping...\n"));
+			schedule();
 		}
                 
 		if (current->need_resched)
