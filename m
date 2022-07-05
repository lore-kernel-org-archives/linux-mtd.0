Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BF7C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FuOxkmx5GZUbD9IZDyhCBrUmL1nHNsbz8pSljfR3wL4=; b=f0xVSOa4T93Yoh
	n3TW8ZljIZ/Hcj0qbGIke34CuMe+wSLjYIRzH5XyEDOWrxHboxiq5SwNlqPt0QlJ/Njge5SnB177M
	4rWokI3Tcus7cWUCA7Z4Dgrvl8TDq24fK+tP+siXDzllyv8p141VnoBWpaC9M7ZFfA+f/PMc0YXoi
	bVTIu+NGSkNSaju8PHyShK+9RP45I09vUtTMEhezO02krgTVg9VoGZUZ/HO0KHf+t/Q+3uWYrNa67
	Tvnl7RSWB5eLpvmLSpZ9Qj2VCLoaOXJKGnIigs41JgAtVeg3H7OB/pwyw6aJ1j/uSdxtqAg0b2z+l
	RFfTJ4TJ05OQAXmTOoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8erh-00Ghqf-Da; Tue, 05 Jul 2022 09:29:05 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8epd-00GgU8-Rq; Tue, 05 Jul 2022 09:27:00 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8DBA51A08BC;
	Tue,  5 Jul 2022 11:26:54 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 54F8C1A0AE4;
	Tue,  5 Jul 2022 11:26:54 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E7BB11802204;
	Tue,  5 Jul 2022 17:26:51 +0800 (+08)
From: haibo.chen@nxp.com
To: ashish.kumar@nxp.com,
	yogeshgaur.83@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	han.xu@nxp.com,
	singh.kuldeep87k@gmail.com,
	tudor.ambarus@microchip.com,
	p.yadav@ti.com,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	haibo.chen@nxp.com,
	zhengxunli@mxic.com.tw
Subject: [PATCH 05/11] spi: spi-nxp-fspi: Add quirk to disable DTR support
Date: Tue,  5 Jul 2022 17:11:37 +0800
Message-Id: <1657012303-6464-5-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_022658_098703_0246B3E5 
X-CRM114-Status: GOOD (  11.93  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Haibo Chen <haibo.chen@nxp.com>

Not all platform currently supports octal DTR mode. lx2160a do not
implement DQS, this causes flash probe failure and therefore, provide
an option of quirk FSPI_QUIRK_DISABLE_DTR for platforms not support
DTR mode.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/spi/spi-nxp-fspi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 34679dc0e1ad..61cf1b82c0d7 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -325,6 +325,9 @@
 /* Access flash memory using IP bus only */
 #define FSPI_QUIRK_USE_IP_ONLY	BIT(0)
 
+/* Disable DTR */
+#define FSPI_QUIRK_DISABLE_DTR	BIT(1)
+
 struct nxp_fspi_devtype_data {
 	unsigned int rxfifo;
 	unsigned int txfifo;
@@ -337,7 +340,7 @@ static struct nxp_fspi_devtype_data lx2160a_data = {
 	.rxfifo = SZ_512,       /* (64  * 64 bits)  */
 	.txfifo = SZ_1K,        /* (128 * 64 bits)  */
 	.ahb_buf_size = SZ_2K,  /* (256 * 64 bits)  */
-	.quirks = 0,
+	.quirks = FSPI_QUIRK_DISABLE_DTR,
 	.little_endian = true,  /* little-endian    */
 };
 
@@ -1149,10 +1152,14 @@ static const struct spi_controller_mem_ops nxp_fspi_mem_ops = {
 	.get_name = nxp_fspi_get_name,
 };
 
-static struct spi_controller_mem_caps nxp_fspi_mem_caps = {
+static const struct spi_controller_mem_caps nxp_fspi_mem_caps = {
 	.dtr = true,
 };
 
+static const struct spi_controller_mem_caps nxp_fspi_mem_caps_quirks = {
+	.dtr = false,
+};
+
 static int nxp_fspi_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
@@ -1257,7 +1264,10 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 	ctlr->bus_num = -1;
 	ctlr->num_chipselect = NXP_FSPI_MAX_CHIPSELECT;
 	ctlr->mem_ops = &nxp_fspi_mem_ops;
-	ctlr->mem_caps = &nxp_fspi_mem_caps;
+	if (f->devtype_data->quirks & FSPI_QUIRK_DISABLE_DTR)
+		ctlr->mem_caps = &nxp_fspi_mem_caps_quirks;
+	else
+		ctlr->mem_caps = &nxp_fspi_mem_caps;
 
 	nxp_fspi_default_setup(f);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
