Received: from ug-out-1314.google.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ghxwx-0000aW-2C
	for linux-mtd@lists.infradead.org; Wed, 08 Nov 2006 19:39:29 -0500
Received: by ug-out-1314.google.com with SMTP id m2so72088uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Nov 2006 16:39:20 -0800 (PST)
Message-ID: <9c9fda240611081639t663c5ce3xec172d1284c3aa8b@mail.gmail.com>
Date: Thu, 9 Nov 2006 09:39:19 +0900
From: "Kyungmin Park" <kyungmin78@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: OneNAND UBI
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here's full sequences of UBI on OneNAND.

1. onenand partitions

Muxed OneNAND 128MB 1.8V 16-bit (0x30)
Scanning device for bad blocks
Bad eraseblock 4 at 0x00080000
Bad eraseblock 32 at 0x00400000
Bad eraseblock 1008 at 0x07e00000
Creating 6 MTD partitions on "onenand":
0x00000000-0x00020000 : "X-Loader + U-Boot"
0x00020000-0x00040000 : "params"
0x00040000-0x00240000 : "kernel"
0x00240000-0x01240000 : "rootfs"
0x01240000-0x03240000 : "filesystem00"
0x03240000-0x08000000 : "filesystem01"

/ # /mtd-utils/eraseall /dev/mtd3
Erasing onenand_erase: attempt to erase a bad block at addr 0x00400000
Erasing 128 Kibyte @ 1c0000 -- 10 % complete.
MTD Erase failure: Input/output error
Erasing 128 Kibyte @ fe0000 -- 99 % complete.

There's one initial bad block, so we can't use this partition as block
device such as cramfs

2. Load ubi module

/ # insmod /mtd-utils/ubi.ko mtd=3
Using /mtd-utils/ubi.ko
UBI: background thread "ubi_bgt0d" started, PID 192
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI: create volume table (copy #2)
UBI: mean erase counter:         0
UBI: attached mtd3 to ubi0
UBI: MTD device name:            "rootfs"
UBI: MTD device size:            16 MB
UBI: physical eraseblock size:   131072 bytes (128 KB)
UBI: logical eraseblock size:    126976 bytes
UBI: number of good PEBs:        127
UBI: number of bad PEBs:         1
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. allowed volumes:       124
UBI: wear-levelling threshold:   4096
UBI: number of internal volumes: 2
UBI: number of user volumes:     0
UBI: available PEBs:             122
UBI: total number of reserved PEBs: 5
UBI: number of PEBs reserved for bad PEB handling: 1

3. Create ubi volume

/ # /mtd-utils/ubimkvol -s 10485760 -N rootfs-cramfs -d 0

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00020000 "X-Loader + U-Boot"
mtd1: 00020000 00020000 "params"
mtd2: 00200000 00020000 "kernel"
mtd3: 01000000 00020000 "rootfs"
mtd4: 02000000 00020000 "filesystem00"
mtd5: 04dc0000 00020000 "filesystem01"
mtd6: 00a0d000 0001f000 "rootfs-cramfs" <= ubi partition

ubi parition, mtd6 is created.

4. copy cramfs image to ubi partition

/ # cp cramfs.img /dev/mtdblock6

5. mount cramfs and test

/ # mount -t cramfs /dev/mtdblock6 /tmp

/ # cd /tmp
/tmp # ls
bin     dev     lib     proc    tmp     var
cramfs  etc     mnt     sbin    usr
/tmp # mount
/dev/mtdblock6 on /tmp type cramfs (ro)

6. create jffs2 ubi partition

/ # /mtd-utils/ubimkvol -s 4194304 -N rootfs-jffs2 -d 0

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00020000 "X-Loader + U-Boot"
mtd1: 00020000 00020000 "params"
mtd2: 00200000 00020000 "kernel"
mtd3: 01000000 00020000 "rootfs"
mtd4: 02000000 00020000 "filesystem00"
mtd5: 04dc0000 00020000 "filesystem01"
mtd6: 00a0d000 0001f000 "rootfs-cramfs"
mtd7: 0041e000 0001f000 "rootfs-jffs2"

ubi partition, mtd7 is created.

7. mount jffs2 and test

/ # mount -t jffs2 /dev/mtdblock7 /mnt
JFFS2 write-buffering enabled buffer (2048) erasesize (126976)
/ # mount
/dev/mtdblock6 on /tmp type cramfs (ro)
/dev/mtdblock7 on /mnt type jffs2 (rw)

/ # cd /mnt
/mnt # cat /proc/filesystems > filesystem
/mnt # cat filesystem
nodev   sysfs
nodev   rootfs
nodev   bdev
nodev   proc
nodev   binfmt_misc
nodev   debugfs
nodev   sockfs
nodev   pipefs
nodev   futexfs
nodev   tmpfs
nodev   inotifyfs
nodev   eventpollfs
nodev   devpts
        cramfs
nodev   ramfs
nodev   nfs
nodev   jffs2
nodev   rpc_pipefs
/mnt # cd ..
/ # umount /mnt
/ # mount -t jffs2 /dev/mtdblock7 /mnt
JFFS2 write-buffering enabled buffer (2048) erasesize (126976)
/ # cd /mnt
/mnt # cat filesystem
nodev   sysfs
nodev   rootfs
nodev   bdev
nodev   proc
nodev   binfmt_misc
nodev   debugfs
nodev   sockfs
nodev   pipefs
nodev   futexfs
nodev   tmpfs
nodev   inotifyfs
nodev   eventpollfs
nodev   devpts
        cramfs
nodev   ramfs
nodev   nfs
nodev   jffs2
nodev   rpc_pipefs

Thank you,
Kyungmin Park
