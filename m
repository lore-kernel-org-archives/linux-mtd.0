Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qc8yn-0000J4-1Q
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 04:35:53 +0000
Received: by yxe42 with SMTP id 42so887258yxe.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2011 21:35:02 -0700 (PDT)
Subject: [PATCH] mtd: tmio_nand: fix build error
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 30 Jun 2011 12:34:54 +0800
Message-ID: <1309408494.10500.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a mistake introduced by commit 33f4a3b
"mtd: tmio_nand.c: use mtd_device_parse_register"

  CC [M]  drivers/mtd/nand/tmio_nand.o
drivers/mtd/nand/tmio_nand.c:461:35: error: macro "mtd_device_register" passed 5 arguments, but takes just 3
drivers/mtd/nand/tmio_nand.c: In function 'tmio_probe':
drivers/mtd/nand/tmio_nand.c:459: error: 'mtd_device_register' undeclared (first use in this function)
drivers/mtd/nand/tmio_nand.c:459: error: (Each undeclared identifier is reported only once
drivers/mtd/nand/tmio_nand.c:459: error: for each function it appears in.)
make[3]: *** [drivers/mtd/nand/tmio_nand.o] Error 1
make[2]: *** [drivers/mtd/nand] Error 2
make[1]: *** [drivers/mtd] Error 2
make: *** [drivers] Error 2

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/tmio_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index d476857..beebd95 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -456,7 +456,7 @@ static int tmio_probe(struct platform_device *dev)
 		goto err_scan;
 	}
 	/* Register the partitions */
-	retval = mtd_device_register(mtd, NULL, 0,
+	retval = mtd_device_parse_register(mtd, NULL, 0,
 			data ? data->partition : NULL,
 			data ? data->num_partitions : 0);
 	if (!retval)
-- 
1.7.4.1
