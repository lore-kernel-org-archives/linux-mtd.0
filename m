Received: from lst-amand-152-33-17-184.w82-127.abo.wanadoo.fr ([82.127.60.184]
	helo=polaris.sacet.fr)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HQiGD-0003RV-0O
	for linux-mtd@lists.infradead.org; Mon, 12 Mar 2007 07:00:17 -0400
Received: from [127.0.0.1] (mimosa.sacet.fr [192.168.82.19])
	by polaris.sacet.fr (8.12.11/8.12.11) with ESMTP id l2CB0wEa013207
	for <linux-mtd@lists.infradead.org>; Mon, 12 Mar 2007 12:00:58 +0100
Message-ID: <45F530FE.4070105@sacet.com>
Date: Mon, 12 Mar 2007 11:52:46 +0100
From: Michel LECONTE <michel.leconte@sacet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Pb with NAND flash and ftl_format
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I work with a nand flash with 4 partitions.
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00010000 "physmap-flash.0"
mtd1: 04200000 00020000 "Linux"
mtd2: 09c00100 00020000 "Apps"
mtd3: 10000000 00020000 "Data"

When I try to format /dev/mtd1 with an ftl_format it gives me :
# ./ftl_format /dev/mtd1
Partition size = 66 mb, erase unit size = 128 kb, 1 transfer units
Reserved 5%, formatted size = 64853504 bytes
Erasing all blocks...
+++++++*+++++++*+++++++*+++++++*+++++++*+++++++*+++++++*+++++++*++
Writing erase unit headers...
write failed: Invalid argument
format failed.

And dmesg :
# dmesg
nand_write: Attempt to write not page aligned data

I 'm not sure to understand what it means.
I suppose that the problem comes with a difference between
the adressing of the data and the size of the data but I don't
know how to do ?


Here is my mtd_debug info :
# ./mtd_debug info /dev/mtd1
mtd.type = MTD_NANDFLASH
mtd.flags =
mtd.size = 69206016 (66M)
mtd.erasesize = 131072 (128K)
mtd.oobblock = 2048 (2K)
mtd.oobsize = 64
mtd.ecctype = MTD_ECC_SW
regions = 0

as somebody has an idea to fix my problem ?

Thank you.


Michel
