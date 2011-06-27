Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbBOC-00079r-Ri
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 12:58:11 +0000
Received: by wyf23 with SMTP id 23so3944376wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 05:58:07 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: tmio_nand should call mtd_device_parse_register
Date: Mon, 27 Jun 2011 16:58:01 +0400
Message-Id: <1309179481-30957-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While patching tmio_nand for mtd_device_parse_register(), I've changed
it to correctly pass arguments, but didn't change the function call
itself, so correct that mistake.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
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
1.7.5.4
