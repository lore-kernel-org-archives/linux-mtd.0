Received: from cn2.connectnet.com ([207.110.3.2] helo=smtp.connectnet.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 161bLO-00028w-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 22:38:50 +0000
Reply-To: <jglennon@getntds.com>
To: <linux-mtd@lists.infradead.org>
Subject: I still do not see how  it (fails to)  get from  cfi_probe into cfi_cmdset_0002 ?
Date: Wed, 7 Nov 2001 15:07:22 -0800
Message-ID: <2178200CCE4ED311974300A0CC4263FB143612@accounting>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
From: jglennon@getntds.com
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

I have re-read the HOW_TO!  Is do_cfi_probe now replaced by do_map_probe?  I
AM doing the "you have to dive into the routine 'do_cfi_probe()' I think...!

My system still fails qry_present, still not being CFI-smart...

---
To: 'David Woodhouse'
Subject: RE:... cfi_probe and cfi_cmdset_0002

>Are you 100% sure these are arranged as 4 8-bit devices side-by-side on the
>32-bit bus? It's more common in my experience to have 2 devices together in
>16-bit mode, and to have two such pairs consecutively mapped in the address
>space if there are four chips.

>Turn off CONFIG_MTD_CFI_ADV_OPTIONS and let it try all the probes.

Thank you, and OK, did that, new .config is attached below.

But still fails qry_present.  It is NOT getting to the cfi_cmdset_0002 stuff
to unlock before doing the CFI query, so still sees normal flash, not the
CFI identification stuff.

Shall I send boot sequence, with (as says in HOW_TO) generous sprinkling of
printk's?

Joe

---------------------
.config:
-------------------------------------
<deleted to MTD stuff>

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
# CONFIG_MTD_PARTITIONS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0xf4000000
CONFIG_MTD_PHYSMAP_LEN=0x1000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_PCI is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
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
# CONFIG_MTD_NAND is not set

<deleted to end>
---------------------
previous message, for reference:
I find that qry_present is failing on MVME5100

target board:   Motorola MVME5100, CPU=MPC750
                FLASH = 4x AMD29D323D, is CFI.

kernel:  2.4.2 (Hard Hat Linux 2.0)
MTD:     CVS download of about Tuesday (10/30/01)

I do not see how to "make it" do cfi_cmdset_0002 (amdstd CFI) stuff.
It goes through gen_probe, and since it didn't correctly put chips into CFI
query mode, the qry_present fails.


It appears like the command to enter CFI Query mode not working; subsequent
cfi_reads return "normal" flash data, I think.  So qry_present returns 1.

I say it looks like normal FLASH contents because I see the stuff cfi_read
returns when I use PPC_BUG6> m 0xF4000000 and scroll on down to ...80 which
is 0x10 * osf.

I am likely missing something basic.  Like incorrect xconfig settings!
Help appreciated!

Enclosed is .config.
Thank you!

Joe
--jcg
