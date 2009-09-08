Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mktmp-0000Mn-TJ
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 06:02:44 +0000
Received: from terlingua.dalsemi.com (localhost [127.0.0.1])
	by antispam02.maxim-ic.com (Spam & Virus Firewall) with ESMTP id
	70C488805EA for <linux-mtd@lists.infradead.org>;
	Tue,  8 Sep 2009 01:02:38 -0500 (CDT)
Received: from terlingua.dalsemi.com (terlingua.dalsemi.com [180.0.34.46]) by
	antispam02.maxim-ic.com with ESMTP id Ues8g67yizEqEM2o for
	<linux-mtd@lists.infradead.org>;
	Tue, 08 Sep 2009 01:02:38 -0500 (CDT)
Received: from itdalex01.it.maxim-ic.internal (itdalex01.it.maxim-ic.internal
	[10.16.15.6])
	by terlingua.dalsemi.com (8.10.2/8.10.2) with ESMTP id n8862cp27641
	for <linux-mtd@lists.infradead.org>;
	Tue, 8 Sep 2009 01:02:38 -0500 (CDT)
Message-ID: <4AA5F37F.4050307@maxim-ic.com>
Date: Tue, 8 Sep 2009 11:32:39 +0530
From: JerinJacob <jerin.jacob@maxim-ic.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: UBIFS Error
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Got an UBIFS error while performing a regression write test on UBIFS 
file system.


[Issue]
=======

While performing a regression write test on UBIFS file system,the UBIFS 
file system becomes read-only mode.
pseudo code for the regression write test as follows:

while(1)
{
create and write a random image(with different block size using dd 
command) to nand flash

if "disk space is reached maxim size"
    delete all the files

}



[Steps followed]
================

flash_eraseall /dev/mtd6
ubiformat /dev/mtd6 -y
modprobe ubi mtd=6 ; modprobe ubifs
ubimkvol /dev/ubi0 -m -N rootfs
mkfs.ubifs /dev/ubi0_0 -x none
mount -t ubifs ubi0:rootfs /ubifs_rootfs
"excetued the regression nand write test"


[Error Log]
===========
UBIFS error (pid 74): ubifs_read_node: bad node type (108 but expected 9)
UBIFS error (pid 74): ubifs_read_node: bad node at LEB 1108:97040

Backtrace:
[<c0122cd8>] (dump_backtrace+0x0/0x110) from [<c01231ac>] 
(dump_stack+0x18/0x1c)
 r6:c1f05a60 r5:0000006c r4:c1f9a000
[<c0123194>] (dump_stack+0x0/0x1c) from [<bf13cc30>] 
(ubifs_read_node+0x300/0x380 [ubifs])
[<bf13c930>] (ubifs_read_node+0x0/0x380 [ubifs]) from [<bf1651e8>] 
(ubifs_load_znode+0xa4/0x874 [ubifs])
[<bf165144>] (ubifs_load_znode+0x0/0x874 [ubifs]) from [<bf1411b4>] 
(lookup_level0_dirty+0xf8/0x448 [ubifs])
[<bf1410bc>] (lookup_level0_dirty+0x0/0x448 [ubifs]) from [<bf144048>] 
(ubifs_tnc_add+0x50/0x19c [ubifs])
[<bf143ff8>] (ubifs_tnc_add+0x0/0x19c [ubifs]) from [<bf12d5b0>] 
(ubifs_jnl_write_inode+0x118/0x260 [ubifs])
[<bf12d498>] (ubifs_jnl_write_inode+0x0/0x260 [ubifs]) from [<bf13a0ac>] 
(ubifs_write_inode+0xbc/0x198 [ubifs])
[<bf139ff0>] (ubifs_write_inode+0x0/0x198 [ubifs]) from [<c01c9ad4>] 
(__writeback_single_inode+0x2a4/0x378)
 r8:c084edac r7:00000005 r6:c084ed14 r5:c1f9a000 r4:00000000
[<c01c9830>] (__writeback_single_inode+0x0/0x378) from [<c01c9fd0>] 
(generic_sync_sb_inodes+0x33c/0x474)
[<c01c9c94>] (generic_sync_sb_inodes+0x0/0x474) from [<c01ca118>] 
(sync_sb_inodes+0x10/0x14)
[<c01ca108>] (sync_sb_inodes+0x0/0x14) from [<c01ca4d4>] 
(writeback_inodes+0xdc/0x110)
[<c01ca3f8>] (writeback_inodes+0x0/0x110) from [<c018a678>] 
(background_writeout+0xe8/0x120)
 r8:c0372680 r7:c1f9bf70 r6:c1f9bf6c r5:fffffd52 r4:00000152
[<c018a590>] (background_writeout+0x0/0x120) from [<c018b0ac>] 
(pdflush+0x140/0x2bc)
[<c018af6c>] (pdflush+0x0/0x2bc) from [<c015e364>] (kthread+0x58/0x84)
[<c015e30c>] (kthread+0x0/0x84) from [<c014a050>] (do_exit+0x0/0x70c)
 r5:00000000 r4:00000000

UBIFS warning (pid 74): ubifs_ro_mode: switched to read-only mode, error -22

Backtrace:
[<c0122cd8>] (dump_backtrace+0x0/0x110) from [<c01231ac>] 
(dump_stack+0x18/0x1c)
 r6:c1de2000 r5:c084ed14 r4:000000a0
[<c0123194>] (dump_stack+0x0/0x1c) from [<bf13c520>] 
(ubifs_ro_mode+0x68/0x78 [ubifs])
[<bf13c4b8>] (ubifs_ro_mode+0x0/0x78 [ubifs]) from [<bf12d5c8>] 
(ubifs_jnl_write_inode+0x130/0x260 [ubifs])
[<bf12d498>] (ubifs_jnl_write_inode+0x0/0x260 [ubifs]) from [<bf13a0ac>] 
(ubifs_write_inode+0xbc/0x198 [ubifs])
[<bf139ff0>] (ubifs_write_inode+0x0/0x198 [ubifs]) from [<c01c9ad4>] 
(__writeback_single_inode+0x2a4/0x378)
 r8:c084edac r7:00000005 r6:c084ed14 r5:c1f9a000 r4:00000000
[<c01c9830>] (__writeback_single_inode+0x0/0x378) from [<c01c9fd0>] 
(generic_sync_sb_inodes+0x33c/0x474)
[<c01c9c94>] (generic_sync_sb_inodes+0x0/0x474) from [<c01ca118>] 
(sync_sb_inodes+0x10/0x14)
[<c01ca108>] (sync_sb_inodes+0x0/0x14) from [<c01ca4d4>] 
(writeback_inodes+0xdc/0x110)
[<c01ca3f8>] (writeback_inodes+0x0/0x110) from [<c018a678>] 
(background_writeout+0xe8/0x120)
 r8:c0372680 r7:c1f9bf70 r6:c1f9bf6c r5:fffffd52 r4:00000152
[<c018a590>] (background_writeout+0x0/0x120) from [<c018b0ac>] 
(pdflush+0x140/0x2bc)
[<c018af6c>] (pdflush+0x0/0x2bc) from [<c015e364>] (kthread+0x58/0x84)
[<c015e30c>] (kthread+0x0/0x84) from [<c014a050>] (do_exit+0x0/0x70c)
 r5:00000000 r4:00000000

UBIFS error (pid 74): ubifs_write_inode: can't write inode 1073, error -22
UBIFS error (pid 74): make_reservation: cannot reserve 4144 bytes in 
jhead 2, error -30
UBIFS error (pid 74): do_writepage: cannot write page 0 of inode 1077, 
error -30
UBIFS error (pid 74): make_reservation: cannot reserve 160 bytes in 
jhead 1, error -30
UBIFS error (pid 74): ubifs_write_inode: can't write inode 1077, error -30
UBIFS error (pid 74): make_reservation: cannot reserve 4144 bytes in 
jhead 2, error -30



[Environment]
=============

root@mg3500evp323 # uname -a
Linux evp323 2.6.30.SDK6r3430 #1 PREEMPT Tue Sep 1 21:18:07 IST 2009 
armv5tejl GNU/Linux


root@evp323 # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 000c0000 00020000 "mboot1"
mtd1: 00320000 00020000 "kernel1"
mtd2: 00320000 00020000 "kernel2"
mtd3: 00220000 00020000 "initrd1"
mtd4: 00220000 00020000 "initrd2"
mtd5: 02880000 00020000 "rootfs"
mtd6: 3cc40000 00020000 "data"


root@evp323 # mtdinfo /dev/mtd6
mtd6
Name:                           data
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          7778 (1019478016 bytes, 972.3 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:12
Bad blocks are allowed:         true
Device is writable:             true


root@evp323 # modprobe ubi mtd=6 ; modprobe ubifs
UBI: attaching mtd6 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd6 to ubi0
UBI: MTD device name:            "data"
UBI: MTD device size:            972 MiB
UBI: number of good PEBs:        7763
UBI: number of bad PEBs:         15
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     2
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 7763
UBI: number of PEBs reserved for bad PEB handling: 77
UBI: max/mean erase counter: 26/25
UBI: background thread "ubi_bgt0d" started, PID 1163


root@evp323 # mount -t ubifs ubi0:rootfs /ubifs_rootfs
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 1, name "rootfs"
UBIFS: file system size:   832333824 bytes (812826 KiB, 793 MiB, 6451 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  0 bytes (0 KiB)


root@evp323 # ubinfo
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:60
Present UBI devices:            ubi0



It would be great, if someone could throw some light on this.
Any help is appreciated.

Thanks in Advance,
Jerin.
 
