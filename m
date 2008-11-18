Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2L3v-0006iz-No
	for linux-mtd@lists.infradead.org; Tue, 18 Nov 2008 07:31:52 +0000
From: Bryan Wu <cooloney@kernel.org>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd/maps: blackfin async flash maps - fix bug: dont leak
	resources when initializing in case of errors
Date: Tue, 18 Nov 2008 15:33:16 +0800
Message-Id: <1226993597-31998-2-git-send-email-cooloney@kernel.org>
In-Reply-To: <1226993597-31998-1-git-send-email-cooloney@kernel.org>
References: <1226993597-31998-1-git-send-email-cooloney@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>, linux-kernel@vger.kernel.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/maps/bfin-async-flash.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 6fec86a..576611f 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -152,14 +152,18 @@ static int __devinit bfin_flash_probe(struct platform_device *pdev)
 
 	if (gpio_request(state->enet_flash_pin, DRIVER_NAME)) {
 		pr_devinit(KERN_ERR DRIVER_NAME ": Failed to request gpio %d\n", state->enet_flash_pin);
+		kfree(state);
 		return -EBUSY;
 	}
 	gpio_direction_output(state->enet_flash_pin, 1);
 
 	pr_devinit(KERN_NOTICE DRIVER_NAME ": probing %d-bit flash bus\n", state->map.bankwidth * 8);
 	state->mtd = do_map_probe(memory->name, &state->map);
-	if (!state->mtd)
+	if (!state->mtd) {
+		gpio_free(state->enet_flash_pin);
+		kfree(state);
 		return -ENXIO;
+	}
 
 #ifdef CONFIG_MTD_PARTITIONS
 	ret = parse_mtd_partitions(state->mtd, part_probe_types, &pdata->parts, 0);
-- 
1.5.6.3
