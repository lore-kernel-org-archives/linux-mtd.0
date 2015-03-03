Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSua0-00073z-Hs
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:16 +0000
Received: by wiwh11 with SMTP id h11so26266997wiw.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:56 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 18/60] mtd: maps: plat_ram: drop owner assignment
Date: Tue,  3 Mar 2015 22:40:02 +0100
Message-Id: <1425418844-25177-19-git-send-email-fransklaver@gmail.com>
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

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/plat-ram.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 4b65c08..5157289 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -210,7 +210,6 @@ static int platram_probe(struct platform_device *pdev)
 		goto exit_free;
 	}
 
-	info->mtd->owner = THIS_MODULE;
 	info->mtd->dev.parent = &pdev->dev;
 
 	platram_setrw(info, PLATRAM_RW);
-- 
2.2.2
