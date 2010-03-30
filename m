Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NwbCO-0005Hr-SW
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 13:09:45 +0000
Subject: Re: ubifs errors for BeagleBoard
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shivdas Gujare <shivdas.tech@gmail.com>
In-Reply-To: <cf70f0211002221649h4411764dvb93fb117adf953ad@mail.gmail.com>
References: <cf70f0211002150053w29f690bj542c4f7c3e9dc626@mail.gmail.com>
	<1266308748.11659.183.camel@localhost>
	<cf70f0211002221649h4411764dvb93fb117adf953ad@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 30 Mar 2010 16:07:32 +0300
Message-ID: <1269954452.6648.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: beagleboard@googlegroups.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-22 at 16:49 -0800, Shivdas Gujare wrote:
> Hi Artem,
> 
> Thanks a lot for your help.
> 
> On Tue, Feb 16, 2010 at 12:25 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Mon, 2010-02-15 at 00:53 -0800, Shivdas Gujare wrote:
> >> Hi All,
> >
> > Good morning,
> >
> >> I am trying to use UBIFS on Omap3 BeagleBoard (kernel version 2.6.33)
> >> I am quite new to flash filesystems & ubifs.
> >>
> >> currently for ubiattach I am getting following error,
> >>
> >> uncorrectable error :
> >> UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB
> >> 198:512, read 512 bytes
> >> [<c002e444>] (unwind_backtrace+0x0/0xdc) from [<c0217ddc>]
> >> (ubi_io_read+0x20c/0x2ec)
> >> [<c0217ddc>] (ubi_io_read+0x20c/0x2ec) from [<c0218048>]
> >> (ubi_io_read_vid_hdr+0x94/0x294)
> >> [<c0218048>] (ubi_io_read_vid_hdr+0x94/0x294) from [<c021cbf4>]
> >> (ubi_scan+0xa50/0x1094)
> >> [<c021cbf4>] (ubi_scan+0xa50/0x1094) from [<c02122f4>]
> >> (ubi_attach_mtd_dev+0x624/0xd6c)
> >> [<c02122f4>] (ubi_attach_mtd_dev+0x624/0xd6c) from [<c0212cd8>]
> >> (ctrl_cdev_ioctl+0xe8/0x1a4)
> >> [<c0212cd8>] (ctrl_cdev_ioctl+0xe8/0x1a4) from [<c00aa590>]
> >> (vfs_ioctl+0x2c/0x70)
> >> [<c00aa590>] (vfs_ioctl+0x2c/0x70) from [<c00aacc4>] (do_vfs_ioctl+0x518/0x55c)
> >> [<c00aacc4>] (do_vfs_ioctl+0x518/0x55c) from [<c00aad3c>] (sys_ioctl+0x34/0x54)
> >> [<c00aad3c>] (sys_ioctl+0x34/0x54) from [<c0028de0>] (ret_fast_syscall+0x0/0x2c)
> >
> > -74 is -EBADMSG, which means an non-correctable ECC error.
> 
> 
> I am very much newbie to mtd & flash's, Do you mean this is a
> non-correctable error caused by hardware?

I do not know. It might be a bug in the driver, but may be a real data
corruption on the flash media.

> This is a major stopper for me right now, If ubitools read only 64
> bytes from mtd driver,
> then how does it handled with when nand page size is 2048. My mtd
> driver has a check of
> 
> if ( (ops->len % mtd->writesize) != 0) ) {
>      printk("%s: : unsupported ops->len, %d\n", __FUNCTION__, ops->len);
>                 return -EINVAL;
> }

This check is valid for the write path, but invalid for the read path.
Your driver should be fixed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
