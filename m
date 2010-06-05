Message-ID: <4C0A146B.1060306@gmail.com>
Date: Sat, 05 Jun 2010 17:10:03 +0800
From: Wan ZongShun <mcuos.com@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, Eric Miao <eric.y.miao@gmail.com>
Subject: [PATCHv2 2/3] MTD/pxa: use resource_size(res) for pxa2xx-flash
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Signed-off-by: Wan ZongShun <mcuos.com@gmail.com>
Acked-by: Eric Miao <eric.y.miao@gmail.com>

---
 drivers/mtd/maps/pxa2xx-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index d8ae634..b5bb1a4 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -70,7 +70,7 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	info->map.name = (char *) flash->name;
 	info->map.bankwidth = flash->width;
 	info->map.phys = res->start;
-	info->map.size = res->end - res->start + 1;
+	info->map.size = resource_size(res);
 	info->parts = flash->parts;
 	info->nr_parts = flash->nr_parts;

-- 
1.6.3.3
