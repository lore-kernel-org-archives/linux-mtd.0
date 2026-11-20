Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C260A260B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yqfBDOHs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZOna/YKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kh7o+Wa32XPt7Oq0A2N+Y4WQYxNyfO++i+H4snm1O6I=; b=yqfBDOHsze8QzIc6lQhaVVxoIc
	2wtBZP26L5v/IhdUIFTI7mhgyo97NPNJX/U27mS9HBAgU0mAi6FIOTqLOGP7ZSnAdJYPM71SJYoqq
	jEDmQqDETT1TI4fM5KZzSIGuvYXKUj4YDwVMzUqtSg20hRN6DBjZQxidUzsoIVs6Lo7IGFfsTtyjt
	MBvXJ/GpGTo/3KRcwn4ojfnBfrs0nSoSt+fhqJInyutsfWwBxD9TsTXfUxVxzPkYsFxhXHOZyOc6K
	HnJ2kx2P9vgTHwaivYFFm3s6WGKj+bPgXLUwvscDjzE5r61RDIxTqee/cTCo/e+C2R4I9wks5cLJ2
	IHenj6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCd-0000000FeG1-1g5l;
	Fri, 20 Nov 2026 17:15:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCR-0000000Fe3h-1TXO
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:15:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB77D1A1755;
	Fri, 20 Nov 2026 17:14:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC587601B9;
	Fri, 20 Nov 2026 17:14:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62C1211BC04A2;
	Fri, 20 Nov 2026 18:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c8TjqIKbyMReltOgDe2OyJat4Lo0bIv1OAsaj1Ilaz0=;
	b=ZOna/YKNEjgtsubmrK1U/LoTSwzfQMFL4VHBsA53RFGid3P3xVGJfMQYuJT9pOdYCDD5bO
	qpg6sF82/x8zGjNk7sf9eNtrt/DoqoDnTOZqQcbLGY2yTkbq0S6IJiQjKU1fW4too0afB3
	gS8G252+oRsPB3QNOAeHnjCMbt0vA+QvghxAe2d5KZ6h594oMkaHpGpUiVW5clX6bEbXcM
	4MMmVI/Qi7iLbhmeDBgo9w8diCboUwKYGKW98FinlI8uwstCd5eFYyzRyiHOonHCpcWD5Q
	mwYSfVzau2ISiWA1MZUGp3q3JvgbnocHVwMKzjUzXgR1LNnF9GdxkPey8qTTaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:34 +0100
Subject: [PATCH v4 08/11] spi: cadence-quadspi: Check DQS usability before
 enabling DQS capture
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-8-8c21e1f71f41@bootlin.com>
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
X-CRM114-CacheID: sfid-20261120_091500_613258_4FED492F 
X-CRM114-Status: GOOD (  11.79  )
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

The DTR tuning path unconditionally enables DQS capture. But DQS is only
usable when the memory supports it, the DQS line is wired to the
controller and the controller is capable. Use the spi-mem helper that
combines these conditions instead of assuming DQS is always available.

This lets the driver fall back to delay-based capture for DTR memories
that do not have a usable DQS line.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 683924a4a274..05f64ebb1965 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -3538,7 +3538,7 @@ static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
 	f_pdata->dtr = op_is_dtr;
 
 	if (op_is_dtr) {
-		f_pdata->use_dqs = true;
+		f_pdata->use_dqs = spi_mem_dqs_is_usable(mem);
 		cqspi_phy_pre_config(cqspi, f_pdata, false);
 		ret = cqspi_phy_tuning_ddr(f_pdata, mem);
 	} else {

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
