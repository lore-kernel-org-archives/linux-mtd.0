Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DltfL-0000t8-3z
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2005 15:16:42 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DltXw-0005LC-Qe
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2005 21:09:00 +0200
Received: from s01060004e28f4900.du.shawcable.net ([70.67.196.121])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2005 21:09:00 +0200
Received: from andre by s01060004e28f4900.du.shawcable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2005 21:09:00 +0200
To: linux-mtd@lists.infradead.org
From: "Andre" <andre@rocklandocean.com>
Date: Fri, 24 Jun 2005 12:18:41 -0700
Message-ID: <d9hlnq$1v7$1@sea.gmane.org>
References: <53F44AF77A9F9B458DCE1910C2E6263811F4A1FE@il02exm15.corp.mot.com>
Sender: news <news@sea.gmane.org>
Subject: Re: MD2202-D384 DoC with MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lindstrom James-A19027 wrote:
> I'm trying to get my MD2202-D384 up and running with the diskonchip.c
> driver.  I'm starting with kernel linux-2.4.18-rmk7-pxa3-cerf3 then
> patching in mtd-snapshot-2005-03-04.  I did quite a bit of work
> hacking things to make them happy.  The kernel boots, however, the
> DoC is not detecting properly.  When I look in nandids.c, though, I
> don't even see an option for the 384 mb variety of DoC.  Am I missing
> something?

I have the exact same device, although my kernel is 2.6.11 with snapshot
20050612. No special hacks were needed in my case since I am not booting
from the diskonchip yet.

Here are the kernel config flags I used related to MTD:
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=m
# CONFIG_MTD_DEBUG is not set
# CONFIG_MTD_CONCAT is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=m
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
CONFIG_FTL=m
# CONFIG_NFTL is not set
CONFIG_INFTL=m

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_RAMTD is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set

#
# NAND Flash Device Drivers
#
CONFIG_MTD_NAND=m
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_IDS=m
CONFIG_MTD_NAND_DISKONCHIP=m
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
# CONFIG_MTD_NAND_NANDSIM is not set

you then load the driver with:
modprobe -a diskonchip
modprobe -a inftl

After this I received some kernel messages from INFTL but I was able to
mount it ok. However, upon subsequent boot, my diskonchip stopped working. I
doubt that it had anything to do with mtd because when I ran the diskonchip
utilities from m-sys, it reported that it couldn't find the bad block table
anymore. According to the diskonchip data sheet, this table is supposedly in
a protected area.
Please see my posting titled 'kernel messages from INFTL'. I am still
waiting to hear from mtd folks what could have happened since the mount
operation should not actually do anything to the media in my opinion.

cheers,
Andre
