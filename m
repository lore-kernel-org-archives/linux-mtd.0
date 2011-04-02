Received: from szxga04-in.huawei.com ([119.145.14.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5qSE-000768-Sa
	for linux-mtd@lists.infradead.org; Sat, 02 Apr 2011 02:20:52 +0000
Received: from huawei.com (szxga04-in [172.24.2.12])
	by szxga04-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0LJ000KH26IHAF@szxga04-in.huawei.com> for
	linux-mtd@lists.infradead.org; Sat, 02 Apr 2011 10:20:41 +0800 (CST)
Received: from szxeml206-edg.china.huawei.com ([172.24.2.119])
	by szxga04-in.huawei.com
	(iPlanet Messaging Server 5.2 HotFix 2.14 (built Aug  8 2006))
	with ESMTP id <0LJ00065B6IGZN@szxga04-in.huawei.com> for
	linux-mtd@lists.infradead.org; Sat, 02 Apr 2011 10:20:40 +0800 (CST)
Date: Sat, 02 Apr 2011 02:20:34 +0000
From: Caizhiyong <caizhiyong@huawei.com>
Subject: I meet a problem
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-id: <C3050A4DBA34F345975765E43127F10F02CDC9@SZXEML506-MBS.china.huawei.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: zh-CN
Content-transfer-encoding: 7BIT
Cc: "tony.taoyong@hisilicon" <tony.taoyong@hisilicon.huawei.com>,
	"Jiangzhonglin\(Jiangzhonglin\)" <jiangzhonglin@huawei.com>,
	Quyaxin <quyaxin@huawei.com>, Renxincun <renxincun@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi, Artem
    I found a problem when I test ubifs on unclean reboot,my test method is that:read,write,and delete ubifs files many times , when I'm  writing or deleting the files ,I 

reboot the system, sometimes the rootfs is broken,but if I reset the power of board,the rootfs is ok. 


my environment:
my UBI and UBIFS is porting from linux2.6.38 ,and linux kernel is linux 2.6.35,and use the following seven patches :http://patchwork.ozlabs.org/patch/85935/ .UBIFS is rootfs, 

and I make unclean reboot test in /tmp ,my ubi partition size is 450M bytes. flash is a SLC nand flash,flash information is following:

Nand ID: 0xAD 0xDC 0x10 0x95 0x54 0xAD 0xDC 0x10
Nand(Hardware): Block:128K Page:2K Ecc:1bit Chip:512M*1 OOB:64Byte
NAND device: Manufacturer ID: 0xad, Chip ID: 0xdc (Hynix NAND 512MiB 3,3V 8-bit)


I run my ubifs test in background,and wait for random seconds ,then reboot the system, make this many times, then some boards will be error when I reboot the system,the debug 

info is following:

delete files
delete 2594 files

write disk 15091695 file 40023umount: tmpfs busy - remounted read-only
write disk 15131718 file 40076UBIFS error (pid 11300): dbg_check_space_info: free space changed from 424404213 to 424396165
UBIFS: saved lprops statistics dump
UBIFS: current lprops statistics dump
UBIFS assert failed in dbg_dump_budg at 613 (pid 11300)
[<c00284bc>] (unwind_backtrace+0x0/0xfc) from [<c018a770>] (dbg_dump_budg+0x220/0x2dc)
[<c018a770>] (dbg_dump_budg+0x220/0x2dc) from [<c018a8dc>] (dbg_check_space_info+0xb0/0xc0)
[<c018a8dc>] (dbg_check_space_info+0xb0/0xc0) from [<c015b4ac>] (ubifs_remount_fs+0x428/0x8dc)
[<c015b4ac>] (ubifs_remount_fs+0x428/0x8dc) from [<c00949b0>] (do_remount_sb+0x6c/0x11c)
[<c00949b0>] (do_remount_sb+0x6c/0x11c) from [<c00aae00>] (do_mount+0x468/0x708)
[<c00aae00>] (do_mount+0x468/0x708) from [<c00ab124>] (sys_mount+0x84/0xc4)
[<c00ab124>] (sys_mount+0x84/0xc4) from [<c0021ec0>] (ret_fast_syscall+0x0/0x30)
[<c00284bc>] (unwind_backtrace+0x0/0xfc) from [<c018a8e0>] (dbg_check_space_info+0xb4/0xc0)
[<c018a8e0>] (dbg_check_space_info+0xb4/0xc0) from [<c015b4ac>] (ubifs_remount_fs+0x428/0x8dc)
[<c015b4ac>] (ubifs_remount_fs+0x428/0x8dc) from [<c00949b0>] (do_remount_sb+0x6c/0x11c)
[<c00949b0>] (do_remount_sb+0x6c/0x11c) from [<c00aae00>] (do_mount+0x468/0x708)
[<c00aae00>] (do_mount+0x468/0x708) from [<c00ab124>] (sys_mount+0x84/0xc4)
[<c00ab124>] (sys_mount+0x84/0xc4) from [<c0021ec0>] (ret_fast_syscall+0x0/0x30)
UBIFS warning (pid 11300): ubifs_ro_mode: switched to read-only mode, error -22
[<c00284bc>] (unwind_backtrace+0x0/0xfc) from [<c015b4bc>] (ubifs_remount_fs+0x438/0x8dc)
[<c015b4bc>] (ubifs_remount_fs+0x438/0x8dc) from [<c00949b0>] (do_remount_sb+0x6c/0x11c)
[<c00949b0>] (do_remount_sb+0x6c/0x11c) from [<c00aae00>] (do_mount+0x468/0x708)
[<c00aae00>] (do_mount+0x468/0x708) from [<c00ab124>] (sys_mount+0x84/0xc4)
[<c00ab124>] (sys_mount+0x84/0xc4) from [<c0021ec0>] (ret_fast_syscall+0x0/0x30)
Unable to handle kernel NULL pointer dereference at virtual address 00000124
pgd = c53bc000
[00000124] *pgd=85378031, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1]
last sysfs file: /sys/devices/virtual/usbmon/usbmon0/dev
Modules linked in:
CPU: 0    Not tainted  
PC is at ubifs_wbuf_add_ino_nolock+0x0/0x2c
LR is at ubifs_jnl_write_data+0x180/0x308
pc : [<c015feec>]    lr : [<c01551c8>]    psr: 60000013
sp : c5837dd8  ip : c52ab2d8  fp : 00002c25
r10: 00001030  r9 : 0001b800  r8 : c5837e28
r7 : c523d000  r6 : 00000ef8  r5 : 00000000  r4 : c5360000
r3 : 000000d9  r2 : 00000000  r1 : 00005711  r0 : 00000120
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 10c53c7d  Table: 853bc059  DAC: 00000015

PC: 0xc015fe6c:
fe6c  e58dc000 e59110d8 eb08db71 e595c58c eafffb70 e1a0000d e3c0cd7f e3cc603f
fe8c  e30d0958 e51f2ed0 e34c0045 e596400c e59410d8 eb08db66 eafffd35 e1a0300d
feac  e3c32d7f e3c2e03f e59d0058 e1a03007 e51f2efc e59e600c e240c001 e08c7007
fecc  e30d0910 e58d7000 e34c0045 e59610d8 eb08db57 eafffc3e eb08db1e eaffffd4
feec  e5903004 e3530000 012fff1e e5903014 e3530000 1590307c 1590c080 12832001
ff0c  178c1103 1580207c e12fff1e e92d4010 e5d04598 e2043004 e6ef3073 e3530000
ff2c  18bd8010 e590c000 e1a0e00d e3ce2d7f e5d0e174 e3c2203f e3844004 e7c1e093
ff4c  e5c04598 e5c0e174 e1a03001 e59ce034 e30d0dc4 e34c0045 e38e1001 e58c1034

LR: 0xc0155148:
5148  ebfff57a e2505000 0a000004 e1a00004 ebfce705 e1a00005 e28dd024 e8bd8ff0
5168  e597113c e596c000 e2815e12 e31c0002 e5959014 e595200c e5956008 e0899002
5188  1a00005e e3a03000 e1a00007 e1a01004 e1a0200a eb003468 e1a00005 e1a01004
51a8  e1a0200a eb002c1e e2505000 1a000014 e597513c e5981000 e2850e12 eb002b48
51c8  e597013c e2800f52 eb0909ce e1a01008 e1a02006 e1a03009 e1a00007 e58da000
51e8  eb004196 e2505000 0a000009 e1a00007 e1a01005 eb002b45 e1a00007 ebfff549
5208  eaffffd1 e597c13c e28c0f52 eb0909bd eafffff5 e1a00007 ebfff542 e1a00004
5228  ebfce6d1 eaffffca e1a0100d e3c1ed7f e3cec03f e30843ac e34c404f e30b0338

SP: 0xc5837d58:
7d58  431bde82 c005425c 77359400 00000001 00000001 00002c25 c03c367c c016059c
7d78  77359400 ffffffff c5837dc4 00000ef8 c523d000 c0021acc 00000120 00005711
7d98  00000000 000000d9 c5360000 00000000 00000ef8 c523d000 c5837e28 0001b800
7db8  00001030 00002c25 c52ab2d8 c5837dd8 c01551c8 c015feec 60000013 ffffffff
7dd8  00000ef8 0001b800 00001030 00000001 c0541480 00005711 00001000 00000000
7df8  a0000013 c0541480 c523d000 c4c95188 00001000 20000000 00005711 c0506000
7e18  00000002 c0157448 00001000 00000b0d 00005711 20000000 c4c95228 c4c95228
7e38  c0541480 c5837e7c c00737c4 c5837ee8 00000001 c00737d8 00000002 c007407c

IP: 0xc52ab258:
b258  00000000 00000000 00000000 00000000 c0160164 c04cad10 00000000 00000000
b278  00000001 00000000 c52ab400 00000000 c52ab288 c52ab288 c523d000 c5dbd000
b298  00000242 0001d000 000005d8 00000228 00000800 00000002 00000001 c015ab84
b2b8  00000001 c52ab2bc c52ab2bc 00000000 00000000 00000003 77359400 00000000
b2d8  00000001 c52ab368 c04cb1c0 00000000 129ee52b 000000d9 129ee52b 000000d7
b2f8  c0160164 c04cad10 00000001 00000000 00000000 00000003 c52ab600 00000000
b318  c592b78c c592b78c c523d000 c5dbd800 00000ef8 0001c800 000007d0 00000030
b338  00000800 00000002 00000002 c015ab84 00000000 c52ab34c c52ab34c 00000000

R4: 0xc535ff80:
ff80  00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffa0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffc0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
0000  06101831 c3b9d606 000bfa1d 00000000 00001030 00000001 00005711 20000000
0020  00000000 00000000 00001000 00000000 57a9a55b b44cc63a 19e714ec 8d7326da
0040  4db3c63a 2ad6718f ac54916f bb45d030 5fa1c937 b24ef50b fc047090 f60ab947
0060  867ae21e 28d848b8 df21b14f 55ab57a9 1ce435cb 49b709f7 2fd135cb fa06d52b

R7: 0xc523cf80:
cf80  cbc6857c f18973bd 6aef19c7 e0726be3 2555ffcb e8e77177 778c45e9 c05fc9bd
cfa0  bf1917f3 cbb3ef93 dfbc95f8 d2f7e362 abe301ff e311dfd3 94ff5347 5fb441f1
cfc0  8fe98b76 7c60abe7 f8c23e12 fff91094 f19fe431 6d1f9186 7f9903f2 e4cfc609
cfe0  2f19dad1 f18a4fe7 4f5f191b 3cf1ebe3 e08fc619 2fb28c7d 2f766564 00737470
d000  c5ddae00 00000000 c04ce388 c04ce460 c536fa00 c007ebf4 00000000 00000010
d020  00000004 00000000 00000000 c007e988 00000000 c045caa8 00000001 00000000
d040  00000001 00000000 00003e17 00000000 0000000e 0000a000 00000000 00000000
d060  00000064 00000080 c523d098 c523d098 c523d008 00000000 ffffdcf4 c5d6eb80

R8: 0xc5837da8:
7da8  00000ef8 c523d000 c5837e28 0001b800 00001030 00002c25 c52ab2d8 c5837dd8
7dc8  c01551c8 c015feec 60000013 ffffffff 00000ef8 0001b800 00001030 00000001
7de8  c0541480 00005711 00001000 00000000 a0000013 c0541480 c523d000 c4c95188
7e08  00001000 20000000 00005711 c0506000 00000002 c0157448 00001000 00000b0d
7e28  00005711 20000000 c4c95228 c4c95228 c0541480 c5837e7c c00737c4 c5837ee8
7e48  00000001 c00737d8 00000002 c007407c 00000003 c0155aa0 00000000 c00737c4
7e68  c4c95228 00000001 00000001 c5825ddc c53b2d10 00000002 00000000 c0541480
7e88  c0541460 c5837ef0 c5837ef0 c5837ec0 fffffdee c5826400 c5837f38 c5837f80
Process lfrw (pid: 11301, stack limit = 0xc58362e8)
Stack: (0xc5837dd8 to 0xc5838000)
7dc0:                                                       00000ef8 0001b800
7de0: 00001030 00000001 c0541480 00005711 00001000 00000000 a0000013 c0541480
7e00: c523d000 c4c95188 00001000 20000000 00005711 c0506000 00000002 c0157448
7e20: 00001000 00000b0d 00005711 20000000 c4c95228 c4c95228 c0541480 c5837e7c
7e40: c00737c4 c5837ee8 00000001 c00737d8 00000002 c007407c 00000003 c0155aa0
7e60: 00000000 c00737c4 c4c95228 00000001 00000001 c5825ddc c53b2d10 00000002
7e80: 00000000 c0541480 c0541460 c5837ef0 c5837ef0 c5837ec0 fffffdee c5826400
7ea0: c5837f38 c5837f80 00000000 00000000 00000000 c0092b58 00000000 00000002
7ec0: 000001ff c5837f14 c4c95228 ffffffff 7fffffff 00000000 00000000 00000000
7ee0: bef78d9c c006cdb0 00000001 00000000 00000000 7fffffff 00000000 00000000
7f00: 00000000 00000000 ffffffff 7fffffff 00000000 00000000 00000002 ffffffff
7f20: 7fffffff c006cdf8 ffffffff 7fffffff 00000001 c5826680 bef76d88 c4c95228
7f40: c5826400 ffffffff 7fffffff c0022068 c5836000 c00b33ac ffffffff 7fffffff
7f60: 00000000 ffffffff 7fffffff 00000004 00000076 c00b3484 ffffffff 7fffffff
7f80: 00000000 00000000 0000000f c5826400 00000000 c00b34ac 00002000 bef78f30
7fa0: bef78e44 c0021ec0 bef78f30 bef78e44 00000003 bef76d88 00002000 00002000
7fc0: bef78f30 bef78e44 00000004 00000076 00000001 00000000 000080b4 bef78d9c
7fe0: 0005c5f4 bef76d70 0000919c 0000923c 60000010 00000003 f50bc937 b050a759
[<c015feec>] (ubifs_wbuf_add_ino_nolock+0x0/0x2c) from [<c01551c8>] (ubifs_jnl_write_data+0x180/0x308)
[<c01551c8>] (ubifs_jnl_write_data+0x180/0x308) from [<c0157448>] (do_writepage+0x80/0x204)
[<c0157448>] (do_writepage+0x80/0x204) from [<c00737d8>] (__writepage+0x14/0x5c)
[<c00737d8>] (__writepage+0x14/0x5c) from [<c007407c>] (write_cache_pages+0x44c/0x5c4)
[<c007407c>] (write_cache_pages+0x44c/0x5c4) from [<c006cdb0>] (__filemap_fdatawrite_range+0x68/0x70)
[<c006cdb0>] (__filemap_fdatawrite_range+0x68/0x70) from [<c006cdf8>] (filemap_write_and_wait_range+0x40/0x6c)
[<c006cdf8>] (filemap_write_and_wait_range+0x40/0x6c) from [<c00b33ac>] (vfs_fsync_range+0x48/0x84)
[<c00b33ac>] (vfs_fsync_range+0x48/0x84) from [<c00b3484>] (vfs_fsync+0x24/0x2c)
[<c00b3484>] (vfs_fsync+0x24/0x2c) from [<c00b34ac>] (do_fsync+0x20/0x34)
[<c00b34ac>] (do_fsync+0x20/0x34) from [<c0021ec0>] (ret_fast_syscall+0x0/0x30)
Code: eb08db57 eafffc3e eb08db1e eaffffd4 (e5903004)
---[ end trace adfcd825b315a904 ]---
umount: ubi0:ubiUBIFS DBG (pid 11302): ubifs_lookup: '.init_enable_core' in dir ino 1
test busy - remoUBIFS DBG (pid 11302): ubifs_lookup_level0: search key (1, direntry, 0x9454e7e)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 0, lvl 0, n 0

UBIFS DBG (pid 11302): ubifs_lookup: not found
UBIFS DBG (pid 11302): ubifs_lookup: 'etc' in dir ino 1
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (1, direntry, 0x24a603)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 11302): ubifs_iget: inode 424
UBIFS DBG (pid 11302): ubifs_lookup: 'TZ' in dir ino 424
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (424, direntry, 0x02bbb4)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 0, lvl 0, n 0
UBIFS DBG (pid 11302): ubifs_lookup: not found
UBIFS DBG (pid 11302): ubifs_lookup: 'swapoff' in dir ino 344
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (344, direntry, 0x1bce9f37)
UBIFS DBG (pid 11302): ubifs_read_node: LEB 16:89776, indexing node, length 148
UBI DBG (pid 11302): ubi_leb_read: read 148 bytes from LEB 0:16:89776
UBIFS DBG (pid 11302): read_znode: LEB 16:89776, level 1, 6 branch
UBIFS DBG (pid 11302): ubifs_read_node: LEB 16:89256, indexing node, length 108
UBI DBG (pid 11302): ubi_leb_read: read 108 bytes from LEB 0:16:89256
UBIFS DBG (pid 11302): read_znode: LEB 16:89256, level 0, 4 branch
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 11302): ubifs_read_node: LEB 22:16840, direntry node, length 64
UBI DBG (pid 11302): ubi_leb_read: read 64 bytes from LEB 0:22:16840
UBIFS DBG (pid 11302): ubifs_iget: inode 413
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (413, inode)
UBIFS DBG (pid 11302): ubifs_read_node: LEB 16:95760, indexing node, length 168
UBI DBG (pid 11302): ubi_leb_read: read 168 bytes from LEB 0:16:95760
UBIFS DBG (pid 11302): read_znode: LEB 16:95760, level 1, 7 branch
UBIFS DBG (pid 11302): ubifs_read_node: LEB 16:95632, indexing node, length 128
UBI DBG (pid 11302): ubi_leb_read: read 128 bytes from LEB 0:16:95632
UBIFS DBG (pid 11302): read_znode: LEB 16:95632, level 0, 5 branch
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 11302): fallible_read_node: LEB 22:16904, key (413, inode)
UBIFS DBG (pid 11302): try_read_node: LEB 22:16904, inode node, length 174
UBI DBG (pid 11302): ubi_leb_read: read 174 bytes from LEB 0:22:16904
UBIFS DBG (pid 11302): ubifs_lookup: 'ld-uClibc.so.0' in dir ino 66
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (66, direntry, 0xd3c7055)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 11302): ubifs_iget: inode 82
UBIFS DBG (pid 11302): ubifs_lookup: 'ld.so.cache' in dir ino 424
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (424, direntry, 0x2a6dd9b)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 0, lvl 0, n 3
UBIFS DBG (pid 11302): ubifs_lookup: not found
UBIFS DBG (pid 11302): ubifs_lookup: 'ld.so.preload' in dir ino 424
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (424, direntry, 0x10d80f17)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 0, lvl 0, n 6
UBIFS DBG (pid 11302): ubifs_lookup: not found
UBIFS DBG (pid 11302): ubifs_lookup: 'libm.so.0' in dir ino 66
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (66, direntry, 0x3edd6a2)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 11302): ubifs_iget: inode 71
UBIFS DBG (pid 11302): ubifs_lookup: 'libc.so.0' in dir ino 66
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (66, direntry, 0x1308bd02)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 11302): ubifs_iget: inode 103
UBIFS DBG (pid 11302): do_readpage: ino 462, pg 107, i_size 822232, flags 0x1
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (462, data, 107)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 11302): fallible_read_node: LEB 70:6976, key (462, data, 107)
UBIFS DBG (pid 11302): try_read_node: LEB 70:6976, data node, length 3611
UBI DBG (pid 11302): ubi_leb_read: read 3611 bytes from LEB 0:70:6976
UBIFS DBG (pid 11302): do_readpage: ino 462, pg 182, i_size 822232, flags 0x1
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (462, data, 182)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 11302): fallible_read_node: LEB 72:17152, key (462, data, 182)
UBIFS DBG (pid 11302): try_read_node: LEB 72:17152, data node, length 3181
UBI DBG (pid 11302): ubi_leb_read: read 3181 bytes from LEB 0:72:17152
UBIFS DBG (pid 11302): ubifs_lookup: 'fstab' in dir ino 424
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (424, direntry, 0x117ee576)
UBIFS DBG (pid 11302): ubifs_read_node: LEB 16:97376, indexing node, length 108
UBI DBG (pid 11302): ubi_leb_read: read 108 bytes from LEB 0:16:97376
UBIFS DBG (pid 11302): read_znode: LEB 16:97376, level 1, 4 branch
UBIFS DBG (pid 11302): ubifs_read_node: LEB 16:96672, indexing node, length 188
UBI DBG (pid 11302): ubi_leb_read: read 188 bytes from LEB 0:16:96672
UBIFS DBG (pid 11302): read_znode: LEB 16:96672, level 0, 8 branch
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 11302): ubifs_read_node: LEB 22:21880, direntry node, length 62
UBI DBG (pid 11302): ubi_leb_read: read 62 bytes from LEB 0:22:21880
UBIFS DBG (pid 11302): ubifs_iget: inode 426
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (426, inode)
UBIFS DBG (pid 11302): ubifs_read_node: LEB 16:96864, indexing node, length 188
UBI DBG (pid 11302): ubi_leb_read: read 188 bytes from LEB 0:16:96864
UBIFS DBG (pid 11302): read_znode: LEB 16:96864, level 0, 8 branch
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 11302): fallible_read_node: LEB 22:94824, key (426, inode)
UBIFS DBG (pid 11302): try_read_node: LEB 22:94824, inode node, length 160
UBI DBG (pid 11302): ubi_leb_read: read 160 bytes from LEB 0:22:94824
UBIFS DBG (pid 405): do_readpage: ino 90, pg 66, i_size 285948, flags 0x1
UBIFS DBG (pid 405): ubifs_lookup_level0: search key (90, data, 66)
UBIFS DBG (pid 405): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 405): fallible_read_node: LEB 26:95080, key (90, data, 66)
UBIFS DBG (pid 405): try_read_node: LEB 26:95080, data node, length 2755
UBI DBG (pid 405): ubi_leb_read: read 2755 bytes from LEB 0:26:95080
UBIFS DBG (pid 11302): do_readpage: ino 426, pg 0, i_size 95, flags 0x1
UBIFS DBG (pid 11302): ubifs_lookup_level0: search key (426, data, 0)
UBIFS DBG (pid 11302): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 11302): fallible_read_node: LEB 66:116016, key (426, data, 0)
UBIFS DBG (pid 11302): try_read_node: LEB 66:116016, data node, length 143
UBI DBG (pid 11302): ubi_leb_read: read 143 bytes from LEB 0:66:116016
Segmentation fauUBIFS DBG (pid 405): ubifs_lookup: 't0_8' in dir ino 109
lt
Ewrite 757  UBIFS DBG (pid 405): ubifs_lookup_level0: search key (109, direntry, 0x1b2d39e)
files
read fileUBIFS DBG (pid 405): ubifs_lookup_level0: found 1, lvl 0, n 5
sUBIFS DBG (pid 405): ubifs_read_node: LEB 2568:107800, direntry node, length 61
UBI DBG (pid 405): ubi_leb_read: read 61 bytes from LEB 0:2568:107800
UBIFS DBG (pid 405): ubifs_iget: inode 21532
The system is gUBIFS DBG (pid 390): do_readpage: ino 365, pg 1, i_size 132051, flags 0x1
oing down NOW!
UBIFS DBG (pid 390): ubifs_lookup_level0: search key (365, data, 1)
Sent SIGTERM toUBIFS DBG (pid 390): ubifs_read_node: LEB 16:93000, indexing node, length 168
 all processes
UBI DBG (pid 390): ubi_leb_read: read 168 bytes from LEB 0:16:93000
UBIFS DBG (pid 446): ubifs_writepage: ino 22289, pg 1, pg flags 0xb2d
UBIFS DBG (pid 446): ubifs_jnl_write_data: ino 22289, blk 1, len 4096, key (22289, data, 1)
UBIFS assert failed in reserve_space at 125 (pid 446)
[<c00284bc>] (unwind_backtrace+0x0/0xfc) from [<c0152cb0>] (make_reservation+0x578/0x888)
[<c0152cb0>] (make_reservation+0x578/0x888) from [<c015514c>] (ubifs_jnl_write_data+0x104/0x308)
[<c015514c>] (ubifs_jnl_write_data+0x104/0x308) from [<c0157448>] (do_writepage+0x80/0x204)
[<c0157448>] (do_writepage+0x80/0x204) from [<c00737d8>] (__writepage+0x14/0x5c)
[<c00737d8>] (__writepage+0x14/0x5c) from [<c0073f0c>] (write_cache_pages+0x2dc/0x5c4)
[<c0073f0c>] (write_cache_pages+0x2dc/0x5c4) from [<c00aed1c>] (writeback_single_inode+0xa8/0x2f8)
[<c00aed1c>] (writeback_single_inode+0xa8/0x2f8) from [<c00af3d4>] (writeback_sb_inodes+0x140/0x214)
[<c00af3d4>] (writeback_sb_inodes+0x140/0x214) from [<c00af874>] (writeback_inodes_wb+0xa0/0x128)
[<c00af874>] (writeback_inodes_wb+0xa0/0x128) from [<c00afb18>] (wb_writeback+0x21c/0x278)
[<c00afb18>] (wb_writeback+0x21c/0x278) from [<c00afbd8>] (wb_do_writeback+0x64/0x16c)
[<c00afbd8>] (wb_do_writeback+0x64/0x16c) from [<c00afd28>] (bdi_writeback_task+0x48/0x110)
[<c00afd28>] (bdi_writeback_task+0x48/0x110) from [<c007f7a8>] (bdi_start_fn+0x6c/0xb8)
[<c007f7a8>] (bdi_start_fn+0x6c/0xb8) from [<c0050050>] (kthread+0x80/0x84)
[<c0050050>] (kthread+0x80/0x84) from [<c0022eac>] (kernel_thread_exit+0x0/0x8)
Unable to handle kernel NULL pointer dereference at virtual address 00000148
pgd = c0004000
[00000148] *pgd=00000000
Internal error: Oops: 17 [#2]
last sysfs file: /sys/devices/virtual/usbmon/usbmon0/dev
Modules linked in:
CPU: 0    Tainted: G      D      
PC is at mutex_lock+0x0/0x18
LR is at make_reservation+0x94/0x888
pc : [<c03979e0>]    lr : [<c01527cc>]    psr: a0000113
sp : c53b9d08  ip : c53b9ff8  fp : 00000000
r10: 00001030  r9 : 00000000  r8 : 00000148
r7 : c04d1374  r6 : 00000120  r5 : c5d6eb80  r4 : c523d000
r3 : 00000000  r2 : c04ab080  r1 : 00000001  r0 : 00000148
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c53c7d  Table: 853a8059  DAC: 00000017

PC: 0xc0397960:
7960  e58d600c e3e05000 e1943f9f e1842f95 e3320000 1afffffb e3530001 0a00000e
7980  e194cf9f e1842f95 e3320000 1afffffb e35c0001 0a000008 e3a07002 e5867000
79a0  ebfffdad e1943f9f e1842f95 e3320000 1afffffb e3530001 1afffff7 e99d0005
79c0  e5820000 e5941004 e5802004 e1580001 03a00000 05840000 e28dd010 e8bd81f0
79e0  e1903f9f e2433001 e1802f93 e1923003 012fff1e eaffffcb e92d40f0 e24dd01c
7a00  e590c008 e28d100c e1a0700d e3c74d7f e3c4303f e5801008 e2807004 e593400c
7a20  e58d700c e58dc010 e58c1000 e58d4014 e3e03000 e1902f9f e1801f93 e3310000
7a40  1afffffb e3520001 0a000015 e1902f9f e1801f93 e3310000 1afffffb e3520001

LR: 0xc015274c:
274c  e1a0400d e59dc020 e3c47d7f e3c7603f e3017374 e35c0001 13a0b000 03a0b001
276c  e34c704d e08c518c e1a0900e e1a04000 e30813ac e1a00205 e34c104f e2843f57
278c  e58d6028 e58d001c e58de024 e58d102c e58d3018 e59d0018 eb0915f1 e5d43598
27ac  e594213c e59d801c e3130003 e0886002 1a00012d e2868028 e1a00008 eb091484
27cc  e5d4c598 e31c0004 1a0000e8 e594e57c e596c00c e5965014 e06c100e e5963008
27ec  e0650001 e15a0000 c3a02000 d3a02001 e3730001 03a02000 e3520000 1a0001a3
280c  e1a00004 e1a0100a e28d2034 e1a0300b eb008a51 e2505000 aa0000d6 e375001c
282c  1a0000b6 e5972000 e3120002 1a00013f e1a00008 eb091432 e1a00004 e3a01000

SP: 0xc53b9c88:
9c88  c05c6020 c5c51f20 c004ffd0 c0022eac 00000013 00000000 00000000 00000000
9ca8  00000000 ffffffff c53b9cf4 00000120 c04d1374 c0021acc 00000148 00000001
9cc8  c04ab080 00000000 c523d000 c5d6eb80 00000120 c04d1374 00000148 00000000
9ce8  00001030 00000000 c53b9ff8 c53b9d08 c01527cc c03979e0 a0000113 ffffffff
9d08  c1da3000 c01b2280 c04d1300 c01b4050 c68cd000 c04d1374 c523d15c 00000120
9d28  00000002 00000000 c53b8000 c04f83ac 00001000 c0177b94 c53b9d80 c5838000
9d48  00000000 c04d1374 c523d000 c53b9db8 c1da3000 00001030 000001be c015514c
9d68  c53b9d84 00001000 c04f8434 00000001 c0541460 00005711 00001000 00000000

IP: 0xc53b9f78:
9f78  c523d068 000001f4 c04ce064 c04ca580 00000000 ffffddbb 00000001 c00afd28
9f98  c05c6020 c523d008 c523d068 20000013 c523d068 00000000 00000000 00000000
9fb8  00000000 c007f7a8 c5c51f20 00000002 c007f73c c0050050 00000000 00000000
9fd8  c53b9fd8 c53b9fd8 00000000 c5c51f20 c004ffd0 c0022eac 00000013 c0022eac
9ff8  00000000 00000000 c5905000 00000000 00000000 00000000 00000000 00000004
a018  00000002 00000000 00000980 0001b4c0 0000006c 00000000 0000006d 4a9b2f42
a038  00000000 00000a28 00006800 00000043 0000006d 4ab61312 00000000 00000228
a058  00004800 00000043 0000006d 4aba25f2 00000000 000004d0 00011000 00000043

R2: 0xc04ab000:
b000  c002108c 8021acb0 c0021224 8022abb0 c0021358 8004adb0 c0021518 80b0b0b0
b020  c002152c 80a8b0b0 c00215f4 800ca9b0 c00218a0 80b0b0b0 c0021930 00016390
b040  c0021954 80a8b0b0 c0021a80 0001638c c0021ae0 00016390 c0021b60 00016394
b060  c0021bc0 00016398 c0021c60 00000001 c0022cc0 80b0b0b0 c0022d30 8004845f
b080  c0022eac 00000001 c0022eb4 80b0b0b0 c0022ee8 00016374 c0022f08 00016378
b0a0  c0022f28 80b0b0b0 c0022f2c 00016374 c0022f50 00016378 c0022f78 8003a8b0
b0c0  c0023208 00016374 c0023270 8014abb0 c00232f0 80a8b0b0 c002332c 80aab0b0
b0e0  c002337c 80b0b0b0 c0023398 8002afb0 c00234e4 80aab0b0 c0023570 80a8b0b0

R4: 0xc523cf80:
cf80  cbc6857c f18973bd 6aef19c7 e0726be3 2555ffcb e8e77177 778c45e9 c05fc9bd
cfa0  bf1917f3 cbb3ef93 dfbc95f8 d2f7e362 abe301ff e311dfd3 94ff5347 5fb441f1
cfc0  8fe98b76 7c60abe7 f8c23e12 fff91094 f19fe431 6d1f9186 7f9903f2 e4cfc609
cfe0  2f19dad1 f18a4fe7 4f5f191b 3cf1ebe3 e08fc619 2fb28c7d 2f766564 00737470
d000  c5ddae00 00000000 c04ce388 c04ce460 c536fa00 c007ebf4 00000000 00000010
d020  00000004 00000000 00000000 c007e988 00000000 c045caa8 00000000 00000000
d040  00000002 00000000 00003e17 00000000 0000000e 0000a000 00000000 00000000
d060  00000064 00000080 c523d098 c523d098 c523d008 00000000 ffffdcf4 c5d6eb80

R5: 0xc5d6eb00:
eb00  c5d6eb00 c5d6eb00 c5d6eb08 c5d6eb08 00000000 00000000 00000000 00000000
eb20  00000000 00000000 00000000 00000000 00000000 c5d6eb34 c5d6eb34 00000000
eb40  00000000 c53de500 c003cc08 00000000 00000002 0000a000 0000000e 0000c350
eb60  0000c350 00000000 ffffffff fff3cefd ffffffff fc2f7fbf ffffdfff ff7ffff3
eb80  00000000 c53b8000 00000002 80a01040 00000000 ffffffff 00000078 00000078
eba0  00000078 00000000 c0399aa8 00000000 00000400 00400000 c5c47459 00000000
ebc0  00000000 c5c61d04 c04c9110 00000001 faf2d8d0 00000031 08e9190e 00000000
ebe0  d1bb1e7f 00000034 00a32000 00000000 00000000 00000000 c5d6ebf8 c5d6ebf8

R7: 0xc04d12f4:
12f4  c04ce210 c04cf7fc 0000000c 00000001 c5253ba0 c04d1348 00000000 c045c230
1314  c045c230 00000002 c51cf540 c04d1354 c04d1360 c045b330 c0461264 00000000
1334  00000000 00000000 00000000 c0446a14 c044cf48 00000001 c04d134c c04d134c
1354  00000001 c04d1358 c04d1358 00000001 c04d1364 c04d1364 c52ac020 c52ac020
1374  0000ffff 000000e5 c0466514 c03c4ac8 c04d2848 c04d7bec 00000000 c5d45900
1394  00000000 00000000 c0466514 00000004 c0195c70 c0195c34 00000000 c04d13bc
13b4  c04d13b4 c04d13b4 c046666c 00000005 c01964ac c0196470 00000000 c04d13e8
13d4  c04d13d4 c04d13d4 00000001 c04d13e0 c04d13e0 c04666a4 00000000 c01971f4
Process flush-ubifs_0_0 (pid: 446, stack limit = 0xc53b82e8)
Stack: (0xc53b9d08 to 0xc53ba000)
9d00:                   c1da3000 c01b2280 c04d1300 c01b4050 c68cd000 c04d1374
9d20: c523d15c 00000120 00000002 00000000 c53b8000 c04f83ac 00001000 c0177b94
9d40: c53b9d80 c5838000 00000000 c04d1374 c523d000 c53b9db8 c1da3000 00001030
9d60: 000001be c015514c c53b9d84 00001000 c04f8434 00000001 c0541460 00005711
9d80: 00001000 00000000 a0000113 c0541460 c523d000 c4c95188 00001000 20000001
9da0: 00005711 c0506000 00000001 c0157448 00001000 00000b2d 00005711 20000001
9dc0: c4c95228 c4c95228 c0541460 c53b9e0c 00000000 c53b9ee8 00000002 c00737d8
9de0: ffffffff c0073f0c 0000000e c0075c00 00000000 c00737c4 c4c95228 00000001
9e00: 00000001 c0073ce0 00000009 00000001 00000000 c0541460 c4fdce68 00000001
9e20: 00000001 c5c46e60 c04c90b8 00000000 00000000 c0541520 c5c46e60 c5c47420
9e40: 40000093 c04c90b8 00000001 00000002 c5c46e60 c4c95188 c53b9ee8 00000082
9e60: c4c95228 c523d088 00000000 c04ca580 c53b9ee8 c00aed1c ffffddbf c523d068
9e80: c5ddae00 c4c95188 00000000 c00af3d4 c5c93184 c523d090 c4c95190 c5ddae00
9ea0: c4fdcdc8 c523d068 c5ddae40 c523d088 00000400 c53b9ee8 00000000 c00af874
9ec0: 7fffffff c53f9380 c523d068 00000000 c04ca580 c53b9ee8 00000000 c00afb18
9ee0: c523d088 c523d090 00000000 00000000 ffffde8a 00000400 00000000 00000000
9f00: 00000000 00000000 ffffffff 7fffffff 00000000 00000000 c5355c00 c0054d38
9f20: c04c90b8 c53b8000 c53b9f5c c53f9380 00000000 c523d068 c523d008 c523d0a0
9f40: 00000001 00000000 00000001 c00afbd8 00000000 ffffddbb c04ca580 ffffdfb0
9f60: 00000003 00000000 00200200 ffffdfb0 c04ebb40 c53b8000 c523d068 000001f4
9f80: c04ce064 c04ca580 00000000 ffffddbb 00000001 c00afd28 c05c6020 c523d008
9fa0: c523d068 20000013 c523d068 00000000 00000000 00000000 00000000 c007f7a8
9fc0: c5c51f20 00000002 c007f73c c0050050 00000000 00000000 c53b9fd8 c53b9fd8
9fe0: 00000000 c5c51f20 c004ffd0 c0022eac 00000013 c0022eac 00000000 00000000
[<c03979e0>] (mutex_lock+0x0/0x18) from [<c01527cc>] (make_reservation+0x94/0x888)
[<c01527cc>] (make_reservation+0x94/0x888) from [<c015514c>] (ubifs_jnl_write_data+0x104/0x308)
[<c015514c>] (ubifs_jnl_write_data+0x104/0x308) from [<c0157448>] (do_writepage+0x80/0x204)
[<c0157448>] (do_writepage+0x80/0x204) from [<c00737d8>] (__writepage+0x14/0x5c)
[<c00737d8>] (__writepage+0x14/0x5c) from [<c0073f0c>] (write_cache_pages+0x2dc/0x5c4)
[<c0073f0c>] (write_cache_pages+0x2dc/0x5c4) from [<c00aed1c>] (writeback_single_inode+0xa8/0x2f8)
[<c00aed1c>] (writeback_single_inode+0xa8/0x2f8) from [<c00af3d4>] (writeback_sb_inodes+0x140/0x214)
[<c00af3d4>] (writeback_sb_inodes+0x140/0x214) from [<c00af874>] (writeback_inodes_wb+0xa0/0x128)
[<c00af874>] (writeback_inodes_wb+0xa0/0x128) from [<c00afb18>] (wb_writeback+0x21c/0x278)
[<c00afb18>] (wb_writeback+0x21c/0x278) from [<c00afbd8>] (wb_do_writeback+0x64/0x16c)
[<c00afbd8>] (wb_do_writeback+0x64/0x16c) from [<c00afd28>] (bdi_writeback_task+0x48/0x110)
[<c00afd28>] (bdi_writeback_task+0x48/0x110) from [<c007f7a8>] (bdi_start_fn+0x6c/0xb8)
[<c007f7a8>] (bdi_start_fn+0x6c/0xb8) from [<c0050050>] (kthread+0x80/0x84)
[<c0050050>] (kthread+0x80/0x84) from [<c0022eac>] (kernel_thread_exit+0x0/0x8)
Code: 03a00000 05840000 e28dd010 e8bd81f0 (e1903f9f)
---[ end trace adfcd825b315a905 ]---
UBIFS DBG (pid 390): read_znode: LEB 16:93000, level 1, 7 branch
UBIFS DBG (pid 390): ubifs_read_node: LEB 16:92096, indexing node, length 108
UBI DBG (pid 390): ubi_leb_read: read 108 bytes from LEB 0:16:92096
Sent SIGKILL toUBIFS DBG (pid 390): read_znode: LEB 16:92096, level 0, 4 branch
UBIFS DBG (pid 390): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 390): fallible_read_node: LEB 67:78056, key (365, data, 1)
UBIFS DBG (pid 390): try_read_node: LEB 67:78056, data node, length 2835
UBI DBG (pid 390): ubi_leb_read: read 2835 bytes from LEB 0:67:78056
Restarting system.

and next time ,the rootfs is down,the debug info is following:

0x000000000000-0x000000100000 : "n1"
0x000000100000-0x000000700000 : "n2"
0x000000700000-0x000001600000 : "n3"
0x000001600000-0x000020000000 : "n4"
UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. sequence number:       17394
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "n4"
UBI: MTD device size:            490 MiB
UBI: number of good PEBs:        3920
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 3920
UBI: number of PEBs reserved for bad PEB handling: 78
UBI: max/mean erase counter: 7/6
UBI: image sequence number:  299607336
UBI: background thread "ubi_bgt0d" started, PID 318

UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0xc5d8511d, read 0xc3b9d606
UBIFS error (pid 1): ubifs_check_node: bad node at LEB 3832:112640
[<c00284bc>] (unwind_backtrace+0x0/0xfc) from [<c0160f5c>] (ubifs_check_node+0x1c8/0x2e4)
[<c0160f5c>] (ubifs_check_node+0x1c8/0x2e4) from [<c01697cc>] (ubifs_scan_a_node+0x144/0x38c)
[<c01697cc>] (ubifs_scan_a_node+0x144/0x38c) from [<c0169a94>] (ubifs_scan+0x80/0x3dc)
[<c0169a94>] (ubifs_scan+0x80/0x3dc) from [<c016ada8>] (ubifs_replay_journal+0xcac/0x1a20)
[<c016ada8>] (ubifs_replay_journal+0xcac/0x1a20) from [<c015d5c0>] (ubifs_fill_super+0xb94/0x17e0)
[<c015d5c0>] (ubifs_fill_super+0xb94/0x17e0) from [<c015e2fc>] (ubifs_mount+0xf0/0x330)
[<c015e2fc>] (ubifs_mount+0xf0/0x330) from [<c009429c>] (vfs_kern_mount+0x5c/0x118)
[<c009429c>] (vfs_kern_mount+0x5c/0x118) from [<c009439c>] (do_kern_mount+0x34/0xdc)
[<c009439c>] (do_kern_mount+0x34/0xdc) from [<c00aaae8>] (do_mount+0x150/0x708)
[<c00aaae8>] (do_mount+0x150/0x708) from [<c00ab124>] (sys_mount+0x84/0xc4)
[<c00ab124>] (sys_mount+0x84/0xc4) from [<c0008d5c>] (mount_block_root+0x10c/0x2d0)
[<c0008d5c>] (mount_block_root+0x10c/0x2d0) from [<c0009024>] (prepare_namespace+0xa4/0x1d4)
[<c0009024>] (prepare_namespace+0xa4/0x1d4) from [<c00084b4>] (kernel_init+0x148/0x154)
[<c00084b4>] (kernel_init+0x148/0x154) from [<c0022eac>] (kernel_thread_exit+0x0/0x8)
UBIFS error (pid 1): ubifs_scan: bad node
UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 3832:112640
UBIFS error (pid 1): ubifs_scanned_corruption: first 8192 bytes from LEB 3832:112640
UBIFS error (pid 1): ubifs_scan: LEB 3832 scanning failed
VFS: Cannot open root device "ubi0:ubitest" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available partitions:
f000           16384 romblock0 (driver?)
1f00           16384 mtdblock0 (driver?)
f001            1024 romblock1 (driver?)
1f01            1024 mtdblock1 (driver?)
f002            6144 romblock2 (driver?)
1f02            6144 mtdblock2 (driver?)
f003           15360 romblock3 (driver?)
1f03           15360 mtdblock3 (driver?)
f004          501760 romblock4 (driver?)
1f04          501760 mtdblock4 (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

and then I power off and power on the boad,the rootfs is ok!!!

how can I fix it?


thanks !
tony
