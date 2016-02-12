Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUICg-0002ar-IF
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 18:12:29 +0000
Received: by mail-lf0-x242.google.com with SMTP id e36so4535625lfi.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 10:12:06 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 3/3] mtd: brcmnand: fix check for Hamming algorithm
Date: Fri, 12 Feb 2016 19:11:25 +0100
Message-Id: <1455300685-27009-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
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

So far we were treating ECC strength 1 as Hamming algorithm. It didn't
supporting some less common devices with BCH-1 (e.g. D-Link DIR-885L).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 844fc07..b8055da 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1842,7 +1842,7 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 
 	switch (chip->ecc.size) {
 	case 512:
-		if (chip->ecc.strength == 1) /* Hamming */
+		if (chip->ecc.algo == NAND_ECC_HAMMING)
 			cfg->ecc_level = 15;
 		else
 			cfg->ecc_level = chip->ecc.strength;
-- 
1.8.4.5
