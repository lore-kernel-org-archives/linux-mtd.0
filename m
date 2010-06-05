Message-ID: <4C09F359.1000100@gmail.com>
Date: Sat, 05 Jun 2010 14:48:57 +0800
From: Wan ZongShun <mcuos.com@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, eric.y.miao@gmail.com,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] MTD/pxa: use resource_size(res) for pxa2xx-flash
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The size calculation is end - start + 1. But,sometimes, the '1' can
be forgotten carelessly, witch will have potential risk, so use resource_size
should be good habit.

Signed-off-by :Wan ZongShun <mcuos.com@gmail.com>

---
 drivers/mtd/maps/pxa2xx-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 43f8bb8..6ed9a2d 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -79,7 +79,7 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	info->map.name = (char *) flash->name;
 	info->map.bankwidth = flash->width;
 	info->map.phys = res->start;
-	info->map.size = res->end - res->start + 1;
+	info->map.size = resource_size(res);
 	info->parts = flash->parts;
 	info->nr_parts = flash->nr_parts;

-- 
1.6.3.3
