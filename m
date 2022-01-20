Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA42BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 20:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0HNPQSgC4VbI5ErTBdvtTSRS9OvNz/MvKkrO9eYzpA=; b=C8hXC1ihQ5OLQL
	7gqkcsTizVFKspJwhmHoduGn+ExVSU+yCfTexC5oRZQA+JUVosd4xcTCGv53RF4rkcl2bpsd7M1Rl
	ScGjfBazOmi6zpO5bhrJYXnEY0q2sY9GYRLaH2wDTs3KJalLv90BfpMzh8mAizXsP6C/kebyQnk7M
	JuklNlHDuZDXkac1H5GdMrl12cAMbjfc9WgEpM021uoSgbcdncrvYimoYTQM/TaDyxXR8w+7sfZsM
	veVDyhNA/YqRqzJRsuCJXuBkIcLWE6p789+MnFAZeSrFuKQ1HuYXqqjFJcXymo/tk7CzSbnF8LU3A
	YVbxe98nE0IwfTCdMU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAe1E-00D7Pr-FN; Thu, 20 Jan 2022 20:26:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAe0l-00D7JJ-QU
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 20:26:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso23115603wma.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jan 2022 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bFvuHlWBlhLrQ+Wqzd7mZdO7/KSfytbRxINKe6WN5eE=;
 b=XpDnnLyRe3o+MVTmrl6vqky0nXyAmWk4qCjC4veYaXRI1Y/G6cKAk7YsAFLJmxRUqh
 LOMrNJCRQR1uN9kKzqsoImINJr2O/qUMhfFg/U5oWi2cBwnJdeY31sYlP8u3c+FeYVt7
 geDunL98zItlxnDP0dxncde7Lcu4HXn0sDPKfqeuRPTig/s2Qj+hyEOLXavH4a/JZdOU
 IyY1fMzRqtPvJKHBLGn4e2s7UJRMwRUBvQ684CGhmX1v/aNGaNzVGsEFbmBeeKSTLwWp
 wW5EAOmqrqyTbewOOG0kK7uDV9bFbNhqKNxtC39SX1gx1g2UvD8XY1QNOGNmrFOHfBxG
 z5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFvuHlWBlhLrQ+Wqzd7mZdO7/KSfytbRxINKe6WN5eE=;
 b=MhjgpLf0tPijZZlbclPm3hCPb9tCYYokb0MKRHDCOQ7CDIscNylD6oaYYb7U3+NJYo
 Llj45c9XDqm4NNIBujPvar/8d3yHBKHapBm+99iLrjR5ARSl0owCv3ZacBY/pazeiQLs
 47VN+FwydCgno3wYA+Fn3YuZFNzDPpi229QcwBUNCDgGYrLmPWRr+HKt+PDr0SiVpoFn
 mihxC93O36wCD94H9ZVRy4dTTIrbG9BotLn0NkH7mDDB3pDyIOg2EZ9i/fkzfRxiquvY
 1Cfhs9kGgPGjG5TFfFwG/XBDEf304eHypwLlUwPCGQXSBi4iLgTVi8V2pfjtn3brMKdw
 Xdcw==
X-Gm-Message-State: AOAM53262r1FnsdjIVyDPDrG51Zht6qB9/0l2nIJ8LAr2qsuyTIxS88U
 4WtezG9BsBUg9qoSqLxOe5o=
X-Google-Smtp-Source: ABdhPJy4+EZNqDhc98GJ7UGzRSXGekPNjSWG4HtF0A8Nj0VApqAotQncU4wsGvPNIsfYdQI1OzY1sg==
X-Received: by 2002:a05:600c:4ca7:: with SMTP id
 g39mr3847605wmp.158.1642710381739; 
 Thu, 20 Jan 2022 12:26:21 -0800 (PST)
Received: from localhost.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.googlemail.com with ESMTPSA id n11sm862919wms.3.2022.01.20.12.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:26:21 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] mtd: core: introduce of support for dynamic partitions
Date: Thu, 20 Jan 2022 21:26:15 +0100
Message-Id: <20220120202615.28076-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220120202615.28076-1-ansuelsmth@gmail.com>
References: <20220120202615.28076-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_122623_881372_ECEC83EF 
X-CRM114-Status: GOOD (  21.73  )
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

We have many parser that register mtd partitions at runtime. One example
is the cmdlinepart or the smem partition where the compatible is defined
in the dts and the partitions gets detected and registered by the
parser. This is problematic for the Nvmem system that requires an of node
to detect nvmem cells. To fix this problem, introduce an additional node
called "dynamic-partitions" that must be defined at the same level of
the "partitions" node that will contain all the required partitions
where a nvmem cell has to be declared. When a mtd_get_of_node() is
called, the function will first check the default dev_of_node() and then
check this alternative partitions node and optionally if a "nvmem-cells"
compatible is detected, sets the of node for the mtd.

The "dynamic-partitions" requires the label set to the mtd name from the
dynamic partition. All the nvmem-cells will be declared in this node and
nvmem will use this node to register the nvmem cells.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c   | 45 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |  6 +-----
 2 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9186268d361b..ccf350337811 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -563,6 +563,51 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
+struct device_node *mtd_get_of_node(struct mtd_info *mtd)
+{
+	struct device_node *dynamic_partitions, *parent_dn, *dn, *mtd_dn = NULL;
+	struct mtd_info *parent;
+	const char *mtd_name;
+	int plen;
+
+	/* Check if mtd has a device node */
+	dn = dev_of_node(&mtd->dev);
+	if (dn)
+		return dn;
+
+	/* Check if a dynamic-partitions node exist */
+	parent = mtd->parent;
+	parent_dn = dev_of_node(&parent->dev);
+	if (!parent_dn)
+		return NULL;
+
+	dynamic_partitions = of_get_compatible_child(parent_dn, "dynamic-partitions");
+	if (!dynamic_partitions)
+		goto exit_parent;
+
+	/* Search if a dynamic partition is defined with the same name */
+	for_each_child_of_node(dynamic_partitions, dn) {
+		mtd_name = of_get_property(dn, "label", &plen);
+		if (!strncmp(mtd->name, mtd_name, plen)) {
+			mtd_dn = dn;
+			break;
+		}
+	}
+
+	if (!mtd_dn)
+		goto exit_partitions;
+
+	/* Set of_node only for nvmem */
+	if (of_device_is_compatible(mtd_dn, "nvmem-cells"))
+		mtd_set_of_node(mtd, mtd_dn);
+
+exit_partitions:
+	of_node_put(dynamic_partitions);
+exit_parent:
+	of_node_put(parent_dn);
+	return mtd_dn;
+}
+
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f5e7dfc2e4e9..f73d65817468 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -464,11 +464,6 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
 		of_property_read_string(np, "label", &mtd->name);
 }
 
-static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
-{
-	return dev_of_node(&mtd->dev);
-}
-
 static inline u32 mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
 {
 	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;
@@ -489,6 +484,7 @@ static inline int mtd_max_bad_blocks(struct mtd_info *mtd,
 				       len);
 }
 
+struct device_node *mtd_get_of_node(struct mtd_info *mtd);
 int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
 			      struct mtd_pairing_info *info);
 int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
-- 
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
