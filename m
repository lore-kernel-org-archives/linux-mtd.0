Received: from bay110-f16.bay110.hotmail.com ([65.54.229.26] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsOnW-000329-IJ
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 14:48:38 -0400
Message-ID: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
In-Reply-To: <1150357994.5257.481.camel@localhost.localdomain>
From: "Han Chang" <posaune@hotmail.com>
To: tglx@linutronix.de
Subject: Re: FAT vs jFFS2 for NAND.
Date: Mon, 19 Jun 2006 11:31:02 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Cc: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks! The reason for using FAT on the NAND is when the device has the NAND 
is connected to a PC via USB, it can appear to be storage device read by the 
PC user directly.

Could you provide more details on how to get this SmartMedia Format driver?

Anyone know any other source base which I can leverage to do the job?

Thanks,
Han


>From: Thomas Gleixner <tglx@linutronix.de>
>Reply-To: tglx@linutronix.de
>To: Han Chang <posaune@hotmail.com>
>CC: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
>Subject: Re: FAT vs jFFS2 for NAND.
>Date: Thu, 15 Jun 2006 09:53:13 +0200
>
>On Wed, 2006-06-14 at 17:34 -0700, Han Chang wrote:
> > Thanks for the information. Now I started to make FAT work on NAND.
> > "mkdosfs" uses ioctl to check if the device is a floppy disk or hard 
>disk,
> > but NAND is neither of these, so it fails. Is there any way to get 
>around
> > this?
>
>The only way which would make sense to a certain degree is to resurrect
>the SmartMedia Format driver, which bitrots in the old MTD CVS. It is
>designed to allow FAT on NAND FLASH, but I have no idea whats the
>current status of that code is.
>
> > Should I do fdisk on the NAND device, if I can already create partition 
>in
> > the driver initiation?
>
>A parition does not transform NAND into a block device. You need to use
>the block device driver of MTD. Be warned that you will wear out your
>FLASH in foreseable time and data loss on powerfail is guaranteed by
>design.
>
>Is there any real good reason why you want to use FAT on a FLASH?
>
>	tglx
>
>
