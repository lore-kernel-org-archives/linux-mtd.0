Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xl3kn-0003BH-2a
 for linux-mtd@lists.infradead.org; Sun, 02 Nov 2014 22:36:09 +0000
Received: by mail-pd0-f178.google.com with SMTP id fp1so10399992pdb.37
 for <linux-mtd@lists.infradead.org>; Sun, 02 Nov 2014 14:35:47 -0800 (PST)
Date: Sun, 2 Nov 2014 14:35:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD fixes for 3.18
Message-ID: <20141102223540.GA22361@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit 8b3d58e554453ab858bbb169d93b7321bdc628d4:

  mtd: nand: omap: Correct CONFIG_MTD_NAND_OMAP_BCH help message (2014-10-06 23:40:09 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20141102

for you to fetch changes up to 89cf38dd536a7301d6b5f5ddd73f42074c01bfaa:

  mtd: cfi_cmdset_0001.c: fix resume for LH28F640BF chips (2014-10-29 18:50:52 -0700)

----------------------------------------------------------------
Three main MTD fixes for 3.18:

 * A regression from 3.16 which was noticed in 3.17. With the restructuring of
   the m25p80.c driver and the SPI NOR library framework, we omitted proper
   listing of the SPI device IDs. This means m25p80.c wouldn't auto-load
   (modprobe) properly when built as a module. For now, we duplicate the device
   IDs into both modules.

* The OMAP / ELM modules were depending on an implicit link ordering. Use
  deferred probing so that the new link order (in 3.18-rc) can still allow for
  successful probing.

* Fix suspend/resume support for LH28F640BF NOR flash

----------------------------------------------------------------
Ben Hutchings (2):
      mtd: spi-nor: make spi_nor_scan() take a chip type name, not spi_device_id
      mtd: m25p80,spi-nor: Fix module aliases for m25p80

Dmitry Eremin-Solenikov (1):
      mtd: cfi_cmdset_0001.c: fix resume for LH28F640BF chips

Frans Klaver (1):
      mtd: omap: fix mtd devices not showing up

Rafał Miłecki (1):
      mtd: m25p80: get rid of spi_get_device_id

 drivers/mtd/chips/cfi_cmdset_0001.c |  2 ++
 drivers/mtd/devices/m25p80.c        | 64 ++++++++++++++++++++++++++++++++-----
 drivers/mtd/nand/omap_elm.c         |  2 +-
 drivers/mtd/spi-nor/fsl-quadspi.c   |  7 +---
 drivers/mtd/spi-nor/spi-nor.c       | 16 ++++++----
 include/linux/mtd/spi-nor.h         | 21 ++----------
 6 files changed, 73 insertions(+), 39 deletions(-)
