Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB75E69EAE
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3HTTNibxmw00Y9+smBT9fO+4BbXJPwdYRRmLcttmWI=; b=PxyqIezkotQlAt
	7H/CyFs0yc0wtrDD6HYq2NUahetlLTRdxdn5XmmRjTEwccNhHIuLAXSYAJp6LRx5W3ihDqefqn18O
	RIUSmZ2Srmo3i8QZtwgSJN9/mBk2L3kiW0TllIOnR2hJk5hm7Cu3HKRo6/B8aFQ7BMlJG+XR6zEKY
	yzKBOk4WbPGTLVowA+/RsNEeYXPuGa0nBj0L3r+hUSa5QrD6s6MYGFvtK19xh6HsVeqf0ZQonAidR
	Fj5gPI7XgJIQaWHFAZk/DKiThW8rWnYDwahZTj0Tv6Z31VWaKLV0+Vp21h+xbf6KaSGIK9KQY3iDR
	fRWh1hvr6kSo6gdA+VRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQaI-000000099q6-0Gwa;
	Tue, 03 Dec 2024 10:56:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQJG-0000000963j-2gft
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 10:39:15 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tIQJ6-00012Q-6Y; Tue, 03 Dec 2024 11:39:04 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Tue, 03 Dec 2024 11:38:37 +0100
Subject: [PATCH v3 3/3] mtd: mchp48l640: add support for Fujitsu
 MB85RS128TY FRAM
MIME-Version: 1.0
Message-Id: <20241203-mb85rs128ty-v3-3-79107d54d839@pengutronix.de>
References: <20241203-mb85rs128ty-v3-0-79107d54d839@pengutronix.de>
In-Reply-To: <20241203-mb85rs128ty-v3-0-79107d54d839@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=+bDwq5NM4Xl7M67XvTmDhZ7VVVdtopt5c2rjbQ9eTGg=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkj3u380w5PpwpmLlzestba8Y8io3JGXZ/1Jv2Dr9vrH+
 maPn/FIdJSyMIhxMMiKKbLEqskpCBn7XzertIuFmcPKBDKEgYtTACaydyXDX9H35qpWTZ+vePQu
 2N2kIn77pbNZ/oXflyP3d/3MfqSSZ8fwv2ZVybychp+/NW0689MS+Df6dd/rq2t99Gmr8l/pmA3
 HuAE=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023914_681958_84484A7F 
X-CRM114-Status: GOOD (  11.21  )
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

From: David Jander <david@protonic.nl>

The Fujitsu FRAM chips use the same command set as Microchip EERAM.
The only differences are that the Fujitsu FRAM chips don't really have a
page size limit, nor do they automatically reset the WEL bit.

Signed-off-by: David Jander <david@protonic.nl>
Reviewed-by: Heiko Schocher <hs@denx.de>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/mtd/devices/mchp48l640.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index 4cdd24aaed416fc7e40a8060b5c7eaf6684fc6d5..7584d0ba93969d79ba3d9c7a97bc63bd0e5ef327 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -303,6 +303,12 @@ static const struct mchp48_caps mchp48l640_caps = {
 	.auto_disable_wel = true,
 };
 
+static const struct mchp48_caps mb85rs128ty_caps = {
+	.size = SZ_16K,
+	.page_size = 256,
+	.auto_disable_wel = false,
+};
+
 static int mchp48l640_probe(struct spi_device *spi)
 {
 	struct mchp48l640_flash *flash;
@@ -361,6 +367,10 @@ static const struct of_device_id mchp48l640_of_table[] = {
 		.compatible = "microchip,48l640",
 		.data = &mchp48l640_caps,
 	},
+	{
+		.compatible = "fujitsu,mb85rs128ty",
+		.data = &mb85rs128ty_caps,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
@@ -370,6 +380,10 @@ static const struct spi_device_id mchp48l640_spi_ids[] = {
 		.name = "48l640",
 		.driver_data = (kernel_ulong_t)&mchp48l640_caps,
 	},
+	{
+		.name = "mb85rs128ty",
+		.driver_data = (kernel_ulong_t)&mb85rs128ty_caps,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(spi, mchp48l640_spi_ids);

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
