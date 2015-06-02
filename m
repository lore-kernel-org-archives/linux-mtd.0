Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzgXb-0000sb-4X
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2015 07:23:17 +0000
Received: by iebgx4 with SMTP id gx4so126545549ieb.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jun 2015 00:22:52 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Jun 2015 09:22:52 +0200
Message-ID: <CAOiidZP8qhLHEf-e5_gHgt-9+SAhnbxEJB8h+r3HG7KJunPuGg@mail.gmail.com>
Subject: Kernel oops during untar
From: Christian Litjes <flitjesdev@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

The two kernel oopses below are happening in the following situation:
A kernel with an init ramfs is mounting a mtd contains the rootfs.
This kernel will then untar a tarball which is located in a ramdisk on the mtd.

I've tried to untar with -v to figure out which file is causing it but
this slows down the untar significantly so I'm unable to gather enough
data. A oops will occur statistically once very 15 attempts. I hope
this can be solved without knowing which file it is. If not I'll try
to setup a test scenario to gather the data.

Kernel version: 2.6.31.8

Gdb points to the following to lines:

Oops 1:
gdb nodelist.o
list *(jffs2_get_ino_cache+0x1c)
line: 425         while (ret && ret->ino < ino)

Oops 2:
gdb nodelist.o
list *(jffs2_add_ino_cache+0x3c)
line: 443         dbg_inocache("add %p (ino #%u)\n", new, new->ino);


This causes the following to oopses:

Oops 1:

Unable to handle kernel paging request at virtual address 18008614

                pgd = c0580000
                [18008614] *pgd=00000000
                Internal error: Oops: 5 [#1]
                Modules linked in: ext3 jbd mbcache ext2 vfat fat
sd_mod usb_storage asix usbnet ehci_hcd usbcore
                CPU: 0    Not tainted  (2.6.31.8 #2)
                PC is at jffs2_get_ino_cache+0x1c/0x3c
                LR is at jffs2_garbage_collect_pass+0x74/0x15b4
                pc : [<c0b9ff04>]    lr : [<c0ba7510>]    psr: 20000013
                sp : c04fdbd8  ip : 00000000  fp : c04fdd08
                r10: 00000000  r9 : cdc6a400  r8 : 00000016
                r7 : c04fc000  r6 : cdc6a42c  r5 : cdc6a400  r4 : 00000015
                r3 : 0000007e  r2 : cdc6aa00  r1 : 0000287e  r0 : 18008608
                Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment user
                Control: 0005397f  Table: 00580000  DAC: 00000015
                Process tar (pid: 1336, stack limit = 0xc04fc270)
                Stack: (0xc04fdbd8 to 0xc04fe000)
                dbc0:
     00000008 c0baaf34
                dbe0: 000007dd c04fdbfc cddcd000 cdc6a42c 00200010
00000002 c0ea31cc 000007dd
                dc00: c0ea31cc 00010000 cf0a5c80 cf0a5cb0 c0e5d810
c0e5d810 00000001 000000c4
                dc20: c04fdc3c 3a1dd180 00000001 cf0a5c80 c0e5d810
00000001 c04fdc5c cf01f090
                dc40: c04d801c c0e5d810 c04d801c cf0a5c80 00000015
cf01f060 cf0a5e10 000000c4
                dc60: c04fc000 c0ae9928 00000000 cddbd980 c04fdc94
c0d4e168 c04fc000 cdc6a400
                dc80: cdc6a42c c04fc000 00000016 00000015 cdc6a400
cdc6a42c c04fc000 00000016
                dca0: 000000c4 00000000 c04fdd08 c0ba1e88 00000000
00001000 00000000 c057b528
                dcc0: cedc3848 00030000 cedc3820 cdc6a400 c057b528
c0ba527c 00000012 00000000
                dce0: 00030000 00000000 cedc3820 c0b9fb90 00001000
cd6b3000 00000000 00000000
                dd00: cedc3848 c0b9fe34 0000ffb8 00000000 60000013
00001000 00000000 c057b528
                dd20: cedc3848 cdc6a400 00000000 c1060660 00001000
c0b9f95c 00030000 00001000
                dd40: c04fdd54 c0d4e168 00030000 00000000 00001000
00000000 00001000 00001000
                dd60: 00000000 00030000 00000000 00001000 00000000
c04fc000 00000000 c0afb8e8
                dd80: 00001000 00001000 c1060660 00000097 00000001
c04fdeb0 cf109520 cedc38e0
                dda0: c0d5a8b8 cedc3848 00001000 00000000 c0d5a8b8
cedc38e0 c04fdf40 00000001
                ddc0: 00000000 00001000 00000097 c1060660 cedc3848
00031000 00000000 00030000
                dde0: 00000000 cedc3848 00000000 00001000 00001000
c0afc05c 00030000 00000000
                de00: c04fdf00 00001000 00000000 347be9ce c04fde20
c04fdf00 c04fdf40 c04fdeb0
                de20: cf109520 cedc38e0 00000000 00000001 cdc6ac00
c0b2e6b0 00000097 347be9ce
                de40: cf1090a0 00001000 c04fdf40 cedc38b4 c04fdeb0
c04fdf40 cedc3848 00000001
                de60: 00000000 cf109520 cedc38e0 c0afca4c cdc6ac64
c0d557c0 c0422000 00030000
                de80: 00000000 c04fdeb0 00000000 cf0a5c80 cf109520
c04fdf80 c04fc000 00000000
                dea0: 00000000 c0b1df58 00030000 00000000 c0a69128
c0544000 00000000 00000001
                dec0: ffffffff cf109520 00000000 00000000 00000000
00000000 cf0a5c80 000200c1
                dee0: 00000000 00000000 00000000 cf0a5c80 c0ae5c64
c04fdef4 c04fdef4 00000004
                df00: 00030000 00000000 cedc3848 00000700 00000000
00000000 00001000 cedc3848
                df20: cedcaf58 c0b2ee20 00000000 00000000 00000002
ced15cf0 c04fc000 00000001
                df40: beb22918 00001000 cf109520 beb22918 c04fdf80
00001000 00001000 c0b1e9d4
                df60: cf109520 beb22918 00030000 00000000 cf109520
00001000 beb22918 c0b1eb28
                df80: 00030000 00000000 00001000 00000000 00001000
beb22918 00000004 00000004
                dfa0: c0a69128 c0a68f80 00001000 beb22918 00000004
beb22918 00001000 000918f4
                dfc0: 00001000 beb22918 00000004 00000004 00030000
00000000 00000004 00000000
                dfe0: 4001f6c0 beb228e0 0000e660 40187a6c 60000010
00000004 00000000 00000000
                [<c0b9ff04>] (jffs2_get_ino_cache+0x1c/0x3c) from
[<c0ba7510>] jffs2_garbage_collect_pass+0x74/0x15b4)
                [<c0ba7510>] (jffs2_garbage_collect_pass+0x74/0x15b4)
from [<c0ba1e88>] jffs2_reserve_space+0xac/0x158)
                [<c0ba1e88>] (jffs2_reserve_space+0xac/0x158) from
[<c0ba527c>] jffs2_write_inode_range+0x50/0x3f8)
                [<c0ba527c>] (jffs2_write_inode_range+0x50/0x3f8) from
[<c0b9f95c>] (jffs2_write_end+0x178/0x2cc)
                [<c0b9f95c>] (jffs2_write_end+0x178/0x2cc) from
[<c0afb8e8>] (generic_file_buffered_write+0x17c/0x2c8)
                [<c0afb8e8>] (generic_file_buffered_write+0x17c/0x2c8)
from [<c0afc05c>] (__generic_file_aio_write_nolock+0x430/0x480)
                [<c0afc05c>]
(__generic_file_aio_write_nolock+0x430/0x480) from [<c0afca4c>]
(generic_file_aio_write+0x70/0xe8)
                [<c0afca4c>] (generic_file_aio_write+0x70/0xe8) from
[<c0b1df58>] (do_sync_write+0xac/0xfc)
                [<c0b1df58>] (do_sync_write+0xac/0xfc) from
[<c0b1e9d4>] (vfs_write+0xac/0x154)
                [<c0b1e9d4>] (vfs_write+0xac/0x154) from [<c0b1eb28>]
(sys_write+0x3c/0x68)
                [<c0b1eb28>] (sys_write+0x3c/0x68) from [<c0a68f80>]
(ret_fast_syscall+0x0/0x2c)
                Code: ea000000 e5900010 e3500000 012fff1e (e590300c)
               ---[ end trace 53dbd45cedeb0f6c ]---


Oops 2:

                2015-04-21T07:26:04+02:00 10.0.110.97 kernel:
[<c00d950c>] (do_sys_open+0x58/0x10c) from [<c0025f80>]
     (ret_fast_syscall+0x0/0x2c)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: Code:
e2820010 e5902000 e3520000 0a000002 (e592300c)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ---[ end
trace 3ec321d0836421b9 ]---
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: Unable
to handle kernel paging request at virtual address 68539462
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: pgd = ce8a8000
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel:
[68539462] *pgd=00000000
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: Internal
error: Oops: 1 [#2]
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: Modules linked in:
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: CPU: 0
 Tainted: G      D     (2.6.31.8 #1)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: PC is at
jffs2_add_ino_cache+0x3c/0x54
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: LR is at
jffs2_do_new_inode+0x58/0x124
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: pc :
[<c015bc0c>]    lr : [<c0161328>]    psr: 20000013
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: sp :
ce9cfe50  ip : 0000047f  fp : 00000022
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: r10:
cedea2e0  r9 : 000081a4  r8 : ce9384e0
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: r7 :
00000001  r6 : cedea308  r5 : ce92e800  r4 : ce98bc68
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: r3 :
0000007f  r2 : 68539456  r1 : ce98bc68  r0 : ce92ebfc
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: Flags:
nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: Control:
0005397f  Table: 0e8a8000  DAC: 00000015
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: Process
cp (pid: 942, stack limit = 0xce9ce270)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: Stack:
(0xce9cfe50 to 0xce9d0000)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: fe40:
                                 cedad598 000081a4 cedea308 ce9384e0
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: fe60:
cedea2e0 ce9b1000 ce92e800 c0165b64 000081a4 cedad598 ce9384e0
cedad598
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: fe80:
cede4818 ce9b1000 ce92e800 c015b39c cedad598 cede4818 000081a4
00000000
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: fea0:
cedad598 cede4818 000081a4 ce9cfef0 000200c2 c00e3058 cedad598
cede4818
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: fec0:
00000000 cedaca38 ce9cfef0 ffffff9c c0026128 c00e579c 000081a4
000200c1
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: fee0:
00000080 00000000 00000000 ce9ce000 cf00a8a0 cedaca38 d973c7fd
00000006
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ff00:
ce9b101d cf00a2a0 cec01c18 00000700 00000000 00000000 ce8a8000
00000200
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ff20:
cf56d7e0 c00c9dcc 000000b7 00000000 00000000 bec7bf38 bec7bac0
000200c2
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ff40:
000081a4 cf0a4ee0 00000004 cf054a60 cf00a8a0 cede4818 cf054a64
000200c1
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ff60:
000081a4 ffffff9c 00000000 c0026128 ce9b1000 00000004 00000000
c00d950c
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ff80:
00000000 bec7bf38 000000c1 bec7bf38 bec7bf38 00000005 c0026128
ce9ce000
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ffa0:
00000000 c0025f80 000000c1 bec7bf38 bec7bf38 000200c1 000081a4
00000000
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ffc0:
000000c1 bec7bf38 bec7bf38 00000005 00000003 00000002 40025000
00000000
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel: ffe0:
000c231c bec7ba90 00092834 400dd650 60000010 bec7bf38 c012b015
41008651
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel:
[<c015bc0c>] (jffs2_add_ino_cache+0x3c/0x54) from [<c0161328>]
(jffs2_do_new_inode+0x58/0x124)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel:
[<c0161328>] (jffs2_do_new_inode+0x58/0x124) from [<c0165b64>]
(jffs2_new_inode+0xdc/0x1e0)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel:
[<c0165b64>] (jffs2_new_inode+0xdc/0x1e0) from [<c015b39c>]
(jffs2_create+0x38/0x12c)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel:
[<c015b39c>] (jffs2_create+0x38/0x12c) from [<c00e3058>]
(vfs_create+0x74/0xc0)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel:
[<c00e3058>] (vfs_create+0x74/0xc0) from [<c00e579c>]
(do_filp_open+0x244/0x7e4)
                2015-04-21T07:26:04+02:00 10.0.110.97 kernel:
[<c00e579c>] (do_filp_open+0x244/0x7e4) from [<c00d950c>]
(do_sys_open+0x58/0x10c)

mtdinfo -a:
Count of MTD devices:           5
Present MTD devices:            mtd0, mtd1,
mtd2, mtd3, mtd4
Sysfs interface supported:      yes

mtd0
Name:                           uboot
Type:                           nor
Eraseblock size:                65536 bytes,
64.0 KiB
Amount of eraseblocks:          12 (786432
bytes, 768.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true

mtd1
Name:                           kernel
Type:                           nor
Eraseblock size:                65536 bytes,
64.0 KiB
Amount of eraseblocks:          80 (5242880
bytes, 5.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:2
Bad blocks are allowed:         false
Device is writable:             true

mtd2
Name:                           config
Type:                           nor
Eraseblock size:                65536 bytes,
64.0 KiB
Amount of eraseblocks:          32 (2097152
bytes, 2.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:4
Bad blocks are allowed:         false
Device is writable:             true

mtd3
Name:                           rootfs
Type:                           nor
Eraseblock size:                65536 bytes,
64.0 KiB
Amount of eraseblocks:          896 (58720256
bytes, 56.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:6
Bad blocks are allowed:         false
Device is writable:             true

mtd4
Name:                           ubenv
Type:                           nor
Eraseblock size:                65536 bytes,
64.0 KiB
Amount of eraseblocks:          4 (262144 bytes,
256.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:8
Bad blocks are allowed:         false
Device is writable:             true
