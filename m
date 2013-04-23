From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: [PATCH 0/4] mtd: atmel_nand: enable Nand Flash Controller (NFC)
 support
Date: Tue, 23 Apr 2013 18:29:53 +0800
Message-ID: <1366712997-17639-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com, Josh Wu <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series enable NFC support for SAMA5 soc. It can send command,
address cycles automaticly. Also when enable NFC sram, NFC will transfer
data to sram. Which can save lots of cpu time.

Josh Wu (4):
  mtd: atmel_nand: replace pmecc enable code with one function.
  mtd: atmel_nand: add Nand Flash Controller (NFC) support
  mtd: atmel_nand: enable Nand Flash Controller (NFC) read data
    via sram
  mtd: atmel_nand: enable Nand Flash Controller (NFC) write via
    sram

 .../devicetree/bindings/mtd/atmel-nand.txt         |    4 +
 drivers/mtd/nand/atmel_nand.c                      |  658 ++++++++++++++++++--
 drivers/mtd/nand/atmel_nand_ecc.h                  |    7 +-
 drivers/mtd/nand/atmel_nand_nfc.h                  |  106 ++++
 4 files changed, 725 insertions(+), 50 deletions(-)
 create mode 100644 drivers/mtd/nand/atmel_nand_nfc.h

-- 
1.7.9.5
