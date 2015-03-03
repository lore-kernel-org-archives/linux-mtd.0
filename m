Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaB-0003F6-V2
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:29 +0000
Received: by wggz12 with SMTP id z12so5616278wgg.9
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:06 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 28/60] mtd: nand: denali: drop owner assignment
Date: Tue,  3 Mar 2015 22:40:12 +0100
Message-Id: <1425418844-25177-29-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/denali.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f44c606..16e61de 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1457,7 +1457,6 @@ int denali_init(struct denali_nand_info *denali)
 	/* now that our ISR is registered, we can enable interrupts */
 	denali_set_intr_modes(denali, true);
 	denali->mtd.name = "denali-nand";
-	denali->mtd.owner = THIS_MODULE;
 	denali->mtd.priv = &denali->nand;
 
 	/* register the driver with the NAND core subsystem */
-- 
2.2.2
