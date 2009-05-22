Received: from a237-248.24online.fi ([84.239.237.248] helo=mail.oliotalo.fi)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7U6h-0007qe-La
	for linux-mtd@lists.infradead.org; Fri, 22 May 2009 12:44:22 +0000
Received: from [192.168.1.33] (a228-85.24online.fi [84.239.228.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.oliotalo.fi (Postfix) with ESMTPSA id 951D2F0006F
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 May 2009 15:44:06 +0300 (EEST)
Message-ID: <4A169E16.6010305@oliotalo.fi>
Date: Fri, 22 May 2009 15:44:06 +0300
From: =?ISO-8859-1?Q?Kaius_H=E4ggblom?= <kaius@oliotalo.fi>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problem to attach NAND MTD-device to UBI
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I'm developing on an embedded arm (AT91) platform, on which I have had 
successfully Linux 2.6.22 and 2.6.25 kernels running for a long time in 
production. As I have had some JFFS2 failures on NAND in the field and 
I'm now updating to a 2.6.29 kernel I want to try ubifs on the NAND to 
see if it would bring an improvement.

I have the kernel running and ubi-tools compiled and installed. I have 
tested that NAND still works OK with JFFS2 with the new kernel. It's a 
256MiB NAND in two partititions:
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron NAND 256MiB 
3,3V 8-bit)
0x000000000000-0x000008000000 : "NAND_Flash 1"
0x000008000000-0x000010000000 : "NAND_Flash 2"

Now the problem is that I cannot get the mtd-devices attached to ubi. 
The error is different depending on if I try to use ubiformat, or if I 
try to attach an empty device directly.

WITH UBIFORMAT
=============

# flash_eraseall /dev/mtd5
Erasing 128 Kibyte @ 5aa0000 -- 70 % complete.
Skipping bad block at 0x05ac0000
Erasing 128 Kibyte @ 7fe0000 -- 99 % complete.

# ./ubiformat /dev/mtd5
ubiformat: mtd5 (NAND), size 134217728 bytes (1280 MiB), 131072 
eraseblocks of 131072 bytes (1280 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 1023 -- 100 % complete 
ubiformat: 1023 eraseblocks are supposedly empty
ubiformat: bad eraseblocks: 726
ubiformat: formatting eraseblock 1023 -- 100 % complete 

# ubiattach /dev/ubi_ctrl -m 5
UBI: attaching mtd5 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI error: validate_ec_hdr: bad VID header offset 2048, expected 512
UBI error: validate_ec_hdr: bad EC header
UBI error: ubi_io_read_ec_hdr: validation failed for PEB 0
ubiattach error: cannot attach mtd5
error 22 (Invalid argument)

DIRECTLY ATTACHING EMPTY DEVICE
===========================
 # flash_eraseall /dev/mtd4
Erasing 128 Kibyte @ 380000 --  2 % complete.
Skipping bad block at 0x003a0000
Erasing 128 Kibyte @ 71e0000 -- 88 % complete.
Skipping bad block at 0x07200000
Erasing 128 Kibyte @ 7bc0000 -- 96 % complete.
Skipping bad block at 0x07be0000
Erasing 128 Kibyte @ 7fe0000 -- 99 % complete.

# ubiattach /dev/ubi_ctrl -m 4
UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 0:512, 
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 1:512, 
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 2:512, 
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 3:512, 
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 4:512, 
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 5:512, 
written 0 bytes
ubiattach error: cannot attach mtd4
error 5 (Input/output error)


Any suggestions or ideas anyone?

kind regards,
kaius
