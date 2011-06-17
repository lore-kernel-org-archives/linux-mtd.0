Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXWsv-0004hE-Jf
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 11:06:46 +0000
Received: by iyb39 with SMTP id 39so2397388iyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Jun 2011 04:06:42 -0700 (PDT)
Subject: [PATCH] mtd: onenand: remove redundant mtd_device_unregister
	before onenand_release
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Jun 2011 19:06:33 +0800
Message-ID: <1308308793.2628.0.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

onenand_release() will call mtd_device_unregister(), thus remove the redundant
mtd_device_unregister() call before onenand_release().

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/onenand/generic.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 8152a31..7813095 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -97,7 +97,6 @@ static int __devexit generic_onenand_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 
 	if (info) {
-		mtd_device_unregister(&info->mtd);
 		onenand_release(&info->mtd);
 		release_mem_region(res->start, size);
 		iounmap(info->onenand.base);
-- 
1.7.4.1
