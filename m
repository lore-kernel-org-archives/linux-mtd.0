Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXU8B-0002X2-Iz
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 08:10:20 +0000
Received: by iyb39 with SMTP id 39so2281553iyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Jun 2011 01:10:17 -0700 (PDT)
Subject: [PATCH 1/2] mtd: onenand/omap2.c: fix build error
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Jun 2011 16:09:36 +0800
Message-ID: <1308298176.13535.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
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

Fix below build error:
  CC      drivers/mtd/onenand/omap2.o
drivers/mtd/onenand/omap2.c: In function 'omap2_onenand_probe':
drivers/mtd/onenand/omap2.c:754: error: 'info' undeclared (first use in this function)
drivers/mtd/onenand/omap2.c:754: error: (Each undeclared identifier is reported only once
drivers/mtd/onenand/omap2.c:754: error: for each function it appears in.)
make[3]: *** [drivers/mtd/onenand/omap2.o] Error 1
make[2]: *** [drivers/mtd/onenand] Error 2
make[1]: *** [drivers/mtd] Error 2
make: *** [drivers] Error 2

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/onenand/omap2.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index eb9cbd9..06efa14 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -751,7 +751,7 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_regulator;
 
-	r = mtd_device_parse_register(&info->mtd, NULL, 0,
+	r = mtd_device_parse_register(&c->mtd, NULL, 0,
 			pdata ? pdata->parts : NULL,
 			pdata ? pdata->nr_parts : 0);
 	if (r)
-- 
1.7.4.1
