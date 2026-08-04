Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302FBC55184
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4N4D4hLTu5JT6HlZwps3TD3NUEB4SaEubvkgqNC2bA=; b=BmVyt+lT25CBzv
	yPxR1TSBsjxTPaBMS8vydTZd7ylhKGo7cMa2Gv8C7h/yVPCTjNah9+v7rOp3AmHy+NOtRnB+fSjkX
	Wu49FEIY0SAmXGOtYqIla5sDh4w3dhem21wyiRKrgPjC3ZlMmyCi/aUsVuvYW6taUgzrNQSC3YeGf
	B6raoi9dUK/pcZmFQWhhP2YfmnmNL96ku77mTJ0g4wzJEyS4HBlqS0rbMbQmN7AR20wELfp7FKm2i
	mmQ5BvDatTMkeVGqHFgfdFxnk6WLkCsOFKD1q6boZqyoKHGpkhTVrhqrXRu1Bjv77K5MaWbHoDlvQ
	cGAeNLlFSdwmGtOUScqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFli-000000020X1-3jFZ;
	Tue, 04 Aug 2026 14:05:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlh-000000020Ve-1i9x
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xFCGZoKQiD9TzzTrzW2O97nG3CHuVvL+BWagyTusTuQ=; b=CJaFcEueOjkMhJzwBgdeswfPoy
	QBjRWeUgigL1f3esu6HQLZyZIce/SlVYgz6CMjAgfsuzIwNaiBZjaJSAVC/46XHqTZkhBGYAdphQv
	NcQq7bf5BPh7ncnf3pbTZOyzZe6XCSuptlEgUhZIRpJz8HPy8/OlD8eCNhPUDP+c7SqAEXYQRkKrI
	Oteukn64VYT8p9DDt5HQzcgLhT5tUb0zUeKdFzz8JifAMnAtOjY1W6dJNTNCST8tR3CMuMT6SRF1D
	3vaeE2V5GsAjfGXjHvTtShR2W2I+ktp87fl1fjYJVTSUg1/SSZgeuGFPgoGLwJnH2Sr0wiWR+Un2W
	iEdcpvpw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFlc-00000009yUc-1Snu
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:05:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B330E4E410DB;
	Tue,  4 Aug 2026 14:05:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8513A6029E;
	Tue,  4 Aug 2026 14:05:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3A7B11C32D2F;
	Tue,  4 Aug 2026 16:05:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852310; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xFCGZoKQiD9TzzTrzW2O97nG3CHuVvL+BWagyTusTuQ=;
	b=izhEkB3HFIc6tm+r/07gk+8AYM+RhYtecVUDMOpYW8b3lfpd0OM1Nshl7irzltgQCIRCqI
	Y+PNw5MOQKH122iw/pboaB0tAHJt6vwq/80BCAfJdselOPC47YSnxjD/HR1J50a99jG7Nd
	ebHExlh1cM1zOHHSY3x7ZPPM1wGYsCLA/Zahddvek9qNyrumC/wQVDDyiCgY8uNlBdj0ll
	V2Cyngg8loCgUQpT+Y8Rm1svyB3SvV1borubTVAuJ6qGSGb8nVNfifwmisZOwrnXFLc7U2
	hM8pmb9qrAVBFKwli58zCCiGyP/QYqbWwdRosxaL5XYXyRxmjVkGD52Y5sfYxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:38 +0200
Subject: [PATCH v4 16/28] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-16-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150516_553672_077990F1 
X-CRM114-Status: GOOD (  12.11  )
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

I do not have any W25Q256JV-Q/N/M nor any W25Q16JV-M chips in hand, but
all the chips with a density <= 256Mib are older revisions of the JV
chips which do not yet implement the 4BAIT extension table, as such,
they cannot advertise their quad page program capability. We can
reasonably expect that these chips follow the exact same rules, so add
the missing flag.

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the bit remains disabled
for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 2cdb4acd9ecf..b250a43ad4e1 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -226,6 +226,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP,
 		.fixups = &w25q256_fixups,
 	}, {
 		/* W25Q512JV-Q/N */
@@ -300,8 +301,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x15),
 		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
@@ -327,6 +328,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
