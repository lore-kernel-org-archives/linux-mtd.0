Received: from f203.pav1.hotmail.com ([64.4.31.203] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188C4Q-00019S-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Nov 2002 04:09:06 +0000
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: mtd2 partition mapping on mtd1?...
Date: Sun, 03 Nov 2002 04:38:46 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F203dutTzDnaax1ITXm000031dd@hotmail.com>
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

Jörn,

Thanks for replying.
Am using AM29LV320D(its a NOR right?) on 2.4.2 kernel for MPC857
provided by Montavista.
When the target was not able to locate root filesystem inspite of 1.adding 
mtd1 in init/main.c root_dev_names[],
2.burning rootfs binary at offset specified in mtd_partitions and 3.running 
rdev on kernel image specifying root device and its offset in ramdisk word,
had to hardcode in cramfs_read to return (flash_base_addr + rootfs_offset + 
offset). Only then the target was able to come up.
Now for cat of /dev/mtd2, its going to cramfs_read() - why?. Are my
steps for getting rootfs OK?. Any better way to tell the same?.

ls -l is giving...
crw-rw----    1 0        0         90,   0 Jan  1  1970 /dev/mtd0
# ls -l /dev/mtd1
crw-rw----    1 0        0         90,   2 Jan  1  1970 /dev/mtd1
# ls -l /dev/mtd2
crw-rw----    1 0        0         90,   4 Jan  1  1970 /dev/mtd2

Why am I seeing the devices(specially the cramfs partition on mtd1) as
rw?. How to check wether the flash is locked?.
>From commands below, looks like the two unlocks are executed, followed
by an unlock-bypass(is that needed after unlocks?). Also, after
running 'program' command why is the physmap_read32
(flash_base_addr_returned_by_ioremap) repeated for several minutes(3-4)?

> > (vijay) in physmap_write32(data=0xaa00aa, adr=0x1554)
> > (vijay) in physmap_write32(data=0x550055, adr=0xaa8)
> > (vijay) in physmap_write32(data=0x200020, adr=0x1554)
> > (vijay) in physmap_write32(data=0xa000a0, adr=0x0)
> > (vijay) in physmap_write32(data=0x28cd3d45, adr=0x400000)
> > (vijay) in physmap_read32(0xc3ba3000)

Regards,
Vijay

>From: Jörn Engel <joern@wohnheim.fh-wedel.de>
>To: vijay vijay <vijay_peshkar@hotmail.com>
>CC: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
>Subject: Re: mtd2 partition mapping on mtd1?...
>Date: Sat, 2 Nov 2002 21:02:37 +0100
>
>On Sat, 2 November 2002 09:52:47 +0000, vijay vijay wrote:
> > Have added 3 partitions in mtd. The root filesystem is cramfs type.
> > Since it was not being located by default, hardcoded cramfs_read
> > to return the rootfs addr. Now the target is coming up..Am getting
> > below results too...
> >
> > # cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 000c0000 00020000 "boot firmware + kernel"
> > mtd1: 00200000 00020000 "cramfs partition"
> > mtd2: 00100000 00020000 "test partition"
> >
> > # mount
> > /dev/root on / type cramfs (rw)
> > /proc on /proc type proc (rw)
> > ramfs on /var type ramfs (rw)
> >
> > Now, "cat /dev/mtd1" and "cat /dev/mtd2" are both fetching
> > same data. How's that?. A dd to /dev/mtd2 is going as..
>
>What do you get on "ls -l /dev/mtd?" ?
>I'd like to be sure what device we are dealing with.
>
> > # busybox dd if=mtd2fs.bin bs=94208 of=/dev/mtd2 count=1
> > MTD_open
> > MTD_write
> > vijay mtd_write (?=E
> > (vijay) in physmap_write32(data=0xaa00aa, adr=0x1554)
> > (vijay) in physmap_write32(data=0x550055, adr=0xaa8)
> > (vijay) in physmap_write32(data=0x200020, adr=0x1554)
> > (vijay) in physmap_write32(data=0xa000a0, adr=0x0)
> > (vijay) in physmap_write32(data=0x28cd3d45, adr=0x400000)
> > (vijay) in physmap_read32(0xc3ba3000)
> > (vijay) in physmap_read32(0xc3ba3000)
> > (vijay) in physmap_read32(0xc3ba3000)
> > (vijay) in physmap_read32(0xc3ba3000)
> > :
> > :
> > :
> > (vijay) in physmap_read32(0xc3ba3000)
> > (vijay) in physmap_read32(0xc3ba3000)
> > (vijay) in physmap_read32(0xc3ba3000)
> > Last[3] is d726c2a6, datum is 28cd3d45
> > (vijay) in physmap_write32(data=0xf000f0, adr=0x0)
> > (vijay) in physmap_write32(data=0x900090, adr=0x0)
> > (vijay) in physmap_write32(data=0x0, adr=0x0)
> > dd: /dev/mtd2: Input/output error
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > MTD_close
> >
> > On "cat /dev/mtd2", am still seeing old data(as on mtd1)?.
>
>This does not surprise me. Something went wrong on the write. Can you
>narrow the options down a little? Make sure that you don't have an
>-ro-device, check wether flash is locked, etc.
>
>The flash is nor, I suppose.
>
>Jörn
>
>--
>When in doubt, use brute force.
>-- Ken Thompson


_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963
