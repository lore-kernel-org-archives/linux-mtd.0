Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdNWM-0005Qv-5Y
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 13:15:12 +0000
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 16:14:14 +0300
Message-ID: <1280150054.14917.108.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-07-26 at 14:00 +0200, Arno Steffen wrote:
> I just tried the howto (mount an empty UBI volume). But when I want to do
> ubimkvol /dev/ubi0 -N test_vol -s 10MiB I get an error message:
> libubi: error!: "/dev/ubi0" is not a character device
> ubimkvol: error!: error while probing "/dev/ubi0"
>           error 22 (Invalid argument)
> 
> If I check /dev/ubi0 it is indeed a block device. But this has been
> created by ubiattach which I used as howto
> What is the problem????

Your udev rules, perhaps? Creating device nodes is responsibility of
your system, not UBI/ubi-utils.

> ( I tried to set the device as a char-device by
> 
> [root@or:/]# ll /dev/ub*
> brw-rw----    1 root     root     253,   0 Jan  1 00:46 /dev/ubi0
> crw-rw----    1 root     root      10,  63 Jan  1 00:00 /dev/ubi_ctrl
> [root@or:/]# rm /dev/ubi0
> [root@or:/]# mknod /dev/ubi0 c 253 0
> 
> But than I get other error messages:
> 
> [root@or:/]# ubimkvol /dev/ubi0 -N test -s 10MiB
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
> 331:512, written 0 bytes
> Backtrace:
> [<8002d558>] (dump_backtrace+0x0/0x10c) from [<80267dac>] (dump_stack+0x18/0x1c)
>  r6:0000014b r5:fffffffb r4:87a19800 r3:00000002
> [<80267d94>] (dump_stack+0x0/0x1c) from [<801bb084>] (ubi_io_write+0x308/0x384)
> [<801bad7c>] (ubi_io_write+0x0/0x384) from [<801bb228>]
> (ubi_io_write_vid_hdr+0x128/0x144)
> [<801bb100>] (ubi_io_write_vid_hdr+0x0/0x144) from [<801b9114>]
> (ubi_eba_write_leb+0x550/0x758)
>  r6:87928400 r5:879dde00 r4:87a19800
> [<801b8bc4>] (ubi_eba_write_leb+0x0/0x758) from [<801b1560>]
> (ubi_change_vtbl_record+0xf4/0x158)
> [<801b146c>] (ubi_change_vtbl_record+0x0/0x158) from [<801b2d74>]
> (ubi_create_volume+0x51c/0x6c0)
>  r7:87a19800 r6:87a73d2c r5:87928200 r4:879282a0
> [<801b2858>] (ubi_create_volume+0x0/0x6c0) from [<801b56f4>]
> (ubi_cdev_ioctl+0x1f4/0x96c)
> [<801b5500>] (ubi_cdev_ioctl+0x0/0x96c) from [<800b6194>] (vfs_ioctl+0x34/0xb4)
> [<800b6160>] (vfs_ioctl+0x0/0xb4) from [<800b6880>] (do_vfs_ioctl+0x56c/0x5b4)
>  r6:40986f00 r5:879f73c0 r4:7e85c9d8 r3:87a2e230
> [<800b6314>] (do_vfs_ioctl+0x0/0x5b4) from [<800b6908>] (sys_ioctl+0x40/0x64)
> [<800b68c8>] (sys_ioctl+0x0/0x64) from [<80029fc0>] (ret_fast_syscall+0x0/0x2c)
>  r7:00000036 r6:00000003 r5:7e85cba8 r4:7e85c9d8
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB
> 2147479551:0, PEB 331
> UBI: run torture test for PEB 331

Strange. Your MTD device returned -EIO, probably you should check
whether you can write to your mtd device or not.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
