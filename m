Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rpd6i-0005P5-L1
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2012 09:56:06 +0000
Message-ID: <4F1E802D.5010402@flatfrog.com>
Date: Tue, 24 Jan 2012 10:55:57 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 oops when writing to two partitions simultaneously
Content-Type: multipart/mixed; boundary="------------050604020609020000050404"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------050604020609020000050404
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm in the process of narrowing down an oops that happens when doing a

   while :; do dd if=/dev/zero of=file bs=800 count=1; done

on two different JFFS2 partitions simultaneously.

The oops happens in crc32_le, coming from jffs2_write_inode_range 
(jffs2_oops attachment).


Sometimes it's sufficient to scp a file to the root partition 
immediately after boot to trigger the oops, possibly because there are 
gc threads running on both mtd partitions because of previous power 
cycles (jffs2_oops_gc attachment).

In addition to these oops, on occasion I get decompress errors instead 
which prevent me from writing to the affected partition.  In that case, 
unmounting the partition, remounting it and removing the offending file 
gets things back into working order.  That situation is harder to 
reproduce, but I thought I'd at least mention it.


I'd appreciate pointers on what to look at next.  More details below.

Thanks,
Orjan



The board is a BeagleBoard-like board (OMAP 3730/Cortex-A8) with a 256 
MB Micron NAND.  We use a slightly old kernel, 2.6.32 and the 
CodeSourcery Lite 2009q1 compiler (gcc 4.3.3).  JFFS2 kernel options:

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
CONFIG_JFFS2_SUMMARY=y
# CONFIG_JFFS2_FS_XATTR is not set
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_LZO=y
CONFIG_JFFS2_RTIME=y
CONFIG_JFFS2_RUBIN=y
# CONFIG_JFFS2_CMODE_NONE is not set
# CONFIG_JFFS2_CMODE_PRIORITY is not set
# CONFIG_JFFS2_CMODE_SIZE is not set
CONFIG_JFFS2_CMODE_FAVOURLZO=y

/proc/mtd:

dev:    size   erasesize  name
mtd0: 001e0000 00020000 "U-Boot"
mtd1: 00020000 00020000 "U-Boot Env"
mtd2: 01000000 00020000 "FlatFrog"
mtd3: 00400000 00020000 "Kernel"
mtd4: 0ea00000 00020000 "File System"


-- 
Orjan Friberg
FlatFrog Laboratories AB

--------------050604020609020000050404
Content-Type: text/plain; name="jffs2_oops"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="jffs2_oops"

[   81.200805] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[   81.217529] pgd = ce13c000
[   81.220855] [00000000] *pgd=8e172031, *pte=00000000, *ppte=00000000
[   81.236480] Internal error: Oops: 17 [#1] PREEMPT
[   81.241210] last sysfs file: /sys/kernel/uevent_seqnum
[   81.246368] Modules linked in: ftdi_sio usbserial
[   81.251129] CPU: 0    Not tainted  (2.6.32 #6)
[   81.255584] PC is at crc32_le+0x6c/0xf4
[   81.259460] LR is at jffs2_write_inode_range+0x2a0/0x420
[   81.264801] pc : [<c0211f28>]    lr : [<c01ae930>]    psr: 20000013
[   81.264801] sp : ce24bcd0  ip : 00000001  fp : ce11f840
[   81.276336] r10: 0000000c  r9 : ce5231d0  r8 : fffffffc
[   81.281585] r7 : 00000002  r6 : 00000000  r5 : c03fcf9c  r4 : 00000000
[   81.288146] r3 : 00000000  r2 : 00000008  r1 : 00000000  r0 : 00000000
[   81.294677] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[   81.301849] Control: 10c5387d  Table: 8e13c019  DAC: 00000015
[   81.307617] Process dd (pid: 5270, stack limit = 0xce24a2f0)
[   81.313323] Stack: (0xce24bcd0 to 0xce24c000)
[   81.317687] bcc0:                                     00000000 00000002 00000003 00000000
[   81.325897] bce0: 00000000 c01ae930 ce24bd1c ce24bd18 00000000 00000008 00000000 00000000
[   81.334136] bd00: 00000000 00000002 cdca7000 ce1a8800 00000000 00000000 00000008 00000320
[   81.342346] bd20: 0001326c 00000000 00000320 00000000 ce11f840 ce523208 00000000 c07754e0
[   81.350555] bd40: 00000320 00000000 ce1a8800 c01a8ac4 00000000 00000320 ce24bd74 ffffffff
[   81.358764] bd60: 00000000 00000320 00000000 00000000 00000320 00000000 00000320 00000320
[   81.367004] bd80: 00000000 00000000 00000000 00000320 00000000 00000000 ce5232b0 c0097d1c
[   81.375213] bda0: 00000320 00000320 c07754e0 ce523208 ce24a000 cebf4140 ce5232b0 00001000
[   81.383422] bdc0: 00000000 c03efe38 ce24bf40 00000001 00000000 00000320 ce523208 c07754e0
[   81.391632] bde0: 00000320 00000320 00000000 00000320 ce523208 00000000 00000000 00000000
[   81.399871] be00: 00000000 c009846c 00000000 00000000 ce24bf00 00000320 00000000 00000000
[   81.408081] be20: 00000002 ce24bf00 ce24bf40 ce24beb0 cebf4140 ce5232b0 00000320 00000001
[   81.416290] be40: ce24a000 ce523278 000ad008 c03dd658 22222222 00000320 22222222 ce523278
[   81.424530] be60: ce24bf40 ce24beb0 00000001 00000000 cebf4140 00000000 000ad008 c009851c
[   81.432739] be80: ce24beb0 ce24bf40 00000000 00000000 ce24beb0 cebf4140 ce24bf80 ce24a000
[   81.440948] bea0: 000aad28 c00bf584 00000000 00000000 00020242 ce1ae000 00000000 00000001
[   81.449157] bec0: ffffffff cebf4140 00000000 00000000 00000000 00000000 ce12d6c0 00020241
[   81.457397] bee0: 00000000 00000000 00000200 ce12d6c0 c0077028 ce24bef4 ce24bef4 00000004
[   81.465606] bf00: 00000000 00000000 000aad28 00000300 00000000 00000000 00000320 00100073
[   81.473815] bf20: 000ad000 ce24a000 000ce000 00000000 00000002 ceb450e0 ce4b0618 00000001
[   81.482025] bf40: 000ad008 00000320 cebf4140 000ad008 ce24bf80 00000320 00000320 c00c01c8
[   81.490264] bf60: cebf4140 000ad008 00000000 00000000 cebf4140 00000320 000ad008 c00c036c
[   81.498474] bf80: 00000000 00000000 00000320 00000000 00000320 00000001 000ad008 00000004
[   81.506683] bfa0: c00390c4 c0038f40 00000320 00000001 00000001 000ad008 00000320 000acd34
[   81.514923] bfc0: 00000320 00000001 000ad008 00000004 00000320 000ad008 000aad28 000ad008
[   81.523132] bfe0: 4001e3e0 bece4b60 00010e34 40188abc 60000010 00000001 00000000 00000000
[   81.531372] [<c0211f28>] (crc32_le+0x6c/0xf4) from [<c01ae930>] (jffs2_write_inode_range+0x2a0/0x420)
[   81.540618] [<c01ae930>] (jffs2_write_inode_range+0x2a0/0x420) from [<c01a8ac4>] (jffs2_write_end+0x190/0x2d4)
[   81.550689] [<c01a8ac4>] (jffs2_write_end+0x190/0x2d4) from [<c0097d1c>] (generic_file_buffered_write+0x180/0x264)
[   81.561096] [<c0097d1c>] (generic_file_buffered_write+0x180/0x264) from [<c009846c>] (__generic_file_aio_write+0x468/0x4b0)
[   81.572265] [<c009846c>] (__generic_file_aio_write+0x468/0x4b0) from [<c009851c>] (generic_file_aio_write+0x68/0xc4)
[   81.582855] [<c009851c>] (generic_file_aio_write+0x68/0xc4) from [<c00bf584>] (do_sync_write+0xac/0xfc)
[   81.592285] [<c00bf584>] (do_sync_write+0xac/0xfc) from [<c00c01c8>] (vfs_write+0xac/0x1a4)
[   81.600677] [<c00c01c8>] (vfs_write+0xac/0x1a4) from [<c00c036c>] (sys_write+0x3c/0x68)
[   81.608734] [<c00c036c>] (sys_write+0x3c/0x68) from [<c0038f40>] (ret_fast_syscall+0x0/0x2c)
[   81.617218] Code: e2448004 e3a01000 e1a0c007 ea00000e (e7942001) 
[   82.040069] ---[ end trace 6a60d817de90299e ]---

--------------050604020609020000050404
Content-Type: text/plain; name="jffs2_oops_gc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="jffs2_oops_gc"

[  223.855712] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[  223.947204] pgd = c0004000
[  223.980438] [00000000] *pgd=00000000
[  223.984039] Internal error: Oops: 17 [#1] PREEMPT
[  223.988769] last sysfs file: /sys/kernel/uevent_seqnum
[  223.993927] Modules linked in: rtc_twl ftdi_sio rtc_core usbserial
[  224.000183] CPU: 0    Not tainted  (2.6.32 #6)
[  224.004669] PC is at crc32_le+0x6c/0xf4
[  224.008514] LR is at jffs2_garbage_collect_live+0xb5c/0xfc8
[  224.014129] pc : [<c0211f28>]    lr : [<c01b14b0>]    psr: 20000113
[  224.014129] sp : ce33bde0  ip : 000000b2  fp : 00000000
[  224.025665] r10: 00000007  r9 : ce596b00  r8 : fffffffc
[  224.030914] r7 : 000000b3  r6 : 00000000  r5 : c03fcf9c  r4 : 00000000
[  224.037445] r3 : 00000000  r2 : 000002cc  r1 : 00000000  r0 : 00000000
[  224.044006] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
[  224.051361] Control: 10c5387d  Table: 8e3c0019  DAC: 00000017
[  224.057128] Process jffs2_gcd_mtd2 (pid: 921, stack limit = 0xce33a2f0)
[  224.063781] Stack: (0xce33bde0 to 0xce33c000)
[  224.068145] bde0: ccff0000 ce33be64 00001000 00000000 00001000 c01b14b0 ce33beac ce33bea8
[  224.076385] be00: ce33a010 c08c554c c05a576c c00d32e0 00000000 00001000 00006888 000081a4
[  224.084594] be20: 00000007 ce3808bc ce1ea200 00000000 ce596b1c 00002000 0001827c ce09de10
[  224.092803] be40: ccff0000 c01b3b04 00000000 00000000 fffffffd 00000000 00002000 00001000
[  224.101013] be60: 00000002 e0021985 00000310 dededdb1 00000023 00000124 000081a4 00000000
[  224.109252] be80: 00006888 4f1d5028 4f1d5038 4f1d5038 00001000 000002cc 00001000 00000007
[  224.117462] bea0: 00000000 b57f0551 000002cc 00001000 c075be00 00000000 0001f9cc 22222222
[  224.125671] bec0: ce1ea22c ce596b00 ce3808bc 00000023 ce1ea200 ce01cb18 0001827c ce09de10
[  224.133880] bee0: ce1ea22c c01b20dc 00000000 00000000 ce1ea2b0 ce1ea290 c006c26c ce3f7b40
[  224.142120] bf00: c0593740 00000000 00000000 00000000 00000000 40000113 ce33a000 00000001
[  224.150329] bf20: ce1ea200 00000000 00000000 00000000 00000000 c01b3678 00000001 00000000
[  224.158538] bf40: 00000080 00000000 00000000 00000000 00000071 0000000f ce3f7b70 c0550c98
[  224.166748] bf60: ce3f7b70 c01b34f4 00000000 c0059ab4 c0550c98 ce3f7b70 ce33bf94 c0059bcc
[  224.174987] bf80: c05507c8 00000000 ce3f7b40 c01b34f4 ce33bfcc c03dc6e4 00000013 ce3f7ddc
[  224.183197] bfa0: ce3f7bb8 ce3f7dd8 c01b34f4 ce33bfd4 cde39e30 ce1ea200 c01b34f4 ce33bfd4
[  224.191406] bfc0: cde39e30 ce1ea200 c01b34f4 c0076cfc 00000000 00000000 ce33bfd8 ce33bfd8
[  224.199645] bfe0: 00000000 00000000 00000000 00000000 00000000 c0039960 00000000 00000000
[  224.207855] [<c0211f28>] (crc32_le+0x6c/0xf4) from [<c01b14b0>] (jffs2_garbage_collect_live+0xb5c/0xfc8)
[  224.217407] [<c01b14b0>] (jffs2_garbage_collect_live+0xb5c/0xfc8) from [<c01b20dc>] (jffs2_garbage_collect_pass+0x7c0/0x8bc)
[  224.228668] [<c01b20dc>] (jffs2_garbage_collect_pass+0x7c0/0x8bc) from [<c01b3678>] (jffs2_garbage_collect_thread+0x184/0x1d8)
[  224.240112] [<c01b3678>] (jffs2_garbage_collect_thread+0x184/0x1d8) from [<c0076cfc>] (kthread+0x7c/0x84)
[  224.249755] [<c0076cfc>] (kthread+0x7c/0x84) from [<c0039960>] (kernel_thread_exit+0x0/0x8)
[  224.258148] Code: e2448004 e3a01000 e1a0c007 ea00000e (e7942001) 
[  226.582031] ---[ end trace 351acc3d8d9196f4 ]---

--------------050604020609020000050404--
