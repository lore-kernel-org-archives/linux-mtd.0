Received: from mail.dev.equiinet.com ([194.164.241.163])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2tyB-0008Ep-8A
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2004 11:57:52 -0400
Received: from invader.dev.equiinet.com (unknown [192.168.100.120])
	by mail.dev.equiinet.com (Postfix) with ESMTP id A31344B6D7
	for <linux-mtd@lists.infradead.org>;
	Thu,  2 Sep 2004 16:57:47 +0100 (BST)
Received: from graham by invader.dev.equiinet.com with local (Exim 3.36 #1
	(Debian)) id 1C2ty7-0002oB-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 Sep 2004 16:57:47 +0100
Date: Thu, 2 Sep 2004 16:57:47 +0100
From: Graham Keeling <graham@equiinet.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20040902155747.GA9201@invader.dev.equiinet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: MTD newbie trying to use AM29F016B
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I am trying to get access (using Linux) to two AM29F016B flash chips on a
machine that I have inherited.
I haven't been able to find an introduction to MTD on the internet.
What I've been trying (using 2.4.22 kernel) is this:
Set the following kernel options...

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=m
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=m
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_CHAR is not set
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=m
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_RAM=m
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
CONFIG_MTD_OBSOLETE_CHIPS=y
CONFIG_MTD_AMDSTD=m
# CONFIG_MTD_SHARP is not set
CONFIG_MTD_JEDEC=m


I then end up with these modules:

mtdcore
mtdblock
mtdpart

amd_flash
cfi_cmdset_0002
cfi_probe
chipreg
gen_probe
jedec
jedec_probe
map_ram

When I use modprobe to install these modules, they give no errors and lsmod
shows that they are installed. No warnings or anything else appear in any
log. I don't know whether I am installing them in the wrong order or
something.

/proc/mtd contains:
dev:    size   erasesize  name

If things were working correctly, I think that there should be more stuff in
/proc/mtd.
AM29F016 is listed in jedec_probe.c, which seems similar enough to
AM29F016B.

I don't know where to go from here. Any help at all would be appreciated!
Thanks,
Graham.
