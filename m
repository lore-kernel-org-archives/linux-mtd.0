Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fxeK-00041K-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 07:37:45 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H9R0095AX6238@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 04 Feb 2003 08:37:14 +0100 (MET)
Date: Tue, 04 Feb 2003 08:35:14 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3E3F31CC.7070701@laser5.co.jp>
To: Vishal <vishal@laser5.co.jp>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200302040835.14667.tglx@linutronix.de>
MIME-version: 1.0
References: <3E3E517F.9010908@laser5.co.jp>
 <200302032004.17611.tglx@linutronix.de> <3E3F31CC.7070701@laser5.co.jp>
Subject: Re: help: bootloader for loading kernel from mtdblock device on
 flash........
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
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

On Tuesday 04 February 2003 04:21, Vishal wrote:
> Its for an ARM7 core.
> I have the block driver for the JFFS on NAND Flash ready. I have the
> basic bootloader code. I was wondering whether i can do the proceed in
> the following way :
> 1. take the read/verify  code from the JFFS block driver for NAND flash,
> and put it in my bootloader code
> 2. The driver code that i copy will have a lot of kernel API calls...so
> i need to incorporate those also into my driver.
> 3. finally use this functionality achieved to read a kernel.bin file
> from the /dev/mtdblock device and load it.
>  or is there  any other workaroud?
Yep. copy your compressed kernel image in chunks of blocksize to your 
NAND-FLASH. Reserve enough spare in the case you have bad blocks. 
Provide a bad block aware read function and modify the decompressor in the 
kernel to read the image via this function from NAND. 
Then you don't need JFFS2 inside the bootloader. 
Then your NAND-CHIP has to have min. 2 Partitions 
1 for the kernel Image and 1 for the root-fs. You do not mount the partition, 
where your kernel image is stored.

Another way is to use YAFFS for your root-fs. YAFFS is NAND-aware too and 
provides bootloader code for booting the kernel from a YAFFS partition. Same 
procedure: 2 partitions (boot = YAFFS, root = JFFS2). You can mount your boot 
partition and update the kernel via normal fs access.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
