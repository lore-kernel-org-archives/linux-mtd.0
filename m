Received: from smtp4-g21.free.fr ([212.27.42.4])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezsYb-0004iE-I3
 for linux-mtd@lists.infradead.org; Sat, 24 Mar 2018 23:26:42 +0000
From: Alban Bedel <albeu@free.fr>
To: linux-kernel@vger.kernel.org
Cc: Alban Bedel <albeu@free.fr>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/3] mtd: Add support for reading MTD devices via the nvmem
 API
Date: Sun, 25 Mar 2018 00:24:56 +0100
Message-Id: <1521933899-362-1-git-send-email-albeu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

this series add support for reading MTD devices via the nvmem API, this
is mostly needed on embedded devices where things like MAC address and
calibration data is often stored in a partition on the main flash device.

Adding support for the nvmem API to the MTD core is trivial, however there
is a clash in the OF binding used by both subsystems. The current nvmem
binding expect nvmem cell to be subnode of the nvmem device, without any
compatible string. But MTD devices used a similar scheme for partition in
the past, so a subnode from an MTD device could be a partition using the
old binding or an nvmem cell.

To avoid this problem we update the nvmem cell binding to use a 'nvmem-cells'
subnode with compatible string to hold the list of nvmem cells. This new
binding make sure that any kind of device can be used as nvmem provider.

Alban Bedel (3):
  nvmem: Update the OF binding to use a subnode for the cells list
  doc: bindings: Add bindings documentation for mtd nvmem
  mtd: Add support for reading MTD devices via the nvmem API

 .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 27 ++++++++++
 Documentation/devicetree/bindings/nvmem/nvmem.txt  | 55 +++++++++++++-------
 drivers/mtd/Kconfig                                |  1 +
 drivers/mtd/mtdcore.c                              | 59 ++++++++++++++++++++++
 drivers/nvmem/core.c                               | 10 ++++
 include/linux/mtd/mtd.h                            |  2 +
 6 files changed, 137 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt

-- 
2.7.4
