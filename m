Received: from gateway.digitalview.com.hk
	([152.101.51.1] helo=janus.hk.panelx.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UNaM-0003hU-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2003 08:53:47 +0000
Message-ID: <001301c2b309$b85d8750$9000010a@paulwong>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <tglx@linutronix.de>,
	<linux-mtd@lists.infradead.org>
References: <000201c2b2fd$dc75c190$9000010a@paulwong> <200301030952.32096.tglx@linutronix.de>
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.
Date: Fri, 3 Jan 2003 17:22:36 +0800
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

Firstly, thanks Thomas,

Let me to explain my system: I separate three partitions of NAND flash
(16MB),
/dev/mtd0   for kernel image , use dd if=xxx.img of=/dev/mtd0
/dev/mtd1   for rootfs image , use dd if=roofts.img of=/dev/mtd1
/dev/mtd2   for jffs2 filesystem

Firstly, system decompress and run the compressed kernel image in mtd0, then
the kernel (kernel 2.4.20)will decompress the rootfs image in mtd1 to
ramdisk. ( I modified the do_mounts.c to do it). Finally, I success to boot
up and run normal. But, I see fill_inbuf() in do_mounts.c, it only use the
read(..) functon to get the content of the rootfs.img (/dev/mtd1), is it
care the bad block??

best regards,
Paul



----- Original Message -----
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Paul Wong" <paul.wong@digitalview.com>; <linux-mtd@lists.infradead.org>
Sent: Friday, January 03, 2003 4:52 PM
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.


> On Friday 03 January 2003 08:56, Paul Wong wrote:
> > Dear All,
> >
> >     I modified the init/do_mounts.c to want to skip the invalid block.
and
> > than make bzImage, that result say: undefined reference to 'ioctl'. What
is
> > the problem?
> ioctl is part of userspace library. You can not use glibc functions inside
the
> kernel.
>
> What's the deeper sense of  this modification ? Bad block handling is done
by
> the filesystem and the mtd drivers.
>
> --
> Thomas
> ____________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
>
