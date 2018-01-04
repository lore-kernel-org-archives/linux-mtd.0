Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eX1VH-0005vJ-GI
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 09:08:01 +0000
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] spi-nor: intel-spi: Prefer WREN over other write enables
Date: Thu,  4 Jan 2018 12:07:42 +0300
Message-Id: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On many older systems using SW sequencer the PREOP_OPTYPE register
contains two preopcodes as following:

  PREOP_OPTYPE=0xf2785006

The last two bytes are the opcodes decoded to:

  0x50 - Write enable for volatile status register
  0x06 - Write enable

The former is used to modify volatile bits in the status register. For
non-volatile bits the latter is needed. Preopcodes are used in SW
sequencer to send one command "atomically" without anything else
interfering the transfer. The sequence that gets executed is:

  - Send preopcode (write enable) from PREOP_OPTYPE register
  - Send the actual SPI command
  - Poll busy bit in the status register (0x05, RDSR)

Commit 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be
programmed by BIOS") enabled atomic sequence handling but because both
preopcodes are programmed, the following happens:

  if (preop >> 8)
  	val |= SSFSTS_CTL_SPOP;

Since on these systems preop >> 8 == 0x50 we end up picking volatile
write enable instead. Because of this the actual write command is pretty
much NOP unless there is a WREN latched in the chip already.

Fix this by preferring WREN over other write enable preopcodes.

Fixes: 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/intel-spi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index ef034d898a23..bba762aa0c8d 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -498,9 +498,17 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len,
 	val |= SSFSTS_CTL_SCGO;
 	preop = readw(ispi->sregs + PREOP_OPTYPE);
 	if (preop) {
-		val |= SSFSTS_CTL_ACS;
-		if (preop >> 8)
-			val |= SSFSTS_CTL_SPOP;
+		switch (optype) {
+		case OPTYPE_WRITE_NO_ADDR:
+		case OPTYPE_WRITE_WITH_ADDR:
+			/*
+			 * For writes prefer WREN over other write enable
+			 * opcodes.
+			 */
+			val |= SSFSTS_CTL_ACS;
+			if ((preop >> 8) == SPINOR_OP_WREN)
+				val |= SSFSTS_CTL_SPOP;
+		}
 	}
 	writel(val, ispi->sregs + SSFSTS_CTL);
 
-- 
2.15.1
