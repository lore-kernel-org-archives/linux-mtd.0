Received: from mail1317.opentransfer.com ([76.162.254.113])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0t0J-00078i-O2
 for linux-mtd@lists.infradead.org; Sat, 28 Jun 2014 13:49:20 +0000
Message-ID: <53AEC7C9.5070408@GlueLogix.com>
Date: Sat, 28 Jun 2014 09:48:57 -0400
From: Larry Martin <Larry@GlueLogix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Request for help booting Gumstix from MTD Flash
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, I am writing this list because my question is not being answered 
on the Gumstix list, so I am turning to the subsystem developers.  I 
have a u-boot, kernel and rootfs all booting properly from MMC, but when 
I try to boot the set from NAND the kernel says the rootfs superblock is 
empty.

I think the problem may be mapping of the MTD block boundaries.  Gumstix 
provides Angstrom images in NAND, which boot fine, but their MTD 
partition sizes differ from mine.  I started my project in Linaro and 
intended to distribute on MMC at first, until we had vibration issues. 
Now I need my Linaro stuff to work in NAND.  The Linaro MTD partitions 
differ from the Angstrom ones.  I'm hoping someone here can point me to 
the right information to get my system working.

My UBI volume is in MTD4.  It was made from my working MMC rootfs on a 
Linux Mint PC using these commands:

 > sudo mkfs.ubifs -v -r /media/rootfs1 -o rootfs.ubifs -m 2048 -e 
129024  -c 1996
 > sudo ubinize -v -o rootfs.ubi -m 2048 -p 128KiB -s 512 ubi.cfg
where ubi.cfg is:
 > [ubifs]
 > mode=ubi
 > image=rootfs.ubifs
 > vol_id=0
 > vol_type=dynamic
 > vol_name=rootfs
 > vol_flags=autoresize

rootfs.ubi starts with "UBI#".  After installation with 'ubiformat -y 
/dev/mtd4 -f rootfs.ubi', I read MTD4 back and compared it with the 
input file.  They differ by about 32K scattered bytes, which I assume 
are erase counters.  MTD4 does start with "UBI#".  While booted from 
MMC, I got these MTD sizes from /sys/class/mtd.  In the Angstrom boot, 
MTD3 is smaller, so the start of MTD4 is different.

 > P       size             start
 > 0 524288         80000   00000000
 > 1 1835008       1C0000   00080000
 > 2 262144         40000   00240000
 > 3 8388608       800000   00280000
 > 4 525860864   1F580000   00A80000

When I try to boot from NAND, the kernel says the superblock is empty. 
It should not be empty.  I'm hoping somebody here can help me connect 
the dots.  Here are the important parts of my boot log:

 > [    1.447052] UBI: attaching mtd4 to ubi0
 > [    1.451354] UBI: physical eraseblock size:   131072 bytes (128 KiB)
 > [    1.457977] UBI: logical eraseblock size:    129024 bytes
 > [    1.463653] UBI: smallest flash I/O unit:    2048
 > [    1.468597] UBI: sub-page size:              512
 > [    1.473480] UBI: VID header offset:          512 (aligned 512)
 > [    1.479614] UBI: data offset:                2048
 > [    2.823974] UBI: max. sequence number:       0
 > [    2.854461] UBI: volume 0 ("rootfs") re-sized from 2980 to 3968 LEBs
 > [    2.862243] UBI: attached mtd4 to ubi0
 > [    2.866271] UBI: MTD device name:            "rootfs"
 > [    2.871612] UBI: MTD device size:            501 MiB
 > [    2.876831] UBI: number of good PEBs:        4012
 > [    2.881774] UBI: number of bad PEBs:         0
 > [    2.886444] UBI: number of corrupted PEBs:   0
 > [    2.891143] UBI: max. allowed volumes:       128
 > [    2.896026] UBI: wear-leveling threshold:    4096
 > [    2.900939] UBI: number of internal volumes: 1
 > [    2.905639] UBI: number of user volumes:     1
 > [    2.910339] UBI: available PEBs:             0
 > [    2.915008] UBI: total number of reserved PEBs: 4012
 > [    2.920227] UBI: number of PEBs reserved for bad PEB handling: 40
 > [    2.926666] UBI: max/mean erase counter: 0/0
 > [    2.931152] UBI: image sequence number:  95215050
 > [    2.936126] UBI: background thread "ubi_bgt0d" started, PID 46
...
 > [    5.073486] UBIFS error (pid 1): ubifs_read_node: bad node type (0
 > but expected 6)
 > [    5.081542] UBIFS error (pid 1): ubifs_read_node: bad node at LEB
 > 0:0, LEB mapping status 1
 > [    5.090545] Not a node, first 24 bytes:
 > [    5.094512] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 > 00 00 00 00 00 00 00 00 ........................
 > [    5.108398] [<c00132b4>] (unwind_backtrace+0x0/0x11c) from
 > [<c01c038c>] (ubifs_read_node+0x264/0x29c)
 > [    5.118194] [<c01c038c>] (ubifs_read_node+0x264/0x29c) from
 > [<c01bd1b0>] (ubifs_read_sb_node+0x50/0x70)
 > [    5.128173] [<c01bd1b0>] (ubifs_read_sb_node+0x50/0x70) from
 > [<c01bd230>] (ubifs_read_superblock+0x20/0xeec)
 > [    5.138610] [<c01bd230>] (ubifs_read_superblock+0x20/0xeec) from
 > [<c01bbdbc>] (ubifs_mount+0x940/0x1b04)
 > [    5.148773] [<c01bbdbc>] (ubifs_mount+0x940/0x1b04) from [<c00e1dc8>]
 > (mount_fs+0x70/0x164)
 > [    5.157684] [<c00e1dc8>] (mount_fs+0x70/0x164) from [<c00f8400>]
 > (vfs_kern_mount+0x4c/0xc0)
 > [    5.166595] usb 1-2.1: New USB device found, idVendor=0424,
 > idProduct=ec00
 > [    5.173919] [<c00f8400>] (vfs_kern_mount+0x4c/0xc0) from [<c00f84a8>]
 > (do_kern_mount+0x34/0xd4)
 > [    5.183105] usb 1-2.1: New USB device strings: Mfr=0, Product=0,
 > SerialNumber=0
 > [    5.190856] [<c00f84a8>] (do_kern_mount+0x34/0xd4) from [<c00fa04c>]
 > (do_mount+0x658/0x6e8)
 > [    5.200347] [<c00fa04c>] (do_mount+0x658/0x6e8) from [<c00fa168>]
 > (sys_mount+0x84/0xc4)
 > [    5.209930] [<c00fa168>] (sys_mount+0x84/0xc4) from [<c0654c14>]
 > (mount_block_root+0xe4/0x218)
 > [    5.219238] [<c0654c14>] (mount_block_root+0xe4/0x218) from
 > [<c0654fc4>] (prepare_namespace+0x88/0x1bc)
 > [    5.229248] [<c0654fc4>] (prepare_namespace+0x88/0x1bc) from
 > [<c065496c>] (kernel_init+0x1b8/0x1f8)
 > [    5.238861] [<c065496c>] (kernel_init+0x1b8/0x1f8) from [<c000ee48>]
 > (kernel_thread_exit+0x0/0x8)
 > [    5.254455] List of all partitions:
 > [    5.258178] 1f00             512 mtdblock0  (driver?)
 > [    5.263580] 1f01            1792 mtdblock1  (driver?)
 > [    5.268920] 1f02             256 mtdblock2  (driver?)
 > [    5.274261] 1f03            8192 mtdblock3  (driver?)
 > [    5.279602] 1f04          513536 mtdblock4  (driver?)
 > [    5.284942] 1f05          499968 mtdblock5  (driver?)
 > [    5.290283] No filesystem could mount root, tried:  ubifs
 > [    5.295989] Kernel panic - not syncing: VFS: Unable to mount root fs
 > on unknown-block(0,0)

AT 5.094 seconds, the system reads 24 bytes all zero.  But my superblock 
starts with "UBI#"  ! The sizes at 5.258 seconds look right, assuming 
they are 1K blocks.

See also:
http://gumstix.8.x6.nabble.com/Re-Is-there-an-easy-way-to-make-a-UBI-image-from-a-working-MMC-tt4969276.html
http://gumstix.8.x6.nabble.com/Is-there-an-easy-way-to-make-a-UBI-image-from-a-working-MMC-tt4969113.html

Thanks,
Larry





-- 
Larry Martin
www.GlueLogix.com
Design, Test and Support of Computerized Systems
desk USA 919.342.0201
cell USA 919.641.1733
