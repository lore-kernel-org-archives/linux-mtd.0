Received: from sun06.mazet.de ([193.29.17.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bchq-0002yT-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 07:50:38 +0100
Received: from se_server.mazet.de ([193.99.171.10])
	by sun06.MAZeT.de (8.9.3/8.9.3) with SMTP id IAA06800
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 08:48:57 +0200 (MET DST)
Message-Id: <3B8B4140.71655206@mazet.de>
Date: Tue, 28 Aug 2001 08:59:12 +0200
From: Holger Friedrich <friedrich@MAZeT.de>
Mime-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Not detecting DOC2000 at boot up ...
References: <9A1957CB9FC45A4FA6F35961093ABB840417BE5D@srvmail-mtl.ubisoft.qc.ca>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi Patrick,
I got my kernel 2.4.0 to recognize the DOC2000 last week. 
This is the MTD section of my .config :
#
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
CONFIG_NFTL_RW=y
 
#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_JEDEC is not set
 
#
# Mapping drivers for chip access
#
# CONFIG_MTD_SUN_UFLASH is not set
# CONFIG_MTD_OCELOT is not set
 
#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_LART is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
 
#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
CONFIG_MTD_DOC2000=y
# CONFIG_MTD_DOC2001 is not set
CONFIG_MTD_DOCPROBE=y
CONFIG_MTD_DOCPROBE_ADVANCED=y
CONFIG_MTD_DOCPROBE_ADDRESS=dc000
# CONFIG_MTD_DOCPROBE_HIGH is not set
# CONFIG_MTD_DOCPROBE_55AA is not set
 
#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set          

Maybe that will help you.

Patrick Allaire wrote:
> 
> Hi all,
> 
> My new kernel(2.2.19) does not detect the DOC at boot up !!! I cannot see
> any messges related to MTD in the boot up log (appended to this email) ?
> Should mtd driver show a message before it tries to find devices ? Is there
> a utility to force the checkup of devices once the kernel is booted ?
> 
> I am also adding my kernel config file. There is so much options in the
> config that I may have choosen wrong.
> 
> thank you all for your time in helping me  (c:
> 
>
