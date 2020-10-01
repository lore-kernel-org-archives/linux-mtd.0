Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFE8C4727E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 20:22:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC9C2074B
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 20:22:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ym+0pyzX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lITzVh8s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC9C2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5TFrpoP7jkGrDD6dAoVki7+x+Zi89N2R7vjUxWLR0XA=; b=ym+0pyzXXo6PqkNQoDycNpwdS
	n/8i2t0bgUH4kySGdjWtG1tYfjs1anRMJY6dfBMeRxRxgwOt/o4S7lC7QjFxkou1auEF7iEJM8BSw
	fQCrq34LztmJzPJI3N4BamNjppbmNZ8I3QZQy7lYRAdARXT0xNdBROa25DnhtHHwXXufBrxlErC/4
	tkyzVjFfS11OuV/PiUNM7i72cHOSRPWgb0lTQh1urY99cuqZkMSQNi94aZOGMSjhFAO8Mc0w2Bb4L
	tQLdIKy3w2yrEkCAACKHN4BNcYS1TYfXgK8GGOoatO4vdhcuudCklQxnWhORTmDxz83Sb26N+YO6P
	uFysYwIug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO55W-0000Qb-R8; Thu, 01 Oct 2020 20:22:03 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO54q-00005a-Oq
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 20:21:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091KLHmk064397;
 Thu, 1 Oct 2020 15:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601583677;
 bh=3OLU5kY6hQ1ebrBh8EISPVDDbO/ZmoE7ZcdUIYFipec=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=lITzVh8sECsnLmh+ad+KQr53u/eJs8i0eqUse0AG2kdAMJ7SkGXUUlynfpci80s3A
 RF8mLANJo6l9pdfwTgnbhJLswcUxQqQt3W0YqtqOBN8lLLmSXzJpA/7/9Dp3JJl4Su
 UYQ45ouKrqsOJAbdX6oj09lftSO2uuBUoERotmY8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091KLHri126847
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 15:21:17 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 15:21:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 15:21:17 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091KKkcO123930;
 Thu, 1 Oct 2020 15:21:14 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 09/15] mtd: spi-nor: Parse SFDP SCCR Map
Date: Fri, 2 Oct 2020 01:50:39 +0530
Message-ID: <20201001202045.21499-10-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001202045.21499-1-p.yadav@ti.com>
References: <20201001202045.21499-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_162120_927306_4D798DA1 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Parse just the 22nd dword and look for the 'DTR Octal Mode Enable
Volatile bit'.

SPI_NOR_IO_MODE_EN_VOLATILE should be set just for the flashes
that don't define the optional SFDP SCCR Map. For the others,
let the SFDP do its job and fill the SNOR_F_IO_MODE_EN_VOLATILE
flag. We avoid this way polluting the flash flags when declaring
one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/sfdp.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b2d097b44a55..3efcba5e629a 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -21,6 +21,10 @@
 #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
 #define SFDP_4BAIT_ID		0xff84  /* 4-byte Address Instruction Table */
 #define SFDP_PROFILE1_ID	0xff05	/* xSPI Profile 1.0 table. */
+#define SFDP_SCCR_MAP_ID	0xff87	/*
+					 * Status, Control and Configuration
+					 * Register Map.
+					 */
 
 #define SFDP_SIGNATURE		0x50444653U
 
@@ -1195,6 +1199,46 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	return ret;
 }
 
+#define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE		BIT(31)
+
+/**
+ * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
+ *                        Map.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @sccr_header:	pointer to the 'struct sfdp_parameter_header' describing
+ *			the SCCR Map table length and version.
+ * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_parse_sccr(struct spi_nor *nor,
+			      const struct sfdp_parameter_header *sccr_header,
+			      struct spi_nor_flash_parameter *params)
+{
+	u32 *dwords, addr;
+	size_t len;
+	int ret;
+
+	len = sccr_header->length * sizeof(*dwords);
+	dwords = kmalloc(len, GFP_KERNEL);
+	if (!dwords)
+		return -ENOMEM;
+
+	addr = SFDP_PARAM_HEADER_PTP(sccr_header);
+	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
+	if (ret)
+		goto out;
+
+	le32_to_cpu_array(dwords, sccr_header->length);
+
+	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
+		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+
+out:
+	kfree(dwords);
+	return ret;
+}
+
 /**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
@@ -1300,6 +1344,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 			err = spi_nor_parse_profile1(nor, param_header, params);
 			break;
 
+		case SFDP_SCCR_MAP_ID:
+			err = spi_nor_parse_sccr(nor, param_header, params);
+			break;
+
 		default:
 			break;
 		}
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
