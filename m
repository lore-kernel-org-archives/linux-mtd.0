Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkPhN-00076i-9m
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 07:03:35 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nandsim: remove debugfs entries in error path
Date: Wed, 23 Aug 2017 09:03:04 +0200
Message-Id: <20170823070304.1336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The debugfs entries must be removed before an error is returned in the
probe function. Otherwise another try to load the module fails and when
the debugfs files are accessed without the module loaded, the kernel
still tries to call a function in that module.

Fixes: 5346c27c5fed ("mtd: nandsim: Introduce debugfs infrastructure")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/nandsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 03a0d057bf2f..e4211c3cc49b 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2373,6 +2373,7 @@ static int __init ns_init_module(void)
         return 0;
 
 err_exit:
+	nandsim_debugfs_remove(nand);
 	free_nandsim(nand);
 	nand_release(nsmtd);
 	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
-- 
2.11.0
