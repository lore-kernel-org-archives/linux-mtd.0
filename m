Received: from [210.241.255.67] (helo=mail.cable.net.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rn3J-0001Y6-Uk
	for <linux-mtd@lists.infradead.org>; Wed, 27 Aug 2003 00:16:42 +0100
Received: from uyvd (unknown [203.162.166.239])
	by mail.cable.net.tw (Postfix) with ESMTP id 32CEB4012A
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Aug 2003 07:20:57 +0000 (UTC)
Message-ID: <000f01c36c27$d67c2390$0a0a10ac@uyvd>
From: "Van Duc Uy" <uyvd@cable.net.tw>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 27 Aug 2003 06:14:33 +0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: JFFS2 : garbage_collect_dirent failed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Subject: JFFS2 : garbage_collect_dirent failed


Hello all,
Some days ago, i already posted this message to list. i'm looking for your
helps about this problem.
i tried to trace the bug but still stucking into this problem so far.

following is my problem:

i patched JFFS2 and MTD drivers from linux kernel 2.4.20 to my kernel
2.4.17. i want to support MXIC flash MX29LV320T on my board.
after patched, i can compile and run kernel successfully. after that, i test
MTD driver and JFFS2 and have following problem.

1. here is boot message:
...
awtel_flash device: 400000 at e0000000
awtel_flash: ioremap is e0000000
buswidth is 2
MX FLASH: Probing for AMD compatible flash...
buswidth is 2
MX FLASH: Found 1 x 4MiB MXIC MX29LV320T at 0x0
phymap 0 amd_flash_probe: mymtd is 4d7320
Creating 4 MTD partitions on "MX FLASH":
0x00000000-0x00400000 : "Whole partition"
0x00000000-0x00010000 : "bios"
0x00010000-0x001f0000 : "kernel"
0x00200000-0x003f0000 : "Data"
...
2. i can eraseall /dev/mtd3 successfully and this partition nearly 2MB
i can use dd command to write 1 file (1.5MB ) to this partition, OK,
successfully.
3. i eraseall /dev/mtd3 again, and start to mount by jffs2 file system

# mount -t jffs2 /dev/mtdblock3 /tmp
and start to copy some file to /tmp, the problem start here.
#
# cp /bin/busybox /tmp  <-- SUCCESS
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/rom0                 3383      3383         0 100% /
/dev/mtdblock3            1984       488      1496  25% /var/tmp

 # cp /bin/ftpd /tmp
cp: write: Input/output error <-- Error here

# ls
busybox  ftpd
# rm ftpd
rm: unable to remove `ftpd': No space left on device <-- ????

#dmesg

Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (e
rasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 47 bytes for garbage_collect_dirent failed: -28

# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/rom0                 3383      3383         0 100% /
/dev/mtdblock3            1984       508      1476  26% /var/tmp
#

and i can not copy or remove file on this partition anymore. :(

4. here is information in /proc
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00010000 "Whole partition"
mtd1: 00010000 00010000 "bios"
mtd2: 001e0000 00010000 "kernel"
mtd3: 001f0000 00010000 "Data"

# cat /proc/filesystems
nodev   rootfs
nodev   bdev
nodev   proc
nodev   sockfs
nodev   pipefs
        ext2
nodev   ramfs
        jffs2
        romfs
#
# cat /proc/devices
Character devices:
  1 mem
  2 pty
  3 ttyp
  4 ttyS
  5 cua
 10 misc
 90 mtd
108 ppp
162 raw

Block devices:
 31 Blkmem
131 mtdblock

Yes, that is all of informations from my system.

Can any one give me a suggesstion for testing to find out the bug ?

Thanks in advance,
Duc Uy
