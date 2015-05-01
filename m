From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/3] mtd: samsung: Constify platform_device_id
Date: Sat,  2 May 2015 00:50:03 +0900
Message-Id: <1430495403-31560-3-git-send-email-k.kozlowski.k@gmail.com>
In-Reply-To: <1430495403-31560-1-git-send-email-k.kozlowski.k@gmail.com>
References: <1430495403-31560-1-git-send-email-k.kozlowski.k@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/mtd/onenand/samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 19cfb97adbc0..739259513055 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -1083,7 +1083,7 @@ static const struct dev_pm_ops s3c_pm_ops = {
 	.resume		= s3c_pm_ops_resume,
 };
 
-static struct platform_device_id s3c_onenand_driver_ids[] = {
+static const struct platform_device_id s3c_onenand_driver_ids[] = {
 	{
 		.name		= "s3c6400-onenand",
 		.driver_data	= TYPE_S3C6400,
-- 
2.1.4
