Received: from [202.98.123.42] (helo=mail.ocdtt.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wD2U-0002ZG-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 02:41:02 +0100
Received: from ocdtt.com (unknown [61.139.82.145])
	by mail.ocdtt.com (Postfix) with ESMTP id C9C7713DD4
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 09:33:01 +0800 (CST)
Message-ID: <3BD61EB0.6FC080F6@ocdtt.com>
Date: Wed, 24 Oct 2001 09:51:44 +0800
From: Chen Yaoming <ming@ocdtt.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Why does /dev/mtd0 complain Intel TE28F160C3B as read only file system?
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

# ls -l /dev/mtd0
crw-rw----    1 root     disk      90,   0 Oct 15  2001 /dev/mtd0

# ./mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 2097152 (2M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 2

region[0].offset = 0x00000000
region[0].erasesize = 8192 (8K)
region[0].numblocks = 8
region[0].regionindex = 0
region[1].offset = 0x00010000
region[1].erasesize = 65536 (64K)
region[1].numblocks = 31

# ./mtd_debug write /dev/mtd0 0x100000 16 /boot/vmlinuz
Copied 16 bytes from /boot/vmlinuz to address 0x00000000 in flash

# dd if=/boot/vmlinuz of=/dev/mtd0 bs=1k seek=1024
dd: writing `/dev/mtd0': Read-only file system
1+0 records in
0+0 records out

# ./mtd_debug erase /dev/mtd0 1048576 65536
MEMERASE: Read-only file system

# ./erase /dev/mtd0 0x100000 1
Erase Total 1 Units
Region 0 is at 0 of 8 sector and with sector size 2000
Region 1 is at 65536 of 31 sector and with sector size 10000
Performing Flash Erase of length 65536 at offset 0x100000
MTD Erase failure: Read-only file system
