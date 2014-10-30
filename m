Received: from mail-db3on0094.outbound.protection.outlook.com ([157.55.234.94]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjkxO-00020K-5y
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 08:19:47 +0000
From: Karsten Jeppesen <kjp@skov.dk>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: libscan: warning!: inconsistent VID header offset
Date: Thu, 30 Oct 2014 08:19:01 +0000
Message-ID: <ffdf47d689fb46dd8ca0d9ff1b3837a2@SERVER75.skov.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guys,

Can one of you set my head straight please?
When using ubinize to create an image for ubiformat to flash, it goes south=
.
Here is what I don't understand:
- How come the LEB size is so small when using a simple ubiformat
- Why does it differ from that calculated by ubinize? (ubiformat: 126976; u=
binize: 130944)

Mtdinfo:
mtd0
Name:                           Rootfs1
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4096 (536870912 bytes, 512.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
OOB size:                       64 bytes
Character device major/minor:   90:0
Bad blocks are allowed:         true
Device is writable:             true

A non-image format says:
# ubiformat /dev/mtd0
ubiformat: mtd0 (nand), size 536870912 bytes (512.0 MiB), 4096 eraseblocks =
of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 4095 -- 100 % complete
ubiformat: 4092 eraseblocks have valid erase counter, mean value is 2
ubiformat: 4 bad eraseblocks found, numbers: 4092, 4093, 4094, 4095
ubiformat: formatting eraseblock 4095 -- 100 % complete

# ubiattach /dev/ubi_ctrl -m 0
UBI: attaching mtd0 to ubi0
UBI: scanning is finished
UBI: attached mtd0 (name "Rootfs1", size 512 MiB) to ubi0
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
UBI: good PEBs: 4092, bad PEBs: 4, corrupted PEBs: 0
UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 3/3, WL threshold: 4096, image sequence number=
: 1840488567
UBI: available PEBs: 4012, total reserved PEBs: 80, PEBs reserved for bad P=
EB handling: 76
UBI: background thread "ubi_bgt0d" started, PID 22714
UBI device number 0, total 4092 LEBs (519585792 bytes, 495.5 MiB), availabl=
e 4012 LEBs (509427712 bytes, 485.8 MiB), LEB size 126976 bytes (124.0 KiB)



Now with ubinize:
The config file:
---
# cat /tmp/test/ubinize.config
[kjp]
mode=3Dubi
image=3D/tmp/test/ubifs.img
vol_id=3D0
vol_type=3Ddynamic
vol_size=3D25MiB
vol_name=3DRootfs1
vol_flags=3Dautoresize
---

Then we make the ubifs using the same low LEB size as the simple ubiformat =
chose.
# mkfs.ubifs -v --root=3D/tmp/test/rfs --min-io-size=3D1 --leb-size=3D12697=
6 --max-leb-cnt=3D243 -o /tmp/test/ubifs.img -x zlib
mkfs.ubifs
        root:         /tmp/test/rfs/
        min_io_size:  8
        leb_size:     126976
        max_leb_cnt:  243
        output:       /tmp/test/ubifs.img
        jrn_size:     3682304
        reserved:     0
        compr:        zlib
        keyhash:      r5
        fanout:       8
        orph_lebs:    1
        super lebs:   1
        master lebs:  2
        log_lebs:     4
        lpt_lebs:     2
        orph_lebs:    1
        main_lebs:    81
        gc lebs:      1
        index lebs:   2
        leb_cnt:      91
        UUID:         01A17D48-0594-4CF9-A456-7F3A6482ABAC
Success!

So far so good. Now the ubinize:
# ubinize -v -o /tmp/test/pack_rfs --min-io-size=3D1 --peb-size=3D131072 /t=
mp/test/ubinize.config
ubinize: LEB size:                  130944
ubinize: PEB size:                  131072
ubinize: min. I/O size:             1
ubinize: sub-page size:             1
ubinize: VID offset:                64
ubinize: data offset:               128
ubinize: UBI image sequence number: 576492560
ubinize: loaded the ini-file "/tmp/test/ubinize.config"
ubinize: count of sections: 1

ubinize: parsing section "kjp"
ubinize: mode=3Dubi, keep parsing
ubinize: volume type: dynamic
ubinize: volume ID: 0
ubinize: volume size: 26214400 bytes
ubinize: volume name: Rootfs1
ubinize: volume alignment: 1
ubinize: autoresize flags found
ubinize: adding volume 0
ubinize: writing volume 0
ubinize: image file: /tmp/test/ubifs.img

ubinize: writing layout volume
ubinize: done


***** Now how did the LEB change??????? Its back to the value I was actuall=
y suspecting, but not the one calculated by ubiformat.

The resulting image put on to the flash using ubiformat with option -f resu=
lts in no errors, but attach fails miserably:
# ubiattach /dev/ubi_ctrl -m 0
UBI: attaching mtd0 to ubi0
UBI error: validate_ec_hdr: bad VID header offset 64, expected 2048
UBI error: validate_ec_hdr: bad EC header
Erase counter header dump:
        magic          0x55424923
        version        1
        ec             8
        vid_hdr_offset 64
        data_offset    128
        image_seq      677585586
        hdr_crc        0x541480d8
erase counter header hexdump:
CPU: 2 PID: 27955 Comm: ubiattach Tainted: G        W    3.12.20 #1
Backtrace:
[<80012090>] (dump_backtrace+0x0/0x10c) from [<8001222c>] (show_stack+0x18/=
0x1c)
 r6:00000008 r5:00000000 r4:00000000 r3:00000000
[<80012214>] (show_stack+0x0/0x1c) from [<804a9ad8>] (dump_stack+0x78/0x94)
[<804a9a60>] (dump_stack+0x0/0x94) from [<802f7010>] (validate_ec_hdr+0xa8/=
0x104)
 r4:00000000 r3:be9d0900
[<802f6f68>] (validate_ec_hdr+0x0/0x104) from [<802f7b34>] (ubi_io_read_ec_=
hdr+0x124/0x1f0)
 r8:00000000 r7:be979000 r6:00000000 r5:bed62000 r4:00000000
r3:541480d8
[<802f7a10>] (ubi_io_read_ec_hdr+0x0/0x1f0) from [<802fc1d0>] (ubi_attach+0=
x148/0x136c)
[<802fc088>] (ubi_attach+0x0/0x136c) from [<802f2270>] (ubi_attach_mtd_dev+=
0x5f0/0xbf8)
[<802f1c80>] (ubi_attach_mtd_dev+0x0/0xbf8) from [<802f2ae0>] (ctrl_cdev_io=
ctl+0xe0/0x1a0)
[<802f2a00>] (ctrl_cdev_ioctl+0x0/0x1a0) from [<800de9ec>] (do_vfs_ioctl+0x=
88/0x5c4)
 r7:7ea22738 r6:00000003 r5:bec4f600 r4:40186f40
[<800de964>] (do_vfs_ioctl+0x0/0x5c4) from [<800def68>] (SyS_ioctl+0x40/0x6=
8)
[<800def28>] (SyS_ioctl+0x0/0x68) from [<8000e7e0>] (ret_fast_syscall+0x0/0=
x48)
 r8:8000e9a4 r7:00000036 r6:7ea22a7c r5:7ea22738 r4:00000003
UBI error: ubi_io_read_ec_hdr: validation failed for PEB 0
UBI error: ubi_attach_mtd_dev: failed to attach mtd0, error -22
ubiattach: error!: cannot attach mtd0
           error 22 (Invalid argument)



Any ideas?




Med venlig hilsen / Sincerely yours,

Karsten Jeppesen, D.D.S;=A0 Bsc. CS
Senior Software Engineer
Ext.: +45 72 17 56 69
Mobile phone: +45 25 66 00 23
______________________________________
SKOV A/S
Hedelund 4, Glyngoere, 7870 Roslev, Denmark
Tel.: +45 72 17 55 55 - Fax: +45 72 17 59 59
www.skov.com
