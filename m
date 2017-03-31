Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctuvE-0005On-E1
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 11:40:55 +0000
Received: by mail-lf0-x243.google.com with SMTP id r36so7109837lfi.0
 for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2017 04:40:31 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 2/3] mtd: add core code reading DT specified part probes
Date: Fri, 31 Mar 2017 13:40:15 +0200
Message-Id: <20170331114016.26858-2-zajec5@gmail.com>
In-Reply-To: <20170331114016.26858-1-zajec5@gmail.com>
References: <20170331114016.26858-1-zajec5@gmail.com>
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

Handling (creating) partitions for flash devices requires using a proper
driver that will read partition table (out of somewhere). We can't
simply try all existing drivers one by one:
1) It would increase boot time
2) The order could be a problem
3) In some corner cases parsers could misinterpret some data as a table
Due to this MTD subsystem allows drivers to specify a list of applicable
part probes.

So far physmap_of was the only driver with support for linux,part-probe
DT property. Other ones had list or probes hardcoded which wasn't making
them really flexible. It prevented using common flash drivers on
platforms that required some specific partition table access.

This commit adds support for mentioned DT property directly to the MTD
core. It's a rewritten implementation of physmap_of's code and it makes
original code obsolete. Thanks to calling it on device parse
registration (as suggested by Boris) all drivers gain support for it for
free.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/mtdcore.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 66a9dedd1062..917def28c756 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -664,6 +664,32 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	}
 }
 
+static const char * const *mtd_of_get_probes(struct device_node *np)
+{
+	const char **res;
+	int count;
+
+	count = of_property_count_strings(np, "linux,part-probe");
+	if (count < 0)
+		return NULL;
+
+	res = kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return NULL;
+
+	count = of_property_read_string_array(np, "linux,part-probe", res,
+					      count);
+	if (count < 0)
+		return NULL;
+
+	return res;
+}
+
+static inline void mtd_of_free_probes(const char * const *probes)
+{
+	kfree(probes);
+}
+
 /**
  * mtd_device_parse_register - parse partitions and register an MTD device.
  *
@@ -698,14 +724,19 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
 {
+	const char * const *part_probe_types;
 	struct mtd_partitions parsed;
 	int ret;
 
 	mtd_set_dev_defaults(mtd);
 
+	part_probe_types = mtd_of_get_probes(mtd_get_of_node(mtd));
+	if (!part_probe_types)
+		part_probe_types = types;
+
 	memset(&parsed, 0, sizeof(parsed));
 
-	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
+	ret = parse_mtd_partitions(mtd, part_probe_types, &parsed, parser_data);
 	if ((ret < 0 || parsed.nr_parts == 0) && parts && nr_parts) {
 		/* Fall back to driver-provided partitions */
 		parsed = (struct mtd_partitions){
@@ -720,6 +751,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		memset(&parsed, 0, sizeof(parsed));
 	}
 
+	if (part_probe_types != types)
+		mtd_of_free_probes(part_probe_types);
+
 	ret = mtd_add_device_partitions(mtd, &parsed);
 	if (ret)
 		goto out;
-- 
2.11.0
