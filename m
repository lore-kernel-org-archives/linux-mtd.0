Received: from [61.95.205.91] (helo=mail.ncoretech.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EE3l2-00021R-6r
	for linux-mtd@lists.infradead.org; Sat, 10 Sep 2005 07:43:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.ncoretech.com (Postfix) with ESMTP id 426C95FFE8
	for <linux-mtd@lists.infradead.org>;
	Sat, 10 Sep 2005 17:29:58 +0530 (IST)
Received: from mail.ncoretech.com ([127.0.0.1])
	by localhost (mail.ncoretech.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14238-03 for <linux-mtd@lists.infradead.org>;
	Sat, 10 Sep 2005 17:29:57 +0530 (IST)
Received: from ncoretech.com (ws192.ncoretech.com [192.168.1.192])
	by mail.ncoretech.com (Postfix) with ESMTP id EA2CC5FFAB
	for <linux-mtd@lists.infradead.org>;
	Sat, 10 Sep 2005 17:29:56 +0530 (IST)
Message-ID: <4322C6D6.2010805@ncoretech.com>
Date: Sat, 10 Sep 2005 17:13:18 +0530
From: ramprasad <ramprasad@ncoretech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Samsung nand flash on pxa
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
	I am working on 2.6.12 kernel with the latest mtdsnap shot.I have 
Samsung nand chip K9F1208UoM and it is on GPIO.Nand chip is detecting 
and i am able to mount also. when i mount i get this error messages ,but 
it mounts.

BOOT messages....

NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 
3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 0 at 0x00000000
Bad eraseblock 185 at 0x002e4000
cmdlinepart partition parsing not available
Using static partition definition
Creating 2 MTD partitions on "edb7312-nand":
0x00000000-0x00800000 : "EP7312 Nand Flash"
mtd: Giving out device 4 to EP7312 Nand Flash
0x00800000-0x04000000 : "EP7312 Nand Flash"
mtd: Giving out device 5 to EP7312 Nand Flash
pxa2xx_udc: version 14-Dec-2003


Mount messages.....

#mount -t jffs2 /dev/mtdblock4 /mnt/cf/

nand_read_ecc: Failed ECC read, page 0x000000e0
nand_read_ecc: Failed ECC read, page 0x000000e0
mtd->read(0x400 bytes from 0x1c000) returned ECC error
nand_read_ecc: Failed ECC read, page 0x00000120
nand_read_ecc: Failed ECC read, page 0x00000120
mtd->read(0x400 bytes from 0x24000) returned ECC error
nand_read_ecc: Failed ECC read, page 0x000001c0
mtd->read(0x400 bytes from 0x38000) returned ECC error
nand_read_ecc: Failed ECC read, page 0x000002e0
nand_read_ecc: Failed ECC read, page 0x000002e0
mtd->read(0x400 bytes from 0x5c000) returned ECC error
nand_read_ecc: Failed ECC read, page 0x00000320
nand_read_ecc: Failed ECC read, page 0x00000320
mtd->read(0x400 bytes from 0x64000) returned ECC error
nand_read_ecc: Failed ECC read, page 0x000003c0
mtd->read(0x400 bytes from 0x78000) returned ECC error
nand_read_ecc: Failed ECC read, page 0x000004e0
nand_read_ecc: Failed ECC read, page 0x000004e0
mtd->read(0x400 bytes from 0x9c000) returned ECC error
nand_read_ecc: Failed ECC read, page 0x00000520
nand_read_ecc: Failed ECC read, page 0x00000520
mtd->read(0x400 bytes from 0xa4000) returned ECC error

NAND write gives me this......

./nandwrite -j -f /dev/mtd4 nand.jffs2

MTD_open
MTD_ioctl
MTD_ioctl
MTD_ioctl
Writing data to block 0
MTD_ioctl
Bad block at 0, 1 block(s) from 0 will be skippedMTD_ioctl
 

Writing data to block 4000
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write


NANDTEST gives me this


[root@Sarva /root]#./nandtest /dev/mtd4
MTD_open
MTD_ioctl
This will erase the first block of device, continue? y
 

Performing Flash Erase of length 16384 at offset 0...MTD_ioctl
 

nand_erase: Device is write protected!!!
 

MTD Erase failure
: Input/output errorMTD_close
 

[root@Sarva /root]#./nandtest /dev/mtd4
MTD_open
MTD_ioctl
This will erase the first block of device, continue? y
 

Performing Flash Erase of length 16384 at offset 0...MTD_ioctl
 

nand_erase: attempt to erase a bad block at page 0x00000000
 

MTD Erase failure
: Input/output errorMTD_close
 



After mounting if i try to write any thing it writes ,when i REBOOT the 
system nothing remains on the chip.Could  any body give me some pointers.

Thanks in advance,
Ramprasad
