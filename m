Received: from gateway.digitalview.com.hk
	([152.101.51.1] helo=janus.hk.panelx.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18V61Z-0001fk-00
	for <linux-mtd@lists.infradead.org>; Sun, 05 Jan 2003 08:20:49 +0000
Message-ID: <001f01c2b497$70a88970$c200a8c0@mobile>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <tglx@linutronix.de>,
	<linux-mtd@lists.infradead.org>
References: <000201c2b2fd$dc75c190$9000010a@paulwong> <200301030952.32096.tglx@linutronix.de> <001301c2b309$b85d8750$9000010a@paulwong> <200301042132.18179.tglx@linutronix.de>
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.
Date: Sun, 5 Jan 2003 16:49:58 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
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

----- Original Message -----
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Paul Wong" <paul.wong@digitalview.com>; <linux-mtd@lists.infradead.org>
Sent: Sunday, January 05, 2003 4:32 AM
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.


> On Friday 03 January 2003 10:22, Paul Wong wrote:
> > Firstly, thanks Thomas,
> >
> > Let me to explain my system: I separate three partitions of NAND flash
> > (16MB),
> > /dev/mtd0   for kernel image , use dd if=xxx.img of=/dev/mtd0
> This works only, if you have no bad blocks in your mtd0 partition
>
> > /dev/mtd1   for rootfs image , use dd if=roofts.img of=/dev/mtd1
> Same as above
>
> > /dev/mtd2   for jffs2 filesystem
>
> Where do you boot from ? I assume NOR-FLASH. Do you have a bootloader
there ?
> You should modify your bootloader to program the kernel image either to
the
> NOR-FLASH itself or to the NAND-FLASH with respect to possible bad blocks
.
> Then your bootloader should load the kernel image from NAND bad block
aware
> to RAM for decrompression or you decompress from your NOR-FLASH.
> There is no need to have a compressed rootfs. You can also put your root
fs on
> JFFS2, which has compression too. This will save you RAM-space. Also for
this
> image you need your NAND and bad block aware bootloader utility to program
> the image to the NAND chip.

Yes, I modifed the bootloader (in NOR-Flash) that can load kernel image in
/dev/mtd0 (NAND flash) and bad block handling.  and I also tried the rootfs
in JFFS2, but the customer do not shutdown the system by keyboard, just
directly power off the unit. then the JFFS2 may be corrupted and cannot boot
up again. The ramdisk is a good solution for this case.   So, I want to
modify the do_mounts.c to check the bad block to load the rootfs image to
ramdisk.


>
> > Firstly, system decompress and run the compressed kernel image in mtd0,
> > then the kernel (kernel 2.4.20)will decompress the rootfs image in mtd1
to
> > ramdisk. ( I modified the do_mounts.c to do it). Finally, I success to
boot
> > up and run normal. But, I see fill_inbuf() in do_mounts.c, it only use
the
> > read(..) functon to get the content of the rootfs.img (/dev/mtd1), is it
> > care the bad block??
> No
>
> --
> Thomas
> ________________________________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
>
>
