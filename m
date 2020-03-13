Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57EAC10DCE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 15:58:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9687D20724
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 15:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYEtST3l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vrhn4KOq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9687D20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZroDa2MxpvMdc22AhU3E61sq3u9RkMQeFL4SnSopGE=; b=MYEtST3lV17zPZ
	6XRakrJXJ0cz4IFsbUMwpGoQVtU8FPX4Gt9I00PQNg+EB+gAvrfjaj93dBz/JH7hj0neokmkqSePx
	qh7uf1ld0b8nc90CHbgf74LCk0jN3/TwuIw236zvYAJhB1nTBr5vnmzK0h0buaXOOzxQ5uRB7TSIs
	DK6Oa472HUlPP3vYdfDO90NpN3q5/8HQkFRdaGd+GcUiA2DULZRYlsxZNmAIPm4i4QY4kPQWoAyVL
	LgMO/FhRN6Jy2ZHFMvMpfok0dw2LJS+5e7ZIWSgIsmVbi36aD335wdQeNXjF8bZgItlmKVJK3JBbZ
	BcjMZ3lH4NMcYhRvmSfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCmhI-0003VV-ER; Fri, 13 Mar 2020 15:58:04 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCmWt-0000AF-NM; Fri, 13 Mar 2020 15:47:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DFlFjf062841;
 Fri, 13 Mar 2020 10:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584114436;
 bh=xUKQWyyZtki5UgUMLBLlKuqvMdom2MNaE665mSjyjPs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vrhn4KOqHMfChsP4pj5i+nJJdcDA+XKDGXzXNpAGtiyrJdiwKKEkYjA48TfvBFgbo
 ZJgKbIpESAdp17uqzJV79nCtSdSMYNYaf6WvB6aUmnvRDW7LJEbWy8Ukn0pCZdiFro
 mFYmjKUcEHzmNnHlqgKnYSD0CM2nZx0SmKV/fnw0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DFlF3V090539
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Mar 2020 10:47:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 10:47:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 10:47:15 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DFkkSK034352;
 Fri, 13 Mar 2020 10:47:12 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
Subject: [PATCH v3 06/12] mtd: spi-nor: get command opcode extension type from
 BFPT
Date: Fri, 13 Mar 2020 21:16:39 +0530
Message-ID: <20200313154645.29293-7-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200313154645.29293-1-p.yadav@ti.com>
References: <20200313154645.29293-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_084719_883346_41A739FF 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some devices in DTR mode expect an extra command byte called the
extension. The extension can either be same as the opcode, bitwise
inverse of the opcode, or another additional byte forming a 16-byte
opcode. Get the extension type from the BFPT. For now, only flashes with
"repeat" and "inverse" extensions are supported.

As of JESD216D.01, BFPT is 20 DWORDs, so update the table size to
reflect that.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9335692e9bcb..91abeb280cd4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -79,11 +79,11 @@ struct sfdp_header {
 /* Basic Flash Parameter Table */
 
 /*
- * JESD216 rev B defines a Basic Flash Parameter Table of 16 DWORDs.
- * They are indexed from 1 but C arrays are indexed from 0.
+ * JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs. They are
+ * indexed from 1 but C arrays are indexed from 0.
  */
 #define BFPT_DWORD(i)		((i) - 1)
-#define BFPT_DWORD_MAX		16
+#define BFPT_DWORD_MAX		20
 
 /* The first version of JESD216 defined only 9 DWORDs. */
 #define BFPT_DWORD_MAX_JESD216			9
@@ -148,6 +148,12 @@ struct sfdp_header {
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
 
+#define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
+#define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
+#define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
+#define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
+#define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
+
 struct sfdp_bfpt {
 	u32	dwords[BFPT_DWORD_MAX];
 };
@@ -3917,6 +3923,24 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EINVAL;
 	}
 
+	/* 8D-8D-8D command extension. */
+	switch (bfpt.dwords[BFPT_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
+	case BFPT_DWORD18_CMD_EXT_REP:
+		nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
+		break;
+
+	case BFPT_DWORD18_CMD_EXT_INV:
+		nor->cmd_ext_type = SPI_NOR_EXT_INVERT;
+		break;
+
+	case BFPT_DWORD18_CMD_EXT_RES:
+		return -EINVAL;
+
+	case BFPT_DWORD18_CMD_EXT_16B:
+		dev_err(nor->dev, "16-bit opcodes not supported\n");
+		return -ENOTSUPP;
+	}
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
 }
 
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
