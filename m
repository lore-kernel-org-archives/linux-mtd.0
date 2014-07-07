Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X44cz-0006H4-6Z
 for linux-mtd@lists.infradead.org; Mon, 07 Jul 2014 08:50:25 +0000
Received: by mail-la0-f52.google.com with SMTP id ty20so2563549lab.25
 for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2014 01:50:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140705223502.GA4083@norris-Latitude-E6410>
References: <CANdawSFXV7irURe37uejLd+WUSyMEJirsYam9mxrozvQPR2i0g@mail.gmail.com>
 <20140705223502.GA4083@norris-Latitude-E6410>
Date: Mon, 7 Jul 2014 10:50:01 +0200
Message-ID: <CANdawSGoHk+x=2NtV0jT2Wm857y3X-TusXy3hM0mTo7dEBK1=w@mail.gmail.com>
Subject: Re: MTD traces on operation with filesystem
From: Joaquim Duran <jduran.gm@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently we're using yaffs. In the kernel parameters we specify the
rootfs using the mtdblockX device name.

rootfs on / type rootfs (rw)
/dev/root on / type yaffs2 (rw,relatime)

[ 0.000000] Kernel command line: console=ttyO0,115200n8 display=p2
mtdparts=omap2-nand.0:512k(x-loader),1664k(u-boot),384k(u-boot-env),4m(kernel),60m(ramdisk),-(fs)
root=/dev/mtdblock5 rw rootfstype=yaffs2

Currently, we've enabled traces to yaffs, to know if it is performing
operations (read/write/delete) on the file system. However, we will
take into account that we could add traces to mtd/nand/nand_base.c or
maybe mtd/nand/omap2.c to know at which sectors it is accessing.

Thanks and Best Regards,
Joaquim Duran

2014-07-06 0:35 GMT+02:00 Brian Norris <computersforpeace@gmail.com>:
> Hi Joaquim,
>
> On Thu, Jul 03, 2014 at 02:04:39PM +0200, Joaquim Duran wrote:
>> To print traces, we've changed the variable 'mtd_debug_verbose' to
>> 0x7. With this configuration, we get traces when we access to the
>> flash when using the /dev/mtdblockX' device file, like:
>>
>> dd if=uImage of=/dev/mtdblock3 bs=131072
> [...]
>> but not if I do write operation using the file system:
>>
>> dd if=/dev/urandom of=test.txt bs=1024 count=4096
>
> What filesystem are you using? What is your 'mount' command?
>
> My guess is that you are not *actually* utilizing mtdblock for your
> filesystem, but are relying on legacy behavior by which /dev/mtdblockX
> gets translated to the appropriate MTD (not a block device).
>
> See the notes here:
>
>   http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock
>
> And the comments in mount_mtd() (drivers/mtd/mtdsuper.c):
>
>         /* try the old way - the hack where we allowed users to mount
>          * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
>          */
>
> If this is the case, then mtdblock.c's tracing will not help you.
>
> You're probably have better luck either tracing the calls to your
> mtd->write() function itself. e.g., if you're using NAND, you'll have to
> modify nand_write() in drivers/mtd/nand/nand_base.c.
>
> (NB: as of kernel v3.3, commit eda95cbf75193808f62948fb0142ba0901d8bee2,
> it should be easier to trace this, since we introduced a mtd_write()
> wrapper function.)
>
> Hope that helps.
>
> Brian
