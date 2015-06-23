Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7VCU-0007uv-Ci
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 20:53:47 +0000
Received: by lagi2 with SMTP id i2so14259900lag.2
 for <linux-mtd@lists.infradead.org>; Tue, 23 Jun 2015 13:53:24 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 23 Jun 2015 22:53:23 +0200
Message-ID: <CAPpUg6MX6L+z7qsweSxQa5TpHhcbP1GZySZ1qAShPMAvr_QMoQ@mail.gmail.com>
Subject: m25p80, wait_till_ready removed
From: Baptiste Clenet <bapclenet@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm working on the board Ralink MT7628 which uses the driver m25p80 to
write the flash memory. I'm upgrading the kernel from 3.18 to 4.0.4
and I've got some problems concerning the flash.
jffs2 complains about wrong CRC:

[   18.900000] jffs2: jffs2_scan_inode_node(): CRC failed on node at
0x0047000c: Read 0x4552e06b, calculated 0x4900568b
[   18.930000] jffs2: jffs2_scan_dirent_node(): Node CRC failed on
node at 0x00470050: Read 0xffffffff, calculated 0x602684d4

... many times

Currently, my changes in /etc/config/network are not saved after
reboot. I presume it is related to my errors. /etc/config/network is
writeable since it is inside /overlay/upper (any edits inside it are
not saved after reboot).

I've attached a patch which failed when I upgrade to kernel 4.0.4.
Obviously, nor->wait_till_ready(nor); couldn't work since it has been
removed. I'm wondering how to replace it and if it could be related to
my problem? (Only removing it brought me to my errors)



Here are some details about the structure of my board:
[    0.480000] Creating 4 MTD partitions on "spi32766.0":
[    0.490000] 0x000000000000-0x000000030000 : "u-boot"
[    0.500000] 0x000000030000-0x000000040000 : "u-boot-env"
[    0.510000] 0x000000040000-0x000000050000 : "factory"
[    0.520000] 0x000000050000-0x000000800000 : "firmware"

[    0.550000] 2 uimage-fw partitions found on MTD device firmware
[    0.570000] 0x000000050000-0x00000016b46d : "kernel"
[    0.580000] 0x00000016b46d-0x000000800000 : "rootfs"

[    0.590000] mtd: device 5 (rootfs) set to be root filesystem
[    0.600000] 1 squashfs-split partitions found on MTD device rootfs
[    0.610000] 0x000000380000-0x000000800000 : "rootfs_data"


root@OpenWrt:/overlay/upper/etc# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00030000 00010000 "u-boot"
mtd1: 00010000 00010000 "u-boot-env"
mtd2: 00010000 00010000 "factory"
mtd3: 007b0000 00010000 "firmware"
mtd4: 0011b46d 00010000 "kernel"
mtd5: 00694b93 00010000 "rootfs"
mtd6: 00480000 00010000 "rootfs_data"

root@OpenWrt:/overlay/upper/etc# cat /proc/partitions
major minor  #blocks  name

  31        0        192 mtdblock0
  31        1         64 mtdblock1
  31        2         64 mtdblock2
  31        3       7872 mtdblock3
  31        4       1133 mtdblock4
  31        5       6738 mtdblock5
  31        6       4608 mtdblock6

root@OpenWrt:/overlay/upper/etc# cat /proc/mounts
/dev/root /rom squashfs ro,relatime 0 0
proc /proc proc rw,noatime 0 0
sysfs /sys sysfs rw,noatime 0 0
tmpfs /tmp tmpfs rw,nosuid,nodev,noatime 0 0
/dev/mtdblock6 /overlay jffs2 rw,noatime 0 0
overlayfs:/overlay / overlay
rw,noatime,lowerdir=/,upperdir=/overlay/upper,workdir=/overlay/work 0
0
tmpfs /dev tmpfs rw,relatime,size=512k,mode=755 0 0
devpts /dev/pts devpts rw,relatime,mode=600 0 0
debugfs /sys/kernel/debug debugfs rw,noatime 0 0


I would be grateful if you could help me a bit on that.

Cheers,

Baptiste
