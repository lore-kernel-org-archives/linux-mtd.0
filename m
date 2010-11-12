Received: from mail.perches.com ([173.55.12.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PH1K0-00063L-EB
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2010 21:38:13 +0000
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>
Subject: [PATCH 00/14] Use printf extension %pR for struct resource
Date: Fri, 12 Nov 2010 13:37:50 -0800
Message-Id: <cover.1289597644.git.joe@perches.com>
Cc: linux-mips@linux-mips.org, alsa-devel@alsa-project.org,
	linux-parisc@vger.kernel.org, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, socketcan-core@lists.berlios.de,
	linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yet more trivia...

Joe Perches (14):
  arch/frv: Use printf extension %pR for struct resource
  arch/mips: Use printf extension %pR for struct resource
  arch/powerpc: Use printf extension %pR for struct resource
  drivers/dma/ppc4xx: Use printf extension %pR for struct resource
  drivers/infiniband: Use printf extension %pR for struct resource
  drivers/mfd: Use printf extension %pR for struct resource
  drivers/mtd/maps: Use printf extension %pR for struct resource
  drivers/mtd/nand: Use printf extension %pR for struct resource
  drivers/net/can/sja1000: Use printf extension %pR for struct resource
  drivers/parisc: Use printf extension %pR for struct resource
  drivers/rapidio: Use printf extension %pR for struct resource
  drivers/uwb: Use printf extension %pR for struct resource
  drivers/video: Use printf extension %pR for struct resource
  sound/ppc: Use printf extension %pR for struct resource

 arch/frv/mb93090-mb00/pci-vdk.c               |    8 ++------
 arch/mips/txx9/generic/pci.c                  |    7 ++-----
 arch/powerpc/kernel/pci_64.c                  |    3 +--
 arch/powerpc/sysdev/tsi108_dev.c              |    8 ++++----
 drivers/dma/ppc4xx/adma.c                     |    5 ++---
 drivers/infiniband/hw/ipath/ipath_driver.c    |    5 ++---
 drivers/mfd/sm501.c                           |    7 ++-----
 drivers/mtd/maps/amd76xrom.c                  |    7 ++-----
 drivers/mtd/maps/ck804xrom.c                  |    7 ++-----
 drivers/mtd/maps/esb2rom.c                    |    9 +++------
 drivers/mtd/maps/ichxrom.c                    |    9 +++------
 drivers/mtd/maps/physmap_of.c                 |    4 +---
 drivers/mtd/maps/scx200_docflash.c            |    5 ++---
 drivers/mtd/nand/pasemi_nand.c                |    2 +-
 drivers/net/can/sja1000/sja1000_of_platform.c |    8 ++------
 drivers/parisc/dino.c                         |   13 +++++--------
 drivers/parisc/hppb.c                         |    6 ++----
 drivers/rapidio/rio.c                         |    4 ++--
 drivers/uwb/umc-dev.c                         |    7 ++-----
 drivers/video/platinumfb.c                    |    8 ++------
 sound/ppc/pmac.c                              |   12 ++++--------
 21 files changed, 48 insertions(+), 96 deletions(-)

-- 
1.7.3.1.g432b3.dirty
