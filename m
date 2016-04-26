Received: from mail-lf0-x230.google.com ([2a00:1450:4010:c07::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av7qt-0001Vf-Pf
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 18:36:52 +0000
Received: by mail-lf0-x230.google.com with SMTP id y84so26012752lfc.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2016 11:36:30 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: fix NULL pointer dereference in
 of_get_nand_ecc_algo
Date: Tue, 26 Apr 2016 20:36:16 +0200
Message-Id: <1461695776-29740-1-git-send-email-zajec5@gmail.com>
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

Our array nand_ecc_algos doesn't specify mappings for all available
enum nand_ecc_algo values. The one missing there is NAND_ECC_UNKNOWN
as this value is reserved for algorithm not being specified at all.
It means we have to be careful when iterating this array and handle
NULL values.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
Hi Boris,

Sorry for this crash in nand subsystem :( If you think it's OK you may
pick this patch as a fixup for
c6e002a7ca9f ("mtd: nand: add support for "nand-ecc-algo" DT property")
---
 drivers/mtd/nand/nand_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a5417a0..0eaa9dc 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4016,6 +4016,8 @@ static int of_get_nand_ecc_algo(struct device_node *np)
 	err = of_property_read_string(np, "nand-ecc-algo", &pm);
 	if (!err) {
 		for (i = 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
+			if (!nand_ecc_algos[i])
+				continue;
 			if (!strcasecmp(pm, nand_ecc_algos[i]))
 				return i;
 		return -ENODEV;
-- 
1.8.4.5
