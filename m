Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A32FCCA47C
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2XT2aVwme/rcfqZ24UdAOXo9+kDv/S5i230TmDQcjA=; b=JLbNYAM+7gGnLP
	jlnz7agSESXKqnpGfFewNg7c5IFhgj1XN2xNiYBPN7Dom9/epk04biK2D5YUxt4ENzjZ8J9VfdLSM
	vqIMav7Jqvih8obZwzoHiGei9hAM/PJ71W8P4kNizXNxoNfjNJhRi3sO2Ejlkih1fuLFh5BdgdYaZ
	C7JKM1rr4nIXSfBl3cNH90GE1YBcFjjrF7+uQLmpRYTJ34nih7bHlYLh3Epjl8E30u2psQZpnameh
	ybfGfXHOTZ221dqukE+/CKoQVysPUcH6qD/Apbu5ofV54I+mgCinlZZ+OX3GKjdAVudk57onna2fx
	D+Buv/JBA9fjG8HtAUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8eqD-00GguV-20; Tue, 05 Jul 2022 09:27:33 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8epc-00GgQb-Oq; Tue, 05 Jul 2022 09:26:58 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C0D3E1A0AF1;
	Tue,  5 Jul 2022 11:26:48 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 886031A0AEC;
	Tue,  5 Jul 2022 11:26:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DA4FF1802204;
	Tue,  5 Jul 2022 17:26:45 +0800 (+08)
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
Subject: [PATCH 02/11] spi: spi-nxp-fspi: change the default lut index
Date: Tue,  5 Jul 2022 17:11:34 +0800
Message-Id: <1657012303-6464-2-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_022656_966797_7AC06481 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

The fspi dynamic lut use the last lut for all IPS operations, the
imx8ulp only supports 15 luts, so change the last lut index from
31 to 15.

Signed-off-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/spi/spi-nxp-fspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index b2cd8e06f374..10e71e55d21a 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -65,9 +65,9 @@
 /*
  * The driver only uses one single LUT entry, that is updated on
  * each call of exec_op(). Index 0 is preset at boot with a basic
- * read operation, so let's use the last entry (31).
+ * read operation, so let's use the last entry (15).
  */
-#define	SEQID_LUT			31
+#define	SEQID_LUT			15
 
 /* Registers used by the driver */
 #define FSPI_MCR0			0x00
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
