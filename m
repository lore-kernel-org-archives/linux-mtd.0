Received: from mail-pd0-f176.google.com ([209.85.192.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5WCv-0004dA-Gg
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 07:57:13 +0000
Received: by mail-pd0-f176.google.com with SMTP id w10so2586339pde.21
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 23:56:42 -0800 (PST)
Message-ID: <1390290994.21488.1.camel@phoenix>
Subject: [PATCH] mtd: m25p80.c: Use positive logic to check JEDEC id
From: Axel Lin <axel.lin@ingics.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
Date: Tue, 21 Jan 2014 15:56:34 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For slightly better readability.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/mtd/devices/m25p80.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d0f6475..3f7955f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -1061,9 +1061,8 @@ static const struct spi_device_id *jedec_probe(struct spi_device *spi)
 	for (tmp = 0; tmp < ARRAY_SIZE(m25p_ids) - 1; tmp++) {
 		info = (void *)m25p_ids[tmp].driver_data;
 		if (info->jedec_id == jedec) {
-			if (info->ext_id != 0 && info->ext_id != ext_jedec)
-				continue;
-			return &m25p_ids[tmp];
+			if (info->ext_id == 0 || info->ext_id == ext_jedec)
+				return &m25p_ids[tmp];
 		}
 	}
 	dev_err(&spi->dev, "unrecognized JEDEC id %06x\n", jedec);
-- 
1.8.1.2
