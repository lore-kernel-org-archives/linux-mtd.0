Received: from smtp-102.noc.nerim.net ([62.4.17.102] helo=mallaury.noc.nerim.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18duNZ-0006op-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 15:43:57 +0000
Received: from bandit.lilotux.net (lilotux.net [62.212.107.33])
	by mallaury.noc.nerim.net (Postfix) with ESMTP id 6490262E3F
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 17:14:56 +0100 (CET)
Received: from slist by bandit.lilotux.net with local (Exim 3.35 #1 (Debian))
	id 18durZ-0002QC-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 17:14:57 +0100
Date: Wed, 29 Jan 2003 17:14:57 +0100
From: Stephane List <stephane.list@lilotux.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Intel Strataflash
Message-ID: <20030129161457.GA9083@lilotux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi,

I'm using a 2.4.17 linux kernel for an embedded product.
On my card I've got 4 Intel Strataflash 16 bits / 16 Mbytes.

Flash 1 : 
-Chip Select : 0
-Data Bus connected on D0-D15 of my CPU

Flash 2 :
-Chip Select : 0
-Data Bus connected on D16-D31 of my CPU

Flash 3 and 4, same thing with Chip Select 1.


When I load the module I've got the following message :
"genprobe_new_chip called with unsupported buswidth 2"

Could you tell me if my .config is OK ?
Thanks

PS : I couldn't compile my kernel with the CVS code...

My .config has the following options :
#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set

#Because the data bus of the CPU is 4 bytes
CONFIG_MTD_CFI_B4=y

# CONFIG_MTD_CFI_B8 is not set
# CONFIG_MTD_CFI_I1 is not set

#Because There are 2 flashs connected on the same Data bus.
CONFIG_MTD_CFI_I2=y

# CONFIG_MTD_CFI_I4 is not set

#Because it's an Intel Strataflash
CONFIG_MTD_CFI_INTELEXT=m

# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_RAM is not set
CONFIG_MTD_ROM=m
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=m
CONFIG_MTD_PHYSMAP_START=10000000
CONFIG_MTD_PHYSMAP_LEN=1FFFFFF

#Because my flash chip data bus is 2 bytes width
CONFIG_MTD_PHYSMAP_BUSWIDTH=2

# CONFIG_MTD_CSTM_MIPS_IXX is not set
# CONFIG_MTD_PB1000 is not set
# CONFIG_MTD_PB1500 is not set
# CONFIG_MTD_OCELOT is not set
# CONFIG_MTD_PCI is not set


-- 
Stephane List
http://slist.lilotux.net
