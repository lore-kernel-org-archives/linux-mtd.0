Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g0VR-0004nr-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 10:40:45 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H9S007KO5N22N@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 04 Feb 2003 11:40:15 +0100 (MET)
Date: Tue, 04 Feb 2003 11:38:13 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3E3F8853.708@laser5.co.jp>
To: Vishal <vishal@laser5.co.jp>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200302041138.14013.tglx@linutronix.de>
MIME-version: 1.0
References: <3E3E517F.9010908@laser5.co.jp>
 <200302040835.14667.tglx@linutronix.de> <3E3F8853.708@laser5.co.jp>
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

On Tuesday 04 February 2003 10:30, Vishal wrote:
> >Yep. copy your compressed kernel image in chunks of blocksize to your
> >NAND-FLASH. Reserve enough spare in the case you have bad blocks.
> >Provide a bad block aware read function and modify the decompressor in the
> >kernel to read the image via this function from NAND.
> >Then you don't need JFFS2 inside the bootloader.
> >Then your NAND-CHIP has to have min. 2 Partitions
> >1 for the kernel Image and 1 for the root-fs. You do not mount the
> > partition, where your kernel image is stored.
>
> hmm....correct me if i am wrong but what you are saying is i have a char
> device /dev/mtd1 (right??) on which i store the kernel image. this
> partition will never be mounted. The kernel image is stored on this
> device in chunks of blocksize.
>    Now while reading from this device on bootup, i read from the char
> device, and generate blocks of the known size in memory, carry out error
> checking and correction on each block. and when the whole of the kernel
> has been read, i run it...right?
> Pardon me if i am wrong.
You don't need to implement a character device. Implement raw NAND access with 
ECC and bad block handling (just skip a bad block, when you program your 
image) in your bootloader. So you can program your kernel image in chunks of 
blocksize into the NAND chip. On boot you provide a small function, which can 
read the kernel image out of the nand-flash. You can do this by copying the 
hole image to RAM and then start the kernel, or load just the decompressor 
portion of the kernel image and modify the decompressor code, so it can read 
the chunks from your NAND-chip.

I'm not sure, why you want to do all this, if there is an out of the box 
solution in YAFFS ? 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
