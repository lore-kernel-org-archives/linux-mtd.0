Received: from [202.114.36.28] (helo=bbs.ccnu.edu.cn)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196LQ3-0003ZH-Aq
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 03:16:04 +0100
Date: Fri, 18 Apr 2003 10:31:16 +0800
From: lhl <lhl@phy.ccnu.edu.cn>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Message-Id: <E196LQ3-0003ZH-Aq@pentafluge.infradead.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
cc: dwmw2@infradead.org
Subject: No recognised DiskOnChip devices found.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My DiskOnChip can work as a block device used M-system's DOC driver.
while when I compile the DiskOnChip as a MTD device,it does not work stilly.

#modprobe -a DOC2000
nothing found in dmesg
#modprobe -a docprob
I get from dmesg:
No recognised DiskOnChip devices found.

I used Redhat 7.2 linux with 2.4.7-10 kernel work.
I download the linux-2.4.17 kernel and get the mtd from cvs.then 
#./patchin.sh -c -j /usr/src/linux




I had use the DOC DOS utilities to format it by
DFORMAT /WIN:DC00 /S:DOC514.exb /EMPTY /Y /NODOS


here are the DOC info :

        Physical Address:  0xDC000
        DiskOnChip Type :  DiskOnChip 2000
        Flash Type      :  TC58256
        FormatType      :  NFTL
        TrueFFS version :  5.1.4
        Driver Version  :  DOS 5.1.4
        Sectors         :  8
        Heads           :  16
        Cylinders       :  1001
        Boot Area Size  :  65536 Bytes
        Logical Sectors :  128224
        Phy. UnitSize   :  16384 Bytes
        Physical Size   :  67108864 (64 MB)
        Unit Size       :  16384 Bytes
        Media Size      :  67108864 Bytes (64 MB)
        Chip Size       :  33554432 Bytes (32 MB)
        No Of Chips     :  2
        Interleaving    :  1



Here are the relevant sections of the .config options I compiled my kernel 
with:

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=m
CONFIG_MTD_DEBUG=m
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CHAR=m
# CONFIG_MTD_BLOCK is not set
CONFIG_FTL=m
CONFIG_NFTL=m
CONFIG_NFTL_RW=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_PNC2000 is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_NETSC520 is not set
# CONFIG_MTD_SBC_GXX is not set
# CONFIG_MTD_ELAN_104NC is not set
# CONFIG_MTD_DILNETPC is not set
# CONFIG_MTD_MIXMEM is not set
# CONFIG_MTD_OCTAGON is not set
# CONFIG_MTD_VMAX is not set
# CONFIG_MTD_L440GX is not set
# CONFIG_MTD_AMD766ROM is not set
# CONFIG_MTD_ICH2ROM is not set
# CONFIG_MTD_PCI is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
CONFIG_MTD_DOC2000=m
CONFIG_MTD_DOC2001=m
CONFIG_MTD_DOCPROBE=m
CONFIG_MTD_DOCPROBE_ADVANCED=m
CONFIG_MTD_DOCPROBE_ADDRESS=0
CONFIG_MTD_DOCPROBE_HIGH=y
CONFIG_MTD_DOCPROBE_55AA=y

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set
