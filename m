Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PBpnX-0003zO-0f
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2010 14:19:16 +0000
Subject: [PATCH] mtd: bcm963xx-flash: try JEDEC probe if CFI fails
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 29 Oct 2010 16:17:49 +0200
Message-ID: <20101029141749.23774.90495.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Mike Albon <malbon@openwrt.org>, Daniel Dickinson <cshore@csolve.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/maps/bcm963xx-flash.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
index d175c12..1f30495 100644
--- a/drivers/mtd/maps/bcm963xx-flash.c
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -196,10 +196,15 @@ static int bcm963xx_probe(struct platform_device *pdev)
 	bcm963xx_mtd_info = do_map_probe("cfi_probe", &bcm963xx_map);
 	if (!bcm963xx_mtd_info) {
 		dev_err(&pdev->dev, "failed to probe using CFI\n");
+		bcm963xx_mtd_info = do_map_probe("jedec_probe", &bcm963xx_map);
+		if (bcm963xx_mtd_info)
+			goto probe_ok;
+		dev_err(&pdev->dev, "failed to probe using JEDEC\n");
 		err = -EIO;
 		goto err_probe;
 	}
 
+probe_ok:
 	bcm963xx_mtd_info->owner = THIS_MODULE;
 
 	/* This is mutually exclusive */
