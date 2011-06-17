Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXU9V-0002ZE-Ec
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 08:11:42 +0000
Received: by iyb39 with SMTP id 39so2282339iyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Jun 2011 01:11:40 -0700 (PDT)
Subject: [PATCH 2/2] mtd: onenand/samsung.c: fix build error
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
In-Reply-To: <1308298176.13535.1.camel@phoenix>
References: <1308298176.13535.1.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Jun 2011 16:11:34 +0800
Message-ID: <1308298294.13535.3.camel@phoenix>
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
index 597dffc..d324074 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -1014,7 +1014,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	if (s3c_read_reg(MEM_CFG_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ)
 		dev_info(&onenand->pdev->dev, "OneNAND Sync. Burst Read enabled\n");
 
-	err = mtd_device_parse_register(&info->mtd, NULL, 0,
+	err = mtd_device_parse_register(onenand->mtd, NULL, 0,
 			pdata ? pdata->parts : NULL,
 			pdata ? pdata->nr_parts : 0);
 
-- 
1.7.4.1
