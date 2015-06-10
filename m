Received: from mail-wg0-x244.google.com ([2a00:1450:400c:c00::244])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mma-00056b-Hn
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:33 +0000
Received: by wggy19 with SMTP id y19so8934314wgg.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:15 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 07/60] mtd: devices: spear_smi: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:21 +0200
Message-Id: <1433968754-10651-8-git-send-email-fransklaver@gmail.com>
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
2.4.0
