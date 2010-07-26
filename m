Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdO3G-0001PV-Vo
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 13:49:10 +0000
Received: by bwz15 with SMTP id 15so3511844bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jul 2010 06:49:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1280150054.14917.108.camel@localhost>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
Date: Mon, 26 Jul 2010 15:49:02 +0200
Message-ID: <AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/7/26 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2010-07-26 at 14:00 +0200, Arno Steffen wrote:
>> I just tried the howto (mount an empty UBI volume). But when I want to d=
o
>> ubimkvol /dev/ubi0 -N test_vol -s 10MiB I get an error message:
>> libubi: error!: "/dev/ubi0" is not a character device
>> ubimkvol: error!: error while probing "/dev/ubi0"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error 22 (Invalid argument)
>>
>> If I check /dev/ubi0 it is indeed a block device. But this has been
>> created by ubiattach which I used as howto
>> What is the problem????
>
> Your udev rules, perhaps? Creating device nodes is responsibility of
> your system, not UBI/ubi-utils.

My mtd8 is a character device as it should be.
crw-rw----    1 root     root      90,  16 Jan  1 00:00 /dev/mtd8

I don't know who is creating the device node, but it is avauilable
after ubiattach.
If it is done by udev - how to control it and change it's behaviour?
I can delete the device node and create one manually as described by
free_electrons.

cat /sys/class/ubi/ubi0/dev (e.g. 253:0)
mknod /dev/ubi0 c 253 0

Calling ubimkvol then creates a lot of other errors. (see below)

>
>> ( I tried to set the device as a char-device by
>>
>> [root@or:/]# ll /dev/ub*
>> brw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 253, =C2=
=A0 0 Jan =C2=A01 00:46 /dev/ubi0
>> crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A010=
, =C2=A063 Jan =C2=A01 00:00 /dev/ubi_ctrl
>> [root@or:/]# rm /dev/ubi0
>> [root@or:/]# mknod /dev/ubi0 c 253 0
>>
>> But than I get other error messages:
>>
>> [root@or:/]# ubimkvol /dev/ubi0 -N test -s 10MiB
>> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
>> 331:512, written 0 bytes
>> Backtrace:
>> [<8002d558>] (dump_backtrace+0x0/0x10c) from [<80267dac>] (dump_stack+0x=
18/0x1c)
>> =C2=A0r6:0000014b r5:fffffffb r4:87a19800 r3:00000002
>> [<80267d94>] (dump_stack+0x0/0x1c) from [<801bb084>] (ubi_io_write+0x308=
/0x384)
>> [<801bad7c>] (ubi_io_write+0x0/0x384) from [<801bb228>]
>> (ubi_io_write_vid_hdr+0x128/0x144)
>> [<801bb100>] (ubi_io_write_vid_hdr+0x0/0x144) from [<801b9114>]
>> (ubi_eba_write_leb+0x550/0x758)
>> =C2=A0r6:87928400 r5:879dde00 r4:87a19800
>> [<801b8bc4>] (ubi_eba_write_leb+0x0/0x758) from [<801b1560>]
>> (ubi_change_vtbl_record+0xf4/0x158)
>> [<801b146c>] (ubi_change_vtbl_record+0x0/0x158) from [<801b2d74>]
>> (ubi_create_volume+0x51c/0x6c0)
>> =C2=A0r7:87a19800 r6:87a73d2c r5:87928200 r4:879282a0
>> [<801b2858>] (ubi_create_volume+0x0/0x6c0) from [<801b56f4>]
>> (ubi_cdev_ioctl+0x1f4/0x96c)
>> [<801b5500>] (ubi_cdev_ioctl+0x0/0x96c) from [<800b6194>] (vfs_ioctl+0x3=
4/0xb4)
>> [<800b6160>] (vfs_ioctl+0x0/0xb4) from [<800b6880>] (do_vfs_ioctl+0x56c/=
0x5b4)
>> =C2=A0r6:40986f00 r5:879f73c0 r4:7e85c9d8 r3:87a2e230
>> [<800b6314>] (do_vfs_ioctl+0x0/0x5b4) from [<800b6908>] (sys_ioctl+0x40/=
0x64)
>> [<800b68c8>] (sys_ioctl+0x0/0x64) from [<80029fc0>] (ret_fast_syscall+0x=
0/0x2c)
>> =C2=A0r7:00000036 r6:00000003 r5:7e85cba8 r4:7e85c9d8
>> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB
>> 2147479551:0, PEB 331
>> UBI: run torture test for PEB 331
>
> Strange. Your MTD device returned -EIO, probably you should check
> whether you can write to your mtd device or not.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

Yes, the mtd is in general writable. Not sure if it is still after ubiattac=
h.
Another try was to flash a ubi.img, but it will not mount again.

ubiattach /dev/ubi_ctrl -m 8
UBI: attaching mtd8 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB
handling, reserved 1, need 3
UBI: attached mtd8 to ubi0
UBI: MTD device name:            "extra"
UBI: MTD device size:            41 MiB
UBI: number of good PEBs:        331
UBI: number of bad PEBs:         1
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 331
UBI: number of PEBs reserved for bad PEB handling: 1
UBI: max/mean erase counter: 1/0
UBI: image sequence number: 228182237
UBI: background thread "ubi_bgt0d" started, PID 367
UBI device number 0, total 331 LEBs (42706944 bytes, 40.7 MiB),
available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
[root@or:/]#
[root@or:/]# ls -l /dev/ubi*
brw-rw----    1 root     root     253,   0 Jan  1 00:13 /dev/ubi0
brw-rw----    1 root     root     253,   1 Jan  1 00:13 /dev/ubi0_0
crw-rw----    1 root     root      10,  63 Jan  1 00:00 /dev/ubi_ctrl
[root@or:/]# mount -t ubifs /dev/ubi0_0 /tmp
mount: mounting /dev/ubi0_0 on /tmp failed: No such device
