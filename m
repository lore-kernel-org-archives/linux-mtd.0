Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UuVP-000789-00
	for <linux-mtd@lists.infradead.org>; Sat, 04 Jan 2003 20:02:51 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8700JJ7IF8CR@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 04 Jan 2003 21:33:09 +0100 (MET)
Date: Sat, 04 Jan 2003 21:32:18 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.
In-reply-to: <001301c2b309$b85d8750$9000010a@paulwong>
To: Paul Wong <paul.wong@digitalview.com>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301042132.18179.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=big5
Content-transfer-encoding: 7BIT
References: <000201c2b2fd$dc75c190$9000010a@paulwong>
 <200301030952.32096.tglx@linutronix.de>
 <001301c2b309$b85d8750$9000010a@paulwong>
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

On Friday 03 January 2003 10:22, Paul Wong wrote:
> Firstly, thanks Thomas,
>
> Let me to explain my system: I separate three partitions of NAND flash
> (16MB),
> /dev/mtd0   for kernel image , use dd if=xxx.img of=/dev/mtd0
This works only, if you have no bad blocks in your mtd0 partition

> /dev/mtd1   for rootfs image , use dd if=roofts.img of=/dev/mtd1
Same as above

> /dev/mtd2   for jffs2 filesystem

Where do you boot from ? I assume NOR-FLASH. Do you have a bootloader there ?
You should modify your bootloader to program the kernel image either to the 
NOR-FLASH itself or to the NAND-FLASH with respect to possible bad blocks . 
Then your bootloader should load the kernel image from NAND bad block aware 
to RAM for decrompression or you decompress from your NOR-FLASH.
There is no need to have a compressed rootfs. You can also put your root fs on 
JFFS2, which has compression too. This will save you RAM-space. Also for this 
image you need your NAND and bad block aware bootloader utility to program 
the image to the NAND chip.

> Firstly, system decompress and run the compressed kernel image in mtd0,
> then the kernel (kernel 2.4.20)will decompress the rootfs image in mtd1 to
> ramdisk. ( I modified the do_mounts.c to do it). Finally, I success to boot
> up and run normal. But, I see fill_inbuf() in do_mounts.c, it only use the
> read(..) functon to get the content of the rootfs.img (/dev/mtd1), is it
> care the bad block??
No

--
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
