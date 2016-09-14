Received: from mail-eopbgr10118.outbound.protection.outlook.com
 ([40.107.1.118] helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bk5Yr-00077h-6T
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 08:29:32 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Richard
 Weinberger" <richard@nod.at>
Subject: UBIFS - strange behaviour after enabling chk_index
Date: Wed, 14 Sep 2016 08:28:29 +0000
Message-ID: <AM4PR0701MB213063EE7BE9DDE08ADAB177FEF10@AM4PR0701MB2130.eurprd07.prod.outlook.com>
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

(Plain text now)

Hi Richard, list

During some power-cut tests I accidently came across strange case.
The test script is here (I could attach it this in thread later).

http://pastebin.com/daNrf6yG

Result of running this on HW and Qemu is the same, and it ends like below (=
logs from Qemu).

It does not reproduce if I use flash with 256KiB sectors (both Qemu and HW)=
,
or do not enable index integrity checks.
Could it be real life case?

root@qemu:~# ./same_file.sh=20
[=A0=A0 28.939927] ubi0: attaching mtd4
[=A0=A0 29.038279] ubi0: scanning is finished
[=A0=A0 29.038717] ubi0: empty MTD device detected
[=A0=A0 29.081212] device: 'ubi0': device_add
[=A0=A0 29.083301] ubi0: attached mtd4 (name "ubi", size 62 MiB)
[=A0=A0 29.083478] ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 by=
tes
[=A0=A0 29.084060] ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
[=A0=A0 29.084270] ubi0: VID header offset: 64 (aligned 64), data offset: 1=
28
[=A0=A0 29.084452] ubi0: good PEBs: 996, bad PEBs: 0, corrupted PEBs: 0
[=A0=A0 29.084628] ubi0: user volume: 0, internal volumes: 1, max. volumes =
count: 128
[=A0=A0 29.084835] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, i=
mage sequence number: 1271795826
[=A0=A0 29.085095] ubi0: available PEBs: 992, total reserved PEBs: 4, PEBs =
reserved for bad PEB handling: 0
[=A0=A0 29.104736] ubi0: background thread "ubi_bgt0d" started, PID 312
UBI device number 0, total 996 LEBs (65146368 bytes, 62.1 MiB), available 9=
92 LEBs (64884736 [=A0=A0 29.268204] device: 'ubi0_0': device_add
[=A0=A0 29.292204] device: 'mtd7': device_add
[=A0=A0 29.324205] device: 'mtd7ro': device_add
[=A0=A0 29.326111] device: '31:7': device_add
[=A0=A0 29.326617] device: 'mtdblock7': device_add
bytes, 61.9 MiB), LEB size 65408 bytes (63.9 KiB)
Volume ID 0, size 161 LEBs (10530688 bytes[=A0=A0 29.556089] device: 'ubifs=
_0_0': device_add
[=A0=A0 29.627573] UBIFS (ubi0:0): default file-system created
[=A0=A0 29.653269] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started=
, PID 317
[=A0=A0 29.696687] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, n=
ame "ubifs_vol"
[=A0=A0 29.697085] UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB), min./max=
. I/O unit sizes: 8 bytes/256 bytes
[=A0=A0 29.697539] UBIFS (ubi0:0): FS size: 9876608 bytes (9 MiB, 151 LEBs)=
, journal size 523265 bytes (0 MiB, 8 LEBs)
[=A0=A0 29.697999] UBIFS (ubi0:0): reserved for root: 466496 bytes (455 KiB=
)
[=A0=A0 29.698668] UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), U=
UID 58BD7596-296F-4179-AED9-A57E457F961D, small LPT model
, 10.0 MiB), LEB size 65408 bytes (63.9 KiB), dynamic, name "ubifs_vol", al=
ignment 1
Generat[=A0=A0 30.049759] random: nonblocking pool is initialized
ing file...
5+0 records in
5+0 records out
Copying same file 1...
Copying same file 2...
Copying same file 3...
Deleting files
Generating new file...
5+0 records in
5+0 records out
Copying new file...
[=A0=A0 63.056570] UBIFS error (ubi0:0 pid 325): ubifs_read_node: bad node =
type (255 but expected 9)
[=A0=A0 63.056934] UBIFS error (ubi0:0 pid 325): ubifs_read_node: bad node =
at LEB 10:0, LEB mapping status 0
[=A0=A0 63.057301] Not a node, first 24 bytes:
[=A0=A0 63.058093] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff f=
f ff ff ff ff ff ff ff ff=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ........................
[=A0=A0 63.058720] CPU: 0 PID: 325 Comm: cp Not tainted 4.4.0 #20
[=A0=A0 63.058878] Hardware name: Nokia-Nahka (Device Tree Support)
[=A0=A0 63.060141] [<c0012515>] (unwind_backtrace) from [<c00100e3>] (show_=
stack+0xb/0xc)
[=A0=A0 63.060612] [<c00100e3>] (show_stack) from [<c0120501>] (dump_stack+=
0x51/0x64)
[=A0=A0 63.060809] [<c0120501>] (dump_stack) from [<c00e0add>] (ubifs_read_=
node+0x221/0x25c)
[=A0=A0 63.061016] [<c00e0add>] (ubifs_read_node) from [<c00e75dd>] (dbg_ch=
eck_old_index+0x85/0x2f8)
[=A0=A0 63.061233] [<c00e75dd>] (dbg_check_old_index) from [<c00e7a37>] (do=
_commit+0x1e7/0x444)
[=A0=A0 63.061484] [<c00e7a37>] (do_commit) from [<c00d68d5>] (make_reserva=
tion+0x395/0x420)
[=A0=A0 63.061744] [<c00d68d5>] (make_reservation) from [<c00d7049>] (ubifs=
_jnl_write_data+0x139/0x244)
[=A0=A0 63.062052] [<c00d7049>] (ubifs_jnl_write_data) from [<c00d83ef>] (d=
o_writepage+0x87/0x158)
[=A0=A0 63.062327] [<c00d83ef>] (do_writepage) from [<c005cc4f>] (__writepa=
ge+0xb/0x24)
[=A0=A0 63.062570] [<c005cc4f>] (__writepage) from [<c005d1b7>] (write_cach=
e_pages+0x157/0x1e0)
[=A0=A0 63.062819] [<c005d1b7>] (write_cache_pages) from [<c005d261>] (gene=
ric_writepages+0x21/0x34)
[=A0=A0 63.063040] [<c005d261>] (generic_writepages) from [<c005833d>] (__f=
ilemap_fdatawrite_range+0x57/0x66)
[=A0=A0 63.063267] [<c005833d>] (__filemap_fdatawrite_range) from [<c00583f=
1>] (filemap_write_and_wait_range+0x21/0x4e)
[=A0=A0 63.063548] [<c00583f1>] (filemap_write_and_wait_range) from [<c00d8=
911>] (ubifs_fsync+0x53/0xa2)
[=A0=A0 63.064021] [<c00d8911>] (ubifs_fsync) from [<c0058ba3>] (generic_fi=
le_write_iter+0x183/0x1a0)
[=A0=A0 63.064204] [<c0058ba3>] (generic_file_write_iter) from [<c00d98ab>]=
 (ubifs_write_iter+0xa7/0xfc)
[=A0=A0 63.064487] [<c00d98ab>] (ubifs_write_iter) from [<c0078ebd>] (vfs_i=
ter_write+0x4f/0x6e)
[=A0=A0 63.064717] [<c0078ebd>] (vfs_iter_write) from [<c0091e25>] (iter_fi=
le_splice_write+0x149/0x1e8)
[=A0=A0 63.065065] [<c0091e25>] (iter_file_splice_write) from [<c0092041>] =
(direct_splice_actor+0x1d/0x24)
[=A0=A0 63.065433] [<c0092041>] (direct_splice_actor) from [<c0091a39>] (sp=
lice_direct_to_actor+0xb5/0x142)
[=A0=A0 63.065798] [<c0091a39>] (splice_direct_to_actor) from [<c0091b1b>] =
(do_splice_direct+0x55/0x76)
[=A0=A0 63.066159] [<c0091b1b>] (do_splice_direct) from [<c0079797>] (do_se=
ndfile+0x10b/0x218)
[=A0=A0 63.066554] [<c0079797>] (do_sendfile) from [<c0079dc7>] (SyS_sendfi=
le64+0xc5/0xca)
[=A0=A0 63.066881] [<c0079dc7>] (SyS_sendfile64) from [<c000d9a1>] (ret_fas=
t_syscall+0x1/0x4c)
[=A0=A0 63.067389] UBIFS error (ubi0:0 pid 325): dbg_check_old_index: faile=
d, error -22
[=A0=A0 63.067724] UBIFS error (ubi0:0 pid 325): do_commit: commit failed, =
error -22
[=A0=A0 63.068106] UBIFS warning (ubi0:0 pid 325): ubifs_ro_mode: switched =
to read-only mode, error -22
[=A0=A0 63.068473] CPU: 0 PID: 325 Comm: cp Not tainted 4.4.0 #20
[=A0=A0 63.068697] Hardware name: Nokia-Nahka (Device Tree Support)
[=A0=A0 63.068964] [<c0012515>] (unwind_backtrace) from [<c00100e3>] (show_=
stack+0xb/0xc)
[=A0=A0 63.069284] [<c00100e3>] (show_stack) from [<c0120501>] (dump_stack+=
0x51/0x64)
[=A0=A0 63.069598] [<c0120501>] (dump_stack) from [<c00e7c6f>] (do_commit+0=
x41f/0x444)
[=A0=A0 63.069917] [<c00e7c6f>] (do_commit) from [<c00d68d5>] (make_reserva=
tion+0x395/0x420)
[=A0=A0 63.070242] [<c00d68d5>] (make_reservation) from [<c00d7049>] (ubifs=
_jnl_write_data+0x139/0x244)
[=A0=A0 63.070606] [<c00d7049>] (ubifs_jnl_write_data) from [<c00d83ef>] (d=
o_writepage+0x87/0x158)
[=A0=A0 63.070928] [<c00d83ef>] (do_writepage) from [<c005cc4f>] (__writepa=
ge+0xb/0x24)
[=A0=A0 63.071234] [<c005cc4f>] (__writepage) from [<c005d1b7>] (write_cach=
e_pages+0x157/0x1e0)
[=A0=A0 63.071557] [<c005d1b7>] (write_cache_pages) from [<c005d261>] (gene=
ric_writepages+0x21/0x34)
[=A0=A0 63.071894] [<c005d261>] (generic_writepages) from [<c005833d>] (__f=
ilemap_fdatawrite_range+0x57/0x66)
[=A0=A0 63.072272] [<c005833d>] (__filemap_fdatawrite_range) from [<c00583f=
1>] (filemap_write_and_wait_range+0x21/0x4e)
[=A0=A0 63.072671] [<c00583f1>] (filemap_write_and_wait_range) from [<c00d8=
911>] (ubifs_fsync+0x53/0xa2)
[=A0=A0 63.073030] [<c00d8911>] (ubifs_fsync) from [<c0058ba3>] (generic_fi=
le_write_iter+0x183/0x1a0)
[=A0=A0 63.073284] [<c0058ba3>] (generic_file_write_iter) from [<c00d98ab>]=
 (ubifs_write_iter+0xa7/0xfc)
[=A0=A0 63.073540] [<c00d98ab>] (ubifs_write_iter) from [<c0078ebd>] (vfs_i=
ter_write+0x4f/0x6e)
[=A0=A0 63.073894] [<c0078ebd>] (vfs_iter_write) from [<c0091e25>] (iter_fi=
le_splice_write+0x149/0x1e8)
[=A0=A0 63.074096] [<c0091e25>] (iter_file_splice_write) from [<c0092041>] =
(direct_splice_actor+0x1d/0x24)
[=A0=A0 63.074307] [<c0092041>] (direct_splice_actor) from [<c0091a39>] (sp=
lice_direct_to_actor+0xb5/0x142)
[=A0=A0 63.074510] [<c0091a39>] (splice_direct_to_actor) from [<c0091b1b>] =
(do_splice_direct+0x55/0x76)
[=A0=A0 63.074707] [<c0091b1b>] (do_splice_direct) from [<c0079797>] (do_se=
ndfile+0x10b/0x218)
[=A0=A0 63.074898] [<c0079797>] (do_sendfile) from [<c0079dc7>] (SyS_sendfi=
le64+0xc5/0xca)
[=A0=A0 63.075085] [<c0079dc7>] (SyS_sendfile64) from [<c000d9a1>] (ret_fas=
t_syscall+0x1/0x4c)
[=A0=A0 63.075366] UBIFS error (ubi0:0 pid 325): do_writepage: cannot write=
 page 45 of inode 68, error -22
cp: write error: Read-only file system
New file cp failed
root@qemu:~# [=A0=A0 92.894358] UBIFS error (ubi0:0 pid 6): make_reservatio=
n: cannot reserve 4144 bytes in jhead 2, error -30
[=A0=A0 92.894802] UBIFS error (ubi0:0 pid 6): do_writepage: cannot write p=
age 46 of inode 68, error -30
[=A0=A0 92.895396] UBIFS error (ubi0:0 pid 6): make_reservation: cannot res=
erve 160 bytes in jhead 1, error -30
[=A0=A0 92.895899] UBIFS error (ubi0:0 pid 6): ubifs_write_inode: can't wri=
te inode 68, error -30
[=A0=A0 97.894231] UBIFS error (ubi0:0 pid 6): make_reservation: cannot res=
erve 4144 bytes in jhead 2, error -30
[=A0=A0 97.894675] UBIFS error (ubi0:0 pid 6): do_writepage: cannot write p=
age 47 of inode 68, error -30

Regards,
Marcin
