Received: from everest.sosdg.org ([66.93.203.161] helo=mail.sosdg.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DpUcd-00032B-8c
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2005 13:20:46 -0400
Date: Mon, 4 Jul 2005 12:15:28 -0500
From: Coywolf Qi Hunt <coywolf@sosdg.org>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20050704171528.GA18442@everest.sosdg.org>
References: <1118327333.2401.42.camel@playin.mvista.com>
	<2cd57c90050704091420198987@mail.gmail.com>
	<1120494341.18862.100.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1120494341.18862.100.camel@tglx.tec.linutronix.de>
Sender: Coywolf Qi Hunt <coywolf@mail.sosdg.org>
Cc: linux-mtd@lists.infradead.org, Paolo Galtieri <pgaltieri@mvista.com>,
	coywolf@lovecn.org
Subject: Re: patch to create sysfs char device nodes
Reply-To: coywolf@lovecn.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 04, 2005 at 06:25:41PM +0200, Thomas Gleixner wrote:
> On Tue, 2005-07-05 at 00:14 +0800, Coywolf Qi Hunt wrote:
> > On 6/9/05, Paolo Galtieri <pgaltieri@mvista.com> wrote:
> > > Hi,
> > >   with DEVFS going away I discovered that no character device nodes are
> > > created if a flash device is present which contains filesystems. The
> > > mtd-utils package requires the existence of character device nodes for
> > > performing erase, lock and unlock functions.  The problem is that the
> > > flash device driver has not been modified to use sysfs instead of devfs.
> > > 
> > > I have attached a patch to mtdchar.c which uses the sysfs interface to
> > > create the appropriate nodes.  Please let me know if you have comments.
> > 
> > I encountered the same problem days ago. Thanks for the patch. A patch
> > based on yours will be sent in the next mail.
> 
> A reworked patch is in the MTD CVS and in the mtd-git tree already. No
> need to send something
> 
> tglx
> 


Basically the git diff is what I was trying to do. plus


Index: mtd/drivers/mtd/mtdchar.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdchar.c,v
retrieving revision 1.72
diff -p -u -r1.72 mtdchar.c
--- mtd/drivers/mtd/mtdchar.c	30 Jun 2005 00:23:24 -0000	1.72
+++ mtd/drivers/mtd/mtdchar.c	4 Jul 2005 17:08:14 -0000
@@ -649,7 +649,7 @@ static int __init init_mtdchar(void)
 	if (IS_ERR(mtd_class)) {
 		printk(KERN_ERR "Error creating mtd class.\n");
 		unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
-		return 1;
+		return PTR_ERR(mtd_class);
 	}
 
 	register_mtd_user(&notifier);
