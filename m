Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JAijD-0000WP-9V
	for linux-mtd@lists.infradead.org; Fri, 04 Jan 2008 09:20:41 +0000
Received: by wa-out-1112.google.com with SMTP id v33so10427539wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Jan 2008 01:20:33 -0800 (PST)
Message-ID: <bae050c10801040120u5d2379aak666c76f99443ef7a@mail.gmail.com>
Date: Fri, 4 Jan 2008 17:20:33 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBIFS: copy file error
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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
   As you can see at last, copy file failed. I use ubifs-olpc-2.6.22 version.
   How can I make it right?

# modprobe nandsim
NAND device: Manufacturer ID: 0x98, Chip ID: 0x39 (Toshiba NAND 128MiB
1,8V 8-bit)
flash size: 128 MiB
page size: 512 bytes
OOB area size: 16 bytes
sector size: 16 KiB
pages number: 262144
pages per sector: 32
bus width: 8
bits in sector size: 14
bits in page size: 9
bits in OOB size: 4
flash size with OOB: 135168 KiB
page address bytes: 4
sector address bytes: 3
options: 0x62
Scanning device for bad blocks
Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
0x00000000-0x08000000 : "NAND simulator partition 0"
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00040000 "NAND BOOT partition"
mtd1: 00400000 00040000 "NAND KERNEL partition"
mtd2: 07800000 00040000 "NAND ROOTFS partition"
mtd3: 08000000 00040000 "NAND DATA1 partition"
mtd4: 10000000 00040000 "NAND DATA2 partition"
mtd5: 20000000 00040000 "NAND VFAT partition"
mtd6: 08000000 00004000 "NAND simulator partition 0"
# modprobe ubi mtd=6
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI: create volume table (copy #2)
UBI: attached mtd6 to ubi0
UBI: MTD device name:            "NAND simulator partition 0"
UBI: MTD device size:            128 MiB
UBI: physical eraseblock size:   16384 bytes (16 KiB)
UBI: logical eraseblock size:    15872 bytes
UBI: number of good PEBs:        8192
UBI: number of bad PEBs:         0
UBI: smallest flash I/O unit:    512
UBI: VID header offset:          256 (aligned 256)
UBI: data offset:                512
UBI: max. allowed volumes:       92
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             8107
UBI: total number of reserved PEBs: 85
UBI: number of PEBs reserved for bad PEB handling: 81
UBI: max/mean erase counter: 0/0
UBI: background thread "ubi_bgt0d" started, PID 784
# pwd
/home/yrtan/utils
# ./ubimkvol -d 0 -n 0 -N ubifs -s 128MiB
Cannot create volume: No space left on device
  err=-1
# ./ubimkvol -d 0 -n 0 -N ubifs -s 124MiB
Cannot create volume: No space left on device
  err=-1
# ./ubimkvol -d 0 -n 0 -N ubifs -s 123MiB
Cannot create volume: No space left on device
  err=-1
# ./ubimkvol -d 0 -n 0 -N ubifs -s 122MiB
# modprobe ubifs
# mount -t ubifs ubi0:ubifs /mnt/1
UBIFS: default file-system created
UBIFS: mounted UBI device 0, volume 0
UBIFS: minimal I/O unit size:   512 bytes
UBIFS: logical eraseblock size: 15872 bytes (15 KiB)
UBIFS: file system size:        127229952 bytes (124248 KiB, 121 MiB,
8016 LEBs)
UBIFS: journal size:            6396416 bytes (6246 KiB, 6 MiB, 403
LEBs)
UBIFS: data journal heads:      1
UBIFS: default compressor:      LZO
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
tmpfs                    30032        52     29980   0% /dev
ubi0:ubifs               88176        60     88116   0% /mnt/1
# du /root/Documents/ -h
36.9M   /root/Documents
# cp /root/Documents/* /mnt/1
UBIFS: background thread "ubifs_bg_thread0_0" started, PID 832
UBIFS error (pid 832): do_commit: commit failed, error 3
UBIFS warning (pid 832): ubifs_ro_mode: switched to read-only mode
cp: write error: Invalid argument

cp: write error: Invalid argument
cp: write error: Invalid argument
cp: write error: Invalid argument
cp: write error: Invalid argument
# UBIFS error (pid 40): do_writepage: cannot write page 1124 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1125 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1126 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1127 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1128 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1129 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1130 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1131 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1132 of inode
65, error -22
UBIFS error (pid 40): do_writepage: cannot write page 1133 of inode
65, error -22
