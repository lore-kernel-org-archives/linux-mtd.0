Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9REE-0002au-00
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2015 05:03:35 +0000
Received: from mail.micron.com (ntxboicas01.micron.com [137.201.84.60])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id t5T5388X006267
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Sun, 28 Jun 2015 23:03:08 -0600
From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mount_ubifs: failed to mount ubifs
Date: Mon, 29 Jun 2015 05:03:05 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF36288@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
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

Hello:
Currently ,I mainly focus on ubi powerloss solution for MLC nand ,now I=20
Have a problem about master node, below is log.

When PEB 354:4096 read failed,and ubi will regard this block a corrupted bl=
ock.
Ubi will not recover it, but reserve it.
Maybe this block contains master node, so will mount failure?
Why ubi not try to recover such block?



UBI: attaching mtd2 to ubi0 ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes fr=
om PEB 354:4096, read only 4096 bytes, retry
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes fr=
om PEB 354:4096, read only 4096 bytes, retry
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes fr=
om PEB 354:4096, read only 4096 bytes, retry
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
UBI error: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from=
 PEB 354:4096, read 4096 bytes
CPU: 1 PID: 1303 Comm: ubiattach Not tainted 3.14.0-xilinx-00017-g71d29dc-d=
irty #65
[<c00145c0>] (unwind_backtrace) from [<c0010c50>] (show_stack+0x10/0x14)
[<c0010c50>] (show_stack) from [<c0478df4>] (dump_stack+0x84/0xd4)
[<c0478df4>] (dump_stack) from [<c02bacf0>] (ubi_io_read+0x1c4/0x298)
[<c02bacf0>] (ubi_io_read) from [<c02c1338>] (ubi_backup_volume_scan+0x208/=
0x308)
[<c02c1338>] (ubi_backup_volume_scan) from [<c02bf300>] (ubi_attach+0x29c/0=
x1200)
[<c02bf300>] (ubi_attach) from [<c02b60a0>] (ubi_attach_mtd_dev+0x59c/0xb60=
)
[<c02b60a0>] (ubi_attach_mtd_dev) from [<c02b68b4>] (ctrl_cdev_ioctl+0xd0/0=
x17c)
[<c02b68b4>] (ctrl_cdev_ioctl) from [<c00bfac4>] (vfs_ioctl+0x18/0x34)
[<c00bfac4>] (vfs_ioctl) from [<c00c059c>] (do_vfs_ioctl+0x530/0x578)
[<c00c059c>] (do_vfs_ioctl) from [<c00c061c>] (SyS_ioctl+0x38/0x54)
[<c00c061c>] (SyS_ioctl) from [<c000db80>] (ret_fast_syscall+0x0/0x30)
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes fr=
om PEB 354:4096, read only 4096 bytes, retry
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes fr=
om PEB 354:4096, read only 4096 bytes, retry
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes fr=
om PEB 354:4096, read only 4096 bytes, retry
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
ecc unrecoverable error
UBI error: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from=
 PEB 354:4096, read 4096 bytes
CPU: 1 PID: 1303 Comm: ubiattach Not tainted 3.14.0-xilinx-00017-g71d29dc-d=
irty #65
[<c00145c0>] (unwind_backtrace) from [<c0010c50>] (show_stack+0x10/0x14)
[<c0010c50>] (show_stack) from [<c0478df4>] (dump_stack+0x84/0xd4)
[<c0478df4>] (dump_stack) from [<c02bacf0>] (ubi_io_read+0x1c4/0x298)
[<c02bacf0>] (ubi_io_read) from [<c02bb1a0>] (ubi_io_read_vid_hdr+0x6c/0x1d=
4)
[<c02bb1a0>] (ubi_io_read_vid_hdr) from [<c02bf2ec>] (ubi_attach+0x288/0x12=
00)
[<c02bf2ec>] (ubi_attach) from [<c02b60a0>] (ubi_attach_mtd_dev+0x59c/0xb60=
)
[<c02b60a0>] (ubi_attach_mtd_dev) from [<c02b68b4>] (ctrl_cdev_ioctl+0xd0/0=
x17c)
[<c02b68b4>] (ctrl_cdev_ioctl) from [<c00bfac4>] (vfs_ioctl+0x18/0x34)
[<c00bfac4>] (vfs_ioctl) from [<c00c059c>] (do_vfs_ioctl+0x530/0x578)
[<c00c059c>] (do_vfs_ioctl) from [<c00c061c>] (SyS_ioctl+0x38/0x54)
[<c00c061c>] (SyS_ioctl) from [<c000db80>] (ret_fast_syscall+0x0/0x30)
UBI error: check_corruption: PEB 354 contains corrupted VID header, and the=
 data does not contain all 0xFF
UBI error: check_corruption: this may be a non-UBI PEB or a severe VID head=
er corruption which requires manual inspection
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
        sqnum     258171
        hdr_crc   f57b76e2
Volume identifier header hexdump:
hexdump of PEB 354 offset 8192, length 1040384
UBI: scanning is finished
UBI error: late_analysis: 1 PEBs are corrupted and preserved
Corrupted PEBs are: 354
UBI assert failed in ubi_wl_init at 1967 (pid 1303)
CPU: 1 PID: 1303 Comm: ubiattach Not tainted 3.14.0-xilinx-00017-g71d29dc-d=
irty #65
[<c00145c0>] (unwind_backtrace) from [<c0010c50>] (show_stack+0x10/0x14)
[<c0010c50>] (show_stack) from [<c0478df4>] (dump_stack+0x84/0xd4)
[<c0478df4>] (dump_stack) from [<c02be3c8>] (ubi_wl_init+0x3a0/0x460)
[<c02be3c8>] (ubi_wl_init) from [<c02c01b8>] (ubi_attach+0x1154/0x1200)
[<c02c01b8>] (ubi_attach) from [<c02b60a0>] (ubi_attach_mtd_dev+0x59c/0xb60=
)
[<c02b60a0>] (ubi_attach_mtd_dev) from [<c02b68b4>] (ctrl_cdev_ioctl+0xd0/0=
x17c)
[<c02b68b4>] (ctrl_cdev_ioctl) from [<c00bfac4>] (vfs_ioctl+0x18/0x34)
[<c00bfac4>] (vfs_ioctl) from [<c00c059c>] (do_vfs_ioctl+0x530/0x578)
[<c00c059c>] (do_vfs_ioctl) from [<c00c061c>] (SyS_ioctl+0x38/0x54)
[<c00c061c>] (SyS_ioctl) from [<c000db80>] (ret_fast_syscall+0x0/0x30)
UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad PEB han=
dling, reserved 76, need 77
UBI warning: print_rsvd_warning: 1 PEBs are corrupted and not used
UBI: attached mtd2 (name "test2", size 1024 MiB) to ubi0
UBI: PEB size: 1048576 bytes (1024 KiB), LEB size: 1040384 bytes
UBI: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
UBI: VID header offset: 4096 (aligned 4096), data offset: 8192
UBI: good PEBs: 1021, bad PEBs: 3, corrupted PEBs: 1
UBI: user volume: 1, internal volumes: 2, max. volumes count: 128
UBI: max/mean erase counter: 446/254, WL threshold: 4096, image sequence nu=
mber: 3046330715
UBI: available PEBs: 0, total reserved PEBs: 1020, PEBs reserved for bad PE=
B handling: 76
UBI: background thread "ubi_bgt0d" started, PID 1306
UBI device number 0, total 1021 LEBs (1062232064 bytes, 1013.0 MiB), availa=
ble 0 LEBs (0 bytes), LEB size 1040384 bytes (1016.0 KiB)
 Ubi device attach................................[OK]=20
 Scan ubi volume..................................[OK]=20
 Mount ubifs on tesUBIFS: background thread "ubifs_bgt0_0" started, PID 131=
1
t dir...............................UBIFS error (pid 1309): ubifs_recover_m=
aster_node: failed to recover master node
UBIFS error (pid 1309): ubifs_recover_master_node: dumping second master no=
de
        magic          0x6101831
        crc            0x6a102f75
        node_type      7 (master node)
        group_type     0 (no node group)
        sqnum          5889233
        len            512
        highest_inum   103440
        commit number  247070
        flags          0x3
        log_lnum       4
        root_lnum      937
        root_offs      411568
        root_len       68
        gc_lnum        12
        ihead_lnum     937
        ihead_offs     413696
        index_size     230688
        lpt_lnum       6
        lpt_offs       581727
        nhead_lnum     6
        nhead_offs     585728
        ltab_lnum      6
        ltab_offs      581632
        lsave_lnum     0
        lsave_offs     0
        lscan_lnum     51
        leb_cnt        939
        empty_lebs     880
        idx_lebs       11
        total_free     917319680
        total_dirty    27678232
        total_used     21288136
        total_dead     0
        total_dark     7520256
UBIFS: background thread "ubifs_bgt0_0" stops
