Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqsTz-0006rf-VK
	for linux-mtd@lists.infradead.org; Thu, 15 Jun 2006 15:06:04 +0100
Subject: Re: FAT vs jFFS2 for NAND.
From: Thomas Gleixner <tglx@linutronix.de>
To: Han Chang <posaune@hotmail.com>
In-Reply-To: <BAY110-F252049B6BCEE0BB50A7CC3BC820@phx.gbl>
References: <BAY110-F252049B6BCEE0BB50A7CC3BC820@phx.gbl>
Content-Type: text/plain
Date: Thu, 15 Jun 2006 09:53:13 +0200
Message-Id: <1150357994.5257.481.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-14 at 17:34 -0700, Han Chang wrote:
> Thanks for the information. Now I started to make FAT work on NAND. 
> "mkdosfs" uses ioctl to check if the device is a floppy disk or hard disk, 
> but NAND is neither of these, so it fails. Is there any way to get around 
> this?

The only way which would make sense to a certain degree is to resurrect
the SmartMedia Format driver, which bitrots in the old MTD CVS. It is
designed to allow FAT on NAND FLASH, but I have no idea whats the
current status of that code is.

> Should I do fdisk on the NAND device, if I can already create partition in 
> the driver initiation?

A parition does not transform NAND into a block device. You need to use
the block device driver of MTD. Be warned that you will wear out your
FLASH in foreseable time and data loss on powerfail is guaranteed by
design.

Is there any real good reason why you want to use FAT on a FLASH? 

	tglx
