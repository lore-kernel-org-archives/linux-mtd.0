Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOGos-0005OQ-Vg
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 05:07:48 +0000
Received: by mail-lf0-x243.google.com with SMTP id l200so4936388lfg.1
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 22:07:26 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: parsers: trx: fix pr_err format for printing offset
Date: Fri, 23 Jun 2017 07:07:14 +0200
Message-Id: <20170623050714.18134-1-zajec5@gmail.com>
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

From: Rafał Miłecki <rafal@milecki.pl>

This fixes following warning:
include/linux/kern_levels.h:4:18: warning: format '%X' expects argument of type 'unsigned int', but argument 2 has type 'size_t {aka long unsigned int}' [-Wformat=]

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/parsers/parser_trx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
index e805108afd31..df360a75e1eb 100644
--- a/drivers/mtd/parsers/parser_trx.c
+++ b/drivers/mtd/parsers/parser_trx.c
@@ -39,7 +39,7 @@ static const char *parser_trx_data_part_name(struct mtd_info *master,
 	err  = mtd_read(master, offset, sizeof(buf), &bytes_read,
 			(uint8_t *)&buf);
 	if (err && !mtd_is_bitflip(err)) {
-		pr_err("mtd_read error while parsing (offset: 0x%X): %d\n",
+		pr_err("mtd_read error while parsing (offset: 0x%zX): %d\n",
 			offset, err);
 		goto out_default;
 	}
-- 
2.11.0
