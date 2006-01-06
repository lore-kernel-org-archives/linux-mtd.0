Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eusb2-0000he-L3
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2006 09:29:42 -0500
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1Eusaz-0003c5-Uv
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2006 15:29:33 +0100
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.1.9.35) with SMTP id
	M2006010615293328310
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2006 15:29:33 +0100
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1Eusaz-0003cT-Rb
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2006 15:29:33 +0100
Message-ID: <43BE7ECD.2080606@inf.u-szeged.hu>
Date: Fri, 06 Jan 2006 15:29:33 +0100
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Latest mtd snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

we have a problem with the latest mtd snapshot and nandsim. (kernel
version is 2.6.14.3 (x86))

We run the following commands, but it doesn't work.
# modprobe nandsim
# flash_eraseall -j /dev/mtd0
# mount /mnt/flash/
# cp /boot/vmlinuz-2.6.14.3 /mnt/flash/
# umount /mnt/flash/
# mount /mnt/flash/
mount: /dev/mtd0: can't read superblock

kern.log:
kernel: NAND device: Manufacturer ID: 0x98, Chip ID: 0x39 (Toshiba NAND 
8MiB 1,8V 8-bit)
kernel: flash size: 8 MiB
kernel: page size: 512 bytes
kernel: OOB area size: 16 bytes
kernel: sector size: 8 KiB
kernel: pages number: 16384
kernel: pages per sector: 16
kernel: bus width: 8
kernel: bits in sector size: 13
kernel: bits in page size: 9
kernel: bits in OOB size: 4
kernel: flash size with OOB: 8448 KiB
kernel: page address bytes: 3
kernel: sector address bytes: 2
kernel: options: 0x62
kernel: Scanning device for bad blocks
kernel: Creating 1 MTD partitions on "NAND 8MiB 1,8V 8-bit":
kernel: 0x00000000-0x00800000 : "NAND simulator partition"
kernel: JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
kernel: Node at 0x00529b64 with length 0x000006ba would run over the end
of the erase block
kernel: Perhaps the file system was created with the wrong erase size?
Reject to mount.

Has somebody get the same effect on a real NAND device on recent snapshot ?

It works on mtdram.

Any idea ???

Zoltan
