Received: from mail-pa0-f54.google.com ([209.85.220.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTTUy-0007x8-8l
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 09:22:36 +0000
Received: by mail-pa0-f54.google.com with SMTP id kx10so8592007pab.41
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 02:22:13 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: sst25l: Remove redundant spi_set_drvdata
Date: Tue,  8 Oct 2013 14:51:33 +0530
Message-Id: <1381224094-14098-1-git-send-email-sachin.kamat@linaro.org>
Cc: computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com,
 andre@bluewatersys.com, dwmw2@infradead.org, sachin.kamat@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Driver core will set the driver data to NULL upon detach
or probe failure.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/devices/sst25l.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index a42f1f0..7cc70db 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -404,7 +404,6 @@ static int sst25l_probe(struct spi_device *spi)
 					data ? data->nr_parts : 0);
 	if (ret) {
 		kfree(flash);
-		spi_set_drvdata(spi, NULL);
 		return -ENODEV;
 	}
 
-- 
1.7.9.5
