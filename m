Received: from [213.97.115.166] (helo=madrid.hispafuentes.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RuUq-0006Wj-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2001 12:49:04 +0100
Message-ID: <3B67EDFD.E19F6F6D@hispafuentes.com>
Date: Wed, 01 Aug 2001 13:54:37 +0200
From: olea@hispafuentes.com
MIME-Version: 1.0
To: Vipin Malik <vipin@embeddedlinuxworks.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Problems compiling kernel 2.2.17
References: <5.1.0.14.0.20010801063242.00a67f20@mail.spewey.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Vipin Malik escribió:
> 
> At 01:08 PM 8/1/2001 +0200, Juan Ramon Jimenez Garcia wrote:
> 
> >
> >but now we got another link error with an undefined reference to
> >'init_nftl'
> 
> Don't link in nftl. What do you need this for? You don't need this for
> either DOC OR NOR flash.

Well, we need to work with a NAND flash.

We have revised the kernel configuration with these options:

----------------8<------------------------------

# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
# CONFIG_MTD_PARTITIONS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_SUN_UFLASH is not set
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_IQ80310 is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_OCELOT is not set
# CONFIG_MTD_L440GX is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_LART is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_VERIFY_WRITE=y
--------8<-----------------------

Compiling with CONFIG_FTL=y give us the same results as Juan told.

We have revised the configuration as far as we know but we aren't sure
if this config has got some kind of conflicts.

Any advice or comment? 

--
	A.Ismael Olea González
	tlf +(34) 914 575 330
	mailto:olea@hispafuentes.com
