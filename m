Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ftpn5-0004cd-8V
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 18:50:02 +0100
Subject: Re: patch with header files not in mtd includes
From: Thomas Gleixner <tglx@linutronix.de>
To: Ben Dooks <ben-mtd@fluff.org>
In-Reply-To: <20060623172130.GA12107@home.fluff.org>
References: <20060623172130.GA12107@home.fluff.org>
Content-Type: text/plain
Date: Fri, 23 Jun 2006 19:51:34 +0200
Message-Id: <1151085094.25491.282.camel@localhost.localdomain>
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

On Fri, 2006-06-23 at 18:21 +0100, Ben Dooks wrote:
> I have udpates for the s3c2410 nand driver which
> includes register updates for the header file
> include/asm-arm/arch-s3c2410/regs-nand.h.
> 
> Is it ok to send this as one patch, or does it
> need the include splitting and sending to rmk?
> A seperate split will mean a possible small period
> when the driver will not build.

the file is nand / mtd related so, there should be no big cry when we
commit both into MTD.

	tglx
	
