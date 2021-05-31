Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA77C47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A0961263
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22A0961263
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/khJ9WD2kRMI+JyyCaUQvi0V2719si8HFROA9ured4I=; b=sZwEaY+gzh2ai/
	i+r+TiSWxm6NDXrKUPlfYJS7mEbPbYKhhcjTHZBPRLYiBDN23TXMy7jBRB4YOHqvKHSLXmC0KnnCH
	4c+wLSAeyK7kn7mbOJ/xHy44WwG1PA7hBtKaBsYdS44+P5gVypVOzfXS5X4INi0qjsl8TIz0jFqxg
	swm3fYcMvgvgIL9fzPXfJQbnS/WgAsSVtnK876gOjGIWW337z/bvmntgLMM28TqDUtTAWOmBL0uYg
	F9opfSU4CSMH6W+vkmj88Y8yv9Dq3lL0vgRcerQXVgqzV59309QhY24zrMxU/PnMtgb7jy/+kRMT5
	ZF1Lzx9OgjTy/MaqrxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnmV3-00D5lb-SV; Mon, 31 May 2021 18:18:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnmUR-00D5Xo-8q
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 18:18:16 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14VIIBe6078827;
 Mon, 31 May 2021 13:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622485091;
 bh=2P6h+Cn1wigbjU0SweqZ2o3rK+yNJ2zH7aHpS7XP2nM=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=AR2ISRJ1FM6/iAr8zkvIT2zp4KRfm4NpYiWXs8qABA5tLtucLsLZA4dvfV5cUmR+J
 fxa9d3rJZYE5ebIAhsIynCxT/h94PFKrooOsMT+ewZrmEz5V4XRGozvzh6tWGRROmL
 0NUSpzvyiB8knI/Dljb4ZhO6qtCJdm9wH6k3n19U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14VIIB5P104398
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 May 2021 13:18:11 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 13:18:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 31 May 2021 13:18:11 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14VIHwdI118543;
 Mon, 31 May 2021 13:18:08 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH v2 3/6] mtd: spi-nor: micron-st: write 2 bytes when disabling
 Octal DTR mode
Date: Mon, 31 May 2021 23:47:54 +0530
Message-ID: <20210531181757.19458-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210531181757.19458-1-p.yadav@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_111815_415943_58BF8544 
X-CRM114-Status: GOOD (  18.84  )
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

The Octal DTR configuration is stored in the CFR0V register. This
register is 1 byte wide. But 1 byte long transactions are not allowed in
8D-8D-8D mode. The next byte address contains the CFR1V register, which
contains the number of dummy cycles. This is very fortunate since the
enable path changes the value of this register. Reset the value to its
default when disabling Octal DTR mode. This way, both changes to the
flash state made when enabling can be reverted in one single
transaction.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

(no changes since v1)

 drivers/mtd/spi-nor/micron-st.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..e49bb2f142b3 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -13,6 +13,7 @@
 #define SPINOR_OP_MT_WR_ANY_REG	0x81	/* Write volatile register */
 #define SPINOR_REG_MT_CFR0V	0x00	/* For setting octal DTR mode */
 #define SPINOR_REG_MT_CFR1V	0x01	/* For setting dummy cycles */
+#define SPINOR_REG_MT_CFR1V_DEF	0x1f	/* Default dummy cycles */
 #define SPINOR_MT_OCT_DTR	0xe7	/* Enable Octal DTR. */
 #define SPINOR_MT_EXSPI		0xff	/* Enable Extended SPI (default) */
 
@@ -48,17 +49,28 @@ static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	if (ret)
 		return ret;
 
-	if (enable)
-		*buf = SPINOR_MT_OCT_DTR;
-	else
-		*buf = SPINOR_MT_EXSPI;
+	if (enable) {
+		buf[0] = SPINOR_MT_OCT_DTR;
+	} else {
+		/*
+		 * The register is 1-byte wide, but 1-byte transactions are not
+		 * allowed in 8D-8D-8D mode. The next register is the dummy
+		 * cycle configuration register. Since the transaction needs to
+		 * be at least 2 bytes wide, set the next register to its
+		 * default value. This also makes sense because the value was
+		 * changed when enabling 8D-8D-8D mode, it should be reset when
+		 * disabling.
+		 */
+		buf[0] = SPINOR_MT_EXSPI;
+		buf[1] = SPINOR_REG_MT_CFR1V_DEF;
+	}
 
 	op = (struct spi_mem_op)
 		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
 			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
 					   SPINOR_REG_MT_CFR0V, 1),
 			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
 
 	if (!enable)
 		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
