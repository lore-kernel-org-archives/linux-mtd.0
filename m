Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QMK2r-0007EB-81
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 13:10:42 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v6 0/8] Switch ARM platforms from integrator-flash to physmap
Date: Tue, 17 May 2011 14:11:09 +0100
Message-Id: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As the integrator-flash driver is mostly a duplicate of physmap,
move all users of this driver to physmap and get rid of the
then unused driver.

Also change the set_vpp() method in physmap to pass the
platform_device instead of the map_info. This allows for a substantial
cleanup in drivers/mtd/maps/pismo.c

This patch set has been ok'ed by RMK, who is willing to take it
through his tree. This requires an ACK from the MTD maintainers. David
Woodhouse cc-ed on the whole patch set in case he'd prefer to merge it
via the MTD tree.

Changes since v5:
- Removed #ifdef around the afs partition name, as requested by
  Artem Bityutskiy
- Dropped changes to board-at572d940hf_ek.c, as the board is to be
  removed from the tree

Changes since v4:
- Changed set_vpp() method in physmap
- Rebased against v2.6.39-rc7

Changes since v3:
- Dropped patch for aaec2000 platform (removed from tree)
- Rebased against next-20110317

Changes since v2:
- Add integrator-flash's init()/exit() methods in order to control
  write access to the various onboard programmable components, as
  per RMK request.
- Rebased against 2.6.38-rc2

Changes since initial revision:
- Rebased against linux-next (20110107). It should apply cleanly
  on top of Linus' tree, except for a small conflict in the last
  patch of the serie.

Marc Zyngier (8):
  MTD: Add integrator-flash feature to physmap
  ARM: Realview: Use physmap driver instead of integrator-flash
  ARM: Versatile: Use physmap driver instead of integrator-flash
  ARM: VExpress: Use physmap driver instead of integrator-flash
  ARM: Integrator/AP: Use physmap driver instead of integrator-flash
  ARM: Integrator/CP: Use physmap driver instead of integrator-flash
  MTD: Remove integrator-flash
  MTD: physmap: let set_vpp() pass a platform_device instead of a
    map_info

 arch/arm/configs/realview-smp_defconfig  |    2 +-
 arch/arm/configs/realview_defconfig      |    2 +-
 arch/arm/configs/versatile_defconfig     |    2 +-
 arch/arm/mach-integrator/integrator_ap.c |   13 +-
 arch/arm/mach-integrator/integrator_cp.c |   13 +-
 arch/arm/mach-omap1/flash.c              |    2 +-
 arch/arm/mach-pxa/hx4700.c               |    2 +-
 arch/arm/mach-pxa/magician.c             |    2 +-
 arch/arm/mach-realview/core.c            |   31 +---
 arch/arm/mach-s3c2410/nor-simtec.c       |    2 +-
 arch/arm/mach-versatile/core.c           |   31 +---
 arch/arm/mach-vexpress/v2m.c             |   22 +--
 arch/arm/plat-omap/include/plat/flash.h  |    2 +-
 drivers/mtd/Kconfig                      |    3 +-
 drivers/mtd/maps/Makefile                |    1 -
 drivers/mtd/maps/integrator-flash.c      |  309 --------------------------=
----
 drivers/mtd/maps/physmap.c               |   28 +++-
 drivers/mtd/maps/pismo.c                 |   40 +----
 include/linux/mtd/physmap.h              |    4 +-
 19 files changed, 65 insertions(+), 446 deletions(-)
 delete mode 100644 drivers/mtd/maps/integrator-flash.c
