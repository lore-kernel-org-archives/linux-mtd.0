Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lrohe-0004pK-Mb
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 07:29:45 +0000
Received: by bwz3 with SMTP id 3so502707bwz.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Apr 2009 00:29:37 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 9 Apr 2009 08:29:37 +0100
Message-ID: <756a7fcc0904090029k627c20abv175515fcf09ca3f2@mail.gmail.com>
Subject: nandwrite problem
From: Donal Morrissey <donal.morrissey@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,
I'm having problems in using the nandwrite command for my cirius logic
EP9302 arm based processor card. I am able to load the images
correctly via redboot, but not via the nandwrite shell command.

I'm using redboot, kernel 2.6.8.1-crus2.0.8 and nandwrite v1.32.

Here is the redboot output:
---------------------------
RedBoot> fis list
Name              FLASH addr  Mem addr    Length      Entry point
RedBoot           0x60000000  0x60000000  0x00040000  0x00000000
RedBoot config    0x60FC0000  0x60FC0000  0x00001000  0x00000000
FIS directory     0x60FE0000  0x60FE0000  0x00020000  0x00000000
config1           0x60040000  0x00800000  0x00020000  0x00000000
config2           0x60060000  0x00800000  0x00020000  0x00000000
ramdisk.gz        0x60080000  0x00800000  0x00400000  0x00800000
zImage            0x60480000  0x00080000  0x00140000  0x00080000

Here are the MTD Devices
------------------------
~ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "RedBoot"
mtd1: 00020000 00020000 "config1"
mtd2: 00020000 00020000 "config2"
mtd3: 00400000 00020000 "ramdisk.gz"
mtd4: 00140000 00020000 "zImage"
mtd5: 00a00000 00020000 "unallocated"
mtd6: 00001000 00020000 "RedBoot config"
mtd7: 00020000 00020000 "FIS directory"

I'm trying to update the ramdisk.gz which is located in /dev/mtd3:

~ # mtd_debug info /dev/mtd3
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CLEAR_BITS
mtd.size = 4194304 (4M)
mtd.erasesize = 131072 (128K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

You can see that the oobblock and oobsize are 0! When I try to run the
nandwrite command I get the following:

~ # nandwrite /dev/mtd3 ramRamdisk.gz
Unknown flash (not normal NAND)

Having looked at the nandwrite command source code, this problem is
caused by the oobblock and oobsize members of the mtf info being 0!

Does anyone know why the values are incorrect or how to get around this issue?

Best Regards,
Donal
