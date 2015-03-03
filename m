Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaV-0004xK-Vp
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:48 +0000
Received: by wghb13 with SMTP id b13so42785631wgh.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:26 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 50/60] mtd: nand: sh_flctl: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:34 +0100
Message-Id: <1425418844-25177-51-git-send-email-fransklaver@gmail.com>
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

Fix a bug where devices aren't shown in sysfs.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/sh_flctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index a21c378..19135b4 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1125,6 +1125,7 @@ static int flctl_probe(struct platform_device *pdev)
 	flctl_mtd = &flctl->mtd;
 	nand = &flctl->chip;
 	flctl_mtd->priv = nand;
+	flctl_mtd->dev.parent = &pdev->dev;
 	flctl->pdev = pdev;
 	flctl->hwecc = pdata->has_hwecc;
 	flctl->holden = pdata->use_holden;
-- 
2.2.2
