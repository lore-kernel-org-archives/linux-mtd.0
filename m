Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SgiZN-0008Oa-5J
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 20:29:05 +0000
Received: by vcbf13 with SMTP id f13so3209179vcb.36
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2012 13:29:03 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 18 Jun 2012 22:29:03 +0200
Message-ID: <CAMU=cjyiX2KnntUFYYa-fwi0QAKX-Um1gE8tpNLwNiNsbj8O1Q@mail.gmail.com>
Subject: Loosed files after umount/mount
From: Andreas Friesen <ndrs.frsn@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm experiencing a strange problem with JFFS2 using Linux
3.1.5, 3.4 from kernel.org.git on PowerPC. After unmounting and
remounting the filesystem,
directory is empty.

$ flash_erase /dev/mtd2
$ reboot
$ mount mtd:storage /storage -t jffs2
$ scp root@server:/tmp/settings/*.xml /storage
$ sync
$ umount /storage
$ mount mtd:storage /storage -t jffs2
$ ls /storage
... empty ?????

Any Hints?

-- Andreas Friesen


root@hbm-000c4e:/$lsmod
Module                  Size  Used by
jffs2                  85057  1
lzo_decompress          5219  1 jffs2
lzo_compress            5143  1 jffs2


root@hbm-000c4e:/$uname -a
Linux hbm-000c4e 3.4.0+ #10 PREEMPT Mon Jun 18 20:07:04 CEST 2012 ppc
GNU/Linux

$ cat build/linux/.config | grep JFFS2
CONFIG_JFFS2_FS=3Dm
CONFIG_JFFS2_FS_DEBUG=3D0
CONFIG_JFFS2_SUMMARY=3Dy
CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
CONFIG_JFFS2_LZO=3Dy
CONFIG_JFFS2_RTIME=3Dy
CONFIG_JFFS2_CMODE_PRIORITY=3Dy

$ cat build/linux/.config | grep MTD
CONFIG_MTD=3Dy
CONFIG_MTD_OF_PARTS=3Dy
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLKDEVS=3Dy
CONFIG_MTD_BLOCK=3Dy
CONFIG_MTD_CFI=3Dy
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_I2=3Dy
CONFIG_MTD_CFI_INTELEXT=3Dy
CONFIG_MTD_CFI_UTIL=3Dy
CONFIG_MTD_PHYSMAP_OF=3Dy
CONFIG_OF_MTD=3Dy


dmesg  output:
[    0.476401] ff000000.flash: Found 1 x16 devices at 0x0 in 8-bit
bank. Manufacturer ID 0x000089 Chip ID 0x000018
[    0.486776] Intel/Sharp Extended Query Table at 0x0031
[    0.492098] Intel/Sharp Extended Query Table at 0x0031
[    0.497412] Using buffer write method
[    0.501208] cfi_cmdset_0001: Erase suspend on write enabled
[    0.506957] erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D128
[    0.508533] 8 ofpart partitions found on MTD device ff000000.flash
[    0.514996] Creating 8 MTD partitions on "ff000000.flash":
[    0.520718] 0x000000000000-0x000000200000 : "kernel"
[    0.527869] 0x000000200000-0x000000600000 : "rootfs"
[    0.535008] 0x000000600000-0x000000c00000 : "storage"
[    0.542277] 0x000000c00000-0x000000f00000 : "parameter"
[    0.549535] 0x000000f00000-0x000000f40000 : "uboot"
[    0.556607] 0x000000f40000-0x000000f60000 : "ubootenv"
..
[    8.914470] jffs2: version 2.2. (SUMMARY)  =A9 2001-2006 Red Hat, Inc.
