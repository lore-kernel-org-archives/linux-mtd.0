Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FbU30-00020j-NN
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 22:58:38 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IYQ004NV09ICP40@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 03 May 2006 22:58:30 -0400 (EDT)
Date: Wed, 03 May 2006 22:58:29 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
To: Dan Merillat <harik.attar@gmail.com>
Message-id: <Pine.LNX.4.64.0605032257120.28543@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI Extended (Intel P30) problems on an ARM PXA255
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 3 May 2006, Dan Merillat wrote:

> I originally sent this to the linux-arm list, but it's looking more
> and more like either a MTD issue, or a hardware issue with our board.
> 
> We have a custom PXA255 board, based on the generic Intel reference
> design.  Nothing very
> complex at all.   RAM, Strataflash (P30), JTAG and a serial port is
> all I have active at this point.
> 
> Everything works correctly, until I try to write to the filesystem. As soon as
> I do, I start getting JFFS corruption notices.  It's fairly
> obvious what's wrong: All reads are returning 0x0080, the 'Ok' status
> bit.   I can break in the jtag, write a reset to the flash, and
> continue, and new reads work properly, until I write again (or the
> original write retries).
> 
> I thought it might be a memory timing issue, but I pulled the timing
> register (MSC0) and applied the faster timings to u-boot, and it can
> still read and write the flash properly.    System speed and memory
> speed are also the same (200mhz/100mhz) for both u-boot and linux.
> 
> I started from the gumstix.org tree, so I'm currently using their
> static-partitions patch until I can patch something better in.  It
> only touches the maps/ directory to create their MTD partition info.
> 
> trimmed dmesg:
> 
> ....
> 
> Write error in obliterating obsoleted node at 0x00102318: -30

-30 is -EROFS.

Did you unlock the flash sectors before mounting JFFS2?


Nicolas
