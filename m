Return-Path: <SRS0=a+Ch=4O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B28C4BA10
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:37:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E856F24653
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+0EjFzP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K6EPpPzR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E856F24653
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qk4+atP/L2xGHzOWMh5reHVM122HCx79uNMe5Gd8YfA=; b=g+0EjFzPS84Fhs
	R4rdv10F8nsubS6ZcatvgtYL9gvKKoobpdrvFc0krJP9AyUwtIwUePGOb+PmTH05NmDYj6R7LgM7q
	oVeB4otqlPJ9V4Yq5uRxYWXk7ybaJDOyfVSlsXR8Uo98HPYbXtCaP9BMBm7ectWhhdwQxUlnCB3j1
	old/zKb0uKXY0JBZS/GL1nQjsjp0Qz3CiUxJG3nz4bV3mp2oAP4Xf+EM2TiqYaQ32YDQ48WdhPF7u
	WHrUNqyvBZLj6mrV035mvBPTGMO8RvxHN0jIQ09+tuufWD1V3HtOwNywsh+oR9Y3Wp6dkmsi6ecGb
	1dqvcYkwdDf2QS+v1/kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6t8J-0001Cy-PO; Wed, 26 Feb 2020 09:37:35 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6t87-00012y-Lk
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2020 09:37:25 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9bHK2087084;
 Wed, 26 Feb 2020 03:37:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582709837;
 bh=/RvMu+KBpcqEDFVBnIWtjiFPQ2qCDkAs2AiQIuWdFws=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=K6EPpPzRPSk4gsirOoI1fBp5truy0/o8R/d1P37k3XGPD9cbcVIhzmmEkU8XA4UO8
 XCt4AtdJCY4rouVI64SzqfNU6w30qSYbkkVpf11Yo8Xoyi855W2yZMYDaIwCCOGMQc
 wJ/3zOV6EfUHDvbLVapgTz2frUoo/TmTXEqezsNI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01Q9bHVR118717
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 03:37:17 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 03:37:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 03:37:17 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9b4A7110613;
 Wed, 26 Feb 2020 03:37:13 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 02/11] spi: set mode bits for "spi-rx-dtr" and "spi-tx-dtr"
Date: Wed, 26 Feb 2020 15:06:54 +0530
Message-ID: <20200226093703.19765-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226093703.19765-1-p.yadav@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_013723_793589_FEC7083C 
X-CRM114-Status: GOOD (  13.96  )
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

These two DT properties express DTR receive and transmit capabilities of
a SPI flash and controller. Introduce two new mode bits: SPI_RX_DTR and
SPI_TX_DTR which correspond to the new DT properties. Set these bits
when the two corresponding properties are present in the device tree.
Also update the detection of unsupported mode bits to include the new
bits.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/spi/spi.c       | 10 +++++++++-
 include/linux/spi/spi.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 38b4c78df506..25c8ed9343f9 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1927,6 +1927,13 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 		}
 	}
 
+	/* Device DTR mode. */
+	if (of_property_read_bool(nc, "spi-tx-dtr"))
+		spi->mode |= SPI_TX_DTR;
+
+	if (of_property_read_bool(nc, "spi-rx-dtr"))
+		spi->mode |= SPI_RX_DTR;
+
 	if (spi_controller_is_slave(ctlr)) {
 		if (!of_node_name_eq(nc, "slave")) {
 			dev_err(&ctlr->dev, "%pOF is not called 'slave'\n",
@@ -3252,7 +3259,8 @@ int spi_setup(struct spi_device *spi)
 		bad_bits &= ~SPI_CS_HIGH;
 	ugly_bits = bad_bits &
 		    (SPI_TX_DUAL | SPI_TX_QUAD | SPI_TX_OCTAL |
-		     SPI_RX_DUAL | SPI_RX_QUAD | SPI_RX_OCTAL);
+		     SPI_RX_DUAL | SPI_RX_QUAD | SPI_RX_OCTAL |
+		     SPI_TX_DTR  | SPI_RX_DTR);
 	if (ugly_bits) {
 		dev_warn(&spi->dev,
 			 "setup: ignoring unsupported mode bits %x\n",
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 6d16ba01ff5a..bf1108318389 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -183,6 +183,8 @@ struct spi_device {
 #define	SPI_TX_OCTAL	0x2000			/* transmit with 8 wires */
 #define	SPI_RX_OCTAL	0x4000			/* receive with 8 wires */
 #define	SPI_3WIRE_HIZ	0x8000			/* high impedance turnaround */
+#define SPI_RX_DTR	0x10000			/* receive in DTR mode */
+#define SPI_TX_DTR	0x20000			/* transmit in DTR mode */
 	int			irq;
 	void			*controller_state;
 	void			*controller_data;
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
