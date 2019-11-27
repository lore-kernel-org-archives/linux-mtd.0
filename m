Return-Path: <SRS0=A63j=ZT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B003CC432C0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2019 10:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7610A206BF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2019 10:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFfvQofY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7610A206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMz2lnL1aNB0BIJV4Kj+jrix9N8c3bRpZ/GVgfaKaHk=; b=RFfvQofYOp8H+t
	thW9c5LIs2RDXZMR0EpVWYNxuprc6i+P5lVyW8O6AzoReLUoU7dpGstMkxCcblsXm0DqOXfymz+c0
	48Kxgh2bM7q3q7BIGwUinMJ9n5LlnGW4DwO2GTgimUqvI1q2fIRGc1WjkNc//po4CGSSMmtpyxrUL
	vRHcIA6sLcU2ZqfiYo9v6kydQZvEqhS6/VmjfG/aYL4x8MOhgOElvhVyOj2QOArngri8K7T4w+Vs9
	S1Jbq4bfAe+fBqJxI38quRjp6tgcrAnrbOgRyNuJaPMbladbYv3UaizbbSQGUAltSWWiY0cRoxLVq
	3BD9l9q1Gba9qYw/obWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZuyv-0003C7-Ca; Wed, 27 Nov 2019 10:55:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZuys-00039d-3E
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2019 10:55:36 +0000
X-Originating-IP: 90.76.211.102
Received: from localhost.localdomain (lfbn-1-2154-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 47898FF808;
 Wed, 27 Nov 2019 10:55:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 3/4] mtd: Add get_mtd_device_by_node() helper
Date: Wed, 27 Nov 2019 11:55:21 +0100
Message-Id: <20191127105522.31445-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127105522.31445-1-miquel.raynal@bootlin.com>
References: <20191127105522.31445-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_025534_274287_30F42D3F 
X-CRM114-Status: GOOD (  10.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bernhard Frauendienst <kernel@nospam.obeliks.de>

Add an helper to retrieve a MTD device by its OF node. Since drivers can
assign arbitrary names to MTD devices in the absence of a 'label' DT
property, there is no other reliable way to retrieve a MTD device for a
given OF node.

Signed-off-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
[<miquel.raynal@bootlin.com>: light internals rework]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c   | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 76b4264936ff..5a94a2c0a6de 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -985,6 +985,44 @@ struct mtd_info *get_mtd_device_nm(const char *name)
 }
 EXPORT_SYMBOL_GPL(get_mtd_device_nm);
 
+/**
+ *	get_mtd_device_by_node - obtain a validated handle for an MTD device
+ *	by of_node
+ *	@of_node: OF node of MTD device to open
+ *
+ *	This function returns an MTD device structure in case of success,
+ *	an error code otherwise.
+ */
+struct mtd_info *get_mtd_device_by_node(const struct device_node *of_node)
+{
+	struct mtd_info *mtd;
+	bool found = false;
+	int ret;
+
+	mutex_lock(&mtd_table_mutex);
+
+	mtd_for_each_device(mtd) {
+		if (of_node == mtd->dev.of_node) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found)
+		ret = __get_mtd_device(mtd);
+
+	mutex_unlock(&mtd_table_mutex);
+
+	if (!found)
+		return ERR_PTR(-ENODEV);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return mtd;
+}
+EXPORT_SYMBOL_GPL(get_mtd_device_by_node);
+
 void put_mtd_device(struct mtd_info *mtd)
 {
 	mutex_lock(&mtd_table_mutex);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 677768b21a1d..0f25c476a1a3 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -573,6 +573,8 @@ extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);
 extern struct mtd_info *get_mtd_device_nm(const char *name);
+extern struct mtd_info *get_mtd_device_by_node(
+		const struct device_node *of_node);
 extern void put_mtd_device(struct mtd_info *mtd);
 
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
