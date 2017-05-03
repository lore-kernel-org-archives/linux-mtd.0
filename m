From: Nicholas Mc Guire <der.herr@hofr.at>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Ludovic Barre <ludovic.barre@st.com>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <der.herr@hofr.at>
Subject: [RFC PATCH] mtd: spi-nor: handle signal case as failure
Date: Wed,  3 May 2017 11:53:09 +0200
Message-Id: <1493805189-25327-1-git-send-email-der.herr@hofr.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 The problem is that stm32_qspi_wait_cmd() will indicate success in case of
 being interrupted. The if condition is incomplete here as
 wait_for_copletion_interruptible_timeout can return -ERESTARTSYS but this
 is not handled by if(!wait_for_completion_interruptible_timeout()).
 While somewhat unlikely it probably would be hard to figure out what went
 wrong if the signal case does occur.

Fixes: commit 0d43d7ab277a ("mtd: spi-nor: add driver for STM32 quad spi flash controller")
Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
Problem found by experimental coccinelle script

Its not clear if its sufficient to simply treat this case as failure or
if it might need some debug output to allow differentiation of signal
and timeout case. 

Patch was compile tested with: stm32_defconfig +CONFIG_MTD=y, CONFIG_MTD_SPI_NOR=y,
CONFIG_SPI_STM32_QUADSPI=m

Patch is against v4.11-rc8 (localversion-next is next-20170503)

 drivers/mtd/spi-nor/stm32-quadspi.c  | 10 ++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
index 1056e74..27147ad 100644
--- a/drivers/mtd/spi-nor/stm32-quadspi.c
+++ b/drivers/mtd/spi-nor/stm32-quadspi.c
@@ -159,6 +159,7 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi)
 {
 	u32 cr;
 	int err = 0;
+	long timeout = 0;
 
 	if (readl_relaxed(qspi->io_base + QUADSPI_SR) & SR_TCF)
 		return 0;
@@ -167,8 +168,13 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi)
 	cr = readl_relaxed(qspi->io_base + QUADSPI_CR);
 	writel_relaxed(cr | CR_TCIE, qspi->io_base + QUADSPI_CR);
 
-	if (!wait_for_completion_interruptible_timeout(&qspi->cmd_completion,
-						       msecs_to_jiffies(1000)))
+	timeout = wait_for_completion_interruptible_timeout(
+				&qspi->cmd_completion, msecs_to_jiffies(1000));
+
+	/* since the calling side only cares about success of failure
+	 * returning -ETIMEDOUT even when interrupted should be ok here
+	 */
+	if (timeout == 0 || timeout == -ERESTARTSYS)
 		err = -ETIMEDOUT;
 
 	writel_relaxed(cr, qspi->io_base + QUADSPI_CR);
-- 
2.1.4
