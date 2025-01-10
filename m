Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856EDE7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYtmerTDC9JIOVNeY3ABvpIjVnp2hPgulxmmsnn/yws=; b=nHfEPMpFWlEoJr
	zDnoskfu+Fp62hPIS61G/zWUwPnzQJa4Ug0xnKP0sJU+ELHOofS+wJCkbWxVP8PzY/yAUXGiIDfiJ
	H/AniN+pWhg+V/h1NFb1kG4Vy6Se7TEziOOdX3HbCcVn5mP4tl6+W3t8wNyhIWocmaeiMPoV5fUuR
	sxktpKvpRJEn3XrK43DCDtnrSSXztZiwiOK6r1G3jH3kR2Pou1IHLtARDigLuGJGXAT0BAC3tQYx6
	iv6QO7Ioo3Q8iekZLAqvdxXjK7LZAH24rcpyEHCDmhDXB+q179y9Lji66/ohbrjdi8VQfPluDx3FP
	GJCIXFteY9BUiS40qyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGJw-0000000Fhei-3ESQ;
	Fri, 10 Jan 2025 14:49:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGM-0000000Fg7i-1usS;
	Fri, 10 Jan 2025 14:45:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71785FF805;
	Fri, 10 Jan 2025 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bezjIfKOhlEJE79cO6ZVpXOH6/T+183qkN81Q6qLp7w=;
	b=RbLkbagOqMBunaMN2YnZGz8JsuiihcjK44O9gcXrDXaOSpGj9LecBmMp+KB2ELkudoPqYt
	Wteh4r4LazTg5RTKap7aOspopZKGe1jYNRi/d6AMySaB64R4a7k3SvPucgTT45G72I1a0A
	KhChutdGDp8rCVf3bOJ9dsAEIQEUXstxys6Qx1hEmZ1mjtuiISzkB16lZJsj2weAgzPptN
	7zlh6/0hmBjbz8hgOws8vE9W4eC84DkgYPLWsD9p6+yays2TV4Se9dpVedM43wyq04ct+5
	aGc7ZwnDsdFUvUudRDRIyTNtab4yU14nycOZLIxMRRYdpVsOu26qtFIXl8uZ2w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:05 +0100
Subject: [PATCH v3 03/27] spi: amd: Support per spi-mem operation frequency
 switches
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-3-7ab4bd56cf6e@bootlin.com>
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
X-CRM114-CacheID: sfid-20250110_064526_757461_80A23BFE 
X-CRM114-Status: GOOD (  14.02  )
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

Every ->exec_op() call correctly configures the spi bus speed to the
maximum allowed frequency for the memory using the constant spi default
parameter. Since we can now have per-operation constraints, let's use
the value that comes from the spi-mem operation structure instead. In
case there is no specific limitation for this operation, the default spi
device value will be given anyway.

This controller however performed a frequency check, which is also
observed during the ->check_op() phase.

The per-operation frequency capability is thus advertised to the spi-mem
core.

Cc: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
index d30a21b0b05f96fe5361d16a1fca3467260e0a08..485ae1e382e3eb8f4d72ebb0fb15c51b9a118d3b 100644
--- a/drivers/spi/spi-amd.c
+++ b/drivers/spi/spi-amd.c
@@ -479,6 +479,9 @@ static bool amd_spi_supports_op(struct spi_mem *mem,
 		return false;
 	}
 
+	if (op->max_freq < mem->spi->controller->min_speed_hz)
+		return false;
+
 	return spi_mem_default_supports_op(mem, op);
 }
 
@@ -676,7 +679,7 @@ static int amd_spi_exec_mem_op(struct spi_mem *mem,
 
 	amd_spi = spi_controller_get_devdata(mem->spi->controller);
 
-	ret = amd_set_spi_freq(amd_spi, mem->spi->max_speed_hz);
+	ret = amd_set_spi_freq(amd_spi, op->max_freq);
 	if (ret)
 		return ret;
 
@@ -705,6 +708,10 @@ static const struct spi_controller_mem_ops amd_spi_mem_ops = {
 	.supports_op = amd_spi_supports_op,
 };
 
+static const struct spi_controller_mem_caps amd_spi_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int amd_spi_host_transfer(struct spi_controller *host,
 				   struct spi_message *msg)
 {
@@ -782,6 +789,7 @@ static int amd_spi_probe(struct platform_device *pdev)
 	host->setup = amd_spi_host_setup;
 	host->transfer_one_message = amd_spi_host_transfer;
 	host->mem_ops = &amd_spi_mem_ops;
+	host->mem_caps = &amd_spi_mem_caps;
 	host->max_transfer_size = amd_spi_max_transfer_size;
 	host->max_message_size = amd_spi_max_transfer_size;
 

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
