Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FFAC54EE9
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Y1pBUacgKZkL19apA5zunGhVlmYWHq4uJHGnIEyIbs=; b=VAYOONLtX0Jv5f
	iMGtiqQO2RTHvBS4sC5ESh5IVGw4r/qLM+gJ5C99EZ02nUim38Tsm0WAPhDhANzKO6rXk9wvY8AyC
	5zp+4CWVceH4RwAtLQwD6No0LvamPYhK1jcU4tc8TD/bTSjvM51CSAwJwVskyEhInlMaVAapmXczS
	WcMlekqA+4r5oex9tBksxeZDOdfZwZ0YOmxDLmBO7h4J7QjOEtgP2vQit2JbHlBQ9yszfxldd1ZwO
	bGxIk3mbcQrN+EjCSRNpAJYtLo0KmjeNsjjns1OGGemNEF3D6p25XqQuBN0VF6h9NwuKtE707WH/y
	8TnxOJZrAvVcPnMdvAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTshB-00FMEH-KD; Thu, 01 Sep 2022 22:29:57 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWv-00FEfA-Q6; Thu, 01 Sep 2022 22:19:25 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 866DC21EE;
	Fri,  2 Sep 2022 00:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5Tm5NgUjgsDKZgk1Ba857CClebez+/VRvwjllvM7EA=;
	b=QNDnFCwPPEMrDdiAIZjnc2qr2trT/+wfriMAeCUHW8mtz+WDlqDTeANWBO5gS1DNDamyve
	Tp5PzhSInvwBAkzYfDxM5PFGHVSl/bf/5TkQpiy6w2YZsI1qflDNntb8pCRFNw1IE6A8yE
	sPHs7j77+ii7LMYbjX8bs2sSA/W98qdJ8o2gDqoQlglj2kdIsZnPDYICFeyXo98Yy0zR31
	cNGc4SChoh1TGv8urKq891kNEjdcQ4ToUHFXbNkv+4O1vIVPOrSOfj3cE1uPFBO28p+f0f
	y02dgjpM1Qc74ll54vCguJEHlx0Htq1ryuPWzebjdyjTY1hHwUZEn1bh9Eeuow==
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
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 10/20] nvmem: core: allow to modify a cell before adding it
Date: Fri,  2 Sep 2022 00:18:47 +0200
Message-Id: <20220901221857.2600340-11-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151922_088204_D5F23594 
X-CRM114-Status: GOOD (  13.97  )
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

Provide a way to modify a cell before it will get added. This is useful
to attach a custom post processing hook via a layout.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - new patch

 drivers/nvmem/core.c           | 4 ++++
 include/linux/nvmem-provider.h | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 02d0a7099d9a..3b65512762b9 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -693,6 +693,7 @@ static int nvmem_validate_keepouts(struct nvmem_device *nvmem)
 
 static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
 {
+	struct nvmem_layout *layout = nvmem->layout;
 	struct device *dev = &nvmem->dev;
 	struct nvmem_cell_entry *cell;
 	struct device_node *child;
@@ -729,6 +730,9 @@ static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
 
 		info.np = of_node_get(child);
 
+		if (layout && layout->fixup_cell_info)
+			layout->fixup_cell_info(nvmem, layout, &info);
+
 		ret = nvmem_add_one_cell(nvmem, &info);
 		kfree(info.name);
 		if (ret) {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index cb488b338d6f..9cb340764b89 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -157,6 +157,8 @@ struct nvmem_cell_table {
  * @add_cells:		Will be called if a nvmem device is found which
  *			has this layout. The function will add layout
  *			specific cells with nvmem_add_one_cell().
+ * @fixup_cell_info:	Will be called before a cell is added. Can be
+ *			used to modify the nvmem_cell_info.
  * @owner:		Pointer to struct module.
  * @node:		List node.
  *
@@ -170,6 +172,9 @@ struct nvmem_layout {
 	const struct of_device_id *of_match_table;
 	int (*add_cells)(struct device *dev, struct nvmem_device *nvmem,
 			 struct nvmem_layout *layout);
+	void (*fixup_cell_info)(struct nvmem_device *nvmem,
+				struct nvmem_layout *layout,
+				struct nvmem_cell_info *cell);
 
 	/* private */
 	struct module *owner;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
