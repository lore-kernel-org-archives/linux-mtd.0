Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6xYW-0007DF-A1
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 12:44:10 +0000
Received: by mail-ed1-x541.google.com with SMTP id n2-v6so3976368edo.9
 for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2018 05:43:57 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v4 2/8] mtd: maps: gpio-addr-flash: Fix ioremapped size
Date: Mon,  1 Oct 2018 14:43:45 +0200
Message-Id: <20181001124351.31615-2-ricardo.ribalda@gmail.com>
In-Reply-To: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
References: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We should only iomap the area of the chip that is memory mapped.
Otherwise we could be mapping devices beyond the memory space or that
belong to other devices.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Fixes: ebd71e3a4861 ("mtd: maps: gpio-addr-flash: fix warnings and make more portable")
Cc: <stable@vger.kernel.org>
---
 drivers/mtd/maps/gpio-addr-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 17be47f72973..6de16e81994c 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -234,7 +234,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.copy_to    = gf_copy_to;
 	state->map.bankwidth  = pdata->width;
 	state->map.size       = state->win_size * (1 << state->gpio_count);
-	state->map.virt       = ioremap_nocache(memory->start, state->map.size);
+	state->map.virt       = ioremap_nocache(memory->start, state->win_size);
 	if (!state->map.virt)
 		return -ENOMEM;
 
-- 
2.19.0
