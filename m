Received: from mtagate3.uk.ibm.com ([195.212.29.136])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GohSd-0003OW-Ko
	for linux-mtd@lists.infradead.org; Mon, 27 Nov 2006 14:28:00 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate3.uk.ibm.com (8.13.8/8.13.8) with ESMTP id kAREQi8k111780
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2006 14:26:44 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id kARETc2M2748516
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2006 14:29:38 GMT
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id kAREQhI8013638
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2006 14:26:44 GMT
Message-ID: <456AF5A2.1070708@vnet.ibm.com>
Date: Mon, 27 Nov 2006 15:26:42 +0100
From: Timo Lindhorst <lindhors@vnet.ibm.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: wrong ECC byte order with ndfc causes fatal consequences
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey,

I've been testing the error detection and correction with the ndfc
driver and observed some fatal consequences using the wrong byte order.
MTD detects one bit errors and pretends to correct them. But instead of
correcting the bit, it causes another bit error in the same 256 Byte ECC
region. To state more precisely, it toggles the bit at the correct bit
position, but at an offset with swapped address bytes: If the error
occurs at 0x????e4, the bit will be toggled at offset 0x????4e.
I do not understand this ECC magic. I assumed, that the ECC would
totally fail, if different byte orders are used in calculation and
correction. But this effect is worse, data is unnoticeably damaged bit
by bit if you blindly believe MTD.
Using CONFIG_MTD_NAND_ECC_SMC (byte order according to Smart Media
Specification) solved this problem (see also previous posting: [PATCH]
[MTD] NAND: fix ifdef option in nand_ecc.c).
What would be a sensible way to connect this option to NDFC? Something like
#if defined(CONFIG_MTD_NAND_ECC_SMC) || defined(CONFIG_MTD_NAND_NDFC)
in nand_ecc.c? Or is there a way to connect these options in the kernel
configuration?

I attached a shell session showing the behavior. Note, that the prompt
switches between the card and my notebook as host.

Kind regards,
Timo


### generate data and dump it with error code ####
/var/tmp/debug $ dd if=/dev/urandom of=data.img bs=2048 count=1
1+0 records in
1+0 records out
2048 bytes (2.0 kB) copied, 0.002122 seconds, 965 kB/s
/var/tmp/debug $ flash_erase /dev/mtd5 0 1
Erase Total 1 Units
Performing Flash Erase of length 131072 at offset 0x0 done
/var/tmp/debug $ nandwrite /dev/mtd5 data.img
Writing data to block 0
/var/tmp/debug $ nanddump -f data.dump -l 2048 /dev/mtd5
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...
/var/tmp/debug $ nanddump -n -f data.noecc.dump -l 2048 /dev/mtd5
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...

### the data is what it should be. Toggle one bit ###
lindhors@lapt /tftpboot/192.168.1.44/var/tmp/debug $ md5sum data*dump
ea7a75606e9f3615d70b0ce1391d18b0  data.dump
ea7a75606e9f3615d70b0ce1391d18b0  data.noecc.dump
lindhors@lapt /tftpboot/192.168.1.44/var/tmp/debug $ khexedit data.dump
lindhors@lapt /tftpboot/192.168.1.44/var/tmp/debug $ hexdiff data.dump \
data.err.dump
4c4
< 00000030 - 79 24 1f 2f  6a a2 6b 2b  bc 46 28 eb  48 16 6e 4b
---
 > 00000030 - 79 04 1f 2f  6a a2 6b 2b  bc 46 28 eb  48 16 6e 4b

### write to flash and read back ###
/var/tmp/debug $ flash_erase /dev/mtd5 0 1
Erase Total 1 Units
Performing Flash Erase of length 131072 at offset 0x0 done
/var/tmp/debug $ nandwrite -o -n /dev/mtd5 data.err.dump
Writing data to block 0
/var/tmp/debug $ nanddump -f data.back.dump -l 2048 /dev/mtd5
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...
ECC: 1 corrected bitflip(s) at offset 0x00000000
### Here MTD claims everything is fine.	###
/var/tmp/debug $ nanddump -n -f data.back.noecc.dump -l 2048 /dev/mtd5
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...

### Compare the dumps, data.back.dump shoud be the same like    ###
### data.dump since the error should be corrected, but acutally ###
### there is another error.					###
lindhors@lapt /tftpboot/192.168.1.44/var/tmp/debug $ md5sum data*dump
883eb72100032362a6d3f23f86c13f73  data.back.noecc.dump
883eb72100032362a6d3f23f86c13f73  data.err.dump
ea7a75606e9f3615d70b0ce1391d18b0  data.dump
ea7a75606e9f3615d70b0ce1391d18b0  data.noecc.dump
f994a582e5c7b78a3a7a10096772c353  data.back.dump
lindhors@lapt /tftpboot/192.168.1.44/var/tmp/debug $ hexdiff data.dump \
data.back.dump
2c2
< 00000010 - a7 07 2b a1  91 20 ad 1b  71 93 90 b2  a6 79 57 8e
---
 > 00000010 - a7 07 2b 81  91 20 ad 1b  71 93 90 b2  a6 79 57 8e
4c4
< 00000030 - 79 24 1f 2f  6a a2 6b 2b  bc 46 28 eb  48 16 6e 4b
---
 > 00000030 - 79 04 1f 2f  6a a2 6b 2b  bc 46 28 eb  48 16 6e 4b
