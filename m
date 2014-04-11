Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYgh3-0005MK-RD
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 19:00:54 +0000
Received: by mail-qg0-f52.google.com with SMTP id q107so5946875qgd.11
 for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2014 12:00:31 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 00/11] mtd: spi-nor: misc. updates, de-duplication
Date: Fri, 11 Apr 2014 11:59:55 -0700
Message-Id: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A few miscellaneous updates, cleanups, and de-duplications. Mostly trivial
stuff, but I had a few oversights in the first round...and in the second round 
too :(

v3:
 - move the fsl-quadspi.c rename of
     SPINOR_OP_QUAD_READ => SPINOR_OP_READ_1_1_4
   from patch 8 to patch 3, so that the series bisects properly
 - add new patch 11, caught while testing with sparse

v2:
 - opcode renames to fsl-quadspi.c (missed a few; I compiled it this time!)
 - additional whitespace consistency cleanups
 - tweak documentation wording/formatting
 - additonal patch (patch 10), to allow building spi-nor as a module


Brian Norris (11):
  mtd: spi-nor: drop \t after #define
  mtd: spi-nor: re-name OPCODE_* to SPINOR_OP_*
  mtd: spi-nor: unify read opcode variants with ST SPI FSM
  Documentation: spi-nor: rewrite some portions
  mtd: spi-nor: shorten Kconfig naming
  mtd: st_spi_fsm: fixup Kconfig dependency
  mtd: st_spi_fsm: kill duplicate CMD definitions
  mtd: st_spi_fsm: replace FLACH_CMD_* with SPINOR_OP_*
  mtd: st_spi_fsm: begin using spi-nor.h opcodes
  mtd: spi-nor: allow to be built as module
  mtd: fsl-quadspi: fix __iomem annotations, accessors

 Documentation/mtd/spi-nor.txt           |  37 ++++----
 drivers/mtd/Makefile                    |   2 +-
 drivers/mtd/devices/Kconfig             |   4 +-
 drivers/mtd/devices/m25p80.c            |   4 +-
 drivers/mtd/devices/serial_flash_cmds.h |  44 +++-------
 drivers/mtd/devices/st_spi_fsm.c        | 149 ++++++++++++--------------------
 drivers/mtd/spi-nor/Kconfig             |  11 ++-
 drivers/mtd/spi-nor/Makefile            |   2 +-
 drivers/mtd/spi-nor/fsl-quadspi.c       |  64 +++++++-------
 drivers/mtd/spi-nor/spi-nor.c           |  64 +++++++-------
 include/linux/mtd/spi-nor.h             |  80 +++++++++--------
 11 files changed, 211 insertions(+), 250 deletions(-)

-- 
1.8.3.2
