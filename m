Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37233C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 11:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=495lgiWyynSP8Di1TvHwgIifsmNQ4tRtPDhL9R+tpso=; b=gS4AX181jOkk93
	9ixaqbWczZuDSVMERqSMsCaXoaStyNFbmy3879fnkMq98pe/q+USHoaWXu/niCjwj2aQJSL6whPDU
	jwYz6Z3nTJv2Lg80WNfs60mY8EjHy+5D5HXE51JBYNLGcmjJtkrOsmjA/YgHbVGxFyNYm0JreBwQw
	No2gGO7pSoPlmE8g6FBIoTSBhX4LB7fhCckOm/S96b70glFajO9KMkZYP+XDYI54Ai+mBNJ+RDUh6
	sfa2n4kEjbdqw/e3mESIfcTxTJ7TZwcE6m9DnDr8ZRRP+cUlamQrrmPiPnMLc05AvHEQgGdaGWG7K
	v0KXC50c5ZAP2xlmNgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx6Bs-00DjYn-8G; Tue, 14 Dec 2021 11:41:52 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx6Bp-00DjWL-8U
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 11:41:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 05F2B24000D;
 Tue, 14 Dec 2021 11:41:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 01/13] mtd: nand: ecc: Provide a helper to retrieve a
 pilelined engine device
Date: Tue, 14 Dec 2021 12:41:28 +0100
Message-Id: <20211214114140.54629-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211214114140.54629-1-miquel.raynal@bootlin.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_034149_469163_04CBE160 
X-CRM114-Status: GOOD (  14.87  )
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

In a pipelined engine situation, we might either have the host which
internally has support for error correction, or have it using an
external hardware block for this purpose. In the former case, the host
is also the ECC engine. In the latter case, it is not. In order to get
the right pointers on the right devices (for example: in order to devm_*
allocate variables), let's introduce this helper which can safely be
called by pipelined ECC engines in order to retrieve the right device
structure.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc.c   | 31 +++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
index 078f5ec38de3..5250764cedee 100644
--- a/drivers/mtd/nand/ecc.c
+++ b/drivers/mtd/nand/ecc.c
@@ -699,6 +699,37 @@ void nand_ecc_put_on_host_hw_engine(struct nand_device *nand)
 }
 EXPORT_SYMBOL(nand_ecc_put_on_host_hw_engine);
 
+/*
+ * In the case of a pipelined engine, the device registering the ECC
+ * engine is not necessarily the ECC engine itself but may be a host controller.
+ * It is then useful to provide a helper to retrieve the right device object
+ * which actually represents the ECC engine.
+ */
+struct device *nand_ecc_get_engine_dev(struct device *host)
+{
+	struct platform_device *ecc_pdev;
+	struct device_node *np;
+
+	/*
+	 * If the device node contains this property, it means we need to follow
+	 * it in order to get the right ECC engine device we are looking for.
+	 */
+	np = of_parse_phandle(host->of_node, "nand-ecc-engine", 0);
+	if (!np)
+		return host;
+
+	ecc_pdev = of_find_device_by_node(np);
+	if (!ecc_pdev) {
+		of_node_put(np);
+		return NULL;
+	}
+
+	platform_device_put(ecc_pdev);
+	of_node_put(np);
+
+	return &ecc_pdev->dev;
+}
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index b617efa0a881..615b3e3a3920 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -309,6 +309,7 @@ struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand);
 struct nand_ecc_engine *nand_ecc_get_on_die_hw_engine(struct nand_device *nand);
 struct nand_ecc_engine *nand_ecc_get_on_host_hw_engine(struct nand_device *nand);
 void nand_ecc_put_on_host_hw_engine(struct nand_device *nand);
+struct device *nand_ecc_get_engine_dev(struct device *host);
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
 struct nand_ecc_engine *nand_ecc_sw_hamming_get_engine(void);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
