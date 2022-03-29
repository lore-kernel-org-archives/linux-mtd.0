Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6524C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Mar 2022 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v37R7yZMPzwDY9fEsbRMNNmM/81PeJUaUoeH/891M0M=; b=JtUO/E0CLt7ujy
	ktilFpmikIdaSZCi5YwL171gAlT+JxKCBzmhqhw9L0aProW0vhl3ZZUNMsa2XhvehCXh9uqBH1imE
	oPmRhRz1cdXDl/utWT4BEinZvIWdow5C/A60OWxbhZ+ddFuMvYyPnjVqvrL2q9KweP0kCsBCLogL1
	ZKUeB4hLXBa2VhXG8a/6CALoCVtm5mle2HDO+y8Ulc80ozPByAtjwYFk+d5JoIBgecPwFjtW0eX6v
	GFa1zAm/eJtb3oKtu+hhjqF29f5JK+YtBY0sPBCVAkU0u5LtS5AENMmwUCfGq03clGUY7rq2vFnkH
	0w7t8qsS/uzw/ON2f/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZAqf-00C9Zt-PI; Tue, 29 Mar 2022 12:21:21 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZApx-00C9EB-6t
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2022 12:20:39 +0000
Received: by mail-lj1-x22c.google.com with SMTP id h11so23169537ljb.2
 for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2022 05:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XhBvTTLrPqYdJ1lMXVCJbS9bURBhHkC2UBv24O2/ZT4=;
 b=QOPW8bq0zwLCqDxYpHVJXUcJp6Oup3uFVFNg0MMCQwlQRnMXmtY77Zy9/VWDf3Gg+G
 gDyR3NrGvwShp8atZIq+oeDHehqp6iRMj+x1MW9TF8w+8FR7FpuHUtzJzoE9Nhro62Ys
 1hfdZjrye6i3118urMK+/t78GEG9XKUFJG1/Cn89g6pi9wDdMDGkOpZ6rzn/48wiNnOh
 NdT4YBvngpVbCLTBWhV+EG0QsUM6HHktI69mSiG2hakCsHphkY/slMFXFMu9yUws1yeb
 +MI034QOos2O9XW8Z1tZoBXM1mgZOtJk/VPR+IXacAXQ4L71C++BXKP2f0N1kNoFjDYH
 gMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XhBvTTLrPqYdJ1lMXVCJbS9bURBhHkC2UBv24O2/ZT4=;
 b=ncxKqJ99hHWH5cT/54e66b7c40jaS0hrOZG9HlOX1l+SuYoLwhdqnV4jyj8BfGXSJa
 RxRW+PtNqMITmZheHLxVuO6Dmtw84tUqDiBLlFstaoq2kE8dRHm96GTlzIdJc2UTftoO
 iUu5brcbXqB3R2Y+rQzZbfSoIB/3qUSrzIUs8HNGbOpH3v0MrM9X8QEYRe3lct2pFLoc
 6nVqd6zGzBlfG3i6P/uDa6m0/0olYTSckvITjakSsIzOmOiXxUrin+5xeFlTuHX+t5c0
 gLCCrs7U1cse6UxUzuIGfikNgUbcjPBD3Ebj+kq7YBzOZF4IlxzUl+KtU1GboefpMwH3
 AnzQ==
X-Gm-Message-State: AOAM530HSqfHHCZ1F8UpMvVbZXKsIAF3gcs/t3h4VcBeag3bbau498ie
 rPQhPL3SkmjOcm+hEbegw7w=
X-Google-Smtp-Source: ABdhPJybhPfQCqvR5j6wQ2b/W9TnRxXilqUNr+5sUATVIa661I+g4SOQCqjO44wOzK8kXsZ5OQCBaw==
X-Received: by 2002:a2e:9212:0:b0:249:84e3:a849 with SMTP id
 k18-20020a2e9212000000b0024984e3a849mr2459008ljg.158.1648556434311; 
 Tue, 29 Mar 2022 05:20:34 -0700 (PDT)
Received: from vmu1804.lan ([2a09:bac0:87::829:2528])
 by smtp.googlemail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm2076692ljh.45.2022.03.29.05.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 05:20:33 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Karim <Karimdplay@gmail.com>, M <x1@disroot.org>,
 Mikhail Zhilkin <csharper2005@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] mtd: parsers: add support for Sercomm partitions
Date: Tue, 29 Mar 2022 12:20:16 +0000
Message-Id: <20220329122016.4122899-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_052037_316558_064127B0 
X-CRM114-Status: GOOD (  24.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds an MTD partition parser for the Sercomm partition table that
is used in some Beeline, Netgear and Sercomm routers.

The Sercomm partition map table contains real partition offsets, which
may differ from device to device depending on the number and location of
bad blocks on NAND.

Device tree example:
partitions {
	compatible = "sercomm,sc-partitions", "fixed-partitions";
	#address-cells = <1>;
	#size-cells = <1>;

	partition@0 {
		label = "u-boot";
		reg = <0x0 0x100000>;
		scpart-id = <0>;
		read-only;
	};
};

This is essentially the same code as proposed by NOGUCHI Hiroshi
<drvlabo@gmail.com> here:
https://github.com/openwrt/openwrt/pull/1318#issuecomment-420607394

Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
---
 drivers/mtd/parsers/Kconfig  |   9 ++
 drivers/mtd/parsers/Makefile |   1 +
 drivers/mtd/parsers/scpart.c | 243 +++++++++++++++++++++++++++++++++++
 3 files changed, 253 insertions(+)
 create mode 100644 drivers/mtd/parsers/scpart.c

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index 23763d16e4f9..92a95297ca84 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -180,6 +180,15 @@ config MTD_REDBOOT_PARTS_READONLY
 
 endif # MTD_REDBOOT_PARTS
 
+config MTD_SERCOMM_PARTS
+	tristate "Sercomm flash partition parser"
+	depends on MTD_OF_PARTS
+	help
+	  This provides partitions table parser for devices with Sercomm
+	  partition map. This partition table contains real partition
+	  offsets, which may differ from device to device depending on the
+	  number and location of bad blocks on NAND.
+
 config MTD_QCOMSMEM_PARTS
 	tristate "Qualcomm SMEM flash partition parser"
 	depends on QCOM_SMEM
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index 2e98aa048278..2fcf0ab9e7da 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -10,6 +10,7 @@ ofpart-$(CONFIG_MTD_OF_PARTS_LINKSYS_NS)+= ofpart_linksys_ns.o
 obj-$(CONFIG_MTD_PARSER_IMAGETAG)	+= parser_imagetag.o
 obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
+obj-$(CONFIG_MTD_SERCOMM_PARTS)		+= scpart.o
 obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS)		+= redboot.o
 obj-$(CONFIG_MTD_QCOMSMEM_PARTS)	+= qcomsmempart.o
diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
new file mode 100644
index 000000000000..0d8b2bb3452e
--- /dev/null
+++ b/drivers/mtd/parsers/scpart.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *    drivers/mtd/scpart.c: Sercomm Partition Parser
+ *
+ *    Copyright (C) 2018 NOGUCHI Hiroshi
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/module.h>
+
+#define	MOD_NAME	"scpart"
+
+static const char sc_part_magic[] = {
+	'S', 'C', 'F', 'L', 'M', 'A', 'P', 'O', 'K', '\0',
+};
+#define	PART_MAGIC_LEN	sizeof(sc_part_magic)
+
+/* assumes that all fields are set by CPU native endian */
+struct sc_part_desc {
+	uint32_t	part_id;
+	uint32_t	part_offs;
+	uint32_t	part_bytes;
+};
+#define	ID_ALREADY_FOUND	(0xFFFFFFFFUL)
+
+#define	MAP_OFFS_IN_BLK	(0x800)
+
+#define	MAP_MIRROR_NUM	(2)
+
+static int scpart_desc_is_valid(struct sc_part_desc *pdesc)
+{
+	return !!((pdesc->part_id != 0xFFFFFFFFUL) &&
+		(pdesc->part_offs != 0xFFFFFFFFUL) &&
+		(pdesc->part_bytes != 0xFFFFFFFFUL));
+}
+
+static int scpart_scan_partmap(struct mtd_info *master, loff_t partmap_offs,
+			       struct sc_part_desc **ppdesc)
+{
+	uint8_t *buf;
+	loff_t offs;
+	size_t retlen;
+	struct sc_part_desc *pdesc = NULL;
+	struct sc_part_desc *tmpdesc;
+	int cnt = 0;
+	int res2;
+	int res = 0;
+
+	buf = kzalloc(master->erasesize, GFP_KERNEL);
+	if (!buf) {
+		res = -ENOMEM;
+		goto out;
+	}
+
+	res2 = mtd_read(master, partmap_offs, master->erasesize, &retlen, buf);
+	if (res2 || (retlen != master->erasesize)) {
+		res = -EIO;
+		goto free;
+	}
+
+	offs = MAP_OFFS_IN_BLK;
+	while ((offs + sizeof(*tmpdesc)) < master->erasesize) {
+		tmpdesc = (struct sc_part_desc *)&(buf[offs]);
+		if (!scpart_desc_is_valid(tmpdesc))
+			break;
+		cnt++;
+		offs += sizeof(*tmpdesc);
+	}
+
+	if (cnt > 0) {
+		int bytes = cnt * sizeof(*pdesc);
+
+		pdesc = kzalloc(bytes, GFP_KERNEL);
+		if (!pdesc) {
+			res = -ENOMEM;
+			goto free;
+		}
+		memcpy(pdesc, &(buf[MAP_OFFS_IN_BLK]), bytes);
+
+		*ppdesc = pdesc;
+		res = cnt;
+	}
+
+free:
+	kfree(buf);
+
+out:
+	return res;
+}
+
+static int scpart_find_partmap(struct mtd_info *master,
+			       struct sc_part_desc **ppdesc)
+{
+	loff_t offs;
+	uint8_t rdbuf[PART_MAGIC_LEN];
+	size_t retlen;
+	int magic_found = 0;
+	int res2;
+	int res = 0;
+
+	offs = 0;
+	while ((magic_found < MAP_MIRROR_NUM) &&
+			(offs < master->size) && !mtd_block_isbad(master, offs)) {
+		res2 = mtd_read(master, offs, PART_MAGIC_LEN, &retlen, rdbuf);
+		if (res2 || (retlen != PART_MAGIC_LEN)) {
+			res = -EIO;
+			goto out;
+		}
+		if (!memcmp(rdbuf, sc_part_magic, PART_MAGIC_LEN)) {
+			pr_debug("%s: signature found at 0x%llx\n", MOD_NAME, offs);
+			magic_found++;
+			res = scpart_scan_partmap(master, offs, ppdesc);
+			if (res > 0)
+				goto out;
+		}
+		offs += master->erasesize;
+	}
+
+out:
+	if (res > 0)
+		pr_info("%s: valid 'SC PART MAP' found (%d partitions)\n", MOD_NAME, res);
+	else
+		pr_info("%s: no valid 'SC PART MAP'\n", MOD_NAME);
+
+	return res;
+}
+
+static int scpart_parse(struct mtd_info *master,
+			const struct mtd_partition **pparts,
+			struct mtd_part_parser_data *data)
+{
+	struct sc_part_desc *scpart_map = NULL;
+	struct mtd_partition *parts = NULL;
+	struct device_node *mtd_node;
+	struct device_node *ofpart_node;
+	struct device_node *pp;
+	const char *partname;
+	int nr_scparts;
+	int nr_parts = 0;
+	int n;
+	int res = 0;
+
+	mtd_node = mtd_get_of_node(master);
+	if (!mtd_node)
+		goto out;
+
+	ofpart_node = of_get_child_by_name(mtd_node, "partitions");
+	if (!ofpart_node)
+		goto out;
+
+	nr_scparts = scpart_find_partmap(master, &scpart_map);
+	if (nr_scparts <= 0) {
+		res = nr_scparts;
+		goto free;
+	}
+
+	for_each_child_of_node(ofpart_node, pp) {
+		u32 scpart_id;
+		struct mtd_partition *parts_tmp;
+
+		if (of_property_read_u32(pp, "scpart-id", &scpart_id))
+			continue;
+
+		for (n = 0 ; n < nr_scparts ; n++)
+			if ((scpart_map[n].part_id != ID_ALREADY_FOUND) &&
+					(scpart_id == scpart_map[n].part_id))
+				break;
+		if (n >= nr_scparts)
+			/* not match */
+			continue;
+
+		/* add the partition found in OF into MTD partition array */
+
+		/* reallocate partition array */
+		parts_tmp = parts;
+		parts = kzalloc((nr_parts + 1) * sizeof(*parts), GFP_KERNEL);
+		if (!parts) {
+			kfree(parts_tmp);
+			res = -ENOMEM;
+			goto free;
+		}
+		if (parts_tmp) {
+			memcpy(parts, parts_tmp, nr_parts * sizeof(*parts));
+			kfree(parts_tmp);
+		}
+
+		parts[nr_parts].offset = scpart_map[n].part_offs;
+		parts[nr_parts].size = scpart_map[n].part_bytes;
+		parts[nr_parts].of_node = pp;
+
+		if (!of_property_read_string(pp, "label", &partname) ||
+				!of_property_read_string(pp, "name", &partname))
+			parts[nr_parts].name = partname;
+
+		if (of_property_read_bool(pp, "read-only"))
+			parts[nr_parts].mask_flags |= MTD_WRITEABLE;
+		if (of_property_read_bool(pp, "lock"))
+			parts[nr_parts].mask_flags |= MTD_POWERUP_LOCK;
+
+		/* mark as 'done' */
+		scpart_map[n].part_id = ID_ALREADY_FOUND;
+
+		nr_parts++;
+	}
+	if (nr_parts > 0) {
+		*pparts = parts;
+		res = nr_parts;
+	} else
+		pr_info("%s: No partition in OF matches partition ID with 'SC PART MAP'.\n",
+			MOD_NAME);
+
+	of_node_put(pp);
+
+free:
+	kfree(scpart_map);
+	if (res <= 0)
+		kfree(parts);
+
+out:
+	return res;
+}
+
+static const struct of_device_id scpart_parser_of_match_table[] = {
+	{ .compatible = "sercomm,sc-partitions" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, scpart_parser_of_match_table);
+
+static struct mtd_part_parser scpart_parser = {
+	.parse_fn = scpart_parse,
+	.name = "scpart",
+	.of_match_table = scpart_parser_of_match_table,
+};
+module_mtd_part_parser(scpart_parser);
+
+/* mtd parsers will request the module by parser name */
+MODULE_ALIAS("scpart");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("NOGUCHI Hiroshi <drvlabo@gmail.com>");
+MODULE_DESCRIPTION("Sercomm partition parser");
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
