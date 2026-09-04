Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D63C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEkXr9nJ86eC/IXLmnT46KkWQCUy9AGVEDoxlT92tkg=; b=bXDSmhv0zGLl4b
	q/8MLke+6he/T0lOA4bKcThRPgqBRkXOUu/hWXEv5hKkT+u8k+OvmDB6HA9PIL5nFIadUHz+do6+F
	Y0H9/KI/7klWhUTn6jOLmKIapeIPYF0dtRLQTcgBOswACZuCe6IqLpnwo7DCs0gR3a0/4BN/mlJES
	lauOCXu+xhcXlNumzx+ugapnMLGTGYGMSXdX49WfMXmGVEiIZKju29dNYcijyhPuGrUKJWKiXoQ0m
	AYE5kVu/BFF50CxZ4mbAw3rD2oZR/kBLO18IxuhzWSrNJ0zQbcvcujvdYXNG9hU727aub/jfZjlRD
	0piz7isq3BreyhelVrtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZW-00000002qm9-23rY;
	Fri, 04 Sep 2026 17:19:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZV-00000002qkl-1qkP
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xzkxgf/mTYzyxWphx0XPaHi32gxU0RoiOilriNHZwuo=; b=q2u334nRtuCdcX+01q9qo7UxEu
	leghcF2shljCu0/dG+lmVRhAo0QR3S6dAnPkIDWC6Hou3XRum5g661Awt1OCTn5rJT9SA347Ob8ng
	yzlSGKEv/L+HX7KoXyXbT10tRDG1SU8hOnxtZv/6RO7aHuqafsNxVs4rcDDYwqcpInHV69zvLqayg
	YnosX+PLUT3nPVVE1xmchU9PT7zfwBGI1kj8a38SD2GXQieaKRUZYEdJy5sEvJ4WkCkEndckHPFa0
	NChpgXfWn8/HSnfSMNncg3TgVyVdGG8aeZqdj07WIi6ywpd66q8fO0sQzD1BqHPLhA/ZxaiKWEU1F
	v8kvlIjg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZS-0000000EKr5-2k1p
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B1764E41515;
	Fri,  4 Sep 2026 17:19:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 209046057F;
	Fri,  4 Sep 2026 17:19:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 329B711C78705;
	Fri,  4 Sep 2026 19:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xzkxgf/mTYzyxWphx0XPaHi32gxU0RoiOilriNHZwuo=;
	b=U4Q2yPnaMj/TRpJZoPLvfaSr1YPdJYgDrAI/O6vDOqhFnYgTWLweIHnHLBjFBVsGXyh0Vh
	ucTQjAVzwaO3EcGBX6MYvJtb1q0r2QzmssVXaEnh6tmxRh2sZiYBnXYpWQ/FoVHBnGx+5l
	YstU58usPvneocoNDp4xBvaXIx5NqcYmH8VPOdnZpuHzILIbWMhYQOtmKtcZ+nCdLTKfyA
	+Nm8CgxJL+iZyHS/Tqol8lgsZ4M1Vu4XqKs4hA9X6J90cS1dMb5DpSpYUowB0UfUNVu7PW
	NLR1ldOMjv5eMfJikQvyZ9mptO091z9/YeMaKeq1zWvrdhvmXHT3zqYXDjNFcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:58 +0200
Subject: [PATCH v6 05/26] mtd: spi-nor: winbond: Normalize names
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-5-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181922_847215_52276E1A 
X-CRM114-Status: GOOD (  11.20  )
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

Winbond chips cannot just be named eg. "W25Q02JV". There are always more
letters after that name, some of them matter.

- W is the Winbond prefix
- 25Q is the type of device
  -> 25Q indicates a quad capable SPI NOR
  -> 25H indicates an automotive grade chip
- 02J is the density
  -> in this case 2Gib
- V is the voltage
  -> V means 3.3V
  -> W means 1.8V
- The next letters (either 2 or 3 letters) are completely irrelevant for
  the software and purely indicate the hardware package.
- The penultimate letter is the temperature grade
  -> I for Industrial grade
  -> J means "above" industrial
- Q, N or M indicate factory states (like QE=1) and also the DTR
  capability.
  -> Q and N typically have the same IDs
  -> M chips typically have a different ID

As a result, W25Q01NWxxIQ is irrelevant and would better be named
W25Q01NW-Q, W25Q02JV is irrelevant and would better be named W25Q02JV-M,
etc.

Make that list uniform before adding more IDs/names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/winbond.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 13a2fcd703e8..ace9e620bfa6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -301,7 +301,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NWxxIQ */
+		/* W25Q01NW-Q */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
@@ -334,7 +334,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
 	}, {
-		/* W25Q02JV */
+		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
@@ -372,28 +372,28 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NWxxIM */
+		/* W25Q01NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q02NWxxIM */
+		/* W25Q02NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_rdcr_fixup,
 	}, {
-		/* W25H512NWxxAM */
+		/* W25H512NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25H01NWxxAM */
+		/* W25H01NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25H02NWxxAM */
+		/* W25H02NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
