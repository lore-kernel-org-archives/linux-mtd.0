Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18J8fw-0004uH-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2002 08:45:04 +0000
Date: Tue, 3 Dec 2002 10:15:28 +0100 (CET)
From: Marius Groeger <mag@sysgo.de>
To: Srinivasu.Vaduguri@nokia.com
cc: Thomas Gleixner <tglx@linutronix.de>, <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 - ECC errors with NAND flash
In-Reply-To: <200212021745.46279.tglx@linutronix.de>
Message-ID: <Pine.LNX.4.40.0212031012210.1609-100000@mag.devdep.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 2 Dec 2002, Thomas Gleixner wrote:

> On Monday 02 December 2002 17:00, Srinivasu.Vaduguri@nokia.com wrote:
> > Hi,
> >
> > I am trying to mount JFFS2 on MTD driver which uses NAND flash. I am using
> > the latest MTD snapshot (mtd-snapshot-20020731.tar.bz2).
> Please use latest code in CVS. There were too mauch changes since then.

Definitely follow Thomas's advice. In case you can't access the CVS
repository directly because of a firewall, nightly snapshots can be
found here:

ftp://ftp2.linux.org.uk:/pub/linux/mtd/cvs/

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions AG       mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
