Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eb5rT-0006Lx-1u
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 14:35:45 +0000
Received: by mail-lf0-x244.google.com with SMTP id m8so13615830lfc.6
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jan 2018 06:35:32 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 2/2] mtd: get rid of the mtd_add_device_partitions function
Date: Mon, 15 Jan 2018 15:35:19 +0100
Message-Id: <20180115143519.9845-3-zajec5@gmail.com>
In-Reply-To: <20180115143519.9845-1-zajec5@gmail.com>
References: <20180115132223.9974-1-zajec5@gmail.com>
 <20180115143519.9845-1-zajec5@gmail.com>
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

This simplifies code a bit by:
1) Avoiding an extra (tiny) function
2) Checking for amount of parsed (found) partitions just once
3) Avoiding clearing/filling struct mtd_partitions manually

With this commit a proper functions are called directly from the
mtd_device_parse_register. It doesn't need to use minor tricks like
memsetting struct to 0 to trigger an expected mtd_add_device_partitions
behavior.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Simplify conditions in the mtd_device_parse_register (thanks Boris)
---
 drivers/mtd/mtdcore.c | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 3304199cca07..9baf93219873 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -636,21 +636,6 @@ int del_mtd_device(struct mtd_info *mtd)
 	return ret;
 }
 
-static int mtd_add_device_partitions(struct mtd_info *mtd,
-				     struct mtd_partitions *parts)
-{
-	const struct mtd_partition *real_parts = parts->parts;
-	int nbparts = parts->nr_parts;
-
-	if (!nbparts && !device_is_registered(&mtd->dev))
-		return add_mtd_device(mtd);
-
-	if (nbparts > 0)
-		return add_mtd_partitions(mtd, real_parts, nbparts);
-
-	return 0;
-}
-
 /*
  * Set a few defaults based on the parent devices, if not provided by the
  * driver
@@ -712,24 +697,20 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			return ret;
 	}
 
-	memset(&parsed, 0, sizeof(parsed));
-
+	/* Prefer parsed partitions over driver-provided fallback */
 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
-	if ((ret < 0 || parsed.nr_parts == 0) && parts && nr_parts) {
-		/* Fall back to driver-provided partitions */
-		parsed = (struct mtd_partitions){
-			.parts		= parts,
-			.nr_parts	= nr_parts,
-		};
-	} else if (ret < 0) {
-		/* Didn't come up with parsed OR fallback partitions */
-		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
-			ret);
-		/* Don't abort on errors; we can still use unpartitioned MTD */
-		memset(&parsed, 0, sizeof(parsed));
+	if (!ret && parsed.nr_parts) {
+		parts = parsed.parts;
+		nr_parts = parsed.nr_parts;
 	}
 
-	ret = mtd_add_device_partitions(mtd, &parsed);
+	if (nr_parts)
+		ret = add_mtd_partitions(mtd, parts, nr_parts);
+	else if (!device_is_registered(&mtd->dev))
+		ret = add_mtd_device(mtd);
+	else
+		ret = 0;
+
 	if (ret)
 		goto out;
 
-- 
2.11.0
