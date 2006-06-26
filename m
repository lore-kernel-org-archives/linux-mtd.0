Received: from ms-1.rz.rwth-aachen.de ([134.130.3.130]
	helo=ms-dienst.rz.rwth-aachen.de)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FunmA-00057T-VZ
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 05:53:09 -0400
Received: from r220-1 (r220-1.rz.RWTH-Aachen.DE [134.130.3.31])
	by ms-dienst.rz.rwth-aachen.de
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J1G003SELZVJG@ms-dienst.rz.rwth-aachen.de> for
	linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 10:52:44 +0200 (MEST)
Received: from rwth-aachen.de (ap-s04.campus.RWTH-Aachen.DE [137.226.2.59])
	by relay.rwth-aachen.de (8.13.7/8.13.3/1) with SMTP id
	k5Q8qgVR023886	for
	<linux-mtd@lists.infradead.org>; Mon, 26 Jun 2006 10:52:43 +0200 (MEST)
Date: Mon, 26 Jun 2006 10:52:43 +0200
From: peter.hosten@rwth-aachen.de
Subject: Cannot erase Nand Flash with mtd-util-1.0.0
To: linux-mtd@lists.infradead.org
Message-id: <380-2200661268524326@rwth-aachen.de>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello, 

I am working on the DbAu1200 Board with Linux version 2.6.11-r000058 and
NAND Flash K9F1208U0B PCB0(Samsung NAND 64MiB 3,3V 8-bit) .

I was able to place the jffs2 file system on NOR Flash (mtd2), i had no
problems using the mtd-utils-1.0.0

Now i want to place it on NAND Flash (mtd3). Unfortunately the mtd-util
(flash_eraseall, mtd_debug) is not able to erase the NAND-Flash. I get the
error  "./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error"
(see below)

Has anyone made the same experiences before?

I also dumped the NAND Flash ( see below); may it be possible that it does
not work because of the OBB data ( OOB Data: 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00) ?

I hope someone can give me a little hint.

Best regards

Peter

 

Linux version 2.6.11-r000058 
CPU revision is: 04030201
AMD Alchemy Db1200 Board
...
Db1200 Flash: probing 16-bit flash bus
Db1200 Flash: Found 1 x16 devices at 0x0 in 16-bit bank
Db1200 Flash: Found 1 x16 devices at 0x2000000 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
Db1200 Flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 2
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 3 MTD partitions on "Db1200 Flash":
0x00000000-0x03c00000 : "User FS"
0x03c00000-0x03d00000 : "YAMON"
0x03d00000-0x03fc0000 : "raw kernel"
block2mtd: version $Revision: 1.23 $
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 3,3V
8-bit)
Scanning device for bad blocks
Bad eraseblock 62 at 0x000f8000
Creating 2 MTD partitions on "NAND 64MiB 3,3V 8-bit":
0x00000000-0x00800000 : "NAND FS 0"
0x00800000-0x04000000 : "NAND FS 1"
No valid DiskOnChip devices found

 


# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 03c00000 00010000 "User FS"
mtd1: 00100000 00010000 "YAMON"
mtd2: 002c0000 00010000 "raw kernel"
mtd3: 00800000 00004000 "NAND FS 0"
mtd4: 03800000 00004000 "NAND FS 1"

 
# ./mtd_debug info /dev/mtd3
mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CLEAR_BITS | MTD_ECC
mtd.size = 8388608 (8M)
mtd.erasesize = 16384 (16K)
mtd.oobblock = 512
mtd.oobsize = 16
mtd.ecctype = MTD_ECC_NONE
regions = 0

 

./flash_eraseall /dev/mtd3
Erasing 16 Kibyte @ 0 --  0 % complete.
./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 4000 --  0 % complete.
./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 8000 --  0 % complete.
./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ c000 --  0 % complete.
./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 10000 --  0 % complete.
./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 14000 --  0 % complete.
./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
...
Erasing 16 Kibyte @ 7f8000 -- 99 % complete.
./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 7fc000 -- 99 % complete.
./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error

 

 

 

# ./nanddump -p -f NAND_DUMP /dev/mtd3
Block size 16384, page size 512, OOB size 16
Dumping data starting at 0x00000000 and ending at 0x00800000..

0x00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000130: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000150: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000160: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000170: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000190: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000001a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000001b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000001c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000001d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000001e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000001f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000210: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000220: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
-------

0x007fffe0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x007ffff0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  
