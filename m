Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0c2d-0003sk-8W
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:19:55 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/19] mxc nand: use resource_size()
Date: Wed, 21 Oct 2009 16:13:15 +0200
Message-Id: <1256134406-25251-9-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-8-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-7-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-8-git-send-email-s.hauer@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 74c5dbc..127e0b7 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -865,7 +865,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 		goto eres;
 	}
 
-	host->regs = ioremap(res->start, res->end - res->start + 1);
+	host->regs = ioremap(res->start, resource_size(res));
 	if (!host->regs) {
 		err = -ENOMEM;
 		goto eres;
-- 
1.6.5
