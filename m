Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D77CC352A3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 13:36:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C40A2070A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 13:36:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qFKacuNg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F4oEmxra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C40A2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpH7GkOFwp5N6naGi7KLGZ8QYYPqoc535fL41X5PBQk=; b=qFKacuNguVWEvA
	eMz/kAaYDjrqzdyy1mCurMqpf1jWqdql9SHJt5FCHGrtdMP+77cqFNKmXM1ogdZgJTq56naAHQkHv
	5Otme6/rdzHcIFJjS4UOr93rTtLL2PY2+2pmrFfqX3n8Gk++6N9p1T5Tjie63Pp26klMm68thAmhS
	pglKmsqJtFpzQ4aGIL9yngofIQWfKp0UNl/JvqKfGmp3YbKe9zBy/S6gQ3l3diZBe5fPbFCGU+Tzg
	M+hTxYPK+7Xxdbfftugai0bcfsnq6EWWrn874xrZ15r+CusRIBgYRRHnBTXurM5W2N6nRGGc6ZgBE
	kWLucsqRyygtW+L1g1pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1ViB-0006yo-Ck; Tue, 11 Feb 2020 13:36:23 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1VgC-0003zu-M2
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 13:34:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BDYHM6081314;
 Tue, 11 Feb 2020 07:34:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581428057;
 bh=uph6/UcIHt9z8rABEAc01MlASAJTmys1NAaWJsZWtv8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=F4oEmxranMcfV/L34cJ3Cj1RaNVNRSt2Pq4YrMMyGCEpaWjbNDgPS7bfZ0zMdOsAk
 rg4hNgPZaTSVHd1a69zER0b4896ah368DspeXH5mdmbWcJXTe4b3O2pIoVq2LJxFDa
 3DheH58y/8p7Q2lEQzrsSh//en86q+6WgB+pslSg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BDYHcX062505
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Feb 2020 07:34:17 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 07:34:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 07:34:17 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BDXm5P087522;
 Tue, 11 Feb 2020 07:34:14 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 8/9] mtd: spi-nor: enable octal DTR mode when possible
Date: Tue, 11 Feb 2020 19:03:47 +0530
Message-ID: <20200211133348.15558-9-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211133348.15558-1-p.yadav@ti.com>
References: <20200211133348.15558-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_053420_825471_E53C273A 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: Sekhar Nori <nsekhar@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Allow flashes to specify a hook to enable octal DTR mode. Use this hook
whenever possible to get optimal transfer speeds.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 31 +++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8c5d7bfa4f16..78e3475fa2a9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -5184,6 +5184,31 @@ static void spi_nor_init_params(struct spi_nor *nor)
 	spi_nor_late_init_params(nor);
 }
 
+/** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
+ * @nor:                 pointer to a 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_octal_dtr_enable(struct spi_nor *nor)
+{
+	int ret;
+
+	if (!nor->params.octal_dtr_enable)
+		return 0;
+
+	if (!(spi_nor_get_protocol_width(nor->read_proto) == 8 ||
+	      spi_nor_get_protocol_width(nor->write_proto) == 8))
+		return 0;
+
+	ret = nor->params.octal_dtr_enable(nor);
+	if (ret)
+		return ret;
+
+	nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
+
+	return 0;
+}
+
 /**
  * spi_nor_quad_enable() - enable Quad I/O if needed.
  * @nor:                pointer to a 'struct spi_nor'
@@ -5223,6 +5248,12 @@ static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
+	err = spi_nor_octal_dtr_enable(nor);
+	if (err) {
+		dev_dbg(nor->dev, "octal mode not supported\n");
+		return err;
+	}
+
 	err = spi_nor_quad_enable(nor);
 	if (err) {
 		dev_dbg(nor->dev, "quad mode not supported\n");
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f54dbd0f86ab..c653f6713cfc 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -526,6 +526,7 @@ struct spi_nor_locking_ops {
  *                      higher index in the array, the higher priority.
  * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
  *                      Table.
+ * @octal_dtr_enable:	enables SPI NOR octal DTR mode.
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte:		puts the SPI NOR in 4 byte addressing mode.
  * @convert_addr:	converts an absolute address into something the flash
@@ -549,6 +550,7 @@ struct spi_nor_flash_parameter {
 
 	struct spi_nor_erase_map        erase_map;
 
+	int (*octal_dtr_enable)(struct spi_nor *nor);
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
