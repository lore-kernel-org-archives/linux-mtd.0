Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDlE-0004ND-UY
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:10 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 00/11] mtd: change printks to pr_*
Date: Tue, 19 Jul 2011 10:06:05 -0700
Message-ID: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We've had quite some discussion about whether to use printk, pr_*, or
dev_* functions for printing info, error, and debugging messages.
Unfortunately, MTD doesn't quite have a nice device model, so we can't
always use dev_* to print nice device information. This patch series
mostly transitions the NAND subsystem to use pr_* functions, which are
a little more brief and slightly more flexible than printk.

Along the way, we've dumped a lot of old DEBUG() code that was written
specifically for MTD in favor of dynamic debugging. I tried killing the
corresponding Kconfig options as well. Not sure if patches 9 and 10 are
necessary.

These patches apply on top of l2-mtd-2.6.git

Brian

Brian Norris (11):
  mtd: nand: change KERN_DEBUG to KERN_INFO
  mtd: nand: convert printk() to pr_*()
  mtd: nand: style fixups in pr_* messages
  mtd: replace DEBUG() with pr_debug()
  mtd: cleanup style on pr_debug messages
  mtd: pcmciamtd: remove custom DEBUG() function
  mtd: remove CONFIG_MTD_DEBUG
  mtd: cleanup last uses of MTD_DEBUG config macros
  arch: remove references to CONFIG_MTD_DEBUG and
    CONFIG_MTD_DEBUG_VERBOSE
  arch: remove references to CONFIG_MTD_PARTITIONS
  mtd: Kbuild: remove reference to MTD_PARTITIONS

 arch/arm/configs/acs5k_defconfig                   |    1 -
 arch/arm/configs/acs5k_tiny_defconfig              |    1 -
 arch/arm/configs/afeb9260_defconfig                |    1 -
 arch/arm/configs/ap4evb_defconfig                  |    1 -
 arch/arm/configs/assabet_defconfig                 |    1 -
 arch/arm/configs/at91cap9adk_defconfig             |    1 -
 arch/arm/configs/at91rm9200_defconfig              |    1 -
 arch/arm/configs/at91sam9261_defconfig             |    1 -
 arch/arm/configs/at91sam9263_defconfig             |    1 -
 arch/arm/configs/at91sam9g20ek_defconfig           |    1 -
 arch/arm/configs/at91sam9rlek_defconfig            |    1 -
 arch/arm/configs/at91x40_defconfig                 |    1 -
 arch/arm/configs/badge4_defconfig                  |    2 -
 arch/arm/configs/bcmring_defconfig                 |    1 -
 arch/arm/configs/cam60_defconfig                   |    1 -
 arch/arm/configs/cerfcube_defconfig                |    1 -
 arch/arm/configs/cm_x300_defconfig                 |    1 -
 arch/arm/configs/cns3420vb_defconfig               |    1 -
 arch/arm/configs/collie_defconfig                  |    1 -
 arch/arm/configs/corgi_defconfig                   |    1 -
 arch/arm/configs/cpu9260_defconfig                 |    1 -
 arch/arm/configs/cpu9g20_defconfig                 |    1 -
 arch/arm/configs/davinci_all_defconfig             |    1 -
 arch/arm/configs/dove_defconfig                    |    1 -
 arch/arm/configs/ep93xx_defconfig                  |    1 -
 arch/arm/configs/g3evm_defconfig                   |    1 -
 arch/arm/configs/g4evm_defconfig                   |    1 -
 arch/arm/configs/h3600_defconfig                   |    1 -
 arch/arm/configs/h5000_defconfig                   |    1 -
 arch/arm/configs/h7201_defconfig                   |    2 -
 arch/arm/configs/h7202_defconfig                   |    1 -
 arch/arm/configs/hackkit_defconfig                 |    2 -
 arch/arm/configs/integrator_defconfig              |    1 -
 arch/arm/configs/iop13xx_defconfig                 |    1 -
 arch/arm/configs/iop32x_defconfig                  |    1 -
 arch/arm/configs/iop33x_defconfig                  |    1 -
 arch/arm/configs/ixp2000_defconfig                 |    1 -
 arch/arm/configs/ixp23xx_defconfig                 |    1 -
 arch/arm/configs/ixp4xx_defconfig                  |    1 -
 arch/arm/configs/kirkwood_defconfig                |    1 -
 arch/arm/configs/ks8695_defconfig                  |    1 -
 arch/arm/configs/lart_defconfig                    |    3 -
 arch/arm/configs/loki_defconfig                    |    1 -
 arch/arm/configs/lpd270_defconfig                  |    1 -
 arch/arm/configs/lubbock_defconfig                 |    1 -
 arch/arm/configs/mackerel_defconfig                |    1 -
 arch/arm/configs/magician_defconfig                |    1 -
 arch/arm/configs/mainstone_defconfig               |    1 -
 arch/arm/configs/mini2440_defconfig                |    1 -
 arch/arm/configs/msm_defconfig                     |    1 -
 arch/arm/configs/mv78xx0_defconfig                 |    1 -
 arch/arm/configs/mx1_defconfig                     |    1 -
 arch/arm/configs/mx21_defconfig                    |    3 -
 arch/arm/configs/mx27_defconfig                    |    1 -
 arch/arm/configs/mx3_defconfig                     |    1 -
 arch/arm/configs/neponset_defconfig                |    1 -
 arch/arm/configs/netx_defconfig                    |    1 -
 arch/arm/configs/nuc910_defconfig                  |    1 -
 arch/arm/configs/nuc950_defconfig                  |    1 -
 arch/arm/configs/nuc960_defconfig                  |    1 -
 arch/arm/configs/omap1_defconfig                   |    3 -
 arch/arm/configs/orion5x_defconfig                 |    1 -
 arch/arm/configs/pcm027_defconfig                  |    1 -
 arch/arm/configs/pcontrol_g20_defconfig            |    1 -
 arch/arm/configs/pleb_defconfig                    |    1 -
 arch/arm/configs/pnx4008_defconfig                 |    1 -
 arch/arm/configs/pxa255-idp_defconfig              |    1 -
 arch/arm/configs/qil-a9260_defconfig               |    1 -
 arch/arm/configs/raumfeld_defconfig                |    1 -
 arch/arm/configs/realview-smp_defconfig            |    1 -
 arch/arm/configs/realview_defconfig                |    1 -
 arch/arm/configs/s3c2410_defconfig                 |    1 -
 arch/arm/configs/sam9_l9260_defconfig              |    1 -
 arch/arm/configs/shannon_defconfig                 |    1 -
 arch/arm/configs/simpad_defconfig                  |    1 -
 arch/arm/configs/spitz_defconfig                   |    1 -
 arch/arm/configs/stamp9g20_defconfig               |    1 -
 arch/arm/configs/tct_hammer_defconfig              |    1 -
 arch/arm/configs/usb-a9260_defconfig               |    1 -
 arch/arm/configs/versatile_defconfig               |    1 -
 arch/arm/configs/vexpress_defconfig                |    1 -
 arch/avr32/configs/atngw100_defconfig              |    1 -
 arch/avr32/configs/atngw100_evklcd100_defconfig    |    1 -
 arch/avr32/configs/atngw100_evklcd101_defconfig    |    1 -
 arch/avr32/configs/atngw100_mrmt_defconfig         |    1 -
 arch/avr32/configs/atngw100mkii_defconfig          |    1 -
 .../avr32/configs/atngw100mkii_evklcd100_defconfig |    1 -
 .../avr32/configs/atngw100mkii_evklcd101_defconfig |    1 -
 arch/avr32/configs/atstk1002_defconfig             |    1 -
 arch/avr32/configs/atstk1003_defconfig             |    1 -
 arch/avr32/configs/atstk1004_defconfig             |    1 -
 arch/avr32/configs/atstk1006_defconfig             |    1 -
 arch/avr32/configs/favr-32_defconfig               |    1 -
 arch/avr32/configs/hammerhead_defconfig            |    1 -
 arch/avr32/configs/merisc_defconfig                |    1 -
 arch/avr32/configs/mimc200_defconfig               |    1 -
 arch/blackfin/configs/BF518F-EZBRD_defconfig       |    1 -
 arch/blackfin/configs/BF526-EZBRD_defconfig        |    1 -
 arch/blackfin/configs/BF527-EZKIT-V2_defconfig     |    1 -
 arch/blackfin/configs/BF527-EZKIT_defconfig        |    1 -
 arch/blackfin/configs/BF533-EZKIT_defconfig        |    1 -
 arch/blackfin/configs/BF537-STAMP_defconfig        |    1 -
 arch/blackfin/configs/BF538-EZKIT_defconfig        |    1 -
 arch/blackfin/configs/BF548-EZKIT_defconfig        |    1 -
 arch/blackfin/configs/BF561-ACVILON_defconfig      |    1 -
 arch/blackfin/configs/BF561-EZKIT-SMP_defconfig    |    1 -
 arch/blackfin/configs/BF561-EZKIT_defconfig        |    1 -
 arch/blackfin/configs/BlackStamp_defconfig         |    1 -
 arch/blackfin/configs/CM-BF533_defconfig           |    1 -
 arch/blackfin/configs/CM-BF548_defconfig           |    1 -
 arch/blackfin/configs/CM-BF561_defconfig           |    1 -
 arch/blackfin/configs/DNP5370_defconfig            |    3 -
 arch/blackfin/configs/H8606_defconfig              |    1 -
 arch/blackfin/configs/IP0X_defconfig               |    1 -
 arch/blackfin/configs/PNAV-10_defconfig            |    1 -
 arch/blackfin/configs/SRV1_defconfig               |    1 -
 arch/blackfin/configs/TCM-BF518_defconfig          |    1 -
 arch/h8300/defconfig                               |    1 -
 arch/m32r/configs/m32700ut.smp_defconfig           |    1 -
 arch/m32r/configs/m32700ut.up_defconfig            |    1 -
 arch/m32r/configs/mappi.smp_defconfig              |    1 -
 arch/m32r/configs/mappi.up_defconfig               |    1 -
 arch/m32r/configs/mappi3.smp_defconfig             |    1 -
 arch/m32r/configs/usrv_defconfig                   |    1 -
 arch/m68k/configs/m5208evb_defconfig               |    1 -
 arch/m68k/configs/m5249evb_defconfig               |    1 -
 arch/m68k/configs/m5272c3_defconfig                |    1 -
 arch/m68k/configs/m5275evb_defconfig               |    1 -
 arch/m68k/configs/m5307c3_defconfig                |    1 -
 arch/m68k/configs/m5407c3_defconfig                |    1 -
 arch/microblaze/configs/nommu_defconfig            |    1 -
 arch/mips/configs/ar7_defconfig                    |    1 -
 arch/mips/configs/bcm47xx_defconfig                |    1 -
 arch/mips/configs/bcm63xx_defconfig                |    1 -
 arch/mips/configs/cavium-octeon_defconfig          |    1 -
 arch/mips/configs/cobalt_defconfig                 |    1 -
 arch/mips/configs/db1000_defconfig                 |    1 -
 arch/mips/configs/db1100_defconfig                 |    1 -
 arch/mips/configs/db1200_defconfig                 |    1 -
 arch/mips/configs/db1500_defconfig                 |    1 -
 arch/mips/configs/db1550_defconfig                 |    1 -
 arch/mips/configs/gpr_defconfig                    |    1 -
 arch/mips/configs/jmr3927_defconfig                |    1 -
 arch/mips/configs/lasat_defconfig                  |    1 -
 arch/mips/configs/malta_defconfig                  |    1 -
 arch/mips/configs/markeins_defconfig               |    1 -
 arch/mips/configs/mtx1_defconfig                   |    1 -
 arch/mips/configs/pb1100_defconfig                 |    1 -
 arch/mips/configs/pb1200_defconfig                 |    1 -
 arch/mips/configs/pb1500_defconfig                 |    1 -
 arch/mips/configs/pb1550_defconfig                 |    1 -
 arch/mips/configs/pnx8335-stb225_defconfig         |    1 -
 arch/mips/configs/powertv_defconfig                |    1 -
 arch/mips/configs/rb532_defconfig                  |    1 -
 arch/mips/configs/rbtx49xx_defconfig               |    1 -
 arch/mn10300/configs/asb2303_defconfig             |    2 -
 arch/mn10300/configs/asb2364_defconfig             |    2 -
 arch/powerpc/configs/40x/acadia_defconfig          |    1 -
 arch/powerpc/configs/40x/ep405_defconfig           |    1 -
 arch/powerpc/configs/40x/hcu4_defconfig            |    1 -
 arch/powerpc/configs/40x/kilauea_defconfig         |    1 -
 arch/powerpc/configs/40x/makalu_defconfig          |    1 -
 arch/powerpc/configs/40x/walnut_defconfig          |    1 -
 arch/powerpc/configs/44x/arches_defconfig          |    1 -
 arch/powerpc/configs/44x/bluestone_defconfig       |    1 -
 arch/powerpc/configs/44x/canyonlands_defconfig     |    1 -
 arch/powerpc/configs/44x/ebony_defconfig           |    1 -
 arch/powerpc/configs/44x/eiger_defconfig           |    1 -
 arch/powerpc/configs/44x/icon_defconfig            |    1 -
 arch/powerpc/configs/44x/iss476-smp_defconfig      |    1 -
 arch/powerpc/configs/44x/katmai_defconfig          |    1 -
 arch/powerpc/configs/44x/rainier_defconfig         |    1 -
 arch/powerpc/configs/44x/redwood_defconfig         |    1 -
 arch/powerpc/configs/44x/sequoia_defconfig         |    1 -
 arch/powerpc/configs/44x/taishan_defconfig         |    1 -
 arch/powerpc/configs/44x/warp_defconfig            |    1 -
 arch/powerpc/configs/52xx/cm5200_defconfig         |    1 -
 arch/powerpc/configs/52xx/motionpro_defconfig      |    1 -
 arch/powerpc/configs/52xx/pcm030_defconfig         |    1 -
 arch/powerpc/configs/52xx/tqm5200_defconfig        |    1 -
 arch/powerpc/configs/83xx/asp8347_defconfig        |    1 -
 arch/powerpc/configs/83xx/kmeter1_defconfig        |    1 -
 arch/powerpc/configs/83xx/mpc8313_rdb_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc8315_rdb_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc836x_mds_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc836x_rdk_defconfig    |    1 -
 arch/powerpc/configs/83xx/sbc834x_defconfig        |    1 -
 arch/powerpc/configs/85xx/ksi8560_defconfig        |    1 -
 arch/powerpc/configs/85xx/socrates_defconfig       |    1 -
 arch/powerpc/configs/85xx/tqm8540_defconfig        |    1 -
 arch/powerpc/configs/85xx/tqm8541_defconfig        |    1 -
 arch/powerpc/configs/85xx/tqm8548_defconfig        |    1 -
 arch/powerpc/configs/85xx/tqm8555_defconfig        |    1 -
 arch/powerpc/configs/85xx/tqm8560_defconfig        |    1 -
 arch/powerpc/configs/85xx/xes_mpc85xx_defconfig    |    1 -
 arch/powerpc/configs/86xx/gef_ppc9a_defconfig      |    1 -
 arch/powerpc/configs/86xx/gef_sbc310_defconfig     |    1 -
 arch/powerpc/configs/86xx/gef_sbc610_defconfig     |    1 -
 arch/powerpc/configs/86xx/mpc8610_hpcd_defconfig   |    1 -
 arch/powerpc/configs/86xx/sbc8641d_defconfig       |    1 -
 arch/powerpc/configs/c2k_defconfig                 |    1 -
 arch/powerpc/configs/linkstation_defconfig         |    1 -
 arch/powerpc/configs/mgcoge_defconfig              |    1 -
 arch/powerpc/configs/mpc512x_defconfig             |    1 -
 arch/powerpc/configs/mpc5200_defconfig             |    1 -
 arch/powerpc/configs/mpc83xx_defconfig             |    1 -
 arch/powerpc/configs/ppc40x_defconfig              |    1 -
 arch/powerpc/configs/ppc44x_defconfig              |    1 -
 arch/powerpc/configs/prpmc2800_defconfig           |    1 -
 arch/powerpc/configs/storcenter_defconfig          |    1 -
 arch/powerpc/configs/tqm8xx_defconfig              |    1 -
 arch/sh/configs/ap325rxa_defconfig                 |    1 -
 arch/sh/configs/apsh4a3a_defconfig                 |    1 -
 arch/sh/configs/ecovec24_defconfig                 |    1 -
 arch/sh/configs/edosk7760_defconfig                |    2 -
 arch/sh/configs/espt_defconfig                     |    1 -
 arch/sh/configs/magicpanelr2_defconfig             |    1 -
 arch/sh/configs/migor_defconfig                    |    1 -
 arch/sh/configs/polaris_defconfig                  |    1 -
 arch/sh/configs/r7780mp_defconfig                  |    1 -
 arch/sh/configs/rsk7201_defconfig                  |    1 -
 arch/sh/configs/rsk7203_defconfig                  |    1 -
 arch/sh/configs/rts7751r2dplus_defconfig           |    1 -
 arch/sh/configs/sdk7786_defconfig                  |    1 -
 arch/sh/configs/se7206_defconfig                   |    1 -
 arch/sh/configs/se7343_defconfig                   |    1 -
 arch/sh/configs/se7619_defconfig                   |    1 -
 arch/sh/configs/se7705_defconfig                   |    1 -
 arch/sh/configs/se7712_defconfig                   |    1 -
 arch/sh/configs/se7721_defconfig                   |    1 -
 arch/sh/configs/se7724_defconfig                   |    1 -
 arch/sh/configs/se7750_defconfig                   |    1 -
 arch/sh/configs/se7751_defconfig                   |    1 -
 arch/sh/configs/se7780_defconfig                   |    1 -
 arch/sh/configs/secureedge5410_defconfig           |    1 -
 arch/sh/configs/sh7710voipgw_defconfig             |    1 -
 arch/sh/configs/sh7757lcr_defconfig                |    1 -
 arch/sh/configs/sh7763rdp_defconfig                |    1 -
 arch/sh/configs/sh7785lcr_32bit_defconfig          |    1 -
 arch/sh/configs/sh7785lcr_defconfig                |    1 -
 arch/sh/configs/shmin_defconfig                    |    1 -
 arch/sh/configs/titan_defconfig                    |    1 -
 arch/sh/configs/ul2_defconfig                      |    1 -
 arch/sh/configs/urquell_defconfig                  |    1 -
 arch/unicore32/configs/debug_defconfig             |    1 -
 drivers/mtd/Kconfig                                |   13 --
 drivers/mtd/chips/cfi_cmdset_0002.c                |   31 ++---
 drivers/mtd/chips/fwh_lock.h                       |    3 +-
 drivers/mtd/chips/jedec_probe.c                    |   32 ++---
 drivers/mtd/devices/doc2000.c                      |   11 +-
 drivers/mtd/devices/doc2001.c                      |    5 +-
 drivers/mtd/devices/doc2001plus.c                  |    5 +-
 drivers/mtd/devices/m25p80.c                       |   41 +++---
 drivers/mtd/devices/mtd_dataflash.c                |   49 +++----
 drivers/mtd/devices/sst25l.c                       |    3 +-
 drivers/mtd/ftl.c                                  |   38 +++---
 drivers/mtd/inftlcore.c                            |   55 ++++----
 drivers/mtd/inftlmount.c                           |  114 +++++++---------
 drivers/mtd/maps/Kconfig                           |    1 -
 drivers/mtd/maps/pcmciamtd.c                       |  124 +++++++---------
 drivers/mtd/mtdblock.c                             |   14 +-
 drivers/mtd/mtdchar.c                              |   10 +-
 drivers/mtd/mtdcore.c                              |    2 +-
 drivers/mtd/mtdsuper.c                             |   20 ++--
 drivers/mtd/nand/mxc_nand.c                        |   16 +--
 drivers/mtd/nand/nand_base.c                       |  151 ++++++++++----------
 drivers/mtd/nand/nand_bbt.c                        |   64 ++++-----
 drivers/mtd/nand/nand_bch.c                        |    4 +-
 drivers/mtd/nand/omap2.c                           |   10 +-
 drivers/mtd/nand/rtc_from4.c                       |    2 +-
 drivers/mtd/nftlcore.c                             |   23 ++--
 drivers/mtd/onenand/onenand_base.c                 |   35 +++---
 drivers/mtd/onenand/onenand_bbt.c                  |    2 +-
 drivers/mtd/ssfdc.c                                |   34 ++---
 include/linux/mtd/mtd.h                            |   23 ---
 275 files changed, 406 insertions(+), 788 deletions(-)
