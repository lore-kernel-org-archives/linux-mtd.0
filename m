Received: from mail-wi0-x242.google.com ([2a00:1450:400c:c05::242])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmi-0003ib-Jg
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:41 +0000
Received: by wivr20 with SMTP id r20so11944849wiv.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:18 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 09/60] mtd: lpddr: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:23 +0200
Message-Id: <1433968754-10651-10-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where mtd parent device symlinks aren't shown in sysfs.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/lpddr/lpddr2_nvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nvm.c
index 063cec4..2342277 100644
--- a/drivers/mtd/lpddr/lpddr2_nvm.c
+++ b/drivers/mtd/lpddr/lpddr2_nvm.c
@@ -460,6 +460,7 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
 
 	/* Populate mtd_info data structure */
 	*mtd = (struct mtd_info) {
+		.dev		= { .parent = &pdev->dev },
 		.name		= pdev->dev.init_name,
 		.type		= MTD_RAM,
 		.priv		= map,
-- 
2.4.0
