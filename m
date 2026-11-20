Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1A8606A335
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i1Hy5Kau;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wY1wnTDJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=krObHQ+5Cb2BcCTpXwDMjqZZ1EOHipYQKxr0Xf3iI5k=; b=i1Hy5KauyHd89q4RPF2WgZkTfp
	y1Lkp/7Ofwo/m00hVgkSoI3Msw7LElLmLfxbksMn+xZxQQpJPWuzjJUu23U4YbZo5uIaAX1ZHxe33
	5xP+MDZqtJqZQQugHbib8XPgObsGj2zVMQRKGI1uCNgroo3oownCcHGTro9eT8lMnDuH8xW0rBczl
	BWNRbC5VU+A3JNHkckRcKw0lF62tywAucFffqWnA0Ll4IxJXLnD+pA9j6RtgfdfK8ZZ10luUqBuYF
	581QZAJKOC5uIJqsFisugccPSnwAu5wRivtbEp3CiogNjGa5Jgxf993z0xPGHEvsD48IPv8+EHY0G
	Tn0e1Hpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSDW-0000000FeXw-1Ecc;
	Fri, 20 Nov 2026 17:16:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCW-0000000Fe6H-0pai
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:15:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5C6BAC6221F;
	Fri, 20 Nov 2026 17:15:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A004601B9;
	Fri, 20 Nov 2026 17:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 074FA11BC0554;
	Fri, 20 Nov 2026 18:14:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sbrnTC1O3lLMY5mwmHSs1TEwBYsx23gEPdvUD7iMI6c=;
	b=wY1wnTDJHs5MHmOCM+XI+uIWkVUFCTb/K5sDaV7u81Hy/T/CVml20RkhdzZRXxlSab4EBV
	2WqIp1fEBW7KmH/nKSTQniMoSv8ivEeYuTTTgsG5ZMsLhbFs3rQ/RC8+X62fkB91yosBSA
	FOfTOexSNkwo4w1mdQ7rFOIsJwcBeC3X5BJ/ZRnFIXANeYZNfMmoBjEXLbhMrhGWRuA2LH
	0e5GAPDkkavzt55KA/Xd3XhoxIrTH3LhLZcZAz+TQpBQf7rs4aOgcz0v/MBd/Hm7vlHesP
	48DSIjWUkA5voxpNor53qqcRC0mxnz0n+nFszyiJpJDiLW4KWPfyVW7ETC4O7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:35 +0100
Subject: [PATCH v4 09/11] mtd: spi-nor: Advertise DQS support for octal DTR
 flashes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-9-8c21e1f71f41@bootlin.com>
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
X-CRM114-CacheID: sfid-20261120_091504_437951_D55DE0FA 
X-CRM114-Status: GOOD (  12.71  )
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

The SPI NOR core does not advertise the DQS capability to the controller,
so spi_mem_dqs_is_usable() returns false for SPI NOR flashes even when
they support DQS. Controllers able to use DQS read data capture are
therefore not able to enable it with octal DTR flashes.

Advertise the DQS pin when the read protocol is octal DTR. DQS support is
a per-flash capability which should be described in the flash_info tables,
but there is no flag for it yet. Keep a TODO in the code and enable the
feature by default for all octal DTR flashes until the per-flash
description is added.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ecf5fdf38471..b78c8fb5a101 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3638,6 +3638,13 @@ static int spi_nor_probe(struct spi_mem *spimem)
 			return -ENOMEM;
 	}
 
+	/*
+	 * TODO: DQS support is a per-flash capability which should be described
+	 * in the flash_info tables, it is considered enabled by default.
+	 */
+	if (nor->read_proto == SNOR_PROTO_8_8_8_DTR)
+		spi_mem_set_dqs_pin_available(spimem);
+
 	/*
 	 * Populate the persistent template and run PHY tuning before dirmap
 	 * creation so the validated frequency feeds into the dirmap op.

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
