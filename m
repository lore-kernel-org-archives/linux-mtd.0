Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZx-0004rZ-UJ
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:14 +0000
Received: by wiwl15 with SMTP id l15so26286454wiw.5
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:48 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 09/60] mtd: lpddr: show device in sysfs
Date: Tue,  3 Mar 2015 22:39:53 +0100
Message-Id: <1425418844-25177-10-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd devices aren't shown in sysfs.

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
2.2.2
