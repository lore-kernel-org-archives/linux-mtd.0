Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTxgu-0004kk-P4
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 14:55:37 +0000
Received: by eyh6 with SMTP id 6so2121864eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 07:55:32 -0700 (PDT)
Subject: [PATCH] mtd: ndfc: fix a memory leak in ndfc_remove
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 22:55:21 +0800
Message-ID: <1307458521.22584.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Sean MacLennan <smaclennan@pikatech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/ndfc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index ea2dea8..7995470 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -288,6 +288,7 @@ static int __devexit ndfc_remove(struct platform_device *ofdev)
 	struct ndfc_controller *ndfc = dev_get_drvdata(&ofdev->dev);
 
 	nand_release(&ndfc->mtd);
+	kfree(ndfc->mtd.name);
 
 	return 0;
 }
-- 
1.7.4.1
