Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8ECC3F2CF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 04:39:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22F73246A3
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 04:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSp/nJ4O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgFIB8G5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22F73246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyYpLqlS99ynr61jygkOB2nnP/ZQBee2DR4+9LyQnak=; b=dSp/nJ4Ouax3JS
	m9lVNaxTBWQz5yzixWqU9n0AAvaU9IXLbx6u4/fj6wSAqlyWhCvvjKJ1SHTqov3y+shcD1t1SQEu2
	wI5rTQXbIfzppbvTVj6+ZJd+/wIItkb64+/f57Yuf7yfjBZjaT5mRiLhih18Fg2Cyb2Wnmo/owtPZ
	fmxmRZlHIsIOeEiXaSj1G4oJuEKbXtQ7JAkn26zWoUq5RfOsNBBKeyyExHGl5XSz4OvEAiXU+93u0
	3Z2wW/ppeSbR462ar75wtNPR+bTzZCFOLiFZyQxh7+ASIU61p69W8AqnFS0C4p1AP/Ni7gRzU8XPJ
	cbxXlAsl1NmGaGxzccRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7XQU-0000em-TX; Fri, 28 Feb 2020 04:39:02 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7XQ4-0000Dm-NO; Fri, 28 Feb 2020 04:38:38 +0000
Received: by mail-pg1-x543.google.com with SMTP id 7so849786pgr.2;
 Thu, 27 Feb 2020 20:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QCI1h6XDepXvM9SY2yPFBOaTm7J4GLR1VLmmf1BO1BQ=;
 b=hgFIB8G5XahI8txUYsDG5MShh+0AatjMli8EcASbn9w8027Uc/WNZUIeppsDE5nxwu
 8k1V9RFPmVegaSjuOx5NqPNXyhYFevqXge3mJywpLSUkweXuhEEPympdpxPUfv4+hb7M
 yVr3nweqvyatKHlLAGD5cGjE6180bkWLkRKuZ8d+BlAN7LXt6IsJ7ZOMRZy65LpEx7Ui
 S718KkrhH+sJwpIEeL74ndAs5kA5oN9ZUNx2dNeEdTEWXtc6ryrHznrwd0AtPIkTM4Sl
 YduGSO7MjAqAtPPPGBwrs4jG57l+x4oS+9uKRGtDuTu/gKF8UiMV8AVR31WyIdX3Axb3
 SM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QCI1h6XDepXvM9SY2yPFBOaTm7J4GLR1VLmmf1BO1BQ=;
 b=Lqt4KDgwMMqQbkshgAsAW0b7uMoKv7JPbmXI8LDsrHohdN8pVIdqhy44SdHNvl+E/t
 fO2jC2Dg4HD8qkiCJ/lVmF4Lo4Fpx2MqO8geoLwlDbP2pYjHc9i6mq0uP9fiTclJ8Q7x
 9YbxrmzXpE6WKdRM7rO7VMKACuosc4GNnpSpVUDm4xxEBJ+Ebkn2DuahyLyT8eAUhJb9
 1byGKailet3g6//KNEfnr8DKq5U9MJp6GSbKXQ56hiFRgCv6Ir7w4KC5aFowJ3nmotWL
 dGdFKwWKhO5R5B5twgs3dX4rGpWJSQrPSpD89hy5ntVS+iwfE/gZ9Zh1LYkX73XlV/TA
 g+WA==
X-Gm-Message-State: APjAAAVej5dtX++V04Q392hfwpOz3MRaYj7iGpg5Qp4WHm6W1sLFSmb1
 +T88kooniK2B3OU8YRWMThss1apb3zSe9JxC
X-Google-Smtp-Source: APXvYqyZ42VI70e6J50zsTaVBDtxBfufPRxVENg+DF+2e5lxd6dM8CgG2DAIqrDLFaRgxCHGRfp6tQ==
X-Received: by 2002:a62:7681:: with SMTP id r123mr2516296pfc.169.1582864715674; 
 Thu, 27 Feb 2020 20:38:35 -0800 (PST)
Received: from localhost.localdomain ([240e:379:962:6595:7b84:9990:1a82:371c])
 by smtp.gmail.com with ESMTPSA id
 196sm9069047pfy.86.2020.02.27.20.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 20:38:35 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] spi: make spi-max-frequency optional
Date: Fri, 28 Feb 2020 12:36:33 +0800
Message-Id: <20200228043636.559915-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200228043636.559915-1-gch981213@gmail.com>
References: <20200228043636.559915-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_203836_815683_7F45BBA4 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We only need a spi-max-frequency when we specifically request a
spi frequency lower than the max speed of spi host.
This property is already documented as optional property and current
host drivers are implemented to operate at highest speed possible
when spi->max_speed_hz is 0.
This patch makes spi-max-frequency an optional property so that
we could just omit it to use max controller speed.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Change since v1:
 new commit

 drivers/spi/spi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 38b4c78df506..c0c55dc79972 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1955,13 +1955,8 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 		spi->mode |= SPI_CS_HIGH;
 
 	/* Device speed */
-	rc = of_property_read_u32(nc, "spi-max-frequency", &value);
-	if (rc) {
-		dev_err(&ctlr->dev,
-			"%pOF has no valid 'spi-max-frequency' property (%d)\n", nc, rc);
-		return rc;
-	}
-	spi->max_speed_hz = value;
+	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
+		spi->max_speed_hz = value;
 
 	return 0;
 }
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
