Received: from f117.pav1.hotmail.com ([64.4.31.117] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188eLH-0005hH-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2002 10:20:23 +0000
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wipro.com
Subject: Re: mtd2 partition mapping on mtd1?...
Date: Mon, 04 Nov 2002 10:50:05 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F1170uJLisx4Vy8zHiv0001806d@hotmail.com>
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

Stupid me. Was all along trying to write without erasing!!.
Now am able to write to desired partition after erasing the
same.

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
Unlimited Internet access for only $21.95/month.  Try MSN! 
http://resourcecenter.msn.com/access/plans/2monthsfree.asp
