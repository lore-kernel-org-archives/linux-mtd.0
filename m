Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctzxE-00082z-LH
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 17:03:18 +0000
From: Ludovic Barre <ludovic.Barre@st.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut
 <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/2] mtd: spi-nor: add stm32 qspi driver
Date: Fri, 31 Mar 2017 19:02:02 +0200
Message-ID: <1490979724-10905-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ludovic Barre <ludovic.barre@st.com>

This patch set adds a SPI-NOR driver for stm32 QSPI controller.
It is a specialized SPI interface for serial Flash devices.
It supports 1 or 2 Flash device with single, dual and quad SPI Flash memories.

It can operate in any of the following modes:
-indirect mode: all the operations are performed using the quadspi
  registers
-read memory-mapped mode: the external Flash memory is mapped to the
  microcontroller address space and is seen by the system as if it was
  an internal memory 

Marek, Cyrille
How do you wish process? 
If this patch set is OK for you, I agree for the merge
Cyrille, I working on rebase 
[PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories
I could send a patch for stm32 as soon as possible, like this you could add my
controller into your patchset. I would be glad to be your stm32 tester :-)

Changes in v2:
-awful construct: s/u32/u8
-add define for timeout
-Use a helper variable
-add comment on "stm32 qspi controller fsize issue"

Ludovic Barre (2):
  dt-bindings: Document the STM32 QSPI bindings
  mtd: spi-nor: add driver for STM32 quad spi flash controller

 .../devicetree/bindings/mtd/stm32-quadspi.txt      |  45 ++
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/stm32-quadspi.c                | 690 +++++++++++++++++++++
 4 files changed, 743 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c

-- 
2.7.4
