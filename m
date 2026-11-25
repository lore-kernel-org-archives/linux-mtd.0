Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F7606A6AC
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YlpaTg71;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Tu7jIaE/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RYp9veoh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9oK2lVoPukuFFBSadiKbDMtPKvzEfwAnXsP8s8Dv57s=; b=YlpaTg71SgwYAZIPBb2cz6dcjc
	tZJRSicT78/RJ0YhhDGF2MlCYaSWB2IBSKZFhIGSTo0fgpqv1P8bmkEMuxTqXC3XVyLb5MoWfr3w9
	UYytP3ZWo+qwFNZCVgUFIkiPFPVnOQ5YEVkQ1lkS+0UMZgXd6z35a8v+U8qul5NHRis15tqxkWsxz
	CBHdDb5i8hHYwyTyfPol3w7mfmb5vsbp3LvixXb6pqk/2X1vkN5YeG+v+wWSgyir7bxuXCseoi33E
	j09vq7voE6Y+zpbmkyyFv85EawcVbmTpT2mr1HBTY2CRh0Zhm/GQ0sqgVhbejW73kCI2MAf9+X5Na
	b0L3vbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHCD-0000000AqWs-1L1w;
	Wed, 25 Nov 2026 17:54:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAo-0000000AoII-3kXV
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3kouSNyK9R23I+qZ3mr2DQ2vQHuvZbqCaS8A5GKpSiI=; b=Tu7jIaE/1iRbXHNLm8OSg3DS0A
	2z3Sq/TF9jPuPMfD+QaXUJ1eU1JYNyg3sDLL28HvOaxFfp6XSdyTuMGJFgSRfnR0aBFlDYDpz7W6d
	mIE4vqtIE3YoKBbYJe3hS/1DARZc2zRTpv8CuxklerDh8ObnoS38DckpeEPg6R4b9kyeKwmr1WbYP
	PVKriLpE4rLpHDp7NuENtVIiil7d5MyL1KFi+z8gO8O3A9nu+x5egy0702T09tXwjvbh6amkCyqfd
	y3N+gUJURdI7lyYwPKbdkxEggMmfSrnIqvCIn5m1zUCadGxCy60KfYA91vH1aMRDSbGAUTN50QhYS
	PzWt7BtA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAl-00000005bNh-2lS7
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9F5CC6221E;
	Wed, 25 Nov 2026 17:52:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0E9260480;
	Wed, 25 Nov 2026 17:52:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B65A11E6B0D2;
	Wed, 25 Nov 2026 18:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3kouSNyK9R23I+qZ3mr2DQ2vQHuvZbqCaS8A5GKpSiI=;
	b=RYp9veohHs2JdLBosL+OsjxwlR5ySlzQOAAtmxVHB0PF+kGJfjYwbk9Zr8zNeXJ6OlEbgv
	6zMyoPjAOXUJULNnrP5XuerZtky0pwNWlOa/oUwIASW95rOPRxAwmAdBoEfqWhjloAAkRz
	+af48+G//LVpdAxvoMbQb1UibBI5CwcDQtJVmcpSki4kh3KMYcxwHtCgaBDn2SKGwmhk12
	Ayf5LyU9tRq5MLbV+cfO5AoxQxPhP0QmO9Hhnel5CvxyUPfGLyrWQpzO6gCul208u8Whpu
	KTRVmtC3+gA1XP/32Aztz+aRTBVY/MvNjItZCiK/GLlZt6TFoHBApm7tO375vw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:26 +0100
Subject: [PATCH RFC 12/16] spi: rtk-nor: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-12-fd036402fd37@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175247_793603_8E7A4047 
X-CRM114-Status: GOOD (  16.19  )
X-Spam-Score: -0.2 (/)
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
 drivers/spi/spi-rtk-nor.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
index 55ea7c371854..6febeee2541d 100644
--- a/drivers/spi/spi-rtk-nor.c
+++ b/drivers/spi/spi-rtk-nor.c
@@ -92,18 +92,10 @@ struct rtk_spi_host {
 	size_t			dirmap_size;
 };
 
-static u32 rtk_spi_calc_dummy_cycles(const struct spi_mem_op *op)
-{
-	if (!op->dummy.nbytes)
-		return 0;
-
-	return (op->dummy.nbytes * 8) / op->dummy.buswidth;
-}
-
 static void rtk_spi_read_mode(struct rtk_spi_host *host, const struct spi_mem_op *op)
 {
 	u32 opcode = op->cmd.opcode;
-	u32 dummy_cycles, val;
+	u32 val;
 
 	if (op->data.buswidth == 2)
 		opcode |= DUAL_MODE_EN;
@@ -113,10 +105,8 @@ static void rtk_spi_read_mode(struct rtk_spi_host *host, const struct spi_mem_op
 	val = readl(host->regbase + SFC_CTL);
 	val |= RW_DATAEN | ADDR_EN;
 
-	dummy_cycles = rtk_spi_calc_dummy_cycles(op);
-
 	val &= ~SFC_CTL_DMYCNT_MASK;
-	val |= (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
+	val |= (op->dummy.ncycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
 	writel(val, host->regbase + SFC_CTL);
 
 	readl(host->iobase);
@@ -192,7 +182,7 @@ static int rtk_spi_command_read(struct rtk_spi_host *host, const struct spi_mem_
 	size_t len = op->data.nbytes;
 	loff_t offset = op->addr.val;
 	u8 opcode = op->cmd.opcode;
-	u32 dummy_cycles, val;
+	u32 val;
 
 	writel(opcode, host->regbase + SFC_OPCODE);
 
@@ -203,8 +193,7 @@ static int rtk_spi_command_read(struct rtk_spi_host *host, const struct spi_mem_
 	if (op->addr.nbytes > 0)
 		val |= ADDR_EN;
 
-	dummy_cycles = rtk_spi_calc_dummy_cycles(op);
-	val |= (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
+	val |= (op.dummy.ncycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
 	writel(val, host->regbase + SFC_CTL);
 
 	return rtk_spi_byte_transfer(host, offset, len, op->data.buf.in, true);
@@ -346,8 +335,8 @@ static bool rtk_spi_supports_op(struct spi_mem *mem,
 	if (!op->addr.nbytes && op->data.nbytes > 1)
 		return false;
 
-	if (op->dummy.nbytes != 0) {
-		if (op->dummy.buswidth > 1 || op->dummy.nbytes > 7)
+	if (op->dummy.ncycles) {
+		if (op->dummy.buswidth > 1 || op->dummy.ncycles > 7 * BITS_PER_BYTE)
 			return false;
 	}
 
@@ -464,6 +453,10 @@ static const struct spi_controller_mem_ops rtk_spi_mem_ops = {
 	.adjust_op_size = rtk_spi_adjust_op_size,
 };
 
+static const struct spi_controller_mem_caps rtk_spi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int rtk_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -535,6 +528,7 @@ static int rtk_spi_probe(struct platform_device *pdev)
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &rtk_spi_mem_ops;
+	ctrl->mem_caps = &rtk_spi_mem_caps;
 	ctrl->num_chipselect = 1;
 	ctrl->auto_runtime_pm = true;
 

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
