Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0rST-0003L1-9C
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 15:23:56 +0000
Received: by mail-io0-x242.google.com with SMTP id d203so4372400iof.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 08:23:32 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] mtd: dataflash: Get rid of loop counter in
 jedec_probe()
Date: Wed, 19 Apr 2017 08:23:03 -0700
Message-Id: <20170419152305.17226-4-andrew.smirnov@gmail.com>
In-Reply-To: <20170419152305.17226-1-andrew.smirnov@gmail.com>
References: <20170419152305.17226-1-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"For" loop in jedec_probe can be simplified to not need counter
'i'. Convert the code and get rid of the variable.

Cc: cphealy@gmail.com
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Not present in v2, v1.

 drivers/mtd/devices/mtd_dataflash.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index ccd1e02..2d3e403 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -736,7 +736,7 @@ static struct flash_info dataflash_data[] = {
 
 static struct flash_info *jedec_probe(struct spi_device *spi)
 {
-	int ret, i;
+	int ret;
 	u8 code = OP_READ_ID;
 	u8 id[3];
 	u32 jedec;
@@ -767,9 +767,9 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
 	jedec = jedec << 8;
 	jedec |= id[2];
 
-	for (i = 0, info = dataflash_data;
-			i < ARRAY_SIZE(dataflash_data);
-			i++, info++) {
+	for (info = dataflash_data;
+	     info < dataflash_data + ARRAY_SIZE(dataflash_data);
+	     info++) {
 		if (info->jedec_id == jedec) {
 			dev_dbg(&spi->dev, "OTP, sector protect%s\n",
 				(info->flags & SUP_POW2PS) ?
-- 
2.9.3
