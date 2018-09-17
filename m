Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1vo0-0004zY-AZ
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 15:51:22 +0000
From: <christophe.kerello@st.com>
To: <boris.brezillon@bootlin.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>
Subject: [PATCH 0/3] mtd: rawnand: add STM32 FMC2 NAND flash controller driver
Date: Mon, 17 Sep 2018 17:47:37 +0200
Message-ID: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
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

From: Christophe Kerello <christophe.kerello@st.com>

This patchset adds the support for the STMicroelectronics FMC2 NAND flash
controller found on STM32MP SOCs.

This patchset supports:
  - the command sequencer feature, a hardware accelerator for read/write
    within a page
  - the manual mode feature, useful for debug purpose
  - a maximum 8k page size
  - following ECC strength and step size
	- nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8)
	- nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
	- nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Extended ecc
	  based on HAMMING)
    
This patchset has been tested on Micron MT29F8G08ABACAH4 (8-bit SLC NAND)
and MT29F8G16ABACAH4 (16-bit SLC NAND)

Christophe Kerello (3):
  dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND controller
    documentation
  mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver
  mtd: rawnand: stm32_fmc2: add manual mode

 .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    |   90 +
 drivers/mtd/nand/raw/Kconfig                       |    9 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             | 1980 ++++++++++++++++++++
 4 files changed, 2080 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
 create mode 100644 drivers/mtd/nand/raw/stm32_fmc2_nand.c

-- 
1.9.1
