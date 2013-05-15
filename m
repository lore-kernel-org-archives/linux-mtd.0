Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcXW2-0002WM-Nh
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 08:56:55 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v5 03/11] mtd: get the ECC info from the parameter page for
 ONFI nand
Date: Wed, 15 May 2013 16:40:26 +0800
Message-ID: <1368607232-2210-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1368607232-2210-1-git-send-email-b32955@freescale.com>
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From the ONFI spec, we can just get the ECC info from the @ecc_bits field of
the parameter page.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index edc7663..15630ef 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2900,6 +2900,11 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	if (le16_to_cpu(p->features) & 1)
 		*busw = NAND_BUSWIDTH_16;
 
+	if (p->ecc_bits != 0xff) {
+		chip->ecc_strength = p->ecc_bits;
+		chip->ecc_step = 512;
+	}
+
 	pr_info("ONFI flash detected\n");
 	return 1;
 }
-- 
1.7.1
