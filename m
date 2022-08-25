Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D99ECAAA3
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 21:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBxTvQu/GtGHEEdW/3Q43Ul/a1Q3k8oZEav4+DilD/Y=; b=sC2Gvl2n/uwvp+
	g8hTiUeXzb09fnuDcgGSSZfT5stQXv31g6OlFTPB924vILs4AFbJcsuDVvgfoohoxdimQb676pGkZ
	04p/ueQj+umwQ2xwOQyMlAtxmrLXiizXTlv0cPmblT6HXgpIi71QoufKrWgEhsRyRO9s9drr9AOmU
	CXfCWafWzx10U94b8AJWG7Cn47o1ROHZ8JAeBAoSaOtP2B0sdTfC1aCYL6yWs8yLz+Krg92CuhzzF
	Gxsfi8P27R4ZNfJ+DmRUW1Yf7W0m7Ba3jEIwsBKL6+NIRmu76LrO0xaxFbV8Nal1HfeWMBV0zaa+c
	J39so3WfAbnY9Vf+nqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKkL-003anL-Qx; Thu, 25 Aug 2022 21:50:41 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKeZ-003XU0-Ae; Thu, 25 Aug 2022 21:44:46 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BB5DD7F32;
	Thu, 25 Aug 2022 23:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661463879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jY0emPBT4127OBFcH8ITuFxvYnQvmd4PIUnzlT5RAgU=;
	b=dnt/7z9E1egCRFkcjvLveYq3F/v3s9AVVV2A4i8MWA4kJKWtWOP1G1C1qeQs5mwLopjEyN
	RWXPYRhEb3gx1qz0zByKEtttXf5TMfRsQVoAqGGHjc0aSXsr+ZD3QtwskWWrrl80Sej2OP
	O2s+M/zm/OPyHifOJwtuqrqW4ZxQb8Du0hEf+6WUYb5RaG2GvM+coYmk71dSb/c+DajxYS
	CASbw2FCRraHbxzF7Ie3T+lEHesRQEjw70Tncwq9BdnFSrA8fZ8Htd/3E572Oi38BD8Dw3
	zwUqz7QQcCfv7iWqE/uNeXvJXJpaPRLT20tvDu678oeeDAe5aDDQ8f0J9lwzMw==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v1 05/14] nvmem: core: add nvmem_add_one_cell()
Date: Thu, 25 Aug 2022 23:44:14 +0200
Message-Id: <20220825214423.903672-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825214423.903672-1-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_144443_586752_3B692FFF 
X-CRM114-Status: GOOD (  18.55  )
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

Add a new function to add exactly one cell. This will be used by the
nvmem layout drivers to add custom cells. In contrast to the
nvmem_add_cells(), this has the advantage that we don't have to assemble
a list of cells on runtime.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/nvmem/core.c           | 58 ++++++++++++++++++++--------------
 include/linux/nvmem-provider.h |  5 +++
 2 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index be38e62fd190..3dfd149374a8 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -501,6 +501,35 @@ static int nvmem_cell_info_to_nvmem_cell_entry(struct nvmem_device *nvmem,
 	return 0;
 }
 
+/**
+ * nvmem_add_one_cell() - Add one cell information to an nvmem device
+ *
+ * @nvmem: nvmem device to add cells to.
+ * @info: nvmem cell info to add to the device
+ *
+ * Return: 0 or negative error code on failure.
+ */
+int nvmem_add_one_cell(struct nvmem_device *nvmem,
+		       const struct nvmem_cell_info *info)
+{
+	struct nvmem_cell_entry *cell;
+	int rval;
+
+	cell = kzalloc(sizeof(*cell), GFP_KERNEL);
+	if (!cell)
+		return -ENOMEM;
+
+	rval = nvmem_cell_info_to_nvmem_cell_entry(nvmem, info, cell);
+	if (rval) {
+		kfree(cell);
+		return rval;
+	}
+
+	nvmem_cell_entry_add(cell);
+
+	return 0;
+}
+
 /**
  * nvmem_add_cells() - Add cell information to an nvmem device
  *
@@ -514,34 +543,15 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
 		    const struct nvmem_cell_info *info,
 		    int ncells)
 {
-	struct nvmem_cell_entry **cells;
-	int i, rval = 0;
-
-	cells = kcalloc(ncells, sizeof(*cells), GFP_KERNEL);
-	if (!cells)
-		return -ENOMEM;
+	int i, rval;
 
 	for (i = 0; i < ncells; i++) {
-		cells[i] = kzalloc(sizeof(**cells), GFP_KERNEL);
-		if (!cells[i]) {
-			rval = -ENOMEM;
-			goto out;
-		}
-
-		rval = nvmem_cell_info_to_nvmem_cell_entry(nvmem, &info[i], cells[i]);
-		if (rval) {
-			kfree(cells[i]);
-			goto out;
-		}
-
-		nvmem_cell_entry_add(cells[i]);
+		rval = nvmem_add_one_cell(nvmem, &info[i]);
+		if (rval)
+			return rval;
 	}
 
-out:
-	/* remove tmp array */
-	kfree(cells);
-
-	return rval;
+	return 0;
 }
 
 /**
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 8f964b394292..e710404959e7 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -138,6 +138,9 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
 void nvmem_add_cell_table(struct nvmem_cell_table *table);
 void nvmem_del_cell_table(struct nvmem_cell_table *table);
 
+int nvmem_add_one_cell(struct nvmem_device *nvmem,
+		       const struct nvmem_cell_info *info);
+
 #else
 
 static inline struct nvmem_device *nvmem_register(const struct nvmem_config *c)
@@ -155,6 +158,8 @@ devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
 
 static inline void nvmem_add_cell_table(struct nvmem_cell_table *table) {}
 static inline void nvmem_del_cell_table(struct nvmem_cell_table *table) {}
+static inline int nvmem_add_one_cell(struct nvmem_device *nvmem,
+				     const struct nvmem_cell_info *info) {}
 
 #endif /* CONFIG_NVMEM */
 #endif  /* ifndef _LINUX_NVMEM_PROVIDER_H */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
