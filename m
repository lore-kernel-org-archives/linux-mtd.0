Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQiMn-00039l-29
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 13:48:28 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Pull request blackfin.git (for-mtd branch)
Date: Tue, 14 Jul 2009 09:48:16 -0400
Message-Id: <1247579296-9866-1-git-send-email-vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following changes since commit 4a390e07fc53ce9dd615d7b788e9ecc73f87ad94:
  Linus Torvalds (1):
        Merge git://git.kernel.org/.../gregkh/staging-2.6

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vapier/blackfin.git for-mtd

Graf Yang (2):
      mtd: m25p80: add support for AAI programming with SST SPI flashes
      mtd: m25p80: add SST WF SPI flash device information

Mike Frysinger (5):
      mtd/maps: uclinux: depend on MTD_RAM being built into the kernel
      mtd/maps: gpio-addr-flash: new driver for GPIO assisted flash addressing
      mtd: fix order of TEST/PARTITIONS kconfig options
      [MTD] [CHIPS] stm_flash: new ST PSD4256G compatible flash chip driver
      [MTD] phram: cleanup error handling and associated messages

Timofei Bondarenko (1):
      mtd/maps: uclinux: fix building when partition support is disabled

 drivers/mtd/Kconfig                |   16 +-
 drivers/mtd/chips/Kconfig          |    8 +
 drivers/mtd/chips/Makefile         |    1 +
 drivers/mtd/chips/stm_flash.c      |  747 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/devices/m25p80.c       |  130 +++++++-
 drivers/mtd/devices/phram.c        |   25 +-
 drivers/mtd/maps/Kconfig           |   12 +-
 drivers/mtd/maps/Makefile          |    3 +-
 drivers/mtd/maps/gpio-addr-flash.c |  311 +++++++++++++++
 drivers/mtd/maps/uclinux.c         |    8 +
 10 files changed, 1236 insertions(+), 25 deletions(-)
 create mode 100644 drivers/mtd/chips/stm_flash.c
 create mode 100644 drivers/mtd/maps/gpio-addr-flash.c
