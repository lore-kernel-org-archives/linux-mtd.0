Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462C9606A321
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vKZD+YZc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Bjc0KQaI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wSU/K5gqVj+Rvr3TgmHNWNyxULcvV62wSj2iQrD5SX0=; b=vKZD+YZck8tk1IjiYWb6OSf3C/
	xsX0HGLS1rWmD1DsjIYrjSkGf6t2wFriQqzcak6PspJ7x7aY9qEq0vvaW0QRHHQ0cOWVge84HBXxj
	a77dLmv2WV5S8WLNn9cvwgTMIx5xmioT4uXjwSQF5rGiMdtIq6h6/WRsMBG7/Voe+3tTYcOqqOn+c
	DMtR0yfho5renJpHIXLkd1N883CZTWpCtQdpPJkPMZQ89XkfdgoFKeJH8pNup0OIkkM17klkyPdFo
	Hpw0BhYb8+/Crl0VA/EEIaZXnGO8YMdbvS475yah++i2r4ixnm4q7kh2D4P+D1vR3yNM+f8fGwWYl
	Z+olSX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHK7-0000000AvOB-3VKj;
	Wed, 25 Nov 2026 18:02:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHK5-0000000AvLG-1ktn
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:02:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 810B44E41799;
	Wed, 25 Nov 2026 18:02:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A96360480;
	Wed, 25 Nov 2026 18:02:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69D5711E6B0DF;
	Wed, 25 Nov 2026 19:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629738; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WB/O/SzzxfI1IB+ENMpw/Jp+ewPq+nhyag1bzIRAVT4=;
	b=Bjc0KQaINWjaBtAux9m+3Vgrc8Pyfwj6JNegOiBct9+ILRQczGnfmIcwZBGgKX6Hgw4rTP
	ysY822nEr33NeTV5kRonPBStd0VK3ChH7pWFl1blq0GuvPd5uBQnNEYkycA2W+7jWzQN7E
	4MSJ2l99WuW5StSmpCFcQj17N0uDlvmI8BErFiUue9GWT51W27e99KlsUKlie4VcOALqrq
	OALpFet9dOi5yRZGdxMMd4C+3320dgpp1aOimyuXd2Bwr0g5MG+ic0qqM1CE5Nqst5GFlG
	9xOFDSFf2++hkm+agyakZVfEWnjipS36hnc/Ju1bHVqbIYIqugDrGPwaw+WpMg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 19:01:34 +0100
Subject: [PATCH 1/4] mtd: spi-nor: macronix: Clear the default RDCR opcode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-1-0d1ab783fd8b@bootlin.com>
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_100225_618404_D38C4C31 
X-CRM114-Status: GOOD (  10.24  )
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

The core defaults opcodes.read_sr2 to the JEDEC RDCR opcode (0x35).
Macronix flashes do not use 0x35 to access their configuration
register; they read it with 0x15, and some parts have no configuration
register at all.

Clear the opcode in the manufacturer default_init, which runs after the
core default and before the SFDP parsing. Parts that do support the
vendor opcode can then opt in from their own fixup.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1c..2c6f507a2dde 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -333,6 +333,13 @@ static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->qe_mask[0] = BIT(6);
 	nor->params->qe_mask[1] = 0;
+
+	/*
+	 * The JEDEC RDCR opcode (0x35) is not valid for Macronix: some parts
+	 * have no CR at all, others use 0x15. Clear the core default. Parts
+	 * that do support the vendor opcode can opt-in from their own fixup.
+	 */
+	nor->params->opcodes.read_sr2 = 0;
 }
 
 static int macronix_nor_late_init(struct spi_nor *nor)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
