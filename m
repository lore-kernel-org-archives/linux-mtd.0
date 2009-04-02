Received: from qw-out-1920.google.com ([74.125.92.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpWOp-0002Je-LH
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 23:32:50 +0000
Received: by qw-out-1920.google.com with SMTP id 5so659894qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Apr 2009 16:32:42 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Apr 2009 16:32:42 -0700
Message-ID: <a95a62fe0904021632l14ddb299l7818f2f2d32c20ac@mail.gmail.com>
Subject: [PATCH] MTD: nandsim should delete its partitions on module unload
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: dwmw2@infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
---
 drivers/mtd/nand/nandsim.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index cd0711b..f4fda9b 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2349,6 +2349,7 @@ static void __exit ns_cleanup_module(void)
 	struct nandsim *ns = (struct nandsim *)(((struct nand_chip
*)nsmtd->priv)->priv);
 	int i;

+	del_mtd_partitions(nsmtd);
 	free_nandsim(ns);    /* Free nandsim private resources */
 	nand_release(nsmtd); /* Unregister driver */
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
-- 
1.5.6.3
