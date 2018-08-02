Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flD80-0006nq-OM
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2018 12:54:55 +0000
From: Frieder Schrempf <frieder.schrempf@exceet.de>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at,
 broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Cc: cyrille.pitchen@wedev4u.fr, frieder.schrempf@exceet.de, pp@emlix.com,
 Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] spi: spi-mem: Fix a typo in the documentation of
 struct spi_mem
Date: Thu,  2 Aug 2018 14:53:52 +0200
Message-Id: <1533214434-28761-2-git-send-email-frieder.schrempf@exceet.de>
In-Reply-To: <1533214434-28761-1-git-send-email-frieder.schrempf@exceet.de>
References: <1533214434-28761-1-git-send-email-frieder.schrempf@exceet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
---
 include/linux/spi/spi-mem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 4fa34a2..72cc9bc 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -124,7 +124,7 @@ struct spi_mem_op {
 /**
  * struct spi_mem - describes a SPI memory device
  * @spi: the underlying SPI device
- * @drvpriv: spi_mem_drviver private data
+ * @drvpriv: spi_mem_driver private data
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
-- 
2.7.4
