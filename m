Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atZBe-0006zw-0H
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 11:23:50 +0000
Received: by mail-lb0-x230.google.com with SMTP id os9so42209500lbb.2
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2016 04:23:30 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] mtd: brcmnand: respect ECC algorithm set by NAND subsystem
Date: Fri, 22 Apr 2016 13:23:15 +0200
Message-Id: <1461324197-1333-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's more reliable than guessing based on ECC strength. It allows using
NAND on devices with BCH-1 (e.g. D-Link DIR-885L).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index c3331ff..dcb22dc 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1927,7 +1927,7 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 
 	switch (chip->ecc.size) {
 	case 512:
-		if (chip->ecc.strength == 1) /* Hamming */
+		if (chip->ecc.algo == NAND_ECC_HAMMING)
 			cfg->ecc_level = 15;
 		else
 			cfg->ecc_level = chip->ecc.strength;
-- 
1.8.4.5
