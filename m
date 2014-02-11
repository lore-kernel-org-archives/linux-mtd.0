Received: from mail-ea0-x231.google.com ([2a00:1450:4013:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDLAs-00064L-BA
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 21:47:27 +0000
Received: by mail-ea0-f177.google.com with SMTP id m10so1392779eaj.36
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 13:47:03 -0800 (PST)
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH v2 0/4] mtd: nand: add per partition ECC config
Date: Tue, 11 Feb 2014 22:46:45 +0100
Message-Id: <1392155209-14495-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gupta Pekon <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patch series is a proposal to add per partition ECC config.

It defines a new partition type called nand_part which stores a pointer to
a nand_ecc_ctrl struct.
This specific nand_ecc_ctrl struct is used in place of the base NAND chip
nand_ecc_ctrl struct when accessing NAND chip from nand_part MTD device.

If the partition does not define any ECC config, the NAND chip ECC config
is used instead.

This patch series also provides an helper function to parse DT defined NAND
partitions (ofnandpart_parse).

If you want to test it you'll have to replace calls to
mtd_device_parse_register with ofnandpart_parse within your NAND controller
driver and implement a driver specific parser function that will provide
the ECC config (see ofnandpart_data struct).

The 4th patch of this series is here as an example on how to move from MTD
partitions to NAND partitions.

Best Regards,

Boris

Changes since v1:
- almost everything :-)

Boris BREZILLON (4):
  mtd: nand: take nand_ecc_ctrl initialization out of nand_scan_tail
  mtd: nand: add support for NAND partitions
  mtd: nand: add DT NAND partition parser
  mtd: nand: add NAND partition support to the sunxi driver

 drivers/mtd/nand/Kconfig      |    4 +
 drivers/mtd/nand/Makefile     |    2 +
 drivers/mtd/nand/nand_base.c  |  763 ++++++++++++++++++++++++++++++++---------
 drivers/mtd/nand/ofnandpart.c |  104 ++++++
 drivers/mtd/nand/sunxi_nand.c |   69 +++-
 include/linux/mtd/nand.h      |   54 +++
 6 files changed, 835 insertions(+), 161 deletions(-)
 create mode 100644 drivers/mtd/nand/ofnandpart.c

-- 
1.7.9.5
