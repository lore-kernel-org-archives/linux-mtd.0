Received: from hermes1.tesbv.com ([188.165.42.68])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N2Luw-0004QC-1t
	for linux-mtd@lists.infradead.org; Mon, 26 Oct 2009 09:31:15 +0000
Received: from ganga.tes (unknown [10.20.0.1])
	by hermes1.tesbv.com (Postfix) with ESMTP id 09E9B5C25F
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Oct 2009 10:18:55 +0100 (CET)
Message-ID: <20091026145935.uvck3scgs8wgcc8o@bangalore.tesbv.com>
Date: Mon, 26 Oct 2009 14:59:35 +0530
From: rithesh@tesbv.com
To: linux-mtd@lists.infradead.org
Subject: UBIFS second time booting issue
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_nzx8g4og6bk"
Content-Transfer-Encoding: 7bit
Cc: thomas@tesbv.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This message is in MIME format.

--=_nzx8g4og6bk
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have built a ubifs filesystem of size 8MiB. The following steps were =20
followed:


./mkfs.ubifs -r /home/rithesh/TITAN/ubifilesystem/ -m 512 -e 15360 -c =20
511 -o /tmp/ubifs.img

./ubinize -o /tmp/ubi.img -m 512 -s 512 -p 16384 ubinize.cfg

My nand flash is 256MiB with the block size of 16KiB and 512 bytes of =20
page size.

The ubinize.cfg contains the following:

[ubifs]
mode=3Dubi
image=3D/tmp/ubifs.img
vol_id=3D0
vol_size=3D8MiB
vol_type=3Ddynamic
vol_name=3Drootfs
vol_flags=3Dautoresize


ISSUE:

The ubi.img which gets generate out of the following steps is flashed =20
and the kernel comes up for the first time but fails to boot up the =20
second time.

Hence i have enabled the Debug message to traces the bug which points =20
towards "switching of ubifs filesystem to readonly mode" but i am not =20
sure why this should happen.
Before switching the readonly mode the ubifs write to the flash fails =20
continues, please see the logfile  attached to this mail.

Please guide me through this problem.

Thanks and Regards,
Rithesh.M
TES Electronic Solutions(I) Pvt LTD.











----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


--=_nzx8g4og6bk
Content-Type: text/plain;
	charset=UTF-8;
	name="Bug report ubifs.txt"
Content-Disposition: attachment;
	filename="Bug report ubifs.txt"
Content-Transfer-Encoding: quoted-printable

remounting / read-write...=20
done.
mounting /proc...=20
done.
mounting /sys...=20
mount: mounting /sys on /sys failed
done.
Creating device nodes manually, running /sbin/makenodes-2.6
mknod: /dev/ttyS2: File exists
mknod: /dev/ttyS3: File exists
mknod: /dev/ttyS4: File exists
mknod: /dev/ttyS5: File exists
Done.
mounting /dev/pts...=20
done.
init loopback interface...
done.
starting syslogd...=20
done.
starting klogd...=20
done.

(none) login: root


BusyBox v1.4.1 (2008-03-27 19:15:47 CET) Built-in shell (ash)
Enter 'help' for a list of built-in commands.

/bin/sh: can't access tty; job control turned off
# dUBI: scrubbed PEB 14, data moved to PEB 1726
UBIFS error (pid 903): ubifs_check_node: bad CRC: calculated 0xe15e0e2e, rea=
d 0x18944807
UBIFS error (pid 903): ubifs_check_node: bad node at LEB 12:13824
[<c00299b0>] (dump_stack+0x0/0x14) from [<c00f25c4>] (ubifs_check_node+0x278=
/0x2b4)
[<c00f234c>] (ubifs_check_node+0x0/0x2b4) from [<c00f9d34>] (ubifs_scan_a_no=
de+0x178/0x2d4)
 r8:00000000 r7:00003600 r6:c1c9f800 r5:c28ed600 r4:00000387
[<c00f9bbc>] (ubifs_scan_a_node+0x0/0x2d4) from [<c00f9f18>] (ubifs_scan+0x8=
8/0x288)
[<c00f9e90>] (ubifs_scan+0x0/0x288) from [<c010ab1c>] (scan_check_cb+0x190/0=
x6dc)
[<c010a98c>] (scan_check_cb+0x0/0x6dc) from [<c0109d34>] (ubifs_lpt_scan_nol=
ock+0x224/0x498)
[<c0109b10>] (ubifs_lpt_scan_nolock+0x0/0x498) from [<c010b110>] (dbg_check_=
lprops+0xa8/0x2f4)
[<c010b068>] (dbg_check_lprops+0x0/0x2f4) from [<c00fdd10>] (do_commit+0xd4/=
0x780)
 r8:00000120 r7:00000004 r6:c1c9f800 r5:c1dd18e4 r4:00000000
[<c00fdc3c>] (do_commit+0x0/0x780) from [<c00fe448>] (ubifs_run_commit+0x8c/=
0xa0)
 r8:c1dd18c0 r7:c1c9f800 r6:fffffff5 r5:c1c9f8d8 r4:c1c9f800
[<c00fe3bc>] (ubifs_run_commit+0x0/0xa0) from [<c00e62fc>] (make_reservation=
+0x44c/0x558)
 r5:fffffff5 r4:00003600
[<c00e5eb0>] (make_reservation+0x0/0x558) from [<c00e7124>] (ubifs_jnl_write=
_data+0x1b4/0x2d4)
[<c00e6f70>] (ubifs_jnl_write_data+0x0/0x2d4) from [<c00e9660>] (do_writepag=
e+0xbc/0x204)
[<c00e95a4>] (do_writepage+0x0/0x204) from [<c00eaa84>] (ubifs_writepage+0x1=
ec/0x224)
[<c00ea898>] (ubifs_writepage+0x0/0x224) from [<c0068668>] (__writepage+0x1c=
/0x6c)
[<c006864c>] (__writepage+0x0/0x6c) from [<c0068d24>] (write_cache_pages+0x1=
e0/0x360)
 r4:00000001
[<c0068b44>] (write_cache_pages+0x0/0x360) from [<c0068ecc>] (generic_writep=
ages+0x28/0x38)
[<c0068ea4>] (generic_writepages+0x0/0x38) from [<c0068f24>] (do_writepages+=
0x48/0x60)
[<c0068edc>] (do_writepages+0x0/0x60) from [<c00a3290>] (__writeback_single_=
inode+0x154/0x2b0)
 r4:00000007
[<c00a313c>] (__writeback_single_inode+0x0/0x2b0) from [<c00a3798>] (generic=
_sync_sb_inodes+0x208/0x2fc)
[<c00a3590>] (generic_sync_sb_inodes+0x0/0x2fc) from [<c0102a28>] (ubifs_bud=
get_space+0x804/0xbe8)
[<c0102224>] (ubifs_budget_space+0x0/0xbe8) from [<c00ea480>] (ubifs_write_b=
egin+0x39c/0x52c)
[<c00ea0e4>] (ubifs_write_begin+0x0/0x52c) from [<c0063050>] (generic_file_b=
uffered_write+0x120/0x670)
[<c0062f34>] (generic_file_buffered_write+0x4/0x670) from [<c0063c68>] (__ge=
neric_file_aio_write_nolock+0x454/0x4c4)
[<c0063814>] (__generic_file_aio_write_nolock+0x0/0x4c4) from [<c0063d58>] (=
generic_file_aio_write+0x80/0xfc)
[<c0063cdc>] (generic_file_aio_write+0x4/0xfc) from [<c00e9060>] (ubifs_aio_=
write+0x1b4/0x218)
[<c00e8eb0>] (ubifs_aio_write+0x4/0x218) from [<c0085164>] (do_sync_write+0x=
c0/0x114)
[<c00850a4>] (do_sync_write+0x0/0x114) from [<c0085a88>] (vfs_write+0xb8/0x1=
44)
 r6:c1ebbf80 r5:00124708 r4:c1c81dc0
[<c00859d0>] (vfs_write+0x0/0x144) from [<c0085f5c>] (sys_write+0x4c/0x80)
 r7:00000004 r6:c1c81dc0 r5:00000000 r4:0029afd3
[<c0085f10>] (sys_write+0x0/0x80) from [<c0025ba0>] (ret_fast_syscall+0x0/0x=
2c)
 r6:00124708 r5:00000092 r4:00000092
UBIFS error (pid 903): ubifs_scan: bad node
UBIFS error (pid 903): ubifs_scanned_corruption: corrupted data at LEB 12:13=
824
UBIFS error (pid 903): ubifs_scanned_corruption: first 1536 bytes from LEB 1=
2:13824
UBIFS error (pid 903): ubifs_scan: LEB 12 scanning failed
UBIFS error (pid 903): do_commit: commit failed, error -117
UBIFS warning (pid 903): ubifs_ro_mode: switched to read-only mode, error -1=
17
[<c00299b0>] (dump_stack+0x0/0x14) from [<c00f226c>] (ubifs_ro_mode+0x58/0x6=
8)
[<c00f2214>] (ubifs_ro_mode+0x0/0x68) from [<c00fe39c>] (do_commit+0x760/0x7=
80)
 r4:ffffff8b
[<c00fdc3c>] (do_commit+0x0/0x780) from [<c00fe448>] (ubifs_run_commit+0x8c/=
0xa0)
 r8:c1dd18c0 r7:c1c9f800 r6:fffffff5 r5:c1c9f8d8 r4:c1c9f800
[<c00fe3bc>] (ubifs_run_commit+0x0/0xa0) from [<c00e62fc>] (make_reservation=
+0x44c/0x558)
 r5:fffffff5 r4:00003600
[<c00e5eb0>] (make_reservation+0x0/0x558) from [<c00e7124>] (ubifs_jnl_write=
_data+0x1b4/0x2d4)
[<c00e6f70>] (ubifs_jnl_write_data+0x0/0x2d4) from [<c00e9660>] (do_writepag=
e+0xbc/0x204)
[<c00e95a4>] (do_writepage+0x0/0x204) from [<c00eaa84>] (ubifs_writepage+0x1=
ec/0x224)
[<c00ea898>] (ubifs_writepage+0x0/0x224) from [<c0068668>] (__writepage+0x1c=
/0x6c)
[<c006864c>] (__writepage+0x0/0x6c) from [<c0068d24>] (write_cache_pages+0x1=
e0/0x360)
 r4:00000001
[<c0068b44>] (write_cache_pages+0x0/0x360) from [<c0068ecc>] (generic_writep=
ages+0x28/0x38)
[<c0068ea4>] (generic_writepages+0x0/0x38) from [<c0068f24>] (do_writepages+=
0x48/0x60)
[<c0068edc>] (do_writepages+0x0/0x60) from [<c00a3290>] (__writeback_single_=
inode+0x154/0x2b0)
 r4:00000007
[<c00a313c>] (__writeback_single_inode+0x0/0x2b0) from [<c00a3798>] (generic=
_sync_sb_inodes+0x208/0x2fc)
[<c00a3590>] (generic_sync_sb_inodes+0x0/0x2fc) from [<c0102a28>] (ubifs_bud=
get_space+0x804/0xbe8)
[<c0102224>] (ubifs_budget_space+0x0/0xbe8) from [<c00ea480>] (ubifs_write_b=
egin+0x39c/0x52c)
[<c00ea0e4>] (ubifs_write_begin+0x0/0x52c) from [<c0063050>] (generic_file_b=
uffered_write+0x120/0x670)
[<c0062f34>] (generic_file_buffered_write+0x4/0x670) from [<c0063c68>] (__ge=
neric_file_aio_write_nolock+0x454/0x4c4)
[<c0063814>] (__generic_file_aio_write_nolock+0x0/0x4c4) from [<c0063d58>] (=
generic_file_aio_write+0x80/0xfc)
[<c0063cdc>] (generic_file_aio_write+0x4/0xfc) from [<c00e9060>] (ubifs_aio_=
write+0x1b4/0x218)
[<c00e8eb0>] (ubifs_aio_write+0x4/0x218) from [<c0085164>] (do_sync_write+0x=
c0/0x114)
[<c00850a4>] (do_sync_write+0x0/0x114) from [<c0085a88>] (vfs_write+0xb8/0x1=
44)
 r6:c1ebbf80 r5:00124708 r4:c1c81dc0
[<c00859d0>] (vfs_write+0x0/0x144) from [<c0085f5c>] (sys_write+0x4c/0x80)
 r7:00000004 r6:c1c81dc0 r5:00000000 r4:0029afd3
[<c0085f10>] (sys_write+0x0/0x80) from [<c0025ba0>] (ret_fast_syscall+0x0/0x=
2c)
 r6:00124708 r5:00000092 r4:00000092
UBIFS error (pid 903): do_writepage: cannot write page 491 of inode 157, err=
or -117
UBIFS error (pid 903): make_reservation: cannot reserve 663 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 492 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 667 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 493 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 685 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 494 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 678 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 495 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 675 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 496 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 656 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 497 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 967 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 498 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 552 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 499 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 799 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 500 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 890 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 501 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 773 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 502 of inode 157, err=
or -30
UBIFS error (pid 903): make_reservation: cannot reserve 758 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 503 of inode 157, err=
or -30
meUBIFS error (pid 903): make_reservation: cannot reserve 160 bytes in jhead=
 1, error -30
UBIFS error (pid 903): ubifs_write_inode: can't write inode 157, error -30
sg=08 =08
# dmesg -n8
#=20
# dmesg -n8=1B[J=08 =08=08 =08=08 =08
] (ubifs_run_commit+0x8c/0xa0)
 r8:c1dd18c0 r7:c1c9f800 r6:fffffff5 r5:c1c9f8d8 r4:c1c9f800
[<c00fe3bc>] (ubifs_run_commit+0x0/0xa0) from [<c00e62fc>] (make_reservation=
+0x44c/0x558)
 r5:fffffff5 r4:00003600
[<c00e5eb0>] (make_reservation+0x0/0x558) from [<c00e7124>] (ubifs_jnl_write=
_data+0x1b4/0x2d4)
[<c00e6f70>] (ubifs_jnl_write_data+0x0/0x2d4) from [<c00e9660>] (do_writepag=
e+0xbc/0x204)
[<c00e95a4>] (do_writepage+0x0/0x204) from [<c00eaa84>] (ubifs_writepage+0x1=
ec/0x224)
[<c00ea898>] (ubifs_writepage+0x0/0x224) from [<c0068668>] (__writepage+0x1c=
/0x6c)
[<c006864c>] (__writepage+0x0/0x6c) from [<c0068d24>] (write_cache_pages+0x1=
e0/0x360)
 r4:00000001
[<c0068b44>] (write_cache_pages+0x0/0x360) from [<c0068ecc>] (generic_writep=
ages+0x28/0x38)
[<c0068ea4>] (generic_writepages+0x0/0x38) from [<c0068f24>] (do_writepages+=
0x48/0x60)
[<c0068edc>] (do_writepages+0x0/0x60) from [<c00a3290>] (__writeback_single_=
inode+0x154/0x2b0)
 r4:00000007
[<c00a313c>] (__writeback_single_inode+0x0/0x2b0) from [<c00a3798>] (generic=
_sync_sb_inodes+0x208/0x2fc)
[<c00a3590>] (generic_sync_sb_inodes+0x0/0x2fc) from [<c0102a28>] (ubifs_bud=
get_space+0x804/0xbe8)
[<c0102224>] (ubifs_budget_space+0x0/0xbe8) from [<c00ea480>] (ubifs_write_b=
egin+0x39c/0x52c)
[<c00ea0e4>] (ubifs_write_begin+0x0/0x52c) from [<c0063050>] (generic_file_b=
uffered_write+0x120/0x670)
[<c0062f34>] (generic_file_buffered_write+0x4/0x670) from [<c0063c68>] (__ge=
neric_file_aio_write_nolock+0x454/0x4c4)
[<c0063814>] (__generic_file_aio_write_nolock+0x0/0x4c4) from [<c0063d58>] (=
generic_file_aio_write+0x80/0xfc)
[<c0063cdc>] (generic_file_aio_write+0x4/0xfc) from [<c00e9060>] (ubifs_aio_=
write+0x1b4/0x218)
[<c00e8eb0>] (ubifs_aio_write+0x4/0x218) from [<c0085164>] (do_sync_write+0x=
c0/0x114)
[<c00850a4>] (do_sync_write+0x0/0x114) from [<c0085a88>] (vfs_write+0xb8/0x1=
44)
 r6:c1ebbf80 r5:00124708 r4:c1c81dc0
[<c00859d0>] (vfs_write+0x0/0x144) from [<c0085f5c>] (sys_write+0x4c/0x80)
 r7:00000004 r6:c1c81dc0 r5:00000000 r4:0029afd3
[<c0085f10>] (sys_write+0x0/0x80) from [<c0025ba0>] (ret_fast_syscall+0x0/0x=
2c)
 r6:00124708 r5:00000092 r4:00000092
UBIFS error (pid 903): ubifs_scan: bad node
UBIFS error (pid 903): ubifs_scanned_corruption: corrupted data at LEB 12:13=
824
UBIFS error (pid 903): ubifs_scanned_corruption: first 1536 bytes from LEB 1=
2:13824
00000000: 06101831 18944807 00001129 00000000 000000a0 00000200 000001ee 000=
00000  1....H..).......................
00000020: 00000000 00000000 000010fa 00000000 00000000 00000000 00000028 000=
00000  ........................(.......
00000040: 00000028 00000000 00000028 00000000 00000000 00000000 00000000 000=
00001  (.......(.......................
00000060: 00000000 00000000 0000c1b6 00000001 00200000 00000000 00000000 000=
00000  .................. .............
00000080: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000  ................................
000000a0: 06101831 c34acb12 0000112a 00000000 000000a0 00000200 0000009d 000=
00000  1.....J.*.......................
000000c0: 00000000 00000000 0000034d 00000000 0018e000 00000000 4ae18dce 000=
00000  ........M..................J....
000000e0: 0000002d 00000000 0000002d 00000000 00000000 00000000 00000000 000=
00001  -.......-.......................
00000100: 000001f6 000001f6 00008180 00000001 00000000 00000000 00000000 000=
00000  ................................
00000120: 00000000 00000001 00000000 00000000 00000000 00000000 00000000 000=
00000  ................................
00000140: 06101831 5fef7800 0000113c 00000000 000000a0 00000200 00000130 000=
00000  1....x._<...............0.......
00000160: 00000000 00000000 00000a7b 00000000 00000066 00000000 4ae18dcf 000=
00000  ........{.......f..........J....
00000180: 00000028 00000000 48e638a3 00000000 00000000 00000000 00000000 000=
00001  (........8.H....................
000001a0: 000001f6 000001f6 000081ed 00000001 00000000 00000000 00000000 000=
00000  ................................
000001c0: 00000000 00000001 00000000 00000000 00000000 00000000 00000000 000=
00000  ................................
000001e0: 06101831 97535eb3 0000113d 00000000 000000a0 00000200 0000012d 000=
00000  1....^S.=3D...............-.......
00000200: 00000000 00000000 00000a6c 00000000 000001bb 00000000 4ae18dcf 000=
00000  ........l..................J....
00000220: 00000028 00000000 48e638a3 00000000 00000000 00000000 00000000 000=
00001  (........8.H....................
00000240: 000001f6 000001f6 000081ed 00000001 00000000 00000000 00000000 000=
00000  ................................
00000260: 00000000 00000001 00000000 00000000 00000000 00000000 00000000 000=
00000  ................................
00000280: 06101831 e472ac78 00001146 00000000 000000a8 00000200 000000f9 000=
00000  1...x.r.F.......................
000002a0: 00000000 00000000 000009cf 00000000 00000000 00000000 4ad832da 000=
00000  .........................2.J....
000002c0: 00000028 00000000 00000029 00000000 00000000 00000000 00000000 000=
00001  (.......).......................
000002e0: 00000000 00000000 00002192 00000001 00000008 00000000 00000000 000=
00000  .........!......................
00000300: 00000000 00000001 00000000 00000000 00000000 00000000 00000000 000=
00000  ................................
00000320: 00000501 00000000 06101831 86c47e1e 0000118a 00000000 000000a0 000=
00200  ........1....~..................
00000340: 0000009d 00000000 00000000 00000000 0000034d 00000000 001a8000 000=
00000  ................M...............
00000360: 4ae18dce 00000000 0000002e 00000000 0000002e 00000000 00000000 000=
00000  ...J............................
00000380: 00000000 00000001 000001f6 000001f6 00008180 00000001 00000000 000=
00000  ................................
000003a0: 00000000 00000000 00000000 00000001 00080000 00000000 00000000 000=
00000  ................................
000003c0: 00000000 00000000 06101831 e5072534 000011b7 00000000 000000a0 000=
00200  ........1...4%..................
000003e0: 0000009d 00000000 00000000 00000000 0000034d 00000000 001c1000 000=
00000  ................M...............
00000400: 4ae18dce 00000000 0000002e 00000000 0000002e 00000000 00000000 000=
00000  ...J............................
00000420: 00000000 00000001 000001f6 000001f6 00008180 00000001 00000000 000=
00000  ................................
00000440: 00000000 00000000 00000000 00000001 00000000 00000000 00000000 000=
00000  ................................
00000460: 00000000 00000000 06101831 3519e399 000011e2 00000000 000000a0 000=
00200  ........1......5................
00000480: 0000009d 00000000 00000000 00000000 0000034d 00000000 001d9000 000=
00000  ................M...............
000004a0: 4ae18dce 00000000 0000002f 00000000 0000002f 00000000 00000000 000=
00000  ...J..../......./...............
000004c0: 00000000 00000001 000001f6 000001f6 00008180 00000001 00000000 000=
00000  ................................
000004e0: 00000000 00000000 00000000 00000001 00000000 00000000 00000000 000=
00000  ................................
00000500: 00000000 00000000 06101831 69e6ee6f 0000120d 00000000 000000a0 000=
00200  ........1...o..i................
00000520: 0000009d 00000000 00000000 00000000 0000034d 00000000 001f1000 000=
00000  ................M...............
00000540: 4ae18dce 00000000 00000030 00000000 00000030 00000000 00000000 000=
00000  ...J....0.......0...............
00000560: 00000000 00000001 000001f6 000001f6 00008180 00000001 00000000 000=
00000  ................................
00000580: 00000000 00000000 00000000 00000001 00000000 00000000 00000000 000=
00000  ................................
000005a0: 00000000 00000000 06101831 0b258d72 00000000 00000000 0000001c 000=
00005  ........1...r.%.................
000005c0: 0000003c 00000000 00000000 00000000 00000000 00400000 00000000 000=
00000  <.....................@.........
000005e0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000  ................................
UBIFS error (pid 903): ubifs_scan: LEB 12 scanning failed
UBIFS error (pid 903): do_commit: commit failed, error -117
UBIFS warning (pid 903): ubifs_ro_mode: switched to read-only mode, error -1=
17
[<c00299b0>] (dump_stack+0x0/0x14) from [<c00f226c>] (ubifs_ro_mode+0x58/0x6=
8)
[<c00f2214>] (ubifs_ro_mode+0x0/0x68) from [<c00fe39c>] (do_commit+0x760/0x7=
80)
 r4:ffffff8b
[<c00fdc3c>] (do_commit+0x0/0x780) from [<c00fe448>] (ubifs_run_commit+0x8c/=
0xa0)
 r8:c1dd18c0 r7:c1c9f800 r6:fffffff5 r5:c1c9f8d8 r4:c1c9f800
[<c00fe3bc>] (ubifs_run_commit+0x0/0xa0) from [<c00e62fc>] (make_reservation=
+0x44c/0x558)
 r5:fffffff5 r4:00003600
[<c00e5eb0>] (make_reservation+0x0/0x558) from [<c00e7124>] (ubifs_jnl_write=
_data+0x1b4/0x2d4)
[<c00e6f70>] (ubifs_jnl_write_data+0x0/0x2d4) from [<c00e9660>] (do_writepag=
e+0xbc/0x204)
[<c00e95a4>] (do_writepage+0x0/0x204) from [<c00eaa84>] (ubifs_writepage+0x1=
ec/0x224)
[<c00ea898>] (ubifs_writepage+0x0/0x224) from [<c0068668>] (__writepage+0x1c=
/0x6c)
[<c006864c>] (__writepage+0x0/0x6c) from [<c0068d24>] (write_cache_pages+0x1=
e0/0x360)
 r4:00000001
[<c0068b44>] (write_cache_pages+0x0/0x360) from [<c0068ecc>] (generic_writep=
ages+0x28/0x38)
[<c0068ea4>] (generic_writepages+0x0/0x38) from [<c0068f24>] (do_writepages+=
0x48/0x60)
[<c0068edc>] (do_writepages+0x0/0x60) from [<c00a3290>] (__writeback_single_=
inode+0x154/0x2b0)
 r4:00000007
[<c00a313c>] (__writeback_single_inode+0x0/0x2b0) from [<c00a3798>] (generic=
_sync_sb_inodes+0x208/0x2fc)
[<c00a3590>] (generic_sync_sb_inodes+0x0/0x2fc) from [<c0102a28>] (ubifs_bud=
get_space+0x804/0xbe8)
[<c0102224>] (ubifs_budget_space+0x0/0xbe8) from [<c00ea480>] (ubifs_write_b=
egin+0x39c/0x52c)
[<c00ea0e4>] (ubifs_write_begin+0x0/0x52c) from [<c0063050>] (generic_file_b=
uffered_write+0x120/0x670)
[<c0062f34>] (generic_file_buffered_write+0x4/0x670) from [<c0063c68>] (__ge=
neric_file_aio_write_nolock+0x454/0x4c4)
[<c0063814>] (__generic_file_aio_write_nolock+0x0/0x4c4) from [<c0063d58>] (=
generic_file_aio_write+0x80/0xfc)
[<c0063cdc>] (generic_file_aio_write+0x4/0xfc) from [<c00e9060>] (ubifs_aio_=
write+0x1b4/0x218)
[<c00e8eb0>] (ubifs_aio_write+0x4/0x218) from [<c0085164>] (do_sync_write+0x=
c0/0x114)
[<c00850a4>] (do_sync_write+0x0/0x114) from [<c0085a88>] (vfs_write+0xb8/0x1=
44)
 r6:c1ebbf80 r5:00124708 r4:c1c81dc0
[<c00859d0>] (vfs_write+0x0/0x144) from [<c0085f5c>] (sys_write+0x4c/0x80)
 r7:00000004 r6:c1c81dc0 r5:00000000 r4:0029afd3
[<c0085f10>] (sys_write+0x0/0x80) from [<c0025ba0>] (ret_fast_syscall+0x0/0x=
2c)
 r6:00124708 r5:00000092 r4:00000092
UBIFS error (pid 903): do_writepage: cannot write page 491 of inode 157, err=
or -117
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 492, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 492, len 4096, key (=
157, data, 492)
UBIFS error (pid 903): make_reservation: cannot reserve 663 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 492 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 493, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 493, len 4096, key (=
157, data, 493)
UBIFS error (pid 903): make_reservation: cannot reserve 667 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 493 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 494, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 494, len 4096, key (=
157, data, 494)
UBIFS error (pid 903): make_reservation: cannot reserve 685 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 494 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 495, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 495, len 4096, key (=
157, data, 495)
UBIFS error (pid 903): make_reservation: cannot reserve 678 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 495 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 496, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 496, len 4096, key (=
157, data, 496)
UBIFS error (pid 903): make_reservation: cannot reserve 675 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 496 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 497, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 497, len 4096, key (=
157, data, 497)
UBIFS error (pid 903): make_reservation: cannot reserve 656 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 497 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 498, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 498, len 4096, key (=
157, data, 498)
UBIFS error (pid 903): make_reservation: cannot reserve 967 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 498 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 499, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 499, len 4096, key (=
157, data, 499)
UBIFS error (pid 903): make_reservation: cannot reserve 552 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 499 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 500, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 500, len 4096, key (=
157, data, 500)
UBIFS error (pid 903): make_reservation: cannot reserve 799 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 500 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 501, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 501, len 4096, key (=
157, data, 501)
UBIFS error (pid 903): make_reservation: cannot reserve 890 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 501 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 502, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 502, len 4096, key (=
157, data, 502)
UBIFS error (pid 903): make_reservation: cannot reserve 773 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 502 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_writepage: ino 157, pg 503, pg flags 0xb29
UBIFS DBG (pid 903): ubifs_jnl_write_data: ino 157, blk 503, len 4096, key (=
157, data, 503)
UBIFS error (pid 903): make_reservation: cannot reserve 758 bytes in jhead 2=
, error -30
UBIFS error (pid 903): do_writepage: cannot write page 503 of inode 157, err=
or -30
UBIFS DBG (pid 903): ubifs_write_inode: inode 157, mode 0x8180, nlink 1
UBIFS DBG (pid 903): ubifs_jnl_write_inode: ino 157, nlink 1
UBIFS error (pid 903): make_reservation: cannot reserve 160 bytes in jhead 1=
, error -30
UBIFS error (pid 903): ubifs_write_inode: can't write inode 157, error -30
UBIFS DBG (pid 903): shrink_liability: 1 pages were written back
UBIFS DBG (pid 903): ubifs_budget_space: try again
UBIFS DBG (pid 903): ubifs_write_end: ino 157, pos 2732032, pg 667, len 101,=
 copied 101, i_size 2732032
UBIFS DBG (pid 903): ubifs_dirty_inode: inode 157
UBIFS DBG (pid 914): ubifs_lookup: 'dmesg' in dir ino 384
UBIFS DBG (pid 914): ubifs_lookup_level0: search key (384, direntry, 0x11163=
d8b)
UBIFS DBG (pid 914): ubifs_lookup_level0: found 0, lvl 0, n 4
UBIFS DBG (pid 914): ubifs_lookup: not found
UBIFS DBG (pid 914): ubifs_lookup: 'dmesg' in dir ino 100
UBIFS DBG (pid 914): ubifs_lookup_level0: search key (100, direntry, 0x11163=
d8b)
UBIFS DBG (pid 914): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 914): ubifs_iget: inode 102
UBIFS DBG (pid 914): ubifs_lookup_level0: search key (102, inode)
UBIFS DBG (pid 914): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 914): ubifs_read_node_wbuf: LEB 61:7936, inode node, length 1=
67
UBIFS DBG (pid 914): ubifs_read_node: LEB 61:7936, inode node, length 167






Booting the Board For Second Time:




>Start PinPoint_Bootstrap_v_0_1...

SDRAM Micron 2x32MB


U-Boot 1.1.5 (Apr  8 2009 - 11:42:54)

RAM Configuration:
Bank #0: 20000000 32 MB
NAND:  NAND device: Manufacturer ID: 0x20, Chip ID: 0x75 ( NAND 32MiB 3,3V 8=
-bit)
32 MiB
End of Autonegociation

Write MAC address...

170:144:120:86:52:18=20

Hit any key to stop autoboot:  0 =08=08=08 0
U-Boot> RomBOOT

>Start PinPoint_Bootstrap_v_0_1...

SDRAM Micron 2x32MB


U-Boot 1.1.5 (Apr  8 2009 - 11:42:54)

RAM Configuration:
Bank #0: 20000000 32 MB
NAND:  NAND device: Manufacturer ID: 0x20, Chip ID: 0x75 ( NAND 32MiB 3,3V 8=
-bit)
32 MiB
End of Autonegociation

Write MAC address...

170:144:120:86:52:18=20

Hit any key to stop autoboot:  0=20

NAND read: device 0 offset 1048576, size 1536556 ...=20

Reading data from 0x100000 --   0% complete.
Reading data from 0x103c00 --   1% complete.
Reading data from 0x107800 --   2% complete.
Reading data from 0x10b400 --   3% complete.
Reading data from 0x10f000 --   4% complete.
Reading data from 0x112c00 --   5% complete.
Reading data from 0x116800 --   6% complete.
Reading data from 0x11a400 --   7% complete.
Reading data from 0x11e000 --   8% complete.
Reading data from 0x121c00 --   9% complete.
Reading data from 0x125800 --  10% complete.
Reading data from 0x129400 --  11% complete.
Reading data from 0x12d000 --  12% complete.
Reading data from 0x130c00 --  13% complete.
Reading data from 0x134800 --  14% complete.
Reading data from 0x138400 --  15% complete.
Reading data from 0x13c000 --  16% complete.
Reading data from 0x13fc00 --  17% complete.
Reading data from 0x143800 --  18% complete.
Reading data from 0x147400 --  19% complete.
Reading data from 0x14b000 --  20% complete.
Reading data from 0x14ec00 --  21% complete.
Reading data from 0x152800 --  22% complete.
Reading data from 0x156400 --  23% complete.
Reading data from 0x15a000 --  24% complete.
Reading data from 0x15dc00 --  25% complete.
Reading data from 0x161800 --  26% complete.
Reading data from 0x165400 --  27% complete.
Reading data from 0x169000 --  28% complete.
Reading data from 0x16cc00 --  29% complete.
Reading data from 0x170800 --  30% complete.
Reading data from 0x174400 --  31% complete.
Reading data from 0x178000 --  32% complete.
Reading data from 0x17bc00 --  33% complete.
Reading data from 0x17f800 --  34% complete.
Reading data from 0x183400 --  35% complete.
Reading data from 0x187000 --  36% complete.
Reading data from 0x18ac00 --  37% complete.
Reading data from 0x18e800 --  38% complete.
Reading data from 0x192400 --  39% complete.
Reading data from 0x196000 --  40% complete.
Reading data from 0x199c00 --  41% complete.
Reading data from 0x19d800 --  42% complete.
Reading data from 0x1a1400 --  43% complete.
Reading data from 0x1a5000 --  44% complete.
Reading data from 0x1a8c00 --  45% complete.
Reading data from 0x1ac800 --  46% complete.
Reading data from 0x1b0400 --  47% complete.
Reading data from 0x1b4000 --  48% complete.
Reading data from 0x1b7c00 --  49% complete.
Reading data from 0x1bb800 --  50% complete.
Reading data from 0x1bf400 --  51% complete.
Reading data from 0x1c3000 --  52% complete.
Reading data from 0x1c6c00 --  53% complete.
Reading data from 0x1ca800 --  54% complete.
Reading data from 0x1ce400 --  55% complete.
Reading data from 0x1d2000 --  56% complete.
Reading data from 0x1d5c00 --  57% complete.
Reading data from 0x1d9800 --  58% complete.
Reading data from 0x1dd400 --  59% complete.
Reading data from 0x1e1000 --  60% complete.
Reading data from 0x1e4c00 --  61% complete.
Reading data from 0x1e8800 --  62% complete.
Reading data from 0x1ec400 --  63% complete.
Reading data from 0x1f0000 --  64% complete.
Reading data from 0x1f3c00 --  65% complete.
Reading data from 0x1f7800 --  66% complete.
Reading data from 0x1fb400 --  67% complete.
Reading data from 0x1ff000 --  68% complete.
Reading data from 0x202c00 --  69% complete.
Reading data from 0x206800 --  70% complete.
Reading data from 0x20a400 --  71% complete.
Reading data from 0x20e000 --  72% complete.
Reading data from 0x211c00 --  73% complete.
Reading data from 0x215800 --  74% complete.
Reading data from 0x219400 --  75% complete.
Reading data from 0x21d000 --  76% complete.
Reading data from 0x220c00 --  77% complete.
Reading data from 0x224800 --  78% complete.
Reading data from 0x228400 --  79% complete.
Reading data from 0x22c000 --  80% complete.
Reading data from 0x22fc00 --  81% complete.
Reading data from 0x233800 --  82% complete.
Reading data from 0x237400 --  83% complete.
Reading data from 0x23b000 --  84% complete.
Reading data from 0x23ec00 --  85% complete.
Reading data from 0x242800 --  86% complete.
Reading data from 0x246400 --  87% complete.
Reading data from 0x24a000 --  88% complete.
Reading data from 0x24dc00 --  89% complete.
Reading data from 0x251800 --  90% complete.
Reading data from 0x255400 --  91% complete.
Reading data from 0x259000 --  92% complete.
Reading data from 0x25ce00 --  93% complete.
Reading data from 0x260a00 --  94% complete.
Reading data from 0x264600 --  95% complete.
Reading data from 0x268200 --  96% complete.
Reading data from 0x26be00 --  97% complete.
Reading data from 0x26fa00 --  98% complete.
Reading data from 0x273600 --  99% complete.
Reading data from 0x277200 -- 100% complete.
OK
## Booting image at 21a00000 ...
   Image Name:   Linux-2.6.27
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1536492 Bytes =3D  1.5 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
OK

Starting kernel ...

Uncompressing Linux.........................................................=
.......................................... done, booting the kernel.
Linux version 2.6.27 (rithesh@compiler.tes.in) (gcc version 4.1.0 20060304 (=
TimeSys 4.1.0-3)) #15 Mon Oct 26 17:27:26 IST 2009
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
Machine: Atmel AT91SAM9260-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: PLLA overclocked, 221 MHz
Clocks: CPU 221 MHz, master 110 MHz, main 18.432 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
CPU0: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 8128
Kernel command line: 'console=3DttyS0,115200 ubi.mtd=3D5 root=3Dubi0:rootfs =
rootfstype=3Dubifs rw'
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 128 (order: 7, 512 bytes)
Console: colour dummy device 80x30
console [tty0] enabled
console [ttyS0] enabled
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 32MB =3D 32MB total
Memory: 29276KB available (2824K code, 218K data, 116K init)
Calibrating delay loop... 110.18 BogoMIPS (lpj=3D550912)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 288 bytes
NET: Registered protocol family 16
AT91: Power Management
AT91: Starting after user reset
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 1024 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
NET: Registered protocol family 1
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.
msgmni has been set to 57
io scheduler noop registered
io scheduler anticipatory registered (default)
keypad V11: starting init
keypad: end init
rotary v12: starting init
setting trigger mode 1 for irq 42 failed (gpio_irq_type+0x0/0x24)
rotary: can't get assigned irq 42
rotary: Unregister=20
Trying to free already-free IRQ 42
Trying to free already-free IRQ 43
infrared v9: starting init
infrared: end init
Register driver gpio v6=20
gpio : init driver done=20
analog v3: starting init
setting trigger mode 3 for irq 5 failed (at91_aic_set_type+0x0/0xcc)
analog: can't get assigned irq 5
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq =3D 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq =3D 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq =3D 7) is a ATMEL_SERIAL
brd: module loaded
MACB_mii_bus: probed
eth0: Atmel MACB at 0xfffc4000 irq 21 (12:34:56:78:90:aa)
eth0: attached PHY driver [Generic PHY] (mii_bus:phy_addr=3Dffffffff:00, irq=
=3D-1)
Driver 'sd' needs updating - please use bus_type methods
NAND device: Manufacturer ID: 0x20, Chip ID: 0x75 (ST Micro NAND 32MiB 3,3V =
8-bit)
AT91 NAND: 8-bit, net ECC
Scanning device for bad blocks
Creating 6 MTD partitions on "atmel_nand":
0x00000000-0x00020000 : "Bootstrap"
0x00020000-0x00060000 : "u-boot binary"
0x00060000-0x00080000 : "u-boot env"
0x00080000-0x00100000 : "None"
0x00100000-0x00500000 : "Linux Binary"
0x00500000-0x02000000 : "UBIFS FS"
UBI: attaching mtd5 to ubi0
UBI: physical eraseblock size:   16384 bytes (16 KiB)
UBI: logical eraseblock size:    15360 bytes
UBI: smallest flash I/O unit:    512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                1024
UBI: attached mtd5 to ubi0
UBI: MTD device name:            "UBIFS FS"
UBI: MTD device size:            27 MiB
UBI: number of good PEBs:        1728
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       89
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1728
UBI: number of PEBs reserved for bad PEB handling: 85
UBI: max/mean erase counter: 1/0
UBI: background thread "ubi_bgt0d" started, PID 745
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
udc: at91_udc version 3 May 2006
mice: PS/2 mouse device common for all mice
rtc-at91sam9 at91_rtt.0: rtc core: registered at91_rtt as rtc0
rtc-at91sam9 at91_rtt.0: rtc0: SET TIME!
i2c /dev entries driver
i2c-gpio i2c-gpio: using pins 55 (SDA) and 56 (SCL)
at91sam9_wdt: invalid timeout (must be between 1 and 16)
TCP cubic registered
NET: Registered protocol family 17
rtc-at91sam9 at91_rtt.0: hctosys: unable to read the hardware clock
UBI error: ubi_io_read: error -74 while reading 15360 bytes from PEB 3:1024,=
 read 15360 bytes
UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0x7a264d91, read =
0xd5655ce7
UBIFS error (pid 1): ubifs_check_node: bad node at LEB 2:512
[<c00299b0>] (dump_stack+0x0/0x14) from [<c00f25c4>] (ubifs_check_node+0x278=
/0x2b4)
[<c00f234c>] (ubifs_check_node+0x0/0x2b4) from [<c00f9d34>] (ubifs_scan_a_no=
de+0x178/0x2d4)
 r8:00000000 r7:00000200 r6:c1c9f800 r5:c28ef200 r4:00000001
[<c00f9bbc>] (ubifs_scan_a_node+0x0/0x2d4) from [<c00f9f18>] (ubifs_scan+0x8=
8/0x288)
[<c00f9e90>] (ubifs_scan+0x0/0x288) from [<c00f8900>] (ubifs_read_master+0xa=
0/0xdd8)
[<c00f8860>] (ubifs_read_master+0x0/0xdd8) from [<c00eec9c>] (ubifs_fill_sup=
er+0x9a0/0x1424)
[<c00ee2fc>] (ubifs_fill_super+0x0/0x1424) from [<c00f07b4>] (ubifs_get_sb+0=
x26c/0x2e8)
[<c00f0548>] (ubifs_get_sb+0x0/0x2e8) from [<c00873f0>] (vfs_kern_mount+0x58=
/0xac)
[<c0087398>] (vfs_kern_mount+0x0/0xac) from [<c00874a0>] (do_kern_mount+0x3c=
/0xd8)
 r8:c02f3d54 r7:c1e55000 r6:00000000 r5:c1e57000 r4:00008000
[<c0087464>] (do_kern_mount+0x0/0xd8) from [<c009d6b8>] (do_new_mount+0x5c/0=
x8c)
 r8:c1e57000 r7:00000000 r6:c1c17ecc r5:c1e55000 r4:00008000
[<c009d65c>] (do_new_mount+0x0/0x8c) from [<c009d858>] (do_mount+0x170/0x198=
)
 r7:c1e56000 r6:c1c17ecc r5:00000000 r4:00008000
[<c009d6e8>] (do_mount+0x0/0x198) from [<c009d90c>] (sys_mount+0x8c/0xd4)
[<c009d880>] (sys_mount+0x0/0xd4) from [<c0008f9c>] (mount_block_root+0xf8/0=
x29c)
 r7:c1ca5000 r6:00000000 r5:c1ca5006 r4:c1ca5000
[<c0008ea4>] (mount_block_root+0x0/0x29c) from [<c000924c>] (prepare_namespa=
ce+0xa0/0x1d8)
[<c00091ac>] (prepare_namespace+0x0/0x1d8) from [<c000892c>] (kernel_init+0x=
b0/0xd8)
 r5:c0021cb0 r4:c03019b8
[<c000887c>] (kernel_init+0x0/0xd8) from [<c003eac4>] (do_exit+0x0/0x6f4)
 r5:00000000 r4:00000000
UBIFS error (pid 1): ubifs_scan: bad node
UBIFS error (pid 1): ubifs_scanned_corruption: corrupted data at LEB 2:512
UBIFS error (pid 1): ubifs_scanned_corruption: first 4096 bytes from LEB 2:5=
12
UBIFS error (pid 1): ubifs_scan: LEB 2 scanning failed
UBI error: ubi_io_read: error -74 while reading 15360 bytes from PEB 3:1024,=
 read 15360 bytes
UBIFS: recovery needed
UBI error: ubi_io_read: error -74 while reading 15360 bytes from PEB 5:1024,=
 read 15360 bytes
UBI error: ubi_io_read: error -74 while reading 1024 bytes from PEB 15:15360=
, read 1024 bytes
UBI error: ubi_io_read: error -74 while reading 3072 bytes from PEB 314:1331=
2, read 3072 bytes
UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0xe0d0fe02, read =
0xe3542a6c
UBIFS error (pid 1): ubifs_check_node: bad node at LEB 312:12624
[<c00299b0>] (dump_stack+0x0/0x14) from [<c00f25c4>] (ubifs_check_node+0x278=
/0x2b4)
[<c00f234c>] (ubifs_check_node+0x0/0x2b4) from [<c00f9d34>] (ubifs_scan_a_no=
de+0x178/0x2d4)
 r8:00000000 r7:00003150 r6:c1c9f800 r5:c28f2150 r4:00000001
[<c00f9bbc>] (ubifs_scan_a_node+0x0/0x2d4) from [<c010d03c>] (ubifs_recover_=
leb+0x114/0x938)
[<c010cf28>] (ubifs_recover_leb+0x0/0x938) from [<c00fac18>] (ubifs_replay_j=
ournal+0x7cc/0x1948)
[<c00fa44c>] (ubifs_replay_journal+0x0/0x1948) from [<c00eed64>] (ubifs_fill=
_super+0xa68/0x1424)
[<c00ee2fc>] (ubifs_fill_super+0x0/0x1424) from [<c00f07b4>] (ubifs_get_sb+0=
x26c/0x2e8)
[<c00f0548>] (ubifs_get_sb+0x0/0x2e8) from [<c00873f0>] (vfs_kern_mount+0x58=
/0xac)
[<c0087398>] (vfs_kern_mount+0x0/0xac) from [<c00874a0>] (do_kern_mount+0x3c=
/0xd8)
 r8:c02f3d54 r7:c1e55000 r6:00000000 r5:c1e57000 r4:00008000
[<c0087464>] (do_kern_mount+0x0/0xd8) from [<c009d6b8>] (do_new_mount+0x5c/0=
x8c)
 r8:c1e57000 r7:00000000 r6:c1c17ecc r5:c1e55000 r4:00008000
[<c009d65c>] (do_new_mount+0x0/0x8c) from [<c009d858>] (do_mount+0x170/0x198=
)
 r7:c1e56000 r6:c1c17ecc r5:00000000 r4:00008000
[<c009d6e8>] (do_mount+0x0/0x198) from [<c009d90c>] (sys_mount+0x8c/0xd4)
[<c009d880>] (sys_mount+0x0/0xd4) from [<c0008f9c>] (mount_block_root+0xf8/0=
x29c)
 r7:c1ca5000 r6:00000000 r5:c1ca5006 r4:c1ca5000
[<c0008ea4>] (mount_block_root+0x0/0x29c) from [<c000924c>] (prepare_namespa=
ce+0xa0/0x1d8)
[<c00091ac>] (prepare_namespace+0x0/0x1d8) from [<c000892c>] (kernel_init+0x=
b0/0xd8)
 r5:c0021cb0 r4:c03019b8
[<c000887c>] (kernel_init+0x0/0xd8) from [<c003eac4>] (do_exit+0x0/0x6f4)
 r5:00000000 r4:00000000
UBIFS error (pid 1): ubifs_recover_leb: bad node
UBIFS error (pid 1): ubifs_scanned_corruption: corrupted data at LEB 312:126=
24
UBIFS error (pid 1): ubifs_scanned_corruption: first 2736 bytes from LEB 312=
:12624
UBIFS error (pid 1): ubifs_recover_leb: LEB 312 scanning failed
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
Please append a correct "root=3D" boot option; here are the available partit=
ions:
1f00        128 mtdblock0 (driver?)
1f01        256 mtdblock1 (driver?)
1f02        128 mtdblock2 (driver?)
1f03        512 mtdblock3 (driver?)
1f04       4096 mtdblock4 (driver?)
1f05      27648 mtdblock5 (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,=
0)



--=_nzx8g4og6bk--
