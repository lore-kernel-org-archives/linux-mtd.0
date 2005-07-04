Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DpTif-0002l4-NL
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2005 12:22:57 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: coywolf@lovecn.org
In-Reply-To: <2cd57c90050704091420198987@mail.gmail.com>
References: <1118327333.2401.42.camel@playin.mvista.com>
	<2cd57c90050704091420198987@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 04 Jul 2005 18:25:41 +0200
Message-Id: <1120494341.18862.100.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, Paolo Galtieri <pgaltieri@mvista.com>,
	linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: patch to create sysfs char device nodes
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-07-05 at 00:14 +0800, Coywolf Qi Hunt wrote:
> On 6/9/05, Paolo Galtieri <pgaltieri@mvista.com> wrote:
> > Hi,
> >   with DEVFS going away I discovered that no character device nodes are
> > created if a flash device is present which contains filesystems. The
> > mtd-utils package requires the existence of character device nodes for
> > performing erase, lock and unlock functions.  The problem is that the
> > flash device driver has not been modified to use sysfs instead of devfs.
> > 
> > I have attached a patch to mtdchar.c which uses the sysfs interface to
> > create the appropriate nodes.  Please let me know if you have comments.
> 
> I encountered the same problem days ago. Thanks for the patch. A patch
> based on yours will be sent in the next mail.

A reworked patch is in the MTD CVS and in the mtd-git tree already. No
need to send something

tglx
