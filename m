Received: from 42.242.232.72.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7CH1-0002jc-UJ
	for linux-mtd@lists.infradead.org; Wed, 17 Jan 2007 10:00:26 -0500
Received: from promwad by secure.poehali.org with local (Exim 4.63)
	(envelope-from <eugene.kozlov@promwad.com>) id 1H7C09-0003sh-8y
	for linux-mtd@lists.infradead.org; Wed, 17 Jan 2007 16:42:57 +0200
Message-ID: <55455.127.0.0.1.1169044977.squirrel@localhost>
Date: Wed, 17 Jan 2007 16:42:57 +0200 (EET)
Subject: samsung nand jffs2 errors
From: eugene.kozlov@promwad.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello
I have good working samsung 64MB k9f1208uob nand flash on 2.6.16 kernel
with at91rm9200 patch and our board specific patches:
md5sum on images writed to /dev/mtdblock/1 is ok.

But when i use jffs2 its returned errors and wrong md5sum on images writed
to jffs2.
To prepare jffs2 image i use: mkfs.jffs2 -o jffs2_image -s 512 -e 16384 -d
jffs2_dir -p 0x4000 -n
I erase flash with "flash_eraseall /dev/mtd/1" from mtd utils and copy
image to flash by nandwrite.
When mount - get such: (this happens on free space, nanddump below)

1)
jffs2_scan_eraseblock(): Node at 0x00178008 {0x1985, 0x2003, 0x00000008)
has invalid CRC 0x00000000 (calculated 0x6b7c27e6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0017800c:
0x0008 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00178018:
0xff7f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0017801c:
0xffff instead
JFFS2: Erase block at 0x00178000 is not formatted. It will be erased

and sometimes
2)
mtd->read(0x400 bytes from 0x16d0000) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d0000:
0x03f3 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d0004:
0xffff instead
Empty flash at 0x016d0008 ends at 0x016d0038
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d0038:
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d003c:
0x0ca7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d0040:
0xf3f0 instead
Empty flash at 0x016d0044 ends at 0x016d0070
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d0070:
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d0074:
0x3f0c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d0078:
0x65ff instead
Empty flash at 0x016d007c ends at 0x016d00ac
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d00ac:
0xaaff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016d00b0:
0xff0f instead
Further such events for this erase block will not be printed
Empty flash at 0x016d00b8 ends at 0x016d00e4
Empty flash at 0x016d00f0 ends at 0x016d0120
Empty flash at 0x016d012c ends at 0x016d0158
Empty flash at 0x016d0164 ends at 0x016d0194
Empty flash at 0x016d01a0 ends at 0x016d01cc
Empty flash at 0x016d01d8 ends at 0x016d0200


This usual nanddump:
/mnt/dataflash/nanddump -l 1 -p /dev/mtd/1 -s 0x3f18000
No ECC status information available: Inappropriate ioctl for device
Block size 16384, page size 512, OOB size 16
Dumping data starting at 0x03f18000 and ending at 0x03f18001...
0x03f18000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f180a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f180b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f180c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f180d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f180e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f180f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f18190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f181a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f181b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f181c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f181d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f181e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x03f181f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff 85 19 03 20 08 00 00 00

Thanks for advice
