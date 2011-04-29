Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFkyx-0008Qy-Lp
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 10:31:32 +0000
Received: by wyb28 with SMTP id 28so3495444wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2011 03:31:29 -0700 (PDT)
Sender: Bryan De faria <bryan.defaria@gmail.com>
From: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
To: 
Subject: [PATCH 2/3] omap : nand : fix omap2 module reinsertion
Date: Fri, 29 Apr 2011 12:31:09 +0200
Message-Id: <1304073070-24526-3-git-send-email-bdefaria@adeneo-embedded.com>
In-Reply-To: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
References: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
To: linux-omap@vger.kernel.org
Cc: Bryan DE FARIA <bdefaria@adeneo-embedded.com>, jjhiblot@adetelgroup.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the module is removed, a reinsertion will fail with a -16 error.

Signed-off-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
---
 drivers/mtd/nand/omap2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index da9a351..eab51da 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1138,6 +1138,7 @@ static int omap_nand_remove(struct platform_device *pdev)
 
 	/* Release NAND device, its internal structures and partitions */
 	nand_release(&info->mtd);
+	release_mem_region(info->phys_base, NAND_IO_SIZE);
 	iounmap(info->nand.IO_ADDR_R);
 	kfree(&info->mtd);
 	return 0;
-- 
1.7.1
