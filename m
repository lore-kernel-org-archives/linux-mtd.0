Received: from mail-ob0-f169.google.com ([209.85.214.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd3Ke-0000eC-QW
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 21:36:42 +0000
Received: by obbmp4 with SMTP id mp4so12803600obb.3
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 14:36:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55FC6F56.4050107@nod.at>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
 <55FC6F56.4050107@nod.at>
Date: Fri, 18 Sep 2015 17:36:14 -0400
Message-ID: <CA+-FG62nCCaK_GEGSqBJ4ROvqgVPZdsh7pyEsnq2C0AXZrnkjw@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Roshni Shah <roshni.shah@timesys.com>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks. I tried 4.1 Kernel ran UBI tests and mounting the UBIFS on
Vybrid TWR. I see a different error, however corruptions & UBI test
failures still persist.

Flash chip: s25fl128s (same as above).

# uname -r
4.1.5

Following are the results:

# flash_erase /dev/mtd4 0 0
Erasing 64 Kibyte @ 0 --  0 % complete random: nonblocking pool is initialized
Erasing 64 Kibyte @ ff0000 -- 100 % complete

# ubiformat /dev/mtd4
ubiformat: mtd4 (nor), size 16777216 bytes (16.0 MiB), 256 eraseblocks
of 65536 bytes (64.0 KiB), min. I/O size 1 bytes
libscan: scanning eraseblock 255 -- 100 % complete
ubiformat: 256 eraseblocks are supposedly empty
ubiformat: formatting eraseblock 255 -- 100 % complete

# ubiattach /dev/ubi_ctrl -m 4
ubi0: attaching mtd4
ubi0 error: check_corruption: PEB 1 contains corrupted VID header, and
the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    5
        vol_id    2147479551
        lnum      1
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     0
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 1 offset 128, length 65408
ubi0: scanning is finished
ubi0 error: late_analysis: 1 PEBs are corrupted and preserved
Corrupted PEBs are: 1
ubi0 warning: process_lvol: volume table copy #2 is corrupted
ubi0: volume table was restored
UBI assert failed in ubi_wl_init at 1593 (pid 1086)
CPU: 0 PID: 1086 Comm: ubiattach Not tainted 4.1.5-00005-gfbe5797-dirty #17
Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
Backtrace:
[<80013010>] (dump_backtrace) from [<8001328c>] (show_stack+0x20/0x24)
 r6:8783a000 r5:811834f4 r4:00000000 r3:00000000
[<8001326c>] (show_stack) from [<804f379c>] (dump_stack+0x24/0x28)
[<804f3778>] (dump_stack) from [<8033fd38>] (ubi_wl_init+0x484/0x510)
[<8033f8b4>] (ubi_wl_init) from [<803417a4>] (ubi_attach+0x980/0x14cc)
 r10:00000000 r9:0000000c r8:87a4c6e4 r7:811834f8 r6:87a4c700 r5:8783a000
 r4:00000000
[<80340e24>] (ubi_attach) from [<803363d0>] (ubi_attach_mtd_dev+0x67c/0xc78)
 r10:00000000 r9:00000080 r8:879b3800 r7:8783a000 r6:00000000 r5:879b3800
 r4:00010000
[<80335d54>] (ubi_attach_mtd_dev) from [<80337a90>] (ctrl_cdev_ioctl+0xdc/0x1b0)
 r10:00000000 r9:87374000 r8:00000003 r7:40186f40 r6:879b3800 r5:7ed4ac28
 r4:40186f40
[<803379b4>] (ctrl_cdev_ioctl) from [<800f1bcc>] (do_vfs_ioctl+0x3e8/0x598)
 r6:00000003 r5:879a6de0 r4:7ed4ac28
[<800f17e4>] (do_vfs_ioctl) from [<800f1dc0>] (SyS_ioctl+0x44/0x6c)
 r9:87374000 r8:00000003 r7:40186f40 r6:873539c0 r5:7ed4ac28 r4:873539c0
[<800f1d7c>] (SyS_ioctl) from [<8000f9e0>] (ret_fast_syscall+0x0/0x3c)
 r8:8000fb84 r7:00000036 r6:7ed4af41 r5:00000003 r4:7ed4ac28 r3:00000000
ubi0: attached mtd4 (name "s25fl128s-1", size 16 MiB)
ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
ubi0: VID header offset: 64 (aligned 64), data offset: 128
ubi0: good PEBs: 256, bad PEBs: 0, corrupted PEBs: 1
ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence
number: 1982543124
ubi0: available PEBs: 251, total reserved PEBs: 4, PEBs reserved for
bad PEB handling: 0
ubi0: background thread "ubi_bgt0d" started, PID 1088
UBI device number 0, total 256 LEBs (16744448 bytes, 16.0 MiB),
available 251 LEBs (16417408 bytes, 15.7 MiB), LEB size 65408 bytes
(63.9 KiB)

# ./runtests.sh /dev/ubi0
Running mkvol_basic /dev/ubi0
Running mkvol_bad /dev/ubi0
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    -2
        alignment 1
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    128
        alignment 1
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 0
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment -1
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 65409
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     -1
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     0
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: ubi_create_volume: not enough PEBs, only 251 available
ubi0 error: ubi_create_volume: 1 PEBs are corrupted and not used
ubi0 error: ubi_create_volume: cannot create volume 0, error -28
ubi0 error: ubi_create_volume: not enough PEBs, only 251 available
ubi0 error: ubi_create_volume: 1 PEBs are corrupted and not used
ubi0 error: ubi_create_volume: cannot create volume 0, error -28
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     65408
        vol_type  7
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: ubi_create_volume: volume 0 already exists
ubi0 error: ubi_create_volume: cannot create volume 0, error -17
ubi0 error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
ubi0 error: ubi_create_volume: cannot create volume 1, error -17
ubi0 error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
ubi0 error: ubi_create_volume: cannot create volume 1, error -17
ubi0 error: ubi_open_volume: cannot open device 0, volume 128, error -22
ubi0 error: ubi_open_volume: cannot open device 0, volume -1, error -22
ubi0 error: ubi_open_volume: cannot open device 0, volume 128, error -22
ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -19
ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -19
Running mkvol_paral /dev/ubi0
Running rsvol /dev/ubi0
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8f7714b9, must
be 0x31a3fc87
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xd1882123, must
be 0xcd7268d3
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x450afe5c, must
be 0x52d05ec4
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x4dd9c8c5, must
be 0x29094548
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xf2fc87b1, must
be 0xa462eb86
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xb05c0752, must
be 0x5c6591d9
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8cea5699, must
be 0x8307ed4b
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x10616357, must
be 0x9e4a9c63
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x3346d2d8, must
be 0xa56e4089
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8f7714b9, must
be 0x31a3fc87
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xb173889e, must
be 0x2290cddf
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x5be9a0a4, must
be 0xfa2dadae
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xab2a5866, must
be 0x44fe00de
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xf059825, must
be 0x3042bfee
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x124ae0cd, must
be 0xbdcdff05
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x7764f21e, must
be 0x64f5e25c
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x701b83f5, must
be 0x4fe59aed
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x4a9846b7, must
be 0xe2e4869b
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x54eea84e, must
be 0xf6bba92c
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x561113d, must
be 0xf740079b
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x124ae0cd, must
be 0xbdcdff05
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x3346d2d8, must
be 0xa56e4089
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x123309e4, must
be 0x43d56a5b
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x77106f82, must
be 0xbeaba9d7
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xf9dd88b3, must
be 0x52b97eed
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x57c636a1, must
be 0x6f3ddd30
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x6736f767, must
be 0x2250c6e7
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x124ae0cd, must
be 0xbdcdff05
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x17be7868, must
be 0x289607db
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x7a18673c, must
be 0x1a52b9c5
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x63a8eea5, must
be 0xe97f372f
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xb8c1917, must
be 0x8cbc412e
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xfd099d2e, must
be 0x700d1987
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x124ae0cd, must
be 0xbdcdff05
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x10616357, must
be 0x9e4a9c63
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x53362e19, must
be 0xa56e4089
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xdfeced37, must
be 0xc450e944
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x45051652, must
be 0xb1cfb9cd
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
Running io_basic /dev/ubi0
[io_basic] test_basic():73: byte at 65296 is not 0xa5 but 0x55
Error: io_basic failed
FAILURE
#

Mounting UBIFS:

ubi0: attaching mtd4
ubi0 error: check_corruption: PEB 1 contains corrupted VID header, and
the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    5
        vol_id    2147479551
        lnum      1
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     0
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 1 offset 128, length 65408
ubi0 error: check_corruption: PEB 35 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      157
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     1178886195218433
        hdr_crc   c4e5cffe
Volume identifier header hexdump:
hexdump of PEB 35 offset 128, length 65408
ubi0 error: check_corruption: PEB 37 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      156
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     12754194144713310208
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 37 offset 128, length 65408
ubi0 error: check_corruption: PEB 39 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      158
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     576504733221526140
        hdr_crc   01080000
Volume identifier header hexdump:
hexdump of PEB 39 offset 128, length 65408
ubi0 error: check_corruption: PEB 41 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      160
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2351128608342859777
        hdr_crc   ffff3a34
Volume identifier header hexdump:
hexdump of PEB 41 offset 128, length 65408
ubi0 error: check_corruption: PEB 43 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      162
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     648562327259454076
        hdr_crc   08000000
Volume identifier header hexdump:
hexdump of PEB 43 offset 128, length 65408
ubi0 error: check_corruption: PEB 45 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      165
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     3328781486977462577
        hdr_crc   3a333820
Volume identifier header hexdump:
hexdump of PEB 45 offset 128, length 65408
ubi0 error: check_corruption: PEB 46 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     ff1a6c02
        version   10
        vol_type  165
        copy_flag 249
        compat    255
        vol_id    -352309088
        lnum      -504692737
        data_size 3014656
        used_ebs  -356844289
        data_pad  -345441537
        sqnum     1935415342440906912
        hdr_crc   e21f0000
Volume identifier header hexdump:
hexdump of PEB 46 offset 128, length 65408
ubi0 error: check_corruption: PEB 48 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      166
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     9576097729292760064
        hdr_crc   d4e50000
Volume identifier header hexdump:
hexdump of PEB 48 offset 128, length 65408
ubi0 error: check_corruption: PEB 50 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      168
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7022297315951407982
        hdr_crc   6d700073
Volume identifier header hexdump:
hexdump of PEB 50 offset 128, length 65408
mmc0: host does not support reading read-only switch, assuming write-enable
ubi0 error: check_corruption: PEB 53 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      170
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11593113165405290544
        hdr_crc   94e5d7ff
Volume identifier header hexdump:
hexdump of PEB 53 offset 128, length 65408
mmc0: new high speed SDHC card at address 1234
ubi0 error: check_corruption: PEB 55 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      172
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     6629300190721961009
        hdr_crc   32140109
Volume identifier header hexdump:
hexdump of PEB 55 offset 128, length 65408
mmcblk0: mmc0:1234 SA08G 7.28 GiB
ubi0 error: check_corruption: PEB 57 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      174
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     13684447910371057676
        hdr_crc   ef2002dc
Volume identifier header hexdump:
hexdump of PEB 57 offset 128, length 65408
 mmcblk0: p1 p2 p3
ubi0 error: check_corruption: PEB 59 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      176
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11592551451647606784
        hdr_crc   feeb6c03
Volume identifier header hexdump:
hexdump of PEB 59 offset 128, length 65408
ubi0 error: check_corruption: PEB 61 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      175
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     6188271343457927264
        hdr_crc   56e31a00
Volume identifier header hexdump:
hexdump of PEB 61 offset 128, length 65408
ubi0 error: check_corruption: PEB 63 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      181
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     18440833101629358336
        hdr_crc   bd00142d
Volume identifier header hexdump:
hexdump of PEB 63 offset 128, length 65408
ubi0 error: check_corruption: PEB 65 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      179
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2942793034132992
        hdr_crc   6e737472
Volume identifier header hexdump:
hexdump of PEB 65 offset 128, length 65408
ubi0 error: check_corruption: PEB 67 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 1
        compat    5
        vol_id    2147479551
        lnum      0
        data_size 22016
        used_ebs  0
        data_pad  0
        sqnum     0
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 67 offset 128, length 65408
ubi0 error: check_corruption: PEB 69 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 1
        compat    0
        vol_id    0
        lnum      6
        data_size 1240
        used_ebs  0
        data_pad  0
        sqnum     54182833521820416
        hdr_crc   00fe0300
Volume identifier header hexdump:
hexdump of PEB 69 offset 128, length 65408
ubi0 error: check_corruption: PEB 71 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      1
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     0
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 71 offset 128, length 65408
ubi0 error: check_corruption: PEB 73 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      10
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     72057594037927936
        hdr_crc   01000000
Volume identifier header hexdump:
hexdump of PEB 73 offset 128, length 65408
ubi0 error: check_corruption: PEB 76 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      13
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     16573246628723425280
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 76 offset 128, length 65408
ubi0 error: check_corruption: PEB 78 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      17
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11529215046068535296
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 78 offset 128, length 65408
ubi0 error: check_corruption: PEB 80 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      15
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     16777216
        hdr_crc   01000000
Volume identifier header hexdump:
hexdump of PEB 80 offset 128, length 65408
ubi0 error: check_corruption: PEB 82 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      21
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     1441410270293451520
        hdr_crc   11a0e108
Volume identifier header hexdump:
hexdump of PEB 82 offset 128, length 65408
ubi0 error: check_corruption: PEB 85 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      19
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     391990064399253743
        hdr_crc   fc6907e3
Volume identifier header hexdump:
hexdump of PEB 85 offset 128, length 65408
ubi0 error: check_corruption: PEB 87 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      25
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     38859010864196689
        hdr_crc   4de008c0
Volume identifier header hexdump:
hexdump of PEB 87 offset 128, length 65408
ubi0 error: check_corruption: PEB 89 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      23
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     72533274037846528
        hdr_crc   e1030055
Volume identifier header hexdump:
hexdump of PEB 89 offset 128, length 65408
ubi0 error: check_corruption: PEB 92 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      29
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11529215046068535296
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 92 offset 128, length 65408
ubi0 error: check_corruption: PEB 94 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      27
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7235441203039271200
        hdr_crc   0409616e
Volume identifier header hexdump:
hexdump of PEB 94 offset 128, length 65408
ubi0 error: check_corruption: PEB 96 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      33
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     18440833100555689152
        hdr_crc   98e0cc9f
Volume identifier header hexdump:
hexdump of PEB 96 offset 128, length 65408
ubi0 error: check_corruption: PEB 98 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      31
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2304998489801662689
        hdr_crc   073142e2
Volume identifier header hexdump:
hexdump of PEB 98 offset 128, length 65408
ubi0 error: check_corruption: PEB 100 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      37
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     508978102674656229
        hdr_crc   070059e1
Volume identifier header hexdump:
hexdump of PEB 100 offset 128, length 65408
ubi0 error: check_corruption: PEB 102 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      36
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     590114371736174819
        hdr_crc   d80f08e3
Volume identifier header hexdump:
hexdump of PEB 102 offset 128, length 65408
ubi0 error: check_corruption: PEB 104 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      38
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11529215046068535296
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 104 offset 128, length 65408
ubi0 error: check_corruption: PEB 106 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      40
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2971249863721287680
        hdr_crc   0002750b
Volume identifier header hexdump:
hexdump of PEB 106 offset 128, length 65408
ubi0 error: check_corruption: PEB 108 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      42
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2816950181027327
        hdr_crc   9fe5df8c
Volume identifier header hexdump:
hexdump of PEB 108 offset 128, length 65408
ubi0 error: check_corruption: PEB 110 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      45
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2351127456410233602
        hdr_crc   d08de2f0
Volume identifier header hexdump:
hexdump of PEB 110 offset 128, length 65408
ubi0 error: check_corruption: PEB 112 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      43
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     3496171412039984563
        hdr_crc   ffff1a05
Volume identifier header hexdump:
hexdump of PEB 112 offset 128, length 65408
ubi0 error: check_corruption: PEB 114 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      49
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7336012798033968
        hdr_crc   00eb0040
Volume identifier header hexdump:
hexdump of PEB 114 offset 128, length 65408
ubi0 error: check_corruption: PEB 117 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      47
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     8031155284846201133
        hdr_crc   796e7379
Volume identifier header hexdump:
hexdump of PEB 117 offset 128, length 65408
ubi0 error: check_corruption: PEB 119 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      53
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     3533755617768788841
        hdr_crc   746f206c
Volume identifier header hexdump:
hexdump of PEB 119 offset 128, length 65408
ubi0 error: check_corruption: PEB 121 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      51
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     271855020212288
        hdr_crc   8de51400
Volume identifier header hexdump:
hexdump of PEB 121 offset 128, length 65408
ubi0 error: check_corruption: PEB 123 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      57
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     9584249347424518992
        hdr_crc   a0e1fbf7
Volume identifier header hexdump:
hexdump of PEB 123 offset 128, length 65408
ubi0 error: check_corruption: PEB 126 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      55
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     3746994893866008576
        hdr_crc   01000020
Volume identifier header hexdump:
hexdump of PEB 126 offset 128, length 65408
ubi0 error: check_corruption: PEB 128 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      61
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11593109868028166912
        hdr_crc   7f038de2
Volume identifier header hexdump:
hexdump of PEB 128 offset 128, length 65408
ubi0 error: check_corruption: PEB 130 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      59
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     18440599388568623102
        hdr_crc   ffea8496
Volume identifier header hexdump:
hexdump of PEB 130 offset 128, length 65408
ubi0 error: check_corruption: PEB 132 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      65
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11592546986760667184
        hdr_crc   52e10200
Volume identifier header hexdump:
hexdump of PEB 132 offset 128, length 65408
ubi0 error: check_corruption: PEB 135 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      63
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11592656938409862144
        hdr_crc   a0a102c0
Volume identifier header hexdump:
hexdump of PEB 135 offset 128, length 65408
ubi0 error: check_corruption: PEB 137 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      69
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2010012810081403904
        hdr_crc   94e57c04
Volume identifier header hexdump:
hexdump of PEB 137 offset 128, length 65408
ubi0 error: check_corruption: PEB 139 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      67
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     720893290737561727
        hdr_crc   921f80e1
Volume identifier header hexdump:
hexdump of PEB 139 offset 128, length 65408
ubi0 error: check_corruption: PEB 141 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      73
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     18388163197998727936
        hdr_crc   62e23002
Volume identifier header hexdump:
hexdump of PEB 141 offset 128, length 65408
ubi0 error: check_corruption: PEB 143 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      72
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     17257702549947972610
        hdr_crc   0000e045
Volume identifier header hexdump:
hexdump of PEB 143 offset 128, length 65408
ubi0 error: check_corruption: PEB 145 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      74
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     18440859558846202112
        hdr_crc   86e00990
Volume identifier header hexdump:
hexdump of PEB 145 offset 128, length 65408
ubi0 error: check_corruption: PEB 147 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      76
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     180994233612508
        hdr_crc   0103f120
Volume identifier header hexdump:
hexdump of PEB 147 offset 128, length 65408
ubi0 error: check_corruption: PEB 149 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      78
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     1432996803017076736
        hdr_crc   2cbc0003
Volume identifier header hexdump:
hexdump of PEB 149 offset 128, length 65408
ubi0 error: check_corruption: PEB 151 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      81
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     4467570832918183936
        hdr_crc   41000000
Volume identifier header hexdump:
hexdump of PEB 151 offset 128, length 65408
ubi0 error: check_corruption: PEB 153 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      79
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     13684188569221141248
        hdr_crc   9de5c8ff
Volume identifier header hexdump:
hexdump of PEB 153 offset 128, length 65408
ubi0 error: check_corruption: PEB 155 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      85
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     3308176710471867184
        hdr_crc   00e30030
Volume identifier header hexdump:
hexdump of PEB 155 offset 128, length 65408
ubi0 error: check_corruption: PEB 157 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      83
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     17077648799248195809
        hdr_crc   080084e2
Volume identifier header hexdump:
hexdump of PEB 157 offset 128, length 65408
ubi0 error: check_corruption: PEB 160 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      89
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     142144866266906625
        hdr_crc   0200002b
Volume identifier header hexdump:
hexdump of PEB 160 offset 128, length 65408
ubi0 error: check_corruption: PEB 162 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      87
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     4142185767009136947
        hdr_crc   312e3100
Volume identifier header hexdump:
hexdump of PEB 162 offset 128, length 65408
ubi0 error: check_corruption: PEB 164 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      93
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11529215046068535296
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 164 offset 128, length 65408
ubi0 error: check_corruption: PEB 166 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      91
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     10440751517301669936
        hdr_crc   93e50000
Volume identifier header hexdump:
hexdump of PEB 166 offset 128, length 65408
ubi0 error: check_corruption: PEB 169 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      97
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     5828237360445915328
        hdr_crc   40e30020
Volume identifier header hexdump:
hexdump of PEB 169 offset 128, length 65408
ubi0 error: check_corruption: PEB 171 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      95
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     432345946008846335
        hdr_crc   ffebbc33
Volume identifier header hexdump:
hexdump of PEB 171 offset 128, length 65408
ubi0 error: check_corruption: PEB 173 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      101
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     18413556417033273360
        hdr_crc   50e350ff
Volume identifier header hexdump:
hexdump of PEB 173 offset 128, length 65408
ubi0 error: check_corruption: PEB 175 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      99
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7310222304492219763
        hdr_crc   792c2077
Volume identifier header hexdump:
hexdump of PEB 175 offset 128, length 65408
ubi0 error: check_corruption: PEB 177 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      102
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     5828223228406992896
        hdr_crc   a0e3f060
Volume identifier header hexdump:
hexdump of PEB 177 offset 128, length 65408
ubi0 error: check_corruption: PEB 179 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      104
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11529215046068535296
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 179 offset 128, length 65408
ubi0 error: check_corruption: PEB 181 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      106
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     9578584802112640208
        hdr_crc   8de21eff
Volume identifier header hexdump:
hexdump of PEB 181 offset 128, length 65408
ubi0 error: check_corruption: PEB 183 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      108
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     12909436672839009212
        hdr_crc   53c8983f
Volume identifier header hexdump:
hexdump of PEB 183 offset 128, length 65408
ubi0 error: check_corruption: PEB 185 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      107
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7349874595361783808
        hdr_crc   66000000
Volume identifier header hexdump:
hexdump of PEB 185 offset 128, length 65408
ubi0 error: check_corruption: PEB 187 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      113
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7757768814391511871
        hdr_crc   4b64d43b
Volume identifier header hexdump:
hexdump of PEB 187 offset 128, length 65408
ubi0 error: check_corruption: PEB 189 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      111
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11985877986292
        hdr_crc   309ce540
Volume identifier header hexdump:
hexdump of PEB 189 offset 128, length 65408
ubi0 error: check_corruption: PEB 191 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      117
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     6847160283463417856
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 191 offset 128, length 65408
ubi0 error: check_corruption: PEB 194 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      115
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     11529215046068535296
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 194 offset 128, length 65408
ubi0 error: check_corruption: PEB 196 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      121
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     3972283076400149605
        hdr_crc   6e6f2061
Volume identifier header hexdump:
hexdump of PEB 196 offset 128, length 65408
ubi0 error: check_corruption: PEB 198 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      119
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7423902510743552000
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 198 offset 128, length 65408
ubi0 error: check_corruption: PEB 200 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      125
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     18232541616432742400
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 200 offset 128, length 65408
ubi0 error: check_corruption: PEB 203 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      123
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2449958197829763072
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 203 offset 128, length 65408
ubi0 error: check_corruption: PEB 205 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      129
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7935473838235066420
        hdr_crc   31333220
Volume identifier header hexdump:
hexdump of PEB 205 offset 128, length 65408
ubi0 error: check_corruption: PEB 207 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      127
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     16777216
        hdr_crc   01000000
Volume identifier header hexdump:
hexdump of PEB 207 offset 128, length 65408
ubi0 error: check_corruption: PEB 209 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      133
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     5644453203558949920
        hdr_crc   65720001
Volume identifier header hexdump:
hexdump of PEB 209 offset 128, length 65408
ubi0 error: check_corruption: PEB 212 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      131
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     2449958198909665280
        hdr_crc   22000000
Volume identifier header hexdump:
hexdump of PEB 212 offset 128, length 65408
ubi0 error: check_corruption: PEB 214 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      137
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     6081392686079566188
        hdr_crc   41534349
Volume identifier header hexdump:
hexdump of PEB 214 offset 128, length 65408
ubi0 error: check_corruption: PEB 216 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      135
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     43910714850017541
        hdr_crc   26000800
Volume identifier header hexdump:
hexdump of PEB 216 offset 128, length 65408
ubi0 error: check_corruption: PEB 218 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      141
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7308890787204046916
        hdr_crc   34363020
Volume identifier header hexdump:
hexdump of PEB 218 offset 128, length 65408
ubi0 error: check_corruption: PEB 220 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      139
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     16777216
        hdr_crc   01000000
Volume identifier header hexdump:
hexdump of PEB 220 offset 128, length 65408
ubi0 error: check_corruption: PEB 222 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      142
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     7286885976438435692
        hdr_crc   62010100
Volume identifier header hexdump:
hexdump of PEB 222 offset 128, length 65408
ubi0 error: check_corruption: PEB 224 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      144
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     648562327276231548
        hdr_crc   08000000
Volume identifier header hexdump:
hexdump of PEB 224 offset 128, length 65408
ubi0 error: check_corruption: PEB 226 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      146
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     508080616118689952
        hdr_crc   00ea0d00
Volume identifier header hexdump:
hexdump of PEB 226 offset 128, length 65408
ubi0 error: check_corruption: PEB 228 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      148
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     8027138716863767072
        hdr_crc   77686963
Volume identifier header hexdump:
hexdump of PEB 228 offset 128, length 65408
ubi0 error: check_corruption: PEB 230 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      147
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     9431136580330983698
        hdr_crc   54e0041a
Volume identifier header hexdump:
hexdump of PEB 230 offset 128, length 65408
ubi0 error: check_corruption: PEB 232 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      153
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     14339462032930111718
        hdr_crc   c800004f
Volume identifier header hexdump:
hexdump of PEB 232 offset 128, length 65408
ubi0 error: check_corruption: PEB 234 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      151
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     66146621840162928
        hdr_crc   14e50030
Volume identifier header hexdump:
hexdump of PEB 234 offset 128, length 65408
ubi0 error: check_corruption: PEB 236 contains corrupted VID header,
and the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      5
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     12806239070788077947
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 236 offset 128, length 65408
ubi0: scanning is finished
ubi0 error: late_analysis: 97 PEBs are corrupted and preserved
Corrupted PEBs are: 236 234 232 230 228 226 224 222 220 218 216 214
212 209 207 205 203 200 198 196 194 191 189 187 185 183 181 179 177
175 173 171 169 166 164 162 160 157 155 153 151 149 11
ubi0 error: late_analysis: too many corrupted PEBs, refusing
ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
UBI error: cannot attach mtd4

On Fri, Sep 18, 2015 at 4:08 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 18.09.2015 um 22:05 schrieb Roshni Shah:
>> Its not mainline. I am using this driver from Freescale, which has
>> support for Quad/DDR read and support for IMX6 SoloX.
>>
>> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/mtd/spi-nor/fsl-quadspi.c?h=imx_3.14.28_1.0.0_ga
>>
>> Mainline driver excludes the above support.
>>
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/spi-nor/fsl-quadspi.c
>>
>> Also, even though the Freescale driver supports Quad / DDR read, I am
>> not using that for this test. My device tree just uses regular read.
>
> Can you please retry using a pristine and recent kernel?
>
> Thanks,
> //richard
