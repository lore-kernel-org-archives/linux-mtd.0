Received: from wproxy.gmail.com ([64.233.184.201])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DFo0P-0007Hz-7s
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2005 01:45:46 -0500
Received: by wproxy.gmail.com with SMTP id 55so248989wri
	for <linux-mtd@lists.infradead.org>;
	Sun, 27 Mar 2005 22:45:46 -0800 (PST)
Message-ID: <7e75d4110503272239dfc7115@mail.gmail.com>
Date: Mon, 28 Mar 2005 00:39:06 -0600
From: Matthew Hudson <hexsane@gmail.com>
To: newtontalk@newtontalk.net, linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Setting up Linux kernel 2.4.28 for reading linear flash PCMCIA cards
Reply-To: Matthew Hudson <hexsane@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*This is being posted to newtontalk@newtontalk.net and
linux-mtd@lists.infradead.org*

Edit /usr/src/linux/.config to look like the following:

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=m
CONFIG_MTD_CONCAT=m
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set
CONFIG_FTL=m
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_RAM=m
CONFIG_MTD_ROM=m
CONFIG_MTD_ABSENT=m
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
# CONFIG_MTD_SCx200_DOCFLASH is not set
# CONFIG_MTD_L440GX is not set
# CONFIG_MTD_AMD76XROM is not set
# CONFIG_MTD_ICH2ROM is not set
# CONFIG_MTD_NETtel is not set
# CONFIG_MTD_SCB2_FLASH is not set
CONFIG_MTD_PCI=y
CONFIG_MTD_PCMCIA=y

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

I've been using this all day today and have had only one problem
(below). In newer kernels (2.6.x) calls to older kernel module hooks
have been deprecated so I haven't been able to get anything to work on
them.

If you have problems - I can't help you. I've tried the linux-mtd list
and they seem to not care that the drivers are broken. Maybe you can
fair a little better than I did: http://www.linux-mtd.infradead.org

If you try to use different sized devices (2MB, 4MB and 16MB in my
case) insert the smallest first. I've had Linux lock solid (!!!) once
when I inserted the 16MB card and then went to a smaller card. After 
rebooting and inserting the 2MB card I was able to insert any card
without a problem.

I hope this helps.

-Matt
