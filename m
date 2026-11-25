Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C95606A32E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K8RcYD81;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KYGCCatk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YSxJEG0IKjxhdFbpNukbOVdq+Ur2oowJXmxQNhsMD2k=; b=K8RcYD81Eg4gWdMfyxXKEE+4k5
	E1Cuz5PxdSV02BYUdnXLGBm7ztstqC/c1lS+nOUhz0nkgaBZrFw1p4xXqKn1Y0CNnj6wN5JEaFt39
	hD0K3/W7Z/Fe2RfSkhdqTnrfmDRM2kq6cl+FRcg6GgjfSNTiAjqT9VHGGekdYGDwdNKdPL39J4+9w
	cDNGUE5s9JDvsVFmsu7gG7DI5VSM/tOBIfulPo3/2E7bxbA5xxEvf1yRW1GaTjxkwkx7iODy20YQ4
	2w/anv7RMYN8BiEKNSBCwgKdrvpVg7pSvN9vI3WiLBhOazqpO6VZZ6Oy86wjzyp9VQ9O4IU7zHiaz
	FbSHXBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHCs-0000000ArIq-3N1M;
	Wed, 25 Nov 2026 17:54:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHB0-0000000AobP-1DIf;
	Wed, 25 Nov 2026 17:53:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41B144E40B00;
	Wed, 25 Nov 2026 17:53:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D09660480;
	Wed, 25 Nov 2026 17:53:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA5F911E6B0CA;
	Wed, 25 Nov 2026 18:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629174; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JCAVXopcRhsu0R7W2AJRcPS4xlZfnpyxLhZGemjrQaY=;
	b=KYGCCatkpDwAP39xFucHg5OhSZCQx2BzoSiOJhGTIvhyjU0iH9MR3Nou9ORwOoHqcQnXWZ
	k8WtGng3n56RvyZGJYrcqIQmYvx22XJkDzMlShSyJBKI1pVqipDqav+hHfIZm2R/LFJK3Z
	R6orNWggySMk4Bc/p8PcSNb1BxXblXaYw9rHsTY/CnCvJeuoEbwAJNPf2WEx0KM/Hyp5pe
	0hJTCcMIveklGb7007f++ldutFB9U0ere1MsT+1fGqCRqCdDgCnONrX7FzjaT87hZFmq75
	e8h0wMhWaaGOEr+pML/ay1JGJuzjfo0QVZXl39N8Dn+JQqgG8evHxLIQmzJ6BA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:28 +0100
Subject: [PATCH RFC 14/16] spi: stm32-ospi: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-14-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095302_559991_2A264203 
X-CRM114-Status: GOOD (  12.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The spi-mem layer is now capable of providing the dummy phase in cycle
units rather than bytes, provided that drivers advertize the dummy_cycle
capability. Since this controller is consuming cycles and currently
converts bytes into cycles, flag it capable to consume cycles directly
and drop the extra conversions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-stm32-ospi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index fa0e8e83cb1b..9b28d1f24482 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -492,10 +492,9 @@ static int stm32_ospi_send(struct spi_device *spi, const struct spi_mem_op *op)
 	}
 
 	tcr = TCR_SSHIFT;
-	if (op->dummy.buswidth && op->dummy.nbytes) {
-		tcr |= FIELD_PREP(TCR_DCYC_MASK,
-				  op->dummy.nbytes * 8 / op->dummy.buswidth);
-	}
+	if (op->dummy.buswidth && op->dummy.ncycles)
+		tcr |= FIELD_PREP(TCR_DCYC_MASK, op->dummy.ncycles);
+
 	writel_relaxed(tcr, regs_base + OSPI_TCR);
 
 	if (op->data.nbytes) {
@@ -691,7 +690,7 @@ static int stm32_ospi_transfer_one_message(struct spi_controller *ctrl,
 		 */
 		if (transfer->dummy_data) {
 			op.dummy.buswidth = transfer->tx_nbits;
-			op.dummy.nbytes = transfer->len;
+			op.dummy.ncycles = transfer->len * 8 / transfer->tx_nbits;
 			dummy_bytes = transfer->len;
 
 			/* If happens, means that message is not correctly built */
@@ -784,6 +783,10 @@ static const struct spi_controller_mem_ops stm32_ospi_mem_ops = {
 	.poll_status	= stm32_ospi_poll_status,
 };
 
+static const struct spi_controller_mem_caps stm32_ospi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int stm32_ospi_get_resources(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -933,6 +936,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 	ctrl->setup = stm32_ospi_setup;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &stm32_ospi_mem_ops;
+	ctrl->mem_caps = &stm32_ospi_mem_caps;
 	ctrl->use_gpio_descriptors = true;
 	ctrl->transfer_one_message = stm32_ospi_transfer_one_message;
 	ctrl->num_chipselect = STM32_OSPI_MAX_NORCHIP;

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
