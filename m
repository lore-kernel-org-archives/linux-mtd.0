Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxyUY-00069B-40
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 16:18:07 +0000
Received: by mail-pg0-x242.google.com with SMTP id o123so318503pga.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Apr 2017 09:17:45 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: dataflash: Add flash_info for AT45DB641E
Date: Tue, 11 Apr 2017 09:17:22 -0700
Message-Id: <20170411161722.11164-2-andrew.smirnov@gmail.com>
In-Reply-To: <20170411161722.11164-1-andrew.smirnov@gmail.com>
References: <20170411161722.11164-1-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
 drivers/mtd/devices/mtd_dataflash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 9a98cdc..150901f 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -734,6 +734,9 @@ static struct flash_info dataflash_data[] = {
 
 	{ "AT45DB642x",  0x1f28000000, 8192, 1056, 11, SUP_POW2PS},
 	{ "at45db642d",  0x1f28000000, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
+
+	{ "AT45DB641E",  0x1f28000100, 32768, 264, 9, SUP_POW2PS},
+	{ "at45db641e",  0x1f28000100, 32768, 256, 8, SUP_POW2PS | IS_POW2PS},
 };
 
 static struct flash_info *jedec_lookup(struct spi_device *spi,
-- 
2.9.3
