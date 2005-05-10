Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVSht-0006VF-Fo
	for linux-mtd@lists.infradead.org; Tue, 10 May 2005 07:15:22 -0400
Received: from mikobook.office.rac.de ([10.0.0.84])
	by mail2.racnet.net with asmtp (Exim (Debian)) id 1DVShv-0008RW-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 May 2005 13:15:23 +0200
Message-ID: <428097CB.3010801@rac.de>
Date: Tue, 10 May 2005 13:15:23 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Subject: partition doesn't end on an erase block -> eraseall - permission
 denied
Reply-To: m.mikolaiczyk@rac.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Our board uses a NOR Flash (mtd0,1) and a NAND flash 2Gbit Samsung
(256MByte). The NAND is now beeing recognised by the kernel but has some
problems with finding an eraseblock on the NAND.
Pagesize (2K + 64)Bytes
Blocksize(128K + 4K)Bytes (=eraseblocksize 0x21000)

Maybe to make a partition which ends up on an eraseblock could be a
solution?
nanddump is working.

dmesg:
...
devfs: v1.12a (20020514) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
Dummy keyboard driver installed.
pty: 256 Unix98 ptys configured
12:34:56:78:99:9A
12:34:56:78:99:9A
physmap flash device: 2000000 at a8000000
Triboard Flash: Found 2 x16 devices at 0x0 in 32-bit mode
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
Creating 2 MTD partitions on "Triboard Flash":
0x00000000-0x00500000 : "Kernel + BOLO"
mtd: Giving out device 0 to Kernel + BOLO
0x00500000-0x02000000 : "User_Flash"
mtd: Giving out device 1 to User_Flash
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB
3,3V 8-bit)
Creating 1 MTD partitions on "NAND 256MiB 3,3V 8-bit":
0x00000000-0x10000000 : "BTU NAND flash partition 1"
mtd: partition "BTU NAND flash partition 1" doesn't end on an erase
block -- force read-only
mtd: Giving out device 2 to BTU NAND flash partition 1
...

nanddump /dev/mtd/2 test_mtd2_dump_02 0x0 0x400

Jan  1 00:08:21 10 daemon.info klogd: MTD_open
Jan  1 00:08:21 10 daemon.info klogd: MTD_ioctl
Jan  1 00:08:23 10 daemon.info klogd: MTD_read
Jan  1 00:08:23 10 daemon.info klogd: nand_read_ecc: from = 0x00000000,
len = 512
Jan  1 00:08:23 10 daemon.warn klogd: Reading data from NAND FLASH
without ECC is not recommended
Jan  1 00:08:24 10 daemon.info klogd: MTD_ioctl
Jan  1 00:08:24 10 daemon.info klogd: nand_read_oob: from = 0x00000000,
len = 16
Jan  1 00:08:24 10 daemon.info klogd: MTD_read
Jan  1 00:08:24 10 daemon.info klogd: nand_read_ecc: from = 0x00000200,
len = 512
Jan  1 00:08:24 10 daemon.warn klogd: Reading data from NAND FLASH
without ECC is not recommended
Jan  1 00:08:24 10 daemon.info klogd: MTD_ioctl
Jan  1 00:08:24 10 daemon.info klogd: nand_read_oob: from = 0x00000200,
len = 16
Jan  1 00:08:24 10 daemon.info klogd: MTD_close
Jan  1 00:08:24 10 daemon.info klogd: nand_sync: called

bash-2.05a# eraseall -j /dev/mtd/2
eraseall: /dev/mtd/2: Permission denied

Jan  1 00:10:31 10 daemon.info klogd: MTD_open

bash-2.05a# unlock /dev/mtd/2
Could not open mtd device: /dev/mtd/2
