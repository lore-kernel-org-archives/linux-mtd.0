Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C51C4727F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 10:00:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A2B9206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 10:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BoDu3+q5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SpTj1Sn5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A2B9206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gKP51Wq1Oyhb5PphZPnXl+1hxcMASx+Zy38/w4qmZFY=; b=BoDu3+q5cHV0RIcerh1ZiJzbh
	sexYLHCMbejMe/60ZZRg6Qohzato5Ke0W9RtePOUOPpE+T/sxEOOdhbl6/WvJdwiWkW2uO3mlbrVm
	xWqr0bFumSygLu8sMO5N0Cxpy8h9WcXrlDp8NcLcfE07s3T0jLJznduVRLNx/cVFi8z/3uxIOCgsN
	cItF4JXQZqwW0mCom5eaePNHVJSb5Sn1kHWXmoCnPjPnrDJja1Mr6nV6XAZoUEbXhoNL2O7cyATRA
	GIQHWrpvBh2Ay0/EsLDftS31/CAd+5uX+cEiKEU0xpS6fQXPJ+n+lZksa+ploFeujSabWbkar+KzS
	bE9bkAqwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNCQf-00040W-1L; Tue, 29 Sep 2020 10:00:13 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNCQV-0003yF-6L
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 10:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601373602; x=1632909602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PbCfDU0S2s2udnRqZm0ylD87jZbPya712ODwCNDxOrw=;
 b=SpTj1Sn5XIsLDH+hJ0UcS0T/KC6fXxRtLTx719VnXe7xG/M9sRcexsoy
 DJq4z30lg3WGdTe3scCcFW1cy0/WnvDEW26wOZQ930zLmBSfjFUAXTQ+t
 mIT+Kn1pwxNol0DJgEmTBqPRWkGiv0fB5Nao8WblU+5+hAhh2sqYSQz/C
 xHDCytLfR99ywyhjimAJHmo/JyeTy8i6WBQmx767uGR/WHwYtM7dEeS/B
 XJzMyemJi9R2cY0yU3eqogsUEU7aT+9GNHuCqMPkhQS2C1kOHxTpP7NPi
 ODlcdYWVQnZkH5bPxzLKND6eLzkl6YJjreIPFJ+gESBTY40QWVoevtNbn A==;
IronPort-SDR: SHRISkPzNj7otgVw8fP3mtayUWwfa2zCqYpnxcM9aShRXeOYE7CL7yyaE+9dSybKTlVtMtWwbs
 3SYAoVYoEhMPgXbSA/+/SAOLgiVSlMoFWSTFVRiS/Q+zi5FQShDIeu94vNeu660C42kcMUf7BJ
 R171Toh7cyjsPcIvuHQv+rUChnbDImtyvOqaEuHLG5Q7plTI8YlJw50oWAFq/C+a6WzcPUN2hX
 unABIzFmivIdsh9PBNZlWCrNzDRS6lRwwV195bPZYbKjWBctqYkBvv5wNLW6vodzK3dM325Jyz
 zz8=
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="28034382"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 03:00:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 03:00:00 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 29 Sep 2020 02:59:49 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <vigneshr@ti.com>, <boris.brezillon@collabora.com>
Subject: [RFC PATCH 3/3] mtd: spi-nor: Parse SFDP SCCR Map
Date: Tue, 29 Sep 2020 12:59:51 +0300
Message-ID: <20200929095951.1575658-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929095951.1575658-1-tudor.ambarus@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200929095951.1575658-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_060003_432975_1C96E5F4 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Parse just the 22nd dword and look for the 'DTR Octal Mode Enable
Volatile bit'.

SPI_NOR_IO_MODE_EN_VOLATILE should be set just for the flashes
that don't define the optional SFDP SCCR Map. For the others,
let the SFDP do its job and fill the SNOR_F_IO_MODE_EN_VOLATILE
flag. We avoid this way polluting the flash flags when declaring
one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/sfdp.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index f192710aca31..7bca64cbba02 100644
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
 
@@ -1199,6 +1203,50 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
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
+	u8 io_mode_en_volatile;
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
+	io_mode_en_volatile = FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
+					dwords[22]);
+
+	if (io_mode_en_volatile)
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
@@ -1304,6 +1352,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
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
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
