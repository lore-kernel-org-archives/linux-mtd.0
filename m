Received: from mail-pf0-f194.google.com ([209.85.192.194])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bXDq9-0000WF-Vh
 for linux-mtd@lists.infradead.org; Tue, 09 Aug 2016 20:41:34 +0000
Received: by mail-pf0-f194.google.com with SMTP id g202so1446218pfb.1
 for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2016 13:41:13 -0700 (PDT)
From: Jagan Teki <jteki@openedev.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Jagan Teki <jteki@openedev.com>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/6] mtd: m25p80: Use spi-nor quad page program
Date: Wed, 10 Aug 2016 02:10:21 +0530
Message-Id: <1470775225-19787-2-git-send-email-jteki@openedev.com>
In-Reply-To: <1470775225-19787-1-git-send-email-jteki@openedev.com>
References: <1470775225-19787-1-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Identify the 4-wire tx transfer from spi controller mode
value and then assign QPP support to nor->flags to make use
of that.

Cc: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Jagan Teki <jteki@openedev.com>
---
 drivers/mtd/devices/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd..1033595 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -224,6 +224,8 @@ static int m25p_probe(struct spi_device *spi)
 		mode = SPI_NOR_QUAD;
 	else if (spi->mode & SPI_RX_DUAL)
 		mode = SPI_NOR_DUAL;
+	else if (spi->mode & SPI_TX_QUAD)
+		nor->flags = SNOR_F_USE_QPP;
 
 	if (data && data->name)
 		nor->mtd.name = data->name;
-- 
2.7.4
