Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D91Yc-0004LQ-Jn
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2005 08:49:05 -0500
Date: Wed, 9 Mar 2005 14:14:54 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050309131453.GA2497@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi people!

These days I have time again for my embedded system to investigate what
weird shit is happening here with the probplems introduced trying to
configure the Flash device to run in sync burst mode.
It is an intel 28F128K3 device with a motorola i.MX cpu.

I now set up a debug environment: I am running a classical kernel
locatedt in FLASH which is succesfully copied and decompressed into
SDRAM. It mounts its root via nfs from server and from there I mount
/dev/mtdblockX for testing purposes with jffs2 and mtd debug turned on.

First weird thing is, reading writing from the device works perfect.
I diffed original and copy and diff putted out no difference. I copied
from flash back into root, copied the copy and diffed on the PC also, no
differences. I tried small files, big files (i.e. libc, 1.5MB) and tried
also /dev/urandom.

Then I populated the rootfs in /dev/mtdblock with the rootfs, booted
with nfs-root again and mounted:

sh-2.05b# mount -t jffs2 /dev/mtdblock3 /mnt
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0004206c: Read
0x9acd7a6e, calculated 0x7fb7dc11
Name for which CRC failed is (now) 'ld-uClibc-0.ø', ino #248
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0009a2b0: Read
0xb08c7dea, calculated 0xd3eba660
Name for which CRC failed is (now) 'modules.', ino #285
jffs2_scan_dirent_node(): Name CRC failed on node at 0x001126e8: Read
0x839452cb, calculated 0xa6182a48
Name for which CRC failed is (now) 'openssh-host-key­ï.sh', ino #376
jffs2_scan_dirent_node(): Name CRC failed on node at 0x002c97ec: Read
0xb08c7dea, calculated 0x0bb60059
Name for which CRC failed is (now) 'modules.ieee', ino #541
jffs2_scan_dirent_node(): Name CRC failed on node at 0x002c9828: Read
0xa33d20d0, calculated 0x2ed7968c
Name for which CRC failed is (now) 'modules.ieee1394µ', ino #0
sh-2.05b# umount /mnt

I did "cat /dev/mtdblock3 > file1" into nfs-root (as a side note, I did
the same again with dd bs=1024k:
konsti@synertronixx3:/usr/src/debian_arm/ > md5sum ddmtdblock3 
e871d71c52d93c1cafb4a8f4ff47a741  ddmtdblock3
konsti@synertronixx3:/usr/src/debian_arm/ > md5sum mtdblock3 
e871d71c52d93c1cafb4a8f4ff47a741  mtdblock3
).

This is emacs in hexl-mode on these files:

jffs2_scan_dirent_node(): Name CRC failed on node at 0x0004206c: Read
0x9acd7a6e, calculated 0x7fb7dc11
Name for which CRC failed is (now) 'ld-uClibc-0.ø', ino #248

00042070: 3b00 0000 7939 3f2d 0700 0000 f600 0000  ;...y9?-........                  
00042080: f800 0000 16a9 ef41 1308 0000 06d6 16d5  .......A........                  
00042090: 6e7a cd9a 6c64 2d75 436c 6962 632d 302e  nz..ld-uClibc-0.                  
000420a0: 392e 3236 2e73 6fff 8519 02c0 3d08 0000  9.26.so.....=...                  
000420b0: b345 d380 f800 0000 0100 0000 ed81 0000  .E..............

ASCII code of the "crossed o" is f8, second line, first byte.

jffs2_scan_dirent_node(): Name CRC failed on node at 0x0009a2b0: Read
0xb08c7dea, calculated 0xd3eba660
Name for which CRC failed is (now) 'modules.', ino #285

0009a2b0: 8519 01e0 3b00 0000 7939 3f2d 1701 0000  ....;...y9?-....                  
0009a2c0: 1b01 0000 1d01 0000 fbb0 ef41 1308 0000  ...........A....                  
0009a2d0: 2c46 14cc ea7d 8cb0 6d6f 6475 6c65 732e  ,F...}..modules.                  
0009a2e0: 6965 6565 3133 3934 6d61 70ff 8519 02c0  ieee1394map.....                  
0009a2f0: 8d00 0000 915a b293 1d01 0000 0100 0000  .....Z..........

What should become "ieee1394map" has become nothing, probably second
line, the 0000.

jffs2_scan_dirent_node(): Name CRC failed on node at 0x001126e8: Read
0x839452cb, calculated 0xa6182a48
Name for which CRC failed is (now) 'openssh-host-key­ï.sh', ino #376

001126e0: 0418 0017 1272 f3ff 8519 01e0 3e00 0000  .....r......>...                  
001126f0: 4bc9 e11a 0a00 0000 7601 0000 7801 0000  K.......v...x...                  
00112700: 9aad ef41 1608 0000 2312 0de0 cb52 9483  ...A....#....R..                  
00112710: 6f70 656e 7373 682d 686f 7374 2d6b 6579  openssh-host-key                  
00112720: 6765 6e2e 7368 ffff 8519 02c0 2801 0000  gen.sh......(...                  
00112730: 91d9 c5e8 7801 0000 0100 0000 ed81 0000  ....x...........

The "i" with two dots is ef third byte, second line.

Name for which CRC failed is (now) 'modules.ieee', ino #541
jffs2_scan_dirent_node(): Name CRC failed on node at 0x002c9828: Read
0xa33d20d0, calculated 0x2ed7968c

002c9820: 3133 3934 6d61 70ff 8519 01e0 4000 0000  1394map.....@...                  
002c9830: e41e 0191 e401 0000 4700 0000 0000 0000  ........G.......                  
002c9840: b500 0000 1800 367c 6ede 69d5 d020 3da3  ......6|n.i.. =.                  
002c9850: 6d6f 6475 6c65 732e 6965 6565 3133 3934  modules.ieee1394                  
002c9860: 6d61 702e 7465 6d70 8519 02c0 4400 0000  map.temp....D...                  
002c9870: 1dfb f798 1e02 0000 0100 0000 a481 0000  ................

Again kernel read "00" (line above third or fourth byte) instead of
1394map.temp.

jffs2_scan_dirent_node(): Name CRC failed on node at 0x002c9828: Read
0xa33d20d0, calculated 0x2ed7968c
Name for which CRC failed is (now) 'modules.ieee1394µ', ino #0

002c9820: 3133 3934 6d61 70ff 8519 01e0 4000 0000  1394map.....@...                  
002c9830: e41e 0191 e401 0000 4700 0000 0000 0000  ........G.......                  
002c9840: b500 0000 1800 367c 6ede 69d5 d020 3da3  ......6|n.i.. =.                  
002c9850: 6d6f 6475 6c65 732e 6965 6565 3133 3934  modules.ieee1394                  
002c9860: 6d61 702e 7465 6d70 8519 02c0 4400 0000  map.temp....D...                  
002c9870: 1dfb f798 1e02 0000 0100 0000 a481 0000  ................

The µ is B5, second line, first byte.

The Kernel is completely XIP unaware or such, it is 
Linux 192.168.1.133 2.6.11-rc2-mm1-imx1 #169 Wed Mar 9 12:49:57 CET 2005
armv4tl GNU/Linux
The error messages are the same if I reboot or try to mount the fs as
root-fs initially also.

Where is jffs2 stumbling upon?
Doesn't jffs cope correctly with cancelled or wrapped around word reads?
But why is Kernel correctly copied then and 6 files broken and not a
dozen? Why could this be unreproducable on less complex filesystem
structures?

Kind Regards, Konsti


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
