Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB9CE7719D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4pbD/aAC2z5D6iLJ4wpEmuU7y78yFpudxzufXdt5aA=; b=t49J9HYZli9qwU
	vjHSIqUCnyb6QIW5pulvRwYMMkwemp1VMiHshUOt9+59d4iO81pj2UYC85bLX7a9DdQ+1TlBeRTdU
	8GJyoPmxWOm+FEPhsx1K2Dv3ZxJDlZok8DL8DCpT8GILt8ibe23Y+6whBrOuUwsTjwEW14xe2VO0v
	Ff4hZGz72oXsPM+lYy9LsTq/Zh2Jyc+AFwnWhE/h4Lf425AWmhupJaj4SgeDNcfggvhPn2hBScEmn
	38btiSQS/OfYQq9C21PpEec17uAhnTwWnUSBHEvr13OpNDwosTz9DbFtBcJ3O7eGTtA8ktewJddij
	yvQh3w2aRr/3peXnnQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGML-0000000FigU-2Vyn;
	Fri, 10 Jan 2025 14:51:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGQ-0000000Fg9c-3KNk;
	Fri, 10 Jan 2025 14:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dHPofq5XZq7az/ZH3pSbnokgc8b9g3SIFoGkVNSo6iM=; b=WgeitKMsUcVH5mkiDLc5eA84Fi
	OseqtSMencYUs0HrHuoHKO7cUbQUl2rlMhHj0qC0GwZ/Yl4p062cQOSDxzs5o8mHNFF5ub54rAcB2
	VnfQoxTBxrCmzRMhMbXJ2A0r3WBeT6rV9WEEH/ARCzyaYMerSLaoN5HxnaCw4Cva8N1RNKH2f6Hac
	kPLzVIctZyVCLTeRVnsM6EEWryMPvNdkkHU+H2bJsA71BpmRSJD+Mf6CnHYa5msUhxT8XZ7+nvl4V
	GvB1XqAJsVvzW2cASmm+Z1NTOu/OYFmCHgbToywqgnmfo29ivbY8ofY4xbMQmKummCQDEEGV/yDKl
	B5iz6IUQ==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGO-00000009o8q-0r95;
	Fri, 10 Jan 2025 14:45:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54FB5FF809;
	Fri, 10 Jan 2025 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHPofq5XZq7az/ZH3pSbnokgc8b9g3SIFoGkVNSo6iM=;
	b=QaykDlSwtQxbTXSFx/WQbVyeesPYBW12EuQ2e83119ikzKXwERkm59oGK8cQtYV6jA7uyt
	nr0ZCtAn6FdPe6RrgAHZUYM5u6MoLPdP9IIAGGaJSQAmLzW3vc+a8hwSFBOZwUzvG9d5N1
	RjjVie2+9GL+I2Tptx7o5sBeHjizza20bxGbLeeGet2CiAEMHRZkLBeEbDnOHiRhGwYr5Y
	ItlINRNMCLBiOuXDN1+EGarnTO9PBFL6oX9U+iDjUsW7jHNbW8kimAtb9fed96Wwmrt6BB
	EBm+jPCNzi6JMVBbchseGwpaeMN7nYjD9MwmTcRdl7W6F45psfhShwxgJ9a7uA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:06 +0100
Subject: [PATCH v3 04/27] spi: amd: Drop redundant check
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-4-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_144528_358954_EB06106F 
X-CRM114-Status: GOOD (  12.91  )
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

Both spi and spi-mem cores already take care of checking the minimum and
maximum speed for transfers depending on the controller
capabilities. There is no reason to repeat this check in controller
drivers.

Once this possible error condition removed from the function, it makes
no longer sense to return an int.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amd.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
index 485ae1e382e3eb8f4d72ebb0fb15c51b9a118d3b..fbe795bbcf507abcbbd973b226b5db0de1584898 100644
--- a/drivers/spi/spi-amd.c
+++ b/drivers/spi/spi-amd.c
@@ -298,19 +298,16 @@ static const struct amd_spi_freq amd_spi_freq[] = {
 	{ AMD_SPI_MIN_HZ,   F_800KHz,         0},
 };
 
-static int amd_set_spi_freq(struct amd_spi *amd_spi, u32 speed_hz)
+static void amd_set_spi_freq(struct amd_spi *amd_spi, u32 speed_hz)
 {
 	unsigned int i, spd7_val, alt_spd;
 
-	if (speed_hz < AMD_SPI_MIN_HZ)
-		return -EINVAL;
-
 	for (i = 0; i < ARRAY_SIZE(amd_spi_freq); i++)
 		if (speed_hz >= amd_spi_freq[i].speed_hz)
 			break;
 
 	if (amd_spi->speed_hz == amd_spi_freq[i].speed_hz)
-		return 0;
+		return;
 
 	amd_spi->speed_hz = amd_spi_freq[i].speed_hz;
 
@@ -329,8 +326,6 @@ static int amd_set_spi_freq(struct amd_spi *amd_spi, u32 speed_hz)
 		amd_spi_setclear_reg32(amd_spi, AMD_SPI_SPEED_REG, spd7_val,
 				       AMD_SPI_SPD7_MASK);
 	}
-
-	return 0;
 }
 
 static inline int amd_spi_fifo_xfer(struct amd_spi *amd_spi,
@@ -679,9 +674,7 @@ static int amd_spi_exec_mem_op(struct spi_mem *mem,
 
 	amd_spi = spi_controller_get_devdata(mem->spi->controller);
 
-	ret = amd_set_spi_freq(amd_spi, op->max_freq);
-	if (ret)
-		return ret;
+	amd_set_spi_freq(amd_spi, op->max_freq);
 
 	if (amd_spi->version == AMD_SPI_V2)
 		amd_set_spi_addr_mode(amd_spi, op);

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
