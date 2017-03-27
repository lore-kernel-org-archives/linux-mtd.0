Received: from mail-wr0-f193.google.com ([209.85.128.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csX9g-0002uW-VO
 for linux-mtd@lists.infradead.org; Mon, 27 Mar 2017 16:06:37 +0000
Received: by mail-wr0-f193.google.com with SMTP id w43so11729460wrb.1
 for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2017 09:05:43 -0700 (PDT)
From: Jan Glauber <jglauber@cavium.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org,
	Jan Glauber <jglauber@cavium.com>
Subject: [RFC PATCH 0/2] Cavium NAND flash driver
Date: Mon, 27 Mar 2017 18:05:22 +0200
Message-Id: <20170327160524.29019-1-jglauber@cavium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series adds a driver for the nand flash controller as found on Cavium's
ARM64 SOCs. For details about the controller see description of patch #2.

The nand flash chip on the board I used for testing is:

[   12.775877] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
[   12.782242] nand: Macronix MX30LF1GE8AB
[   12.786072] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64

This chip has internal on-die ECC (which cannot be disabled). Data
sheet can be found here:
http://www.macronix.com/en-us/products/NAND-Flash/SLC-NAND-Flash/Pages/spec.aspx?p=MX30LF1GE8AB

I've tested with ecc-mode="none" but will use the new ecc-mode "on-die" when
it is available (already described it in DTS).

Passed tests:
- mtd-utils nandtest
- mtd kernel test modules (minus oob writetest)
- ubifs works :)

Known issues:
- OOB write is broken (read works)
- only one nand chip is supported currently
- 16 bit bus support probably broken

Feedback welcome!

thanks,
Jan

---

Jan Glauber (2):
  dt-bindings: mtd: Add Cavium SOCs NAND bindings
  nand: cavium: Nand flash controller for Cavium ARM64 SOCs

 .../devicetree/bindings/mtd/cavium_nand.txt        |   32 +
 drivers/mtd/nand/Kconfig                           |    6 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/cavium_nand.c                     | 1160 ++++++++++++++++++++
 drivers/mtd/nand/cavium_nand.h                     |  231 ++++
 5 files changed, 1430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cavium_nand.txt
 create mode 100644 drivers/mtd/nand/cavium_nand.c
 create mode 100644 drivers/mtd/nand/cavium_nand.h

-- 
2.9.0.rc0.21.g7777322
