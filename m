Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BPrVG-0001kz-QB
	for linux-mtd@lists.infradead.org; Tue, 18 May 2004 00:26:38 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: "lokesh kumar" <lokeshk@hotmail.com>,
 linux-mtd@lists.infradead.org
Date: Tue, 18 May 2004 01:21:16 +0200
References: <BAY1-F74G7Tyc1ZoHGt0001c7c9@hotmail.com>
In-Reply-To: <BAY1-F74G7Tyc1ZoHGt0001c7c9@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200405180121.16354.tglx@linutronix.de>
Subject: Re: jffs2 2.4.18 kernel problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 18 May 2004 01:20, lokesh kumar wrote:
> Hi,
> I have a jffs2 partition on my mpc8xx board, running 2.4.18 kernel. I am
> using mtd snapshot of july 2002. The mtd partition size is 2MB.
>
> I enabled the mtd options in kernel, and then built an image for this
> partition using
>
> mkfs.jffs2 -e 0x20000 -b -r rootdir -o img
>
> and then I copy this image over this partition using u-boot or debugger. I
> can then boot the board and mount this partition on a mount point. Then I
> can cd to this partition and create a directory and copy a file to this
> directory. Now, I turn the power off and when I reboot, I can mount the
> file system and can see that the directory and file exist, but when I say
> "rm -fr file" or "rm -fr directory", it crashes the kernel saying "kernel
> access of bad area"
>
> What am I doing wrong?

Not much. You just use an ancient kernel and a pre ancient version of mtd

=2D-=20
Thomas
________________________________________________________________________
Steve Ballmer quotes the statistic that IT pros spend 70 percent of their=20
time managing existing systems. That couldn=E2=80=99t have anything to do w=
ith=20
the fact that 99 percent of these systems run Windows, could it?
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
