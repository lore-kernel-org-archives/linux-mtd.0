Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xydl1-0005x7-5d
 for linux-mtd@lists.infradead.org; Wed, 10 Dec 2014 09:40:32 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1XydkZ-00079a-Sd
 for linux-mtd@lists.infradead.org; Wed, 10 Dec 2014 10:40:06 +0100
Received: from user.nova.net.cn ([user.nova.net.cn])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2014 10:40:03 +0100
Received: from ykong by user.nova.net.cn with local (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2014 10:40:03 +0100
To: linux-mtd@lists.infradead.org
From: Yan <ykong@sierrawireless.com>
Subject: UBI errors when "ls -l"
Date: Wed, 10 Dec 2014 09:34:22 +0000 (UTC)
Message-ID: <loom.20141210T102753-582@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

My Kernel version is:
Linux swi-mdm9x15 3.4.91-yocto-standard #7 PREEMPT Wed Dec 10 17:39:02 HKT 2014 
armv7l GNU/Linux

I am trying to mount ubifs. It seems mount ubifs image successfully, but when 
access ubifs, it will print out lots of error msgs.
This is steps I do:
(1)make ubifs.image. I make ubifs image from *.conf (I tried use "mkfs.ubifs" 
and "ubinize" to make image directly, the same error msgs ).
IMAGE_FSTYPES += "ubi"
MKUBIFS_ARGS = "-m 4096 -e 253952 -c 2047"
UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096"

(2)mount ubifs In Linux shell.
mkdir -p /mnt/ubifs
flash_erase /dev/mtd3 0 0 -N
dd if=/mnt/flash/ubi.img of=/dev/mtd3 bs=4096
ubiattach /dev/ubi_ctrl -m 3 -O 4096
ubiblkvol -a /dev/ubi0_0
mount -t ubifs ubi0:swi-mdm9x15-rootfs /mnt/ubifs

(3)After step (2), ubifs can be mounted successfully. But when I access ubifs, 
such as when I input "ls", it will show lots of error msgs. But after printing 
out error msgs, finally it will show directory.
By the way, I tried to use nandsim to debug the ubi image in Ubuntu, it is OK.
I think there is something wrong in Kernel configuration.
Could you please help me? Thank you very much!
Error msgs and Kernel configuration attached.

error msgs:
[ 1126.270349] UBI assert failed in ubi_io_read at 213 (pid 427)
[ 1126.275690] [<c0015568>] (unwind_backtrace+0x0/0x138) from [<c06a23fc>] 
(dump_stack+0x20/0x24)
[ 1126.284205] [<c06a23fc>] (dump_stack+0x20/0x24) from [<c0412934>] 
(ubi_io_read+0x2a0/0x320)
[ 1126.292781] [<c0412934>] (ubi_io_read+0x2a0/0x320) from [<c0410978>] 
(ubi_eba_read_leb+0x2dc/0x400)
[ 1126.301815] [<c0410978>] (ubi_eba_read_leb+0x2dc/0x400) from [<c040faa8>] 
(ubi_leb_read+0x110/0x174)
[ 1126.310483] [<c040faa8>] (ubi_leb_read+0x110/0x174) from [<c025f388>] 
(ubifs_leb_read+0x38/0x98)
[ 1126.319670] [<c025f388>] (ubifs_leb_read+0x38/0x98) from [<c02611c8>] 
(ubifs_read_node+0x16c/0x2b4)
[ 1126.328521] [<c02611c8>] (ubifs_read_node+0x16c/0x2b4) from [<c027ebe8>] 
(ubifs_load_znode+0xb8/0x518)
[ 1126.337555] [<c027ebe8>] (ubifs_load_znode+0xb8/0x518) from [<c0264638>] 
(ubifs_lookup_level0+0x140/0x2dc)
[ 1126.347138] [<c0264638>] (ubifs_lookup_level0+0x140/0x2dc) from [<c0264820>] 
(ubifs_tnc_locate+0x4c/0x1a0)
[ 1126.356844] [<c0264820>] (ubifs_tnc_locate+0x4c/0x1a0) from [<c0264fd8>] 
(ubifs_tnc_lookup_nm+0x34/0x1b8)
[ 1126.366793] [<c0264fd8>] (ubifs_tnc_lookup_nm+0x34/0x1b8) from [<c0284fc8>] 
(ubifs_getxattr+0x12c/0x26c)
[ 1126.375797] [<c0284fc8>] (ubifs_getxattr+0x12c/0x26c) from [<c032edf4>] 
(smk_fetch+0x80/0xb0)
[ 1126.384312] [<c032edf4>] (smk_fetch+0x80/0xb0) from [<c032f2a8>] 
(smack_d_instantiate+0x16c/0x29c)
[ 1126.393254] [<c032f2a8>] (smack_d_instantiate+0x16c/0x29c) from [<c032b044>] 
(security_d_instantiate+0x38/0x40)
[ 1126.403326] [<c032b044>] (security_d_instantiate+0x38/0x40) from 
[<c013e144>] (d_instantiate+0x84/0x88)
[ 1126.412665] [<c013e144>] (d_instantiate+0x84/0x88) from [<c0258e68>] 
(ubifs_lookup+0x1bc/0x244)
[ 1126.421364] [<c0258e68>] (ubifs_lookup+0x1bc/0x244) from [<c0133d3c>] 
(__lookup_hash+0xc0/0xf8)
[ 1126.429818] [<c0133d3c>] (__lookup_hash+0xc0/0xf8) from [<c0133fe4>] 
(do_lookup+0x270/0x2b0)
[ 1126.438577] [<c0133fe4>] (do_lookup+0x270/0x2b0) from [<c0135df8>] 
(path_lookupat+0x10c/0x700)
[ 1126.447062] [<c0135df8>] (path_lookupat+0x10c/0x700) from [<c0136418>] 
(do_path_lookup+0x2c/0x68)
[ 1126.455882] [<c0136418>] (do_path_lookup+0x2c/0x68) from [<c0137de8>] 
(user_path_at_empty+0x68/0x98)
[ 1126.465008] [<c0137de8>] (user_path_at_empty+0x68/0x98) from [<c0137e3c>] 
(user_path_at+0x24/0x2c)
[ 1126.473950] [<c0137e3c>] (user_path_at+0x24/0x2c) from [<c012dea4>] 
(vfs_fstatat+0x40/0x78)
[ 1126.482313] [<c012dea4>] (vfs_fstatat+0x40/0x78) from [<c012df38>] 
(vfs_stat+0x2c/0x30)
[ 1126.490034] [<c012df38>] (vfs_stat+0x2c/0x30) from [<c012e160>] 
(sys_stat64+0x24/0x40)
[ 1126.498275] [<c012e160>] (sys_stat64+0x24/0x40) from [<c000e6a0>] 
(ret_fast_syscall+0x0/0x30)
[ 1126.506668] UBIFS error (pid 427): ubifs_check_node: bad magic 0xce5f59ff, 
expected 0x6101831
[ 1126.515153] UBIFS error (pid 427): ubifs_check_node: bad node at LEB 91:4032
[ 1126.522172] Not a node, first 24 bytes:
