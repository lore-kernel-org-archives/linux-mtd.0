Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D54qS-0005zE-3H
	for linux-mtd@lists.infradead.org; Sat, 26 Feb 2005 11:31:08 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Paolo Tagliavini <ptagliavini@flp-consultant.it>
In-Reply-To: <42209E97.2070201@flp-consultant.it>
References: <42209E97.2070201@flp-consultant.it>
Content-Type: text/plain
Date: Sat, 26 Feb 2005 17:30:56 +0100
Message-Id: <1109435457.31108.21.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: writing jffs2 file system trought JTAG
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-02-26 at 17:06 +0100, Paolo Tagliavini wrote:
> Dear all ,
> 
> I'm working on ARM920 based embedded system. Linux kernel is 2.4.20.
> This system mount a 64 Mbyte Samsung NAND flash.
> My simple questions are:
>     Is it  possible write in nand flash  the jffs2 image , made with 
> mkfs.jffs2 , using JTAG interface ?
>     Is there any way to handle nand bad block dowloadind jffs2 image 
> trought JTAG interface ?

Read

http://www.linux-mtd.infradead.org/tech/faq.html

The section "Must my bootloader be aware of NAND FLASH ?" has all the
answers. The requirements for JTAG programming are the same as for
bootloaders.

tglx
