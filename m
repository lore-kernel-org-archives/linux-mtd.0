Received: from smtprelay06.ispgateway.de ([80.67.18.29])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmday-00027R-2n
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 10:18:11 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 1/2] mtd: nand: make Samsung SLC NAND usable again
Date: Tue, 29 Aug 2017 12:17:12 +0200
Message-Id: <1504001833-18097-2-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
References: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
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

commit c51d0ac59f24 ("mtd: nand: Move Samsung specific init/detection
logic in nand_samsung.c") introduced a regression for Samsung SLC NAND
chips. Prior to this commit chip->bits_per_cell was initialized by calling
nand_get_bits_per_cell() before using nand_is_slc().
With the offending commit this call is skipped, leaving
chip->bits_per_cell cleared to zero when the manufacturer specific
'.detect' function calls nand_is_slc() which in turn interprets
bits_per_cell != 1 as indication for an MLC chip.
The effect is that e.g. a K9F1G08U0F NAND chip is falsely detected as
MLC NAND with 4KiB page size rather than SLC with 2KiB page size.

Add a call to nand_get_bits_per_cell() before calling the .detect hook
function in nand_manufacturer_detect(), so that the nand_is_slc()
calls in the manufacturer specific code will return correct results.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/nand_base.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9900476..bcc8cef1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3820,10 +3820,13 @@ static void nand_manufacturer_detect(struct nand_chip *chip)
 	 * nand_decode_ext_id() otherwise.
 	 */
 	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
-	    chip->manufacturer.desc->ops->detect)
+	    chip->manufacturer.desc->ops->detect) {
+		/* The 3rd id byte holds MLC / multichip data */
+		chip->bits_per_cell = nand_get_bits_per_cell(chip->id.data[2]);
 		chip->manufacturer.desc->ops->detect(chip);
-	else
+	} else {
 		nand_decode_ext_id(chip);
+	}
 }
 
 /*
-- 
2.1.4
