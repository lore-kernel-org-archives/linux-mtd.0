Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aTRW5-0004N5-LD
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2016 09:57:01 +0000
Received: by mail-wm0-x243.google.com with SMTP id g62so3083149wme.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2016 01:56:36 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>
Cc: Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Rob Herring <robh@kernel.org>, Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH v4 0/5] mtd: atmel_nand: Add support for NAND Flash on SAMA5D2
Date: Wed, 10 Feb 2016 10:56:22 +0100
Message-Id: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND Flash controller for SAMA5D2 has small differences that make it
impossible to use the existing driver for SAMA5D3. This patchset uses the
device tree's compatible string to get those differences, and the code is
slightly modified to handle them.

Based on linux-mtd-next, commit ed4eeba7338bb123090f1c8b208f64d8184a896d

See revision 2 to apply on the Atmel Linux 4.1 branch.

Compile tested for sama5_defconfig, and tested on SAMA5D3xek as there is no
existing SAMA5D2 board with NAND Flash memory (yet).

V4:
- Collect Tested-by and Reviewed-By tags

V3:
- Rebase on linux-mtd-next
- Skip patches already in the tree

V2:
- Rebase on v4.4
- Use of_device_get_match_data
- Split message cleanup
- Reword a small part of the atmel_nand device tree binding
- Use 'caps' for all private data structures

V1:
- Split the support of 32-bit ECC on SAMA5D2 in two commits
- Fix the missing ECC strength configuration code

RFC:
- First version

Romain Izard (5):
  mtd: atmel_nand: Support variable RB_EDGE interrupts
  dt-bindings: atmel_nand: Reword the documentation
  mtd: atmel_nand: Support PMECC on SAMA5D2
  mtd: atmel_nand: Support 32-bit ECC strength
  ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes

 .../devicetree/bindings/mtd/atmel-nand.txt         | 31 +++++----
 arch/arm/boot/dts/sama5d2.dtsi                     | 38 +++++++++++
 drivers/mtd/nand/atmel_nand.c                      | 77 ++++++++++++++++++----
 drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++-
 drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
 5 files changed, 131 insertions(+), 27 deletions(-)

-- 
2.5.0
