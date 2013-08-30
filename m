Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFLkQ-0001kX-9A
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 10:16:11 +0000
Received: by mail-pa0-f53.google.com with SMTP id lb1so2137940pab.26
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 03:15:48 -0700 (PDT)
From: wangyuhang <wangyuhang2014@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com
Subject: [PATCH V2 2/2] spi: dual and quad support(miss "return")
Date: Fri, 30 Aug 2013 18:14:36 +0800
Message-Id: <1377857676-6986-1-git-send-email-wangyuhang2014@gmail.com>
Cc: wangyuhang <wangyuhang2014@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Miss return in patch:
commit id:f477b7fb13df2b843997559ff34e87d054ba6538

Delete a "return" when commit the patch to a new kernel version
 by mistake. So recover it.

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 drivers/spi/spi.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 6653913..10584ee 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1466,6 +1466,7 @@ static int __spi_async(struct spi_device *spi, struct spi_message *message)
 			return -EINVAL;
 		if (xfer->speed_hz && master->max_speed_hz &&
 		    xfer->speed_hz > master->max_speed_hz)
+			return -EINVAL;
 
 		if (xfer->tx_buf && !xfer->tx_nbits)
 			xfer->tx_nbits = SPI_NBITS_SINGLE;
-- 
1.7.9.5
