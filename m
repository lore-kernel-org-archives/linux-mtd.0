Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWc1U-0001Ut-Qn
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 20:14:49 +0000
Received: by ywh13 with SMTP id 13so1047242ywh.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 13:14:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200907302036.24243.marek.vasut@gmail.com>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
Date: Thu, 30 Jul 2009 15:14:43 -0500
Message-ID: <3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
From: E Robertson <e.robertson.svg@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 1:36 PM, Marek Vasut<marek.vasut@gmail.com> wrote:
> Dne =C8t 30. =E8ervence 2009 20:24:16 E Robertson napsal(a):
>> Hi All,
>> The Oops below occurs when writing to a flash file system, particularly
>> nand. I'm using jffs2 which after formatting and mounted I copy any file=
 to
>> it. Apparently this copying always
>> seem to cause an oops. I haven't been able to determine if this is
>> entirely a filesystem issue and not
>> a driver issue (althought I did not find an issue with the driver). Than=
ks.
> Hi!
>
> would you mind testing if this oops happens even on .31-rc (the current g=
it
> version) ?
>
> Also, maybe you'd like to CC linux MTD mailing list.
>
> Thanks!
>
>>
>> # flash_eraseall -j /dev/mtd0
>> Erasing 128 Kibyte @ 4000000 -- 100 % complete.Cleanmarker written at
>> 3fe0000. # flash_eraseall -j /dev/mtd2
>> Erasing 128 Kibyte @ 4420000 -- 42 % complete. Cleanmarker written at
>> 4420000. Skipping bad block at 0x04440000
>> Erasing 128 Kibyte @ a000000 -- 100 % complete.Cleanmarker written at
>> 9fe0000. # mount -t jffs2 /dev/mtdblock0 /mnt/home
>> # mount -t jffs2 /dev/mtdblock2 /mnt/root
>> # cp /bin/ts_calibrate /mnt/home
>> Data CRC 73ec70d8 !=3D calculated CRC af36398e for node at 02ec0078
>> Unable to handle kernel NULL pointer dereference at virtual address
>> 00000000 pgd =3D c1d60000
>> [00000000] *pgd=3D21ca9031, *pte=3D00000000, *ppte=3D00000000
>> Internal error: Oops: 817 [#1]
>> CPU: 0 =A0 =A0Not tainted =A0(2.6.28.4 #454)
>> PC is at jffs2_write_end+0x60/0x290
>> LR is at generic_file_buffered_write+0x188/0x2d0
>> pc : [<c0122e70>] =A0 =A0lr : [<c00b64fc>] =A0 =A0psr: 60000013
>> sp : c1c3fce4 =A0ip : c1c3fd3c =A0fp : c1c3fd38
>> r10: c02fd500 =A0r9 : 00000000 =A0r8 : c1815d6c
>> r7 : 00001000 =A0r6 : c1815d44 =A0r5 : 00000000 =A0r4 : c1ca8e00
>> r3 : 00000000 =A0r2 : c1ca8c00 =A0r1 : 00001000 =A0r0 : c1c3fcf8
>> Flags: nZCv =A0IRQs on =A0FIQs on =A0Mode SVC_32 =A0ISA ARM =A0Segment u=
ser
>> Control: 0005317f =A0Table: 21d60000 =A0DAC: 00000015
>> Process cp (pid: 1107, stack limit =3D 0xc1c3e260)
>> Stack: (0xc1c3fce4 to 0xc1c40000)
>> fce0: =A0 =A0 =A0 =A0 =A000000000 00000000 c1c3fd04 c1815dac 00000000 00=
001000
>> 00001000 fd00: 00000000 00000000 00001000 c1c3e000 00001000 00001000
>> 00000000 00001000 fd20: c1c3e000 00000000 00000000 c1c3fdb4 c1c3fd3c
>> c00b64fc c0122e20 00001000 fd40: 00001000 c02fd500 00000099 00001000
>> 00000000 00000000 c024498c c1815e04 fd60: c1815d6c c024498c c1815e04
>> c1c2b6a0 c1c3fea8 00000099 c02fd500 c1c3fea0 fd80: 00000001 00000000
>> 00001000 00001000 00000000 00002000 00000000 00000000 fda0: c1c3fdf4
>> c1c3fea0 c1c3fe54 c1c3fdbc c00b6b48 c00b6388 00001000 00000000 fdc0:
>> c1c3fef0 00001000 00000000 00002000 00000000 00001000 00000000 00000000
>> fde0: c1815e04 c1c2b6a0 c1c3fef0 c1c3fea8 00001000 00001000 00000000
>> 00001000 fe00: 00000001 c1c3fe10 c00e6828 c00e8890 00000099 3b4e48ae
>> 00000000 00001000 fe20: c1c3fe94 c1c3fe30 c00d03f0 c1815dd8 c1c3fea8
>> c1c3fef0 c1815d6c 00001000 fe40: 00000000 c1c3fea0 c1c3fe94 c1c3fe58
>> c00b6cb8 c00b6654 00000001 00001000 fe60: c1815e04 c1c2b6a0 00000001
>> c1c3fea8 c1c3fef0 c1c2b6a0 c1c3ff78 c1c3fea0 fe80: 00000000 00000003
>> c1c3ff50 c1c3fe9c c00d5638 c00b6c48 00001000 00000000 fea0: bef40bcc
>> 00001000 c1c5acc0 c1c3fec8 00000000 00000001 ffffffff c1c2b6a0 fec0:
>> 00000000 00000000 00000000 00000000 c1c5acc0 00000000 00000000 ffffffff
>> fee0: c1c5acc0 c00a4fd8 c1c3fee8 c1c3fee8 00001000 00000000 c1c3ffac
>> c1c3ff08 ff00: c007b220 c0080d04 00001000 c00c52a0 0000003b 00000000
>> 00000000 00000000 ff20: 00000000 00000001 00000001 c1c2b6a0 bef40bcc
>> c1c3ff78 00001000 00000000 ff40: c1c3e000 c1c3ff74 c1c3ff54 c00d574c
>> c00d5588 00000000 c1c2b6c0 c1c2b6a0 ff60: c1c3ff78 00001000 c1c3ffa4
>> c1c3ff78 c00d5890 c00d5698 00001000 00000000 ff80: 00000000 00001000
>> bef40bcc 00000004 00000004 c007bf44 00000000 c1c3ffa8 ffa0: c007bda0
>> c00d5854 00001000 bef40bcc 00000004 bef40bcc 00001000 000000c1 ffc0:
>> 00001000 bef40bcc 00000004 00000004 00000004 00000003 00000003 00000000
>> ffe0: 000065fd bef40ba0 00024b0c 0001c8b4 20000010 00000004 c7a3270e
>> 3d29b12b Backtrace:
>> [<c0122e10>] (jffs2_write_end+0x0/0x290) from [<c00b64fc>]
>> (generic_file_buffered_write+0x188/0x2d0
>> )
>> [<c00b6378>] (generic_file_buffered_write+0x4/0x2d0) from [<c00b6b48>]
>> (__generic_file_aio_write_no
>> lock+0x504/0x534)
>> [<c00b6644>] (__generic_file_aio_write_nolock+0x0/0x534) from
>> [<c00b6cb8>] (generic_file_aio_write+
>> 0x84/0xf8)
>> [<c00b6c38>] (generic_file_aio_write+0x4/0xf8) from [<c00d5638>]
>> (do_sync_write+0xc0/0x110)
>> [<c00d5578>] (do_sync_write+0x0/0x110) from [<c00d574c>]
>> (vfs_write+0xc4/0x148) r9:c1c3e000 r8:00000000 r7:00001000 r6:c1c3ff78
>> r5:bef40bcc
>> r4:c1c2b6a0
>> [<c00d5688>] (vfs_write+0x0/0x148) from [<c00d5890>] (sys_write+0x4c/0x7=
4)
>> =A0r7:00001000 r6:c1c3ff78 r5:c1c2b6a0 r4:c1c2b6c0
>> [<c00d5844>] (sys_write+0x0/0x74) from [<c007bda0>]
>> (ret_fast_syscall+0x0/0x2c) r8:c007bf44 r7:00000004 r6:00000004 r5:bef40=
bcc
>> r4:00001000
>> Code: e2486028 e3c95003 1a000002 e3a03000 (e5833000)
>> ---[ end trace 09f754d14d7cdfe1 ]---
>> Segmentation fault
>>
>> -------------------------------------------------------------------
>> List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-ker=
nel
>> FAQ: =A0 =A0 =A0 =A0http://www.arm.linux.org.uk/mailinglists/faq.php
>> Etiquette: =A0http://www.arm.linux.org.uk/mailinglists/etiquette.php
>
>


I got 2.6.31-rc4 and patch it which wasn't painful.
However, no change.
Here are the results: My initramfs initially mount the two nand
partitions and that's where the initial
uncorrectable error comes from.

uncorrectable error :
mtd->read(0x1f658 bytes from 0x2ec09a8) returned ECC error
JFFS2 notice: (1053) read_dnode: wrong data CRC in data node at
0x02ec3070: read 0xaa9e5485, calcul
ated 0x8f0bb8b3.
uncorrectable error :
mtd->read(0x80c bytes from 0x2edc7f4) returned ECC error
JFFS2 notice: (1053) check_node_data: wrong data CRC in data node at
0x02edc7f4: read 0xdc28e66a, c
alculated 0x87142f6d.

BusyBox v1.13.4 (2009-04-22 14:16:57 UTC) built-in shell (ash)
Enter 'help' for a list of built-in commands.
/bin/sh: can't access tty; job control turned off
JFFS2 notice: (1056) check_node_data: wrong data CRC in data node at
0x09f40078: read 0x73ec70d8, c
alculated 0xfd767305.

# mount
rootfs on / type rootfs (rw)
tmpfs on /tmp type tmpfs (rw,relatime)
tmpfs on / type tmpfs (rw,relatime)
tmpfs on / type tmpfs (rw,relatime)
/dev/sda1 on /usbstick type vfat
(rw,relatime,fmask=3D0022,dmask=3D0022,codepage=3Dcp437,iocharset=3Diso885
9-1,errors=3Dremount-ro)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
/dev/mtdblock0 on /mnt/home type jffs2 (rw,relatime)
/dev/mtdblock2 on /mnt/root type jffs2 (rw,relatime)
# umount /mnt/home
# umount /mnt/root
# flash_eraseall -j /dev/mtd0
Erasing 128 Kibyte @ 4000000 -- 100 % complete.Cleanmarker written at 3fe00=
00.
# flash_eraseall -j /dev/mtd2
Erasing 128 Kibyte @ 4420000 -- 42 % complete. Cleanmarker written at 44200=
00.
Skipping bad block at 0x04440000
Erasing 128 Kibyte @ a000000 -- 100 % complete.Cleanmarker written at 9fe00=
00.
# mount -t jffs2 /dev/mtdblock0 /mnt/home
# mount -t jffs2 /dev/mtdblock2 /mnt/root
# cp /bin/ts_calibrate /mnt/home
# cp /bin/ts_calibrate /mnt/root
Data CRC 73ec70d8 !=3D calculated CRC af36398e for node at 04560078
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
0
pgd =3D c1d64000
[00000000] *pgd=3D21edb031, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 817 [#1] PREEMPT
CPU: 0    Not tainted  (2.6.31-rc4 #1)
PC is at jffs2_write_end+0x64/0x264
LR is at generic_file_buffered_write+0x1a8/0x308
pc : [<c0194d98>]    lr : [<c0118c94>]    psr: 40000013
sp : c1fabd1c  ip : 00000000  fp : c1fabd68
r10: 00000000  r9 : c182325c  r8 : 00000000
r7 : c03472a0  r6 : c18231c0  r5 : 00001000  r4 : 00001000
r3 : 00000000  r2 : 00001000  r1 : 00000000  r0 : c1fc8600
Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 21d64000  DAC: 00000015
Process cp (pid: 1072, stack limit =3D 0xc1faa260)
Stack: (0xc1fabd1c to 0xc1fac000)
bd00:                                                                000000=
00
bd20: 00001000 c1fabd3c 00001000 00001000 00000000 c1fc8600 c1415000 000000=
00
bd40: 00001000 00001000 00000000 00000000 00000000 c182325c 00000000 c1fabd=
e4
bd60: c1fabd6c c0118c94 c0194d44 00001000 00001000 c03472a0 c1fabde8 c1fabe=
a0
bd80: c1c888c0 c182325c c029e88c c18231c0 00001000 00001000 00000000 c029e8=
8c
bda0: c1faa000 c1fabf24 00000001 00000000 00001000 c1fabde8 c03472a0 000020=
00
bdc0: 00000000 00001000 00000000 c18231c0 00000000 00001000 c1fabe58 c1fabd=
ec
bde0: c011951c c0118b00 00001000 00000000 c1fabee8 00001000 00000000 c1fabe=
e8
be00: c1fabf24 c1fabea0 c1c888c0 c182325c 00000000 00000001 00001000 000000=
00
be20: c1fabe94 c1fabe30 c0128224 00001000 c1823230 c18231c0 c1fabea0 000010=
00
be40: 00000000 00000001 c1fabf24 c1fabe94 c1fabe5c c0119870 c0119090 be97ab=
ac
be60: 00000000 c1c888c0 c182325c c1fabea0 c1c888c0 c1fabea0 c1fabf24 c1fabf=
80
be80: c1faa000 fffffdee c1fabf50 c1fabe9c c013ca84 c0119800 00001000 000000=
00
bea0: 00000000 be979000 00000000 00000001 ffffffff c1c888c0 00000000 000000=
00
bec0: 00000000 00000000 c1c97ca0 00000000 00000000 00000817 c1c97ca0 c0103b=
e4
bee0: c1fabee0 c1fabee0 00001000 00000000 00000003 00000003 c1fabfac c1fabf=
08
bf00: 00001000 c00dd240 00000000 00000000 00000000 c1fabf38 c1fabf24 000000=
00
bf20: 00000000 be979bac 00001000 c1c888c0 be979bac c1fabf80 00000004 000010=
00
bf40: 00000003 c1fabf7c c1fabf54 c013d3ac c013c9c8 00000000 00000000 000010=
00
bf60: 00000000 c1c888c0 00000004 c00d7fc4 c1fabfa4 c1fabf80 c013d9cc c013d3=
04
bf80: 00001000 00000000 00000000 00001000 be979bac 00000004 00000000 c1fabf=
a8
bfa0: c00d7e20 c013d990 00001000 be979bac 00000004 be979bac 00001000 000000=
c1
bfc0: 00001000 be979bac 00000004 00000004 00000004 00000003 00000003 000000=
00
bfe0: 000065fd be979b80 00024b0c 0001c8b4 20000010 00000004 20361031 203614=
31
Backtrace:
[<c0194d34>] (jffs2_write_end+0x0/0x264) from [<c0118c94>]
(generic_file_buffered_write+0x1a8/0x308
)
[<c0118af0>] (generic_file_buffered_write+0x4/0x308) from [<c011951c>]
(__generic_file_aio_write_no
lock+0x49c/0x4ec)
[<c0119080>] (__generic_file_aio_write_nolock+0x0/0x4ec) from
[<c0119870>] (generic_file_aio_write+
0x84/0xf8)
[<c01197f0>] (generic_file_aio_write+0x4/0xf8) from [<c013ca84>]
(do_sync_write+0xcc/0x11c)
[<c013c9b8>] (do_sync_write+0x0/0x11c) from [<c013d3ac>] (vfs_write+0xb8/0x=
164)
[<c013d2f4>] (vfs_write+0x0/0x164) from [<c013d9cc>] (sys_write+0x4c/0x80)
 r8:c00d7fc4 r7:00000004 r6:c1c888c0 r5:00000000 r4:00001000
[<c013d980>] (sys_write+0x0/0x80) from [<c00d7e20>] (ret_fast_syscall+0x0/0=
x2c)
 r6:00000004 r5:be979bac r4:00001000
Code: e50b3040 01a0a00c 0a000003 ea000001 (e5811000)
---[ end trace 04e0ff1b7ca460a6 ]---
Segmentation fault
