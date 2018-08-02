Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::8])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flD81-0006o2-C8
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2018 12:54:55 +0000
From: Frieder Schrempf <frieder.schrempf@exceet.de>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at,
 broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Cc: cyrille.pitchen@wedev4u.fr, frieder.schrempf@exceet.de, pp@emlix.com,
 Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] mtd: m25p80: Call spi_mem_get_name() to let controller
 set a custom name
Date: Thu,  2 Aug 2018 14:53:54 +0200
Message-Id: <1533214434-28761-4-git-send-email-frieder.schrempf@exceet.de>
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

By calling spi_mem_get_name(), the driver of the (Q)SPI controller can
set a custom name for the memory device if necessary.
This is useful to keep mtdparts compatible when controller drivers are
ported from the MTD to the SPI layer.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
---
 drivers/mtd/devices/m25p80.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index e84563d..aac48800 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -202,6 +202,9 @@ static int m25p_probe(struct spi_mem *spimem)
 	if (data && data->name)
 		nor->mtd.name = data->name;
 
+	if (!nor->mtd.name)
+		nor->mtd.name = spi_mem_get_name(spimem);
+
 	/* For some (historical?) reason many platforms provide two different
 	 * names in flash_platform_data: "name" and "type". Quite often name is
 	 * set to "m25p80" and then "type" provides a real chip name.
-- 
2.7.4
