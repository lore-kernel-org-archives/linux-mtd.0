From: Arnd Bergmann <arnd@arndb.de>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Ludovic Barre <ludovic.barre@st.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: stm32-quadspi: avoid unintialized return code
Date: Thu, 14 Sep 2017 13:06:59 +0200
Message-Id: <20170914110709.3591691-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we send zero-length data to stm32_qspi_tx_poll() on older
compiler versions such as gcc-4.6, we get warned that the
return code is uninitialized:

drivers/mtd/spi-nor/stm32-quadspi.c:248:2: error: ‘ret’ may be used uninitialized in this function [-Werror=uninitialized]

On newer compiler versions, the return code is always zero
in this case, as the local variable gets optimized away and
is assumed to be zero after the loop completes without error.

This changes the function to instead return -EINVAL if it
ever gets called with a zero length buffer.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82203
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/spi-nor/stm32-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
index 86c0931543c5..711cfe7aa4bf 100644
--- a/drivers/mtd/spi-nor/stm32-quadspi.c
+++ b/drivers/mtd/spi-nor/stm32-quadspi.c
@@ -227,7 +227,7 @@ static int stm32_qspi_tx_poll(struct stm32_qspi *qspi,
 	void (*tx_fifo)(u8 *, void __iomem *);
 	u32 len = cmd->len, sr;
 	u8 *buf = cmd->buf;
-	int ret;
+	int ret = -EINVAL;
 
 	if (cmd->qspimode == CCR_FMODE_INDW)
 		tx_fifo = stm32_qspi_write_fifo;
-- 
2.9.0
