Subject: [GIT *] MTD for 2.6.30
From: David Woodhouse <dwmw2@infradead.org>
To: torvalds@linux-foundation.org
In-Reply-To: <1238857258.4068.26.camel@macbook.infradead.org>
References: <1238857258.4068.26.camel@macbook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Apr 2009 07:38:14 -0700
Message-Id: <1239028694.11870.39.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please pull from git://git.infradead.org/mtd-2.6.git

Most notable change is that it starts to drag the MTD subsystem into the
21st century, by adding basic support for the driver model. We now
attempt to hook devices up properly to their appropriate parent, and
expose device characteristics in sysfs instead of only through the
ioctls which we inherited from the PCMCIA subsystem years ago.

There's more to do here, but this is a reasonable start. Next I want to
redo the way we handle MTD "partitions", which have always been a dirty
hack.

Other than that... David Howells' romfs-XIP bits which have been pending
for ages, a couple of new board drivers, support for multiple NAND chips
on certain Freescale-based boards, various fixes and hardware
workarounds, and a new NOR flash chip ident. Nothing massively exciting.

There's a trivial conflict in drivers/mtd/maps/Makefile which I've left
as an exercise for the reader.

(Please also pull the iommu-2.6.git tree which was submitted a couple of
days ago)

Adrian Hunter (3):
      [MTD] mtdoops: allow MTD selection by name
      [MTD] mtdoops: fix a bit of spin lock usage
      [MTD] [OneNAND] omap2: panic_write may be in an interrupt context

Atsushi Nemoto (5):
      [MTD] [NAND] TXx9: add NDFMC support
      [MTD] RBTX4939: add MTD support
      [MTD] TXx9 SoC NAND Flash Memory Controller driver
      [MTD] RBTX4939 map driver
      [MTD] mtdpart: Make all partition parsers return allocated array

Benjamin Krill (1):
      [MTD] ofpart: Check name property to determine partition nodes.

Bernd Schmidt (1):
      [MTD] Fix a bad dependency in the Blackfin code

Darius Augulis (1):
      [MTD] [NOR] Fixup for Numonyx M29W128 chips

David Brownell (7):
      [MTD] [NAND] fix "raw" reads with ECC syndrome layouts
      [MTD] [NAND] davinci_nand driver
      [MTD] [NAND] fix broken debug messages
      [MTD] we don't need no misc devices
      [MTD] partitioning utility predicates
      [MTD] driver model updates
      [MTD] support driver model updates

David Howells (4):
      NOMMU: Present backing device capabilities for MTD chardevs
      NOMMU: Add support for direct mapping through mtdconcat if possible
      NOMMU: Make it possible for RomFS to use MTD devices directly
      NOMMU: Fix the RomFS Kconfig to ensure at least one backing store is selected

David Woodhouse (3):
      [MTD] [NAND] Add parent info for CAFÉ controller
      [MTD] [NOR] Add device parent info to physmap_of

Dmitry Eremin-Solenikov (1):
      [MTD] [MAPS] Drop now unused sharpsl-flash map

Graff Yang (1):
      [MTD] [CHIPS] cfi_cmdset_0001.c: Fix a bug in inval_cache_and_wait_for_operation().

Kay Sievers (1):
      [MTD] struct device - replace bus_id with dev_name(), dev_set_name()

Kevin Cernekee (2):
      [MTD] driver model updates (part 2)
      [MTD] sysfs support should not depend on CONFIG_PROC_FS

Kevin Hilman (1):
      [MTD] [NAND] davinci: drop usage of cpu_is_* macro

Kyungmin Park (1):
      [MTD] [OneNAND] Add write-while-program support

Marcin Slusarz (1):
      [MTD] fix use after free in register_mtd_blktrans

Mike Frysinger (3):
      [MTD] [NAND] Blackfin NFC Driver: do not clobber DMAC1_PERIMUX
      [MTD] [NAND] Blackfin NFC Driver: mark bf5xx_nand_add_partition() as __devinit
      [MTD] [NAND] Blackfin NFC Driver: drop pointless casts with set_dma_callback()

Mike Rapoport (3):
      [MTD] [NAND] pxa3xx_nand: use resource_size instead of 'r->end - r->start + 1'
      [MTD] [NAND] pxa3xx_nand: allow building as module
      [MTD] [NAND] pxa3xx_nand: add ability to keep controller settings defined by OBM/bootloader

Roel Kluin (1):
      [JFFS2] jffs2_acl_count() tests < 0 on unsigned

Scott James Remnant (2):
      [MTD] Auto-load mtdchar module when device opened.
      [MTD] Auto-load nftl module when device opened.

Thomas Gleixner (1):
      [MTD] [NAND] Add support for 4KiB pages.

Uwe Kleine-König (2):
      [MTD] [MAPS] move sa1100 flash's probe function to .devinit.text
      [MTD] [NAND] move gen_nand's probe function to .devinit.text

Wei Yongjun (1):
      [JFFS2] kmem_cache_alloc/memset -> kmem_cache_zalloc

Wolfgang Grandegger (5):
      [MTD] [NAND] Add support for NAND on the Socrates board
      [MTD] [NAND] FSL-UPM: add multi chip support
      [MTD] [NAND] FSL-UPM: Add wait flags to support board/chip specific delays
      powerpc: NAND: FSL UPM: document new bindings
      powerpc/85xx: TQM8548: Update DTS file for multi-chip support

Yauhen Kharuzhy (1):
      [MTD] mtdpart: Make ecc_stats more realistic.

Yegor Yefremov (1):
      [MTD] [CHIPS] Add JEDEC probe support for the SST 39VF3201 flash chip

Yoshihiro Shimoda (1):
      [MTD] [NAND] sh_flctl: fix hardware ecc handling for 2048 byte page

 .../powerpc/dts-bindings/fsl/upm-nand.txt          |   39 ++-
 arch/arm/mach-davinci/include/mach/nand.h          |   80 +++
 arch/arm/mach-pxa/include/mach/pxa3xx_nand.h       |    3 +
 arch/blackfin/kernel/process.c                     |    2 +-
 arch/mips/include/asm/txx9/ndfmc.h                 |   30 +
 arch/mips/include/asm/txx9/rbtx4939.h              |    9 +
 arch/mips/include/asm/txx9/tx4938.h                |    1 +
 arch/mips/include/asm/txx9/tx4939.h                |    2 +
 arch/mips/txx9/generic/setup.c                     |   21 +
 arch/mips/txx9/generic/setup_tx4938.c              |   21 +
 arch/mips/txx9/generic/setup_tx4939.c              |   17 +
 arch/mips/txx9/rbtx4938/setup.c                    |    2 +
 arch/mips/txx9/rbtx4939/setup.c                    |  161 +++++
 arch/powerpc/boot/dts/tqm8548-bigflash.dts         |    7 +-
 arch/powerpc/boot/dts/tqm8548.dts                  |    7 +-
 arch/powerpc/sysdev/fsl_lbc.c                      |    2 +-
 drivers/mtd/Makefile                               |    2 +-
 drivers/mtd/ar7part.c                              |    6 +-
 drivers/mtd/chips/cfi_cmdset_0001.c                |    8 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                |   11 +
 drivers/mtd/chips/jedec_probe.c                    |   16 +
 drivers/mtd/chips/map_ram.c                        |   17 +
 drivers/mtd/chips/map_rom.c                        |   17 +
 drivers/mtd/cmdlinepart.c                          |    6 +-
 drivers/mtd/devices/doc2000.c                      |    1 -
 drivers/mtd/devices/doc2001.c                      |    1 -
 drivers/mtd/devices/doc2001plus.c                  |    1 -
 drivers/mtd/devices/docecc.c                       |    1 -
 drivers/mtd/devices/m25p80.c                       |   19 +-
 drivers/mtd/devices/mtd_dataflash.c                |   18 +-
 drivers/mtd/devices/mtdram.c                       |   14 +
 drivers/mtd/inftlmount.c                           |    1 -
 drivers/mtd/internal.h                             |   17 +
 drivers/mtd/maps/Kconfig                           |   12 +-
 drivers/mtd/maps/Makefile                          |    2 +-
 drivers/mtd/maps/omap_nor.c                        |    2 +
 drivers/mtd/maps/physmap.c                         |    1 +
 drivers/mtd/maps/physmap_of.c                      |    1 +
 drivers/mtd/maps/plat-ram.c                        |    1 +
 drivers/mtd/maps/rbtx4939-flash.c                  |  208 ++++++
 drivers/mtd/maps/sa1100-flash.c                    |    2 +-
 drivers/mtd/maps/sharpsl-flash.c                   |  116 ----
 drivers/mtd/mtd_blkdevs.c                          |    4 +-
 drivers/mtd/mtdbdi.c                               |   43 ++
 drivers/mtd/mtdchar.c                              |  111 ++--
 drivers/mtd/mtdconcat.c                            |   47 ++
 drivers/mtd/mtdcore.c                              |  208 ++++++-
 drivers/mtd/mtdoops.c                              |   16 +-
 drivers/mtd/mtdpart.c                              |   31 +-
 drivers/mtd/nand/Kconfig                           |   21 +-
 drivers/mtd/nand/Makefile                          |    3 +
 drivers/mtd/nand/bf5xx_nand.c                      |   18 +-
 drivers/mtd/nand/cafe_nand.c                       |    1 +
 drivers/mtd/nand/davinci_nand.c                    |  570 +++++++++++++++++
 drivers/mtd/nand/fsl_upm.c                         |  119 +++-
 drivers/mtd/nand/mxc_nand.c                        |    1 +
 drivers/mtd/nand/nand_base.c                       |  125 ++++-
 drivers/mtd/nand/plat_nand.c                       |    2 +-
 drivers/mtd/nand/pxa3xx_nand.c                     |  119 ++++-
 drivers/mtd/nand/sh_flctl.c                        |   18 +-
 drivers/mtd/nand/socrates_nand.c                   |  325 ++++++++++
 drivers/mtd/nand/txx9ndfmc.c                       |  428 +++++++++++++
 drivers/mtd/nftlcore.c                             |    3 +-
 drivers/mtd/ofpart.c                               |    7 +
 drivers/mtd/onenand/omap2.c                        |    6 +
 drivers/mtd/onenand/onenand_base.c                 |  145 +++--
 fs/jffs2/acl.c                                     |    4 +-
 fs/jffs2/malloc.c                                  |    6 +-
 fs/romfs/Kconfig                                   |   48 ++-
 fs/romfs/Makefile                                  |    9 +-
 fs/romfs/inode.c                                   |  665 --------------------
 fs/romfs/internal.h                                |   47 ++
 fs/romfs/mmap-nommu.c                              |   75 +++
 fs/romfs/storage.c                                 |  261 ++++++++
 fs/romfs/super.c                                   |  648 +++++++++++++++++++
 include/linux/mtd/mtd.h                            |   21 +
 include/linux/mtd/nand.h                           |    4 +-
 include/linux/mtd/partitions.h                     |   12 +
 78 files changed, 4080 insertions(+), 996 deletions(-)

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
