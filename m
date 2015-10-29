Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zrmha-0000ed-9s
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 12:53:11 +0000
Received: by lfaz124 with SMTP id z124so18245704lfa.1
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 05:52:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] mtd: physmap_of: break out array clone code
Date: Thu, 29 Oct 2015 13:52:31 +0100
Message-Id: <1446123152-22666-2-git-send-email-linus.walleij@linaro.org>
In-Reply-To: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a piece of code cloning a string array in the end of
the of_get_probes() function. Break it out, so we can reuse it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/maps/physmap_of.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 3e614e9119d5..1b66ca66206b 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -112,17 +112,18 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
 static const char * const part_probe_types_def[] = {
 	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
 
-static const char * const *of_get_probes(struct device_node *dp)
+/**
+ * string_to_array() - split a string into an array
+ *
+ * This takes "a\0string\0array" and splits it into { "a", "string", "array" }
+ * with a newly allocated array of pointers returned. A NULL terminator
+ * is also added at the end of the array.
+ */
+static const char * const *string_to_array(const char *cp, int cplen)
 {
-	const char *cp;
-	int cplen;
+	const char **res;
 	unsigned int l;
 	unsigned int count;
-	const char **res;
-
-	cp = of_get_property(dp, "linux,part-probe", &cplen);
-	if (cp == NULL)
-		return part_probe_types_def;
 
 	count = 0;
 	for (l = 0; l != cplen; l++)
@@ -143,6 +144,18 @@ static const char * const *of_get_probes(struct device_node *dp)
 	return res;
 }
 
+static const char * const *of_get_probes(struct device_node *dp)
+{
+	const char *cp;
+	int cplen;
+	int ret;
+
+	cp = of_get_property(dp, "linux,part-probe", &cplen);
+	if (cp == NULL)
+		return part_probe_types_def;
+	return string_to_array(cp, cplen);
+}
+
 static void of_free_probes(const char * const *probes)
 {
 	if (probes != part_probe_types_def)
-- 
2.4.3
