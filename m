Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsL9n-00053l-N2
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 15:55:20 +0100
Subject: Re: NAND problems with at91 kernels
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <4496A162.5080305@epico.si>
References: <4496A162.5080305@epico.si>
Content-Type: text/plain
Date: Mon, 19 Jun 2006 16:55:48 +0200
Message-Id: <1150728949.29299.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-06-19 at 15:06 +0200, Savin Zlobec wrote:
> Hi all,
> 
> I'am running kernel 2.6.17 on AT91RM9200 board with Samsung 32MiB NAND.
> I've been experiencing a lot of NAND flash errors (running JFFS2 or 
> YAFFS)  which
> traced down to busy delay handling. Asking on linux-arm-kernel list I've 
> got a link to
> this message thread:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2005-September/013625.html
> 
> I've patched nand_base:nand_read_oob with the patch attached to the 
> above mail and
> it seems to solve my problems - I'am going to run some test for the next 
> couple of days
> just to be shure.
> 
> Is there any reason why this patch was not accepted and more importantly 
> can I expect
> more delay related problems which apperantly show only on some platforms.

I probably missed that patch and nobody yelled loud enough. :)

I looked at the code in question and I think this is actually a problem
for FLASH chips which have the "autoincrement" feature. So after reading
one chunk, it leaves the chip in the autoread mode. Can you please check
if this still happens with the current mtd-git code ? 

You need update the at91 nand code to the recent changes and when you
are at it you might resubmit the patch to MTD mailinglist so we can
include it into the official tree.

Thanks,

	tglx
