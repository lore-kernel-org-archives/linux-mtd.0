Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6Cqr-0005YE-Qd
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2005 14:16:14 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: pgrayson@realmsys.com
In-Reply-To: <1109700711.5043.53.camel@pgrayson1.realmsys.com>
References: <1109643247.5043.26.camel@pgrayson1.realmsys.com>
	<1109645229.3805.11.camel@tglx.tec.linutronix.de>
	<1109700711.5043.53.camel@pgrayson1.realmsys.com>
Content-Type: text/plain
Date: Tue, 01 Mar 2005 20:16:10 +0100
Message-Id: <1109704571.8540.26.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can you really write a jffs2 image with nandwrite?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-03-01 at 11:11 -0700, Peter Grayson wrote:
> > nandwrite does not expect oob data for jffs2 images.
> 
> But it appears nandwrite can accept oob data. It does have the --oob
> option and when this option is set nandwrite reads the oob data from the
> image and does an ioctl() to the mtd character device to write it.

Yes it can, but JFFS2 images contain no oob data

> With mkfs.jffs2, I had some confusion about the pagesize option. I was
> thinking that it corresponded to the NAND pagesize, but that is not
> correct, it sets the jffs2 filesystem page size.

Oops, missed that one.

> With nandwrite, the -j option causes things to not work. This was a
> great stumbling block for me. It proved to be critical to _not_ use the
> -j (or -o) option with nandwrite. This is in direct conflict with
> instructions in the FAQ.

Could you please correct the FAQ and add the steps you took and send a
patch ?

tglx
