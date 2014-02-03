Received: from 213083164162.static.sonofon.dk ([213.83.164.162]
 helo=HORWDSPRD01.spectralink.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAKv0-0002uO-HB
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2014 14:54:40 +0000
From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, avinashphilip@ti.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd:elm: Use correct check on return value of
 pm_runtime_get_sync
Date: Mon,  3 Feb 2014 15:54:09 +0100
Message-Id: <1391439249-23078-1-git-send-email-stefan.sorensen@spectralink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ELM driver incorrectly reagard any non-zero return value from
pm_runtime_get_sync as an error, but it may return 1 if the device
was already active. Fix to only error when return value is negative.

Signed-off-by: Stefan Sørensen <stefan.sorensen@spectralink.com>
---
 drivers/mtd/devices/elm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index d1dd6a3..e2c073c 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -380,7 +380,7 @@ static int elm_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(&pdev->dev);
-	if (pm_runtime_get_sync(&pdev->dev)) {
+	if (pm_runtime_get_sync(&pdev->dev) < 0) {
 		ret = -EINVAL;
 		pm_runtime_disable(&pdev->dev);
 		dev_err(&pdev->dev, "can't enable clock\n");
-- 
1.8.5.3
