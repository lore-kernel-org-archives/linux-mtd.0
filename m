Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2tQy-0004TO-Vz
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 07:31:39 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] spi: spi-mem: Minor fixes/improvements
Date: Thu, 20 Sep 2018 09:31:09 +0200
Message-Id: <20180920073112.7897-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Mark,

Here is a patchset which, IMO, is improving spi-mem support. The first
2 patches are fixing/improving the kerneldoc header associated to the
spi_mem_op struct, and the last one is adding checks on the spi_mem_op
object passed to spi_mem_{exec,supports}_op().

Regards,

Boris

Boris Brezillon (3):
  spi: spi-mem: Add missing description for data.nbytes field
  spi: spi-mem: Move the DMA-able constraint doc to the kerneldoc header
  spi: spi-mem: Add extra sanity checks on the op param

 drivers/spi/spi-mem.c       | 54 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/spi/spi-mem.h |  7 +++---
 2 files changed, 52 insertions(+), 9 deletions(-)

-- 
2.14.1
