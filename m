Received: from web10306.mail.yahoo.com ([216.136.130.84])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WbI6-000405-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 11:56:07 +0000
Message-ID: <20030109122653.4606.qmail@web10306.mail.yahoo.com>
Date: Thu, 9 Jan 2003 04:26:53 -0800 (PST)
From: Sanal Kumar <p_sanalk@yahoo.com>
Subject: Re: Accessing DiskonChip 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org
In-Reply-To: <27941.1041929480@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi David ,

Sorry for not explaining the problem in detail.
I have read the howto's on the infradead .
But still I dont understand how to create a partition
on Disk on chip
and have filesystem on it.
I have tried with nftl_* .But I could not do anything.

Could you please explain what I need to do for making
the filesystem on DOC.


Boot Messages
--------------

out-of-line wait
_DoC_WaitReady called for out-of-line wait
.
. _DoC_WaitReady called for out-of-line wait

Could not find valid boot record
Could not mount NFTL device

and using nftl_format I tried to format the diskon
chip But I get an error like the following

NFTL_open
ENODEV: thisNFTL = 0, minor = 23808, ip = c94ac4c0, fp
= c965caa0
NFTL_open
ENODEV: thisNFTL = 0, minor = 23809, ip = c94ac6e0, fp
= c965ca20 The only thing I could do was

dd if=XXXX of=/dev/mtd0



I am adding part of my .config here.
-----------------------------------
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_BOOTLDR_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set #
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
CONFIG_NFTL=y
CONFIG_NFTL_RW=y #
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
# CONFIG_MTD_GEN_PROBE is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set #
# Mapping drivers for chip access
# #
# Self-contained MTD device drivers
#
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set #
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
CONFIG_MTD_DOC2000=y
CONFIG_MTD_DOC2001=y
CONFIG_MTD_DOCPROBE=y
# CONFIG_MTD_DOCPROBE_ADVANCED is not set
CONFIG_MTD_DOCPROBE_ADDRESS=0
# CONFIG_MTD_DOCPROBE_HIGH is not set
# CONFIG_MTD_DOCPROBE_55AA is not set #
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set


TIA
Best Regards
Sanal

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> p_sanalk@yahoo.com said:
> >  I have added nftl support. So i need to support
> make a filesystem on
> > disk on chip How can I do that. 
> 
> Might have been useful had you included this
> information in your first 
> message. The HOWTO should suffice to get you going
> from that point.
> 
> --
> dwmw2
> 
> 


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
