From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Josh Wu <josh.wu@atmel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Andrew Victor <linux@maxim.org.za>
Subject: [PATCH 0/4] mtd: nand: atmel: Rework DT representation of NFC/NAND
Date: Thu,  4 Dec 2014 23:30:10 +0100
Message-Id: <1417732214-3292-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

While working on the EBI driver [1] I noticed that the relationship between
the NFC (NAND Flash Controller) and the NAND chip it is attached to would
make things harder to represent when moving the NAND node under the EBI bus
(another useless 'ranges' definition).

Actually this representation might be even more problematic if one wants
decide to connect two NAND chips on his sama5 based board, because the NFC
node is a child of the NAND chip node, and thus can only be attached to a
single NAND chip.

To address this problem the current series moves the NFC node outside of
the NAND chip device which then reference the NFC using the "atmel,nfc"
property.

The series does not implement multi-chip support, but at least the new
representation should make it possible.

Best Regards,

Boris

[1]https://lkml.org/lkml/2014/12/3/806

Boris Brezillon (4):
  mtd: nand: atmel: Rework driver to separate nfc and nand nodes
  mtd: nand: atmel: Update DT documentation after splitting NFC and NAND
  ARM: at91/dt: sama5: move NFC nodes outside of NAND nodes
  ARM: at91/dt: sama5: move NAND nodes into board dts/dtsi

 .../devicetree/bindings/mtd/atmel-nand.txt         | 46 +++++++------
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        | 18 ++++-
 arch/arm/boot/dts/at91-sama5d4ek.dts               | 16 ++++-
 arch/arm/boot/dts/sama5d3.dtsi                     | 36 ++--------
 arch/arm/boot/dts/sama5d3xcm.dtsi                  | 18 ++++-
 arch/arm/boot/dts/sama5d4.dtsi                     | 36 ++--------
 drivers/mtd/nand/atmel_nand.c                      | 76 +++++++++++++++++-----
 7 files changed, 149 insertions(+), 97 deletions(-)

-- 
1.9.1
