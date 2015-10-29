Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zrmhi-0000fT-H8
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 12:53:20 +0000
Received: by lbbwb3 with SMTP id wb3so27670488lbb.1
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 05:52:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] mtd: physmap_of: handle the new "partition-type"
Date: Thu, 29 Oct 2015 13:52:32 +0100
Message-Id: <1446123152-22666-3-git-send-email-linus.walleij@linaro.org>
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

We defined a new device tree binding for partitions, and if they
are found these need to be translated into a string array of
Linux partitions. Reuse the string-to-array split function and
support "arm,arm-flash-structure" by splitting "afs" into
{"afs", NULL} and passing that along.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/maps/physmap_of.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 1b66ca66206b..8c09d7e23b6e 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -105,7 +105,7 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
 	}
 }
 
-/* When partitions are set we look for a linux,part-probe property which
+/* When partitions are set we look for a partition-type property which
    specifies the list of partition probers to use. If none is given then the
    default is use. These take precedence over other device tree
    information. */
@@ -150,9 +150,25 @@ static const char * const *of_get_probes(struct device_node *dp)
 	int cplen;
 	int ret;
 
+	/*
+	 * The proper device tree bindings take precedence.
+	 */
+	ret = of_property_read_string(dp, "partition-type", &cp);
+	if (!ret) {
+		pr_info("check for partition type \"%s\"\n", cp);
+		if (!strcmp(cp, "arm,arm-flash-structure"))
+			return string_to_array("afs", 1);
+	}
+
+	/*
+	 * Else look for the deprecated binding, or fall back to
+	 * defaults.
+	 */
 	cp = of_get_property(dp, "linux,part-probe", &cplen);
 	if (cp == NULL)
 		return part_probe_types_def;
+	pr_info("DT is using the deprecated \"linux,part-probe\" binding\n");
+	pr_info("please move to the standard \"partition-type\" binding\n");
 	return string_to_array(cp, cplen);
 }
 
-- 
2.4.3
