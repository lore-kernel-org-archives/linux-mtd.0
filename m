From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: [PATCH 0/2] atmel_nand: remove cpu_is_xxx() in nand driver
Date: Thu, 9 May 2013 15:34:53 +0800
Message-ID: <1368084895-18266-1-git-send-email-josh.wu@atmel.com>
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

avoid to use cpu_is_xxx() macro in driver, we use platform data and dts
for the different cpu.

Josh Wu (2):
  atmel_nand: at91/avr32/: Replace cpu_is_at32ap7000() with a nand
    platform data
  mtd: atmel_nand: add a new dt binding item for nand dma support

 .../devicetree/bindings/mtd/atmel-nand.txt         |    1 +
 arch/avr32/mach-at32ap/at32ap700x.c                |    3 +++
 drivers/mtd/nand/atmel_nand.c                      |   24 ++++++++------------
 include/linux/platform_data/atmel.h                |    4 ++++
 4 files changed, 17 insertions(+), 15 deletions(-)

-- 
1.7.9.5
