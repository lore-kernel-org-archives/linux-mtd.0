Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xvn4o-0003I6-0E
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 13:01:13 +0000
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
To: Andrew Bresticker <abrestic@chromium.org>, Ionela Voinescu
 <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>, Brian
 Norris <computersforpeace@gmail.com>, <bpqw@micron.com>,
 <arnaud.mouiche@invoxia.com>, <frankliu@micron.com>
Subject: [PATCH 0/6] SPI NAND for everyone
Date: Tue, 2 Dec 2014 09:58:50 -0300
Message-ID: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

During the discussion of Ionela Voinescu's patch to support GD5F SPI NAND
devices [1], it was decided that a proper SPI NAND framework was needed
to support the mt29f device (driver currently in staging area) and the new
gd5f.

This patchset is a first attempt to address this.

The SPI NAND framework allows devices to register as NAND drivers. This is
useful to take advantage of the bad block management code. Given the
SPI NAND and the bare NAND commands are different, the SPI NAND framework
implements its own .cmdfunc callback, which is in charge of calling
device-specific hooks for each of the flash operations (read, program, erase,
etc).

The SPI NAND framework does not deal with SPI transactions per-se. Instead,
the SPI messages should be prepared by the users of the SPI NAND framework
(those that implement the device-specific hooks).

The result can be expressed in the following hierarchy:

    Userspace
  ------------------
    MTD
  ------------------
    NAND core
  ------------------
    SPI NAND core
  ------------------
    SPI NAND device
  ------------------
    SPI core
  ------------------
    SPI master
  ------------------
    Hardware

Notice there was a previous attempt to propose an SPI NAND framework,
by Sourav Poddar and Mona Anonuevo. We didn't find this proposal suitable,
so this series is a completely new work.

This series is based on v3.18-rc7. Tests have been performed with a Gigadevice
GD5F 4 Gbit device, including nandtest runs and filesystem testing on top
of UBI. I don't have MT29F devices yet, but the amount of changes required to
support it should be fairly small.

I don't intend this first proposal to be complete, but I hope it's a good
starting point to support SPI NAND properly.

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-November/056364.html
[2] https://lkml.org/lkml/2013/6/26/83

Ezequiel Garcia (6):
  mtd: nand: Check length of ID before reading bits per cell
  mtd: nand: Add JEDEC manufacturer ID for Gigadevice
  mtd: nand: Allow to set a per-device ECC layout
  mtd: Introduce SPI NAND framework
  mtd: spi-nand: Add devicetree binding
  mtd: spi-nand: Support common SPI NAND devices

 Documentation/devicetree/bindings/mtd/spi-nand.txt |  21 +
 drivers/mtd/Kconfig                                |   2 +
 drivers/mtd/Makefile                               |   1 +
 drivers/mtd/nand/nand_base.c                       |   4 +-
 drivers/mtd/nand/nand_ids.c                        |   1 +
 drivers/mtd/spi-nand/Kconfig                       |  18 +
 drivers/mtd/spi-nand/Makefile                      |   2 +
 drivers/mtd/spi-nand/spi-nand-base.c               | 530 +++++++++++++++++++++
 drivers/mtd/spi-nand/spi-nand-device.c             | 500 +++++++++++++++++++
 include/linux/mtd/nand.h                           |   3 +
 include/linux/mtd/spi-nand.h                       |  54 +++
 11 files changed, 1135 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
 create mode 100644 drivers/mtd/spi-nand/Kconfig
 create mode 100644 drivers/mtd/spi-nand/Makefile
 create mode 100644 drivers/mtd/spi-nand/spi-nand-base.c
 create mode 100644 drivers/mtd/spi-nand/spi-nand-device.c
 create mode 100644 include/linux/mtd/spi-nand.h

-- 
2.1.0
