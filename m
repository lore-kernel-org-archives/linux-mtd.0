Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F557C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiTiqfpFkaXce0tQiNvf9ushwQGKclnM/LpF1Kah1wU=; b=PvVEs64WAUeqde
	zu4ibYDOcxbYz39knh8bHCwETsr85Xb/v4JNWEwgWtjwTBnlza3VcwJp9ednn+1MfGzGlitJSkIOm
	mNMlNdk5W886vDL72/UEznR9qpqgKOQYuSgWrwdPCunKIjCB0bB5Cu1/S1oyXw5htm1gG5y21OAac
	nl4PHfGhsSdazLourVzD9AkkZuu2jTa51XNg7+WOx1Qf/+R8lDIHbortCPxuFbyBQVnpFKeBISx/5
	6qS9J/TMsK/bqRMfb7onRweJcvNppzjmd27+Lh15S9zYhxevVCitS7vTikoPSBdmyBRmksgpSDLw1
	IxbsWdetVWxEFeOaRVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8euX-00Gjg4-CU; Tue, 05 Jul 2022 09:32:01 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8epj-00GgZ0-O0; Tue, 05 Jul 2022 09:27:05 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 44F6F200F0E;
	Tue,  5 Jul 2022 11:27:02 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 17BF3200F0B;
	Tue,  5 Jul 2022 11:27:02 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AC5A3181D0CA;
	Tue,  5 Jul 2022 17:26:59 +0800 (+08)
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
Subject: [PATCH 09/11] mtd: spi-nor: macronix: add mx25uw51345g OPI mode support
Date: Tue,  5 Jul 2022 17:11:41 +0800
Message-Id: <1657012303-6464-9-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_022703_967389_0FC199EE 
X-CRM114-Status: GOOD (  11.83  )
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

mx25uw51345g has a special OPI DTR read command id, so add this
special fixup.
For RDID under OPI DTR mode, the dummy need to enlarge to 20 cycles,
otherwise can't get correct ID value.

Acked-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/mtd/spi-nor/macronix.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b4f4d8185cce..99140fc9305b 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -13,6 +13,7 @@
 #define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR mode */
 #define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
 #define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */
+#define SPINOR_OP_OPI_DTR_RD		0xEE		/* OPI DTR first read opcode */
 
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
@@ -117,6 +118,19 @@ static struct spi_nor_fixups octaflash_fixups = {
 	.default_init = octaflash_default_init,
 };
 
+static void mx25uw51345g_post_sfdp_fixup(struct spi_nor *nor)
+{
+	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
+				  0, 20, SPINOR_OP_OPI_DTR_RD,
+				  SNOR_PROTO_8_8_8_DTR);
+}
+
+static struct spi_nor_fixups mx25uw51345g_fixups = {
+	.default_init = octaflash_default_init,
+	.post_sfdp = mx25uw51345g_post_sfdp_fixup,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
@@ -264,7 +278,7 @@ static const struct flash_info macronix_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
 			      SPI_NOR_OCTAL_DTR_PP)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
-		.fixups = &octaflash_fixups },
+		.fixups = &mx25uw51345g_fixups },
 	{ "mx25um25645g", INFO(0xc28039, 0, 8 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
 			      SPI_NOR_OCTAL_DTR_PP)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
