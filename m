Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJOO8-0000IG-Li
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 16:35:13 +0000
Received: by mail-wm0-x242.google.com with SMTP id f206so37784789wmf.2
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jan 2016 08:34:50 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Yang Wenyou <Wenyou.Yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH v1 0/5] mtd: atmel_nand: Add support for NAND Flash on SAMA5D2
Date: Wed, 13 Jan 2016 17:34:12 +0100
Message-Id: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
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

Applies on the Atmel Linux 4.1 branch for now, but only the dtsi file
differs from the mainline.

Compile tested for all SAMA5 chips for now, and tested on SAMA5D3xek as
there is no existing SAMA5D2 board with NAND Flash memory (yet).

RFC -> V1:
- Split the support of 32-bit ECC on SAMA5D2 in two commits
- Fix the missing ECC strength configuration code

Romain Izard (5):
  mtd: atmel_nand: Do not warn on bitflips
  mtd: atmel_nand: Support variable RB_EDGE interrupts
  mtd: atmel_nand: Support PMECC on SAMA5D2
  mtd: atmel_nand: Support 32-bit ECC strength
  ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes

 .../devicetree/bindings/mtd/atmel-nand.txt         | 12 ++-
 arch/arm/boot/dts/sama5d2.dtsi                     | 38 +++++++++
 drivers/mtd/nand/atmel_nand.c                      | 89 ++++++++++++++++++----
 drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++-
 drivers/mtd/nand/atmel_nand_nfc.h                  |  5 +-
 5 files changed, 131 insertions(+), 22 deletions(-)

-- 
2.5.0
