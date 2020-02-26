Return-Path: <SRS0=a+Ch=4O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C56C4BA0E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631F020732
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PSmbgLwT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="No0k3OIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631F020732
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r04vIFRrlUxpDyS8EdY3I0fxPKvkWrk2QhH1p9V+xfQ=; b=PSmbgLwTpbgg6/
	3ICee1eliv5kpzuHFfcQXIYszUxYBMOmI5zFoQEFBN+LPPIduYSD88CVqZp4Ly96iGrPH2vaK7GWu
	mKAjK0wWJoK6LXX6zzHNmJ2/NbhjEQ94Rd5rdHoorzvG/hWVMXX/juvKuGOAsJgdZ0uqw6AMM9vIC
	h6wVmxHtHo5kPzaFIf4yX2Z7jdCpX2a3365eVruJt3XA1p63oK0M2qcxEOgL+4THbsSYYsHBM6/8/
	oh90hsF6OaBb9ZWdhkLEKwjGDoKFvjkB2X7QyAss1LcgUlymI0pd3TfvnIBnMzw7Id9ZaRWAWgrc5
	zzfpnmlPGrhf+ddJPKuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6tAm-0003px-7A; Wed, 26 Feb 2020 09:40:08 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6t8f-0001Yz-Gc
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2020 09:37:59 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9bpYG048469;
 Wed, 26 Feb 2020 03:37:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582709872;
 bh=f73KydanqCBfpggGnWafdMQaZ6wiesDHl1RvZlVeYSw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=No0k3OIxU014MkfBvJ/fgCEQgTU7Z/CIgPHeLbBZuNxg97HCQabtuGeyb9bWOr/+H
 NBRwuOutUGuYTPlp9TIJ63sj5HHaz5l+8TMVBu76ri4gs1VS+EqUgVtcuc4F55DO+J
 1sLHBaf1ZOvmd1rXzk0+7N8QkkBuz9qMjSA0Imuc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01Q9bpPI119216
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 03:37:51 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 03:37:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 03:37:51 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9b4AF110613;
 Wed, 26 Feb 2020 03:37:47 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 10/11] mtd: spi-nor: enable octal DTR mode when possible
Date: Wed, 26 Feb 2020 15:07:02 +0530
Message-ID: <20200226093703.19765-11-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226093703.19765-1-p.yadav@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_013757_654331_191E3805 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>
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
index 06cfc525260c..fdcc1b4abc3f 100644
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
