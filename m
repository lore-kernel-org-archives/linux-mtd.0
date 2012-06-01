From: Josh Wu <josh.wu@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
Subject: [PATCH v10 0/3] MTD: at91: Add PMECC support for at91 nand flash
 driver
Date: Fri,  1 Jun 2012 18:13:11 +0800
Message-Id: <1338545594-18483-1-git-send-email-josh.wu@atmel.com>
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, ivan.djelic@parrot.com,
 plagnioj@jcrosoft.com, Josh Wu <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Code is based on 3.4-rc2

Changes since v9,
	use jiffies for timeout test to read PMECC status register.
	modified according to J.C and Artem's comments.
	add rom lookup table offset as DT variables.
	refine coding style and error handling.

Changes since v8,
	use _relaxed read/write in most place. use writel in operations of Control Register since it needs memory barrier.
	allocate the data for PMECC computation.
	add pmecc prefix for related variable/functions.
	modify code according to J.C's suggestion. except:

Josh Wu (3):
  moves hw ecc initialization code to one function.
  add DT support for PMECC parameters.
  update driver to support Programmable Multibit ECC controller.

 .../devicetree/bindings/mtd/atmel-nand.txt         |    9 +
 drivers/mtd/nand/atmel_nand.c                      |  914 ++++++++++++++++++--
 drivers/mtd/nand/atmel_nand_ecc.h                  |  114 ++-
 3 files changed, 974 insertions(+), 63 deletions(-)

-- 
1.7.10
