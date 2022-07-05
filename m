Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0F4C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7nk15JjHP//GNqvhwEByLPkkCyE7HCwc2ORZyCz500=; b=zyL4f+hkJ0kyte
	GLZvFeFsq9xymCxA4+uJCNS8SQ5TKdnj//oYz4BFpGHSWbb40st+NGPK5kEaU2wy42DAyErbyXRCE
	b0jGLeb1yBnkIV00WvPGiD6IMvm0Po+fofZo8OFLxYZg1JcKk6RE5IoiLeHF63l3FtJ8CVMDQrYaj
	qaPBr1lxbtZVes3xRDKYynvvFlIIKl9+6X4H9likQ3gXZwRw3AC+R9OW4zEeAa/nNXleQ6HquqTh8
	K/Q/C3M6N4Y6qZ5DTaJhPryIc/PZ3NK93QVOUntw8IFaTTWj2SIUwwhSGyjF/f8xVvkvqVUZJ7O9J
	2HH8lGs1o1EKeaIPWUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8esG-00GiBc-TM; Tue, 05 Jul 2022 09:29:40 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8epe-00GgSI-4R; Tue, 05 Jul 2022 09:27:00 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A31A7200D8E;
	Tue,  5 Jul 2022 11:26:50 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 755BB200D85;
	Tue,  5 Jul 2022 11:26:50 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 162B1180222D;
	Tue,  5 Jul 2022 17:26:48 +0800 (+08)
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
Subject: [PATCH 03/11] spi: spi-nxp-fspi: add DTR mode support
Date: Tue,  5 Jul 2022 17:11:35 +0800
Message-Id: <1657012303-6464-3-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_022658_526394_3210674F 
X-CRM114-Status: GOOD (  10.46  )
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

For LUT, add DTR command support.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/spi/spi-nxp-fspi.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 10e71e55d21a..c32a4f53fa2a 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -537,12 +537,22 @@ static void nxp_fspi_prepare_lut(struct nxp_fspi *f,
 	int lutidx = 1, i;
 
 	/* cmd */
-	lutval[0] |= LUT_DEF(0, LUT_CMD, LUT_PAD(op->cmd.buswidth),
-			     op->cmd.opcode);
+	if (op->cmd.dtr) {
+		lutval[0] |= LUT_DEF(0, LUT_CMD_DDR, LUT_PAD(op->cmd.buswidth),
+				     op->cmd.opcode >> 8);
+		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_CMD_DDR,
+					      LUT_PAD(op->cmd.buswidth),
+					      op->cmd.opcode & 0x00ff);
+		lutidx++;
+	} else {
+		lutval[0] |= LUT_DEF(0, LUT_CMD, LUT_PAD(op->cmd.buswidth),
+				     op->cmd.opcode);
+	}
 
 	/* addr bytes */
 	if (op->addr.nbytes) {
-		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_ADDR,
+		lutval[lutidx / 2] |= LUT_DEF(lutidx, op->addr.dtr ?
+					      LUT_ADDR_DDR : LUT_ADDR,
 					      LUT_PAD(op->addr.buswidth),
 					      op->addr.nbytes * 8);
 		lutidx++;
@@ -550,7 +560,8 @@ static void nxp_fspi_prepare_lut(struct nxp_fspi *f,
 
 	/* dummy bytes, if needed */
 	if (op->dummy.nbytes) {
-		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_DUMMY,
+		lutval[lutidx / 2] |= LUT_DEF(lutidx, op->dummy.dtr ?
+					      LUT_DUMMY_DDR : LUT_DUMMY,
 		/*
 		 * Due to FlexSPI controller limitation number of PAD for dummy
 		 * buswidth needs to be programmed as equal to data buswidth.
@@ -565,7 +576,8 @@ static void nxp_fspi_prepare_lut(struct nxp_fspi *f,
 	if (op->data.nbytes) {
 		lutval[lutidx / 2] |= LUT_DEF(lutidx,
 					      op->data.dir == SPI_MEM_DATA_IN ?
-					      LUT_NXP_READ : LUT_NXP_WRITE,
+					      (op->data.dtr ? LUT_READ_DDR : LUT_NXP_READ) :
+					      (op->data.dtr ? LUT_WRITE_DDR : LUT_NXP_WRITE),
 					      LUT_PAD(op->data.buswidth),
 					      0);
 		lutidx++;
@@ -1090,6 +1102,10 @@ static const struct spi_controller_mem_ops nxp_fspi_mem_ops = {
 	.get_name = nxp_fspi_get_name,
 };
 
+static struct spi_controller_mem_caps nxp_fspi_mem_caps = {
+	.dtr = true,
+};
+
 static int nxp_fspi_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
@@ -1194,6 +1210,7 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 	ctlr->bus_num = -1;
 	ctlr->num_chipselect = NXP_FSPI_MAX_CHIPSELECT;
 	ctlr->mem_ops = &nxp_fspi_mem_ops;
+	ctlr->mem_caps = &nxp_fspi_mem_caps;
 
 	nxp_fspi_default_setup(f);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
