Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUmAY-0003Ri-U9
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 04:53:37 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [RFC PATCH 1/2] mtd: rawnand: handle ONFI revision number field being
 0
Date: Mon, 18 Jun 2018 16:52:54 +1200
Message-Id: <20180618045255.8015-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
References: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some Micron NAND chips (MT29F1G08ABAFAWP-ITE:F) report 00 00 for the
revision number field of the ONFI parameter page. Rather than rejecting
these outright assume ONFI version 1.0 if the revision number is 00 00.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
At the moment I haven't qualified this check on anything, I should
probably at least include vendor == MICRON.

As far as I can tell revision number == 0 is not permitted by the ONFI
spec but this wouldn't be the first time a vendor has ignored a spec. On
the other hand maybe I'm reading the spec wrong and someone here will
say "oh 0 means ...".

 drivers/mtd/nand/raw/nand_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 0cd3e216b95c..1691c7005ae4 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5184,6 +5184,8 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		chip->parameters.onfi.version = 20;
 	else if (val & (1 << 1))
 		chip->parameters.onfi.version = 10;
+	else if (val == 0)
+		chip->parameters.onfi.version = 10;
 
 	if (!chip->parameters.onfi.version) {
 		pr_info("unsupported ONFI version: %d\n", val);
-- 
2.17.1
