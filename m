Received: from gateway.digitalview.com.hk
	([152.101.51.1] helo=janus.hk.panelx.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VCdh-0002Si-00
	for <linux-mtd@lists.infradead.org>; Sun, 05 Jan 2003 15:24:38 +0000
Message-ID: <001801c2b4d3$1571e4c0$b200a8c0@home>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <tglx@linutronix.de>,
	<linux-mtd@lists.infradead.org>
References: <000201c2b2fd$dc75c190$9000010a@paulwong> <200301042132.18179.tglx@linutronix.de> <001f01c2b497$70a88970$c200a8c0@mobile> <200301051037.03860.tglx@linutronix.de>
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.
Date: Sun, 5 Jan 2003 23:56:56 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
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

Really! this is a good new. I will try this method when I back to office.
Thanks a lots.

Paul

----- Original Message -----
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Paul Wong" <paul.wong@digitalview.com>; <linux-mtd@lists.infradead.org>
Sent: Sunday, January 05, 2003 5:37 PM
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.


> On Sunday 05 January 2003 09:49, Paul Wong wrote:
> >
> > Yes, I modifed the bootloader (in NOR-Flash) that can load kernel image
in
> > /dev/mtd0 (NAND flash) and bad block handling.  and I also tried the
rootfs
> > in JFFS2, but the customer do not shutdown the system by keyboard, just
> > directly power off the unit. then the JFFS2 may be corrupted and cannot
> > boot up again. The ramdisk is a good solution for this case.   So, I
want
> > to modify the do_mounts.c to check the bad block to load the rootfs
image
> > to ramdisk.
> JFFS2 can handle a direct power down. The only way you can loose data, is
if
> you are writing to a file exactly in the moment, when you power down. This
> does not lead to a fs corruption. JFFS2 can handle this.
>
> --
> Thomas
> ________________________________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
>
>
>
