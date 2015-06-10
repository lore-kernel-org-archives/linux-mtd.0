Received: from mail-wi0-x243.google.com ([2a00:1450:400c:c05::243])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mn3-0003ja-R7
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:02 +0000
Received: by wibbw19 with SMTP id bw19so11973387wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:39 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 28/60] mtd: nand: denali: drop owner assignment
Date: Wed, 10 Jun 2015 22:38:42 +0200
Message-Id: <1433968754-10651-29-git-send-email-fransklaver@gmail.com>
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

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/denali.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 870c7fc..84ee0fe 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1454,7 +1454,6 @@ int denali_init(struct denali_nand_info *denali)
 	/* now that our ISR is registered, we can enable interrupts */
 	denali_set_intr_modes(denali, true);
 	denali->mtd.name = "denali-nand";
-	denali->mtd.owner = THIS_MODULE;
 	denali->mtd.priv = &denali->nand;
 
 	/* register the driver with the NAND core subsystem */
-- 
2.4.0
