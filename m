Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctcTx-0006jW-TB
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 15:59:31 +0000
Received: by mail-lf0-x241.google.com with SMTP id x137so5053442lff.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 08:59:09 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: physmap_of: use OF helpers for reading strings
Date: Thu, 30 Mar 2017 17:58:53 +0200
Message-Id: <20170330155853.30349-1-zajec5@gmail.com>
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

OF core code provides helpers for counting strings and reading them so
use them instead of doing this manually. This simplifies the code a bit.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/maps/physmap_of.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 14e8909c9955..62fa6836f218 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -116,32 +116,22 @@ static const char * const part_probe_types_def[] = {
 
 static const char * const *of_get_probes(struct device_node *dp)
 {
-	const char *cp;
-	int cplen;
-	unsigned int l;
-	unsigned int count;
 	const char **res;
+	int count;
 
-	cp = of_get_property(dp, "linux,part-probe", &cplen);
-	if (cp == NULL)
+	count = of_property_count_strings(dp, "linux,part-probe");
+	if (count < 0)
 		return part_probe_types_def;
 
-	count = 0;
-	for (l = 0; l != cplen; l++)
-		if (cp[l] == 0)
-			count++;
-
-	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
+	res = kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
 	if (!res)
 		return NULL;
-	count = 0;
-	while (cplen > 0) {
-		res[count] = cp;
-		l = strlen(cp) + 1;
-		cp += l;
-		cplen -= l;
-		count++;
-	}
+
+	count = of_property_read_string_array(dp, "linux,part-probe", res,
+					      count);
+	if (count < 0)
+		return NULL;
+
 	return res;
 }
 
-- 
2.11.0
