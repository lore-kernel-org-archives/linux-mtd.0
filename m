Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097C60A2633
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2hIV/nZo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P6x3FjYY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ca+SuEgdRpQTd63+rxF7Jf/tiAnd1/kWM7Ofy2u1zCQ=; b=2hIV/nZocUyrMIcMcfZo6s13co
	5KyNDK4vKmd3luja/ArHQbpTq4WLIKmMIhJuWUIJeUSr67QN5DdpioxtFCPhSzPAows+qajn22lYk
	hpcR4dzZziWnJlP2OiPTA5hqhQbrglz2tOQ1yS8Pmgia5iUNvyed1lhhFFepo6tQNZI6HWUORTqYP
	N1YCvmOWpbJL5C5i9W6j5roPzu4GBjrRbxCtAuBlMHI+SmobOSRKrUiAUBwvliFUqEUAVrCpogXBo
	/+amxkbVlgeiRmgZQVAZ7FVMfbZa+DQpxKnwrViVtZ5iyuiLndZrJSM5J1DHztBBB8czQb0H645xR
	9CeymhuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCa-0000000FeA1-0KRV;
	Fri, 20 Nov 2026 17:15:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCN-0000000Fe1Q-34Uw
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:15:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 422EB4E41691;
	Fri, 20 Nov 2026 17:14:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1711D601B9;
	Fri, 20 Nov 2026 17:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FC4411BC050D;
	Fri, 20 Nov 2026 18:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YbvWbjLCYoKp6tHNvaVP7QLDPYtscluj35tRrDoYGIs=;
	b=P6x3FjYYmvfqQntA6Q2WCDt18eREPbuyVoBhYZY+YlNclM1g6lcyI4DEH5pfeUeNq667IO
	f2184sdb5Ar4ZsHoMj6SHO7XH9nZIVg6AbjOH4+7qC+0GmQHMX/wS89mLag6GrOpJXzVg8
	MA/sqi3SixaRfh4tPzjyWMVWQSrbXkhJ7hf9WNIq7AU6em3QkZUOT8ASSyop4lfAUhMGnB
	bk1GEytHXXpr+plJ5YhwUIjwjltErAbQAtZF2kbnnOLMLh92ZSd1cS1mDmHr/gCitFYVTT
	00kX99GDD2VHdHwmanq0T/oXzIj5D7wnDM0aIwxlQ0uW1me93PCe728I/vaCxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:33 +0100
Subject: [PATCH v4 07/11] spi: cadence-quadspi: Decouple the read capture
 bypass from DQS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-7-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_091456_546667_DF624C22 
X-CRM114-Status: GOOD (  12.35  )
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

The READCAPTURE bypass bit is not the logical opposite of the DQS bit.
Bypass selects the legacy delay-based read capture while DQS selects the
data strobe based capture. Both are valid in DTR mode: a DTR read without
a DQS line must use the delay-based capture with bypass disabled.

The tuning helpers currently derive bypass from !use_dqs. This happens to
work while use_dqs is always true in DTR mode, but use_dqs will soon
become false for DTR reads when the DQS line is not usable. Bypass would
then be wrongly enabled during tuning, unlike cqspi_phy_pre_config()
which keeps bypass disabled for DTR.

Store whether the read op is DTR and derive bypass from it instead of
from use_dqs. SDR reads keep bypass enabled and DTR reads keep it
disabled, regardless of the DQS setting.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 72a5101c4a8c..683924a4a274 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -84,6 +84,7 @@ struct cqspi_flash_pdata {
 	u32			tchsh_ns;
 	u32			tslch_ns;
 	bool			use_dqs;
+	bool			dtr;
 	bool			use_tuned_phy;
 	bool			dll_locked;
 	u8			cs;
@@ -1149,7 +1150,7 @@ static int cqspi_tune_phy_read(struct cqspi_flash_pdata *f_pdata, bool enable)
 	if (ret)
 		return ret;
 
-	cqspi_readdata_capture(cqspi, !f_pdata->use_dqs, f_pdata->use_dqs,
+	cqspi_readdata_capture(cqspi, !f_pdata->dtr, f_pdata->use_dqs,
 			       f_pdata->phy_setting.read_delay);
 
 	reg = readl(reg_base + CQSPI_REG_CONFIG);
@@ -2137,7 +2138,7 @@ static int cqspi_phy_apply_setting(struct cqspi_flash_pdata *f_pdata,
 	f_pdata->phy_setting.tx = phy->tx;
 	f_pdata->phy_setting.read_delay = phy->read_delay;
 
-	cqspi_readdata_capture(cqspi, !f_pdata->use_dqs, f_pdata->use_dqs,
+	cqspi_readdata_capture(cqspi, !f_pdata->dtr, f_pdata->use_dqs,
 			       phy->read_delay);
 
 	return 0;
@@ -3534,6 +3535,8 @@ static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
 
 	f_pdata->phy_read_op.max_freq = mem->spi->post_config_max_speed_hz;
 
+	f_pdata->dtr = op_is_dtr;
+
 	if (op_is_dtr) {
 		f_pdata->use_dqs = true;
 		cqspi_phy_pre_config(cqspi, f_pdata, false);

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
