Received: from mail02.syd.optusnet.com.au ([211.29.132.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRIR-0001bR-8v
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:02:35 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: michael <trimarchi@gandalf.sssup.it>
In-Reply-To: <483668B6.3080507@gandalf.sssup.it>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
	<483668B6.3080507@gandalf.sssup.it>
Content-Type: text/plain
Date: Fri, 23 May 2008 17:02:22 +1000
Message-Id: <1211526142.6203.24.camel@torchwood>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michael,

On Fri, 2008-05-23 at 08:48 +0200, michael wrote:
> How do you create the jffs2 image. Which parameters use with the
> mtd-utils?

I was using the one supplied from
ftp://www.linux4sam.org/pub/oe/deploy/glibc/images/at91sam9263ek/Angstrom-x11-image-demo-glibc.rootfs.jffs2

I built the Angstrom minimal system and tried the resulting jffs2 file
system from that too.  Same problem.

I did try mkfs.jffs2 on the root file system produced in the Angstrom
minimal system build, but the result was the same.  I don't recall the
precise command line args I used now.

> Did you try to start from a ramdisk, erase all, and mount it?

At the moment I've got a USB stick as root, with an ext3 fs on it, and
noatime/nodiratime options.  At one stage I did erase the whole thing
and mount -tjffs2 /dev/mtdblock0 /mnt, writing and reading files died
there soon too.

> I'm using an at91san9260 board without any problems.

What kernel, patches and tool chain are you using?

Regards,
James.
