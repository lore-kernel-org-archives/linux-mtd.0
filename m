Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2OCU-0001F7-Ty
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2004 02:02:33 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Wed, 1 Sep 2004 08:05:33 +0200
References: <1093998741.21592.22.camel@localhost.localdomain>
In-Reply-To: <1093998741.21592.22.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <200409010805.33574.gruber.m@utanet.at>
Subject: Re: Support for Am29LV2562M NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi !

I use two Am29LV256M chips in 32 bit mode. 2x 16 bit chips on 32 bit data bus.
I map it with physmap and also set phymap_configure in my arch/arm/Board-Tree. 
My config is this:

# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
CONFIG_MTD_REDBOOT_PARTS_READONLY=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y

CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_AMDSTD_RETRY=5
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x10000000
CONFIG_MTD_PHYSMAP_LEN=0x4000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4

you also need this patch from 
Bug in cfi_cmdset_0002.c in linux-2.6.8.1 from Jochen Karrer

Am Mittwoch, 1. September 2004 02:32 schrieb Shamile Khan:
> Hello,
>
> I am new to MTD so bear with me. I tried getting MTD sources (as of end
> July) to autodetect Am29LV2562M chip in x32 mode (16M * 32-bit).
>
> This chip contains two Am29LV256M chips (16M * 16-bit). However it seems
> that it cannot be modelled as two interleaved x16 chips. This is because
> the data bits are connected as DQ0-7 (chip1), DQ8-15 (chip2), DQ16-23
> (chip1) and DQ24-31 (chip2) i.e it alternates between chips for every
> byte. As far as I understand, two x16 chips interleaved have the
> configuration DQ0-DQ16 (chip 1), DQ17-31 (chip2). As a consequence, the
> command sequences I require are of the form 0x0000XXXX instead of
> 0x00XX00XX (which MTD supports for interleaved flash chips as I verified
> in another board). XX refers to the data part of the command e.g 98 for
> CFI query.

on my board:
0x00XX00XX --> with interleave 2 it doese that on my board.
on my board DQ0-15 is on the first chip and 16-31on the second chip.
when you have another configuration maybe you have to do changes in cfi.h 
where the command is generated, where shifting the command is done. maybe 
also the two unlock codes have to be changed for your configuration.  

> I am wondering if I am missing something here. Does MTD support the
> flash geometry for Am29LV2562M?

jffs2 runs.

hope it helps...
regards manfred
