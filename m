Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1bSj-0005S0-2m
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 16:31:15 +0000
Received: by mail-yb0-x244.google.com with SMTP id l192so5505635ybl.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Apr 2017 09:30:54 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] mtd: dataflash: Add flash_info for AT45DB641E
Date: Fri, 21 Apr 2017 09:30:26 -0700
Message-Id: <20170421163026.24884-6-andrew.smirnov@gmail.com>
In-Reply-To: <20170421163026.24884-1-andrew.smirnov@gmail.com>
References: <20170421163026.24884-1-andrew.smirnov@gmail.com>
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
Acked-by: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since [v4]:

	- Collected Acked-by from Marek

Changes since [v3]:

	- Update the patch ot use SUP_EXTID

No changes between v3 to v1.

[v3] http://lkml.kernel.org/r/20170419152305.17226-6-andrew.smirnov@gmail.com
[v4] http://lkml.kernel.org/r/20170420162952.5181-6-andrew.smirnov@gmail.com

 drivers/mtd/devices/mtd_dataflash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 3f1a0fb..5dc8bd0 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -736,6 +736,9 @@ static struct flash_info dataflash_data[] = {
 
 	{ "AT45DB642x",  0x1f2800, 8192, 1056, 11, SUP_POW2PS},
 	{ "at45db642d",  0x1f2800, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
+
+	{ "AT45DB641E",  0x1f28000100, 32768, 264, 9, SUP_EXTID | SUP_POW2PS},
+	{ "at45db641e",  0x1f28000100, 32768, 256, 8, SUP_EXTID | SUP_POW2PS | IS_POW2PS},
 };
 
 static struct flash_info *jedec_lookup(struct spi_device *spi,
-- 
2.9.3
