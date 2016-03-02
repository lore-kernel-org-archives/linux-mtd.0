Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abA8q-0003ID-QI
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 17:00:53 +0000
Received: by mail-io0-x22c.google.com with SMTP id l127so266199028iof.3
 for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2016 09:00:32 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To: jorge.ramirez-ortiz@linaro.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, matthias.bgg@gmail.com, robh@kernel.org
Cc: daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com
Subject: [RFC PATCH 0/3] MTK Smart Device Gen1 NAND support
Date: Wed,  2 Mar 2016 12:00:10 -0500
Message-Id: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Overview:
---------

The following patch-set adds support for Mediatek's Smart Device
Gen1 NAND controller.

Because this is the controller present in SoC mt2701, we also enabled
support in the corresponding device tree for the evaluation board.

* Controller expected layout

The controller expects the OOB information relevant to each sector
within the page to follow immediately the data field.

For example for a 4KiB page with 1KiB sectors and 128B of OOB information,
the controller would expect the following layout.

-----------------------------------------------------
| 1KiB | 32B | 1KiB | 32B | 1KiB | 32B | 1KiB | 32B |
-----------------------------------------------------

This means that before raw writes can be performed, the driver will
have to manually reassemble the page (we use a private buffer for
that).

In the case of non raw writes (hardware generated ECC), the CPU just
needs to copy the OOB information to the FDM registers before
initiating the DMA transfer.

The MTK controller can generate ECC parity data for both the sector
data and the 8B FDM data.

* bad block mark position:

One particular issue with this controller is that the bad block mark
position is actually generated at some offset within the sector data
area. To work around this issue, the driver includes
mtk_nfc_switch_oob so it can initialize the BBT during probe.

Similarly, when marking a block as bad, the driver will fill the whole
page with 0x00 (it would be meaningless for this controller to write to
write the watermark to the OOB area).

Tests:
------

* UBIFS support has been validated on 512MiB device (iozone, dd)
* All drivers/mtd/tests/ pass clean.
* Speed tests:
      - eraseblock write speed		: 7673 KiB/s
      - eraseblock read speed  		: 11155 KiB/s
      - page write speed       		: 7622 KiB/s
      - page read speed	       		: 11117 KiB/s
      - 2 page write speed     		: 7647 KiB/s
      - 2 page read speed      		: 11133 KiB/s
      - erase speed 	       		: 105774 KiB/
      - 2x multi-block erase speed	: 358891 KiB/s
      - 4x multi-block erase speed	: 359878 KiB/s
      - 8x multi-block erase speed	: 359878 KiB/s
      - 16x multi-block erase speed	: 360374 KiB/s
      - 32x multi-block erase speed	: 360374 KiB/s
      - 64x multi-block erase speed	: 360374 KiB/s

Jorge Ramirez-Ortiz (3):
  mtd: mediatek: device tree docs for MTK Smart Device Gen1 NAND
  mtd: mediatek: driver for MTK Smart Device Gen1 NAND
  mtd: mediatek: device tree enable NAND in MTK's 2701 evb

 .../devicetree/bindings/mtd/mtksdg1-nand.txt       |   38 +
 arch/arm/boot/dts/mt2701-evb.dts                   |    4 +
 arch/arm/boot/dts/mt2701.dtsi                      |   12 +
 drivers/mtd/nand/Kconfig                           |    6 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/mtksdg1_nand.c                    | 1535 ++++++++++++++++++++
 drivers/mtd/nand/mtksdg1_nand_ecc.h                |   75 +
 drivers/mtd/nand/mtksdg1_nand_nfi.h                |  119 ++
 8 files changed, 1790 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
 create mode 100644 drivers/mtd/nand/mtksdg1_nand.c
 create mode 100644 drivers/mtd/nand/mtksdg1_nand_ecc.h
 create mode 100644 drivers/mtd/nand/mtksdg1_nand_nfi.h

-- 
2.1.4
