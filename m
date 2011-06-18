Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXkWC-0002uc-RU
	for linux-mtd@lists.infradead.org; Sat, 18 Jun 2011 01:40:13 +0000
Received: by iwn35 with SMTP id 35so1088727iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Jun 2011 18:40:10 -0700 (PDT)
Subject: [PATCH 2/2 v2] mtd: onenand/samsung.c: fix build error
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 18 Jun 2011 09:40:00 +0800
Message-ID: <1308361200.2400.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix below build error:
  CC      drivers/mtd/onenand/samsung.o
drivers/mtd/onenand/samsung.c: In function 's3c_onenand_probe':
drivers/mtd/onenand/samsung.c:1017: error: 'info' undeclared (first use in this function)
drivers/mtd/onenand/samsung.c:1017: error: (Each undeclared identifier is reported only once
drivers/mtd/onenand/samsung.c:1017: error: for each function it appears in.)
make[3]: *** [drivers/mtd/onenand/samsung.o] Error 1
make[2]: *** [drivers/mtd/onenand] Error 2
make[1]: *** [drivers/mtd] Error 2
make: *** [drivers] Error 2

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/onenand/samsung.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 597dffc..a0ef087 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -1014,7 +1014,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	if (s3c_read_reg(MEM_CFG_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ)
 		dev_info(&onenand->pdev->dev, "OneNAND Sync. Burst Read enabled\n");
 
-	err = mtd_device_parse_register(&info->mtd, NULL, 0,
+	err = mtd_device_parse_register(mtd, NULL, 0,
 			pdata ? pdata->parts : NULL,
 			pdata ? pdata->nr_parts : 0);
 
-- 
1.7.4.1
