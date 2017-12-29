From: Vignesh R <vigneshr@ti.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut
 <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <matthew.gerlach@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Vignesh R <vigneshr@ti.com>
Subject: [PATCH v2 0/2] CQSPI: Add direct mode support
Date: Fri, 29 Dec 2017 14:41:01 +0530
Message-ID: <20171229091103.14436-1-vigneshr@ti.com>
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

This patch series enables use Direct access controller on Cadence QSPI
which helps in accessing QSPI flash in memory mapped mode.

On TI platforms, this mode has higher throughput compared to indirect
access mode.

Tested on TI's 66AK2G GP EVM.

It would be great if this patch series could be tested SoCFPGA as well.
Although, this patch should have no effect on non TI platforms as driver
continues to use indirect mode when direct access memory window is less
than size of connected flash.


Vignesh R (2):
  mtd: spi-nor: cadence-quadspi: Refactor indirect read/write sequence.
  mtd: spi-nor: cadence-quadspi: Add support for direct access mode

 drivers/mtd/spi-nor/cadence-quadspi.c | 54 +++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 15 deletions(-)

-- 
2.15.1
