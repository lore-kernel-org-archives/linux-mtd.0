Received: from web60414.mail.yahoo.com ([209.73.178.157])
	by canuck.infradead.org with smtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FSgv9-0003Du-Va
	for linux-mtd@lists.infradead.org; Sun, 09 Apr 2006 16:54:14 -0400
Message-ID: <20060409204724.65884.qmail@web60414.mail.yahoo.com>
Date: Sun, 9 Apr 2006 13:47:24 -0700 (PDT)
From: amirhosein jahanbekam <am_jahanbekam@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: help
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all
I have an 'at91rm9200 development kit'.
Recently, I `ve attached an 'AT45DB642' serial data
flash
to the board and installed uboot via XModem
successfully.
But somethings seemed to go wrong:

Firstly, uboot is not able to erase or unprotect the  
    flash as I tested  several versions of uboot and
also compiled 'u-boot-1.1.2' to be certain that
dataflash options are correctly enabled.
It pretend to work,but really does nothing.

Secondly, after booting via network,linux also is not
able to deal with flash operations, for instance:

--[root@AT91RM9200DK /root]$flash_erase
/dev/mtdblock/1
--Erase Total 1 Units
 but in fact nothing happens.


My linux version is '2.4.27-vrs1-ATMEL' and my mtd
configs are as follow.

 Tanks in advanced.
 
 Amir.H.J


#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=0
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CONCAT=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_AFS_PARTS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
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
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_CDB89712 is not set
# CONFIG_MTD_SA1100 is not set
# CONFIG_MTD_DC21285 is not set
# CONFIG_MTD_IQ80310 is not set
# CONFIG_MTD_FORTUNET is not set
# CONFIG_MTD_EPXA is not set
# CONFIG_MTD_AUTCPU12 is not set
# CONFIG_MTD_EDB7312 is not set
# CONFIG_MTD_IMPA7 is not set
# CONFIG_MTD_CEIVA is not set
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PCMCIA is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_AT91_DATAFLASH=y
CONFIG_MTD_AT91_DATAFLASH_CARD=y
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTDRAM_ABS_POS=0
CONFIG_MTD_BLKMTD=y
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set
# CONFIG_MTD_AT91_SMARTMEDIA is not set

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
