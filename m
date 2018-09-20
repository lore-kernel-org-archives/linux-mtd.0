Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g34b4-0005ea-IE
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 19:26:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Applied "spi: spi-mem: Add missing description for data.nbytes field"
 to the spi tree
In-Reply-To: <20180920073112.7897-2-boris.brezillon@bootlin.com>
Message-Id: <20180920192626.2868D440078@finisterre.ee.mobilebroadband>
Date: Thu, 20 Sep 2018 20:26:26 +0100 (BST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch

   spi: spi-mem: Add missing description for data.nbytes field

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 60489f085574157c343fc62a32f997fe7346a659 Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Thu, 20 Sep 2018 09:31:10 +0200
Subject: [PATCH] spi: spi-mem: Add missing description for data.nbytes field

Add a description for spi_mem_op.data.nbytes to the kerneldoc header.

Fixes: c36ff266dc82 ("spi: Extend the core to ease integration of SPI memory controllers")
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/spi/spi-mem.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 62722fb7472d..0cfbb1ad8d96 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -79,6 +79,8 @@ enum spi_mem_data_dir {
  * @dummy.buswidth: number of IO lanes used to transmit the dummy bytes
  * @data.buswidth: number of IO lanes used to send/receive the data
  * @data.dir: direction of the transfer
+ * @data.nbytes: number of data bytes to send/receive. Can be zero if the
+ *		 operation does not involve transferring data
  * @data.buf.in: input buffer
  * @data.buf.out: output buffer
  */
-- 
2.19.0
