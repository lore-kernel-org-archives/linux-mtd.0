Received: from mail-wg0-f50.google.com ([74.125.82.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZt-00038t-7P
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:10 +0000
Received: by wggz12 with SMTP id z12so5614674wgg.9
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:46 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 07/60] mtd: devices: spear_smi: show device in sysfs
Date: Tue,  3 Mar 2015 22:39:51 +0100
Message-Id: <1425418844-25177-8-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/devices/spear_smi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 508bab3..015a1cf 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -854,6 +854,7 @@ static int spear_smi_setup_banks(struct platform_device *pdev,
 	else
 		flash->mtd.name = flash_devices[flash_index].name;
 
+	flash->mtd.dev.parent = &pdev->dev;
 	flash->mtd.type = MTD_NORFLASH;
 	flash->mtd.writesize = 1;
 	flash->mtd.flags = MTD_CAP_NORFLASH;
-- 
2.2.2
