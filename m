Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73E606A335
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RKFvmwsv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qc/fJomL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H2Yjxh9GiAMnkw4iPxpA8hDiNTZnSERbUxy/3GcSycE=; b=RKFvmwsvYQmNkl+wOkqVwzjLa1
	CiT4eP1M+kMYE2IQYI2hiUZ3wPK7P50s1octBTFWIfiwLyYEthgVykvtq+DQpk8EnMcSxCtY9/Rgv
	2ci8clOZ/uZacp1eVMkEILoliOeKC613VCZbSdTak1I099cIuR4gCaX8TMku76+JdwAth9SzIVF3M
	UCrz8f0ZnbQqqg9Lg+4UtzK3YBqlvJjkmzfpJ9UTGnl89qo3uPJ9MZopzivVlT1G0AeLgVpqZzj0l
	RPVZpG8Ck2PdcVzxZ8O/NW6kbf6aZ5PUaO/GAuXryvXpmm/NwgGFdSTP4FEYL4Ifha17BftL5FkBa
	JmXM7/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHKC-0000000AvSd-3zkh;
	Wed, 25 Nov 2026 18:02:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHKA-0000000AvOy-1WLT
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:02:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B126F1A17FB;
	Wed, 25 Nov 2026 18:02:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8041160480;
	Wed, 25 Nov 2026 18:02:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3A7811E6B08C;
	Wed, 25 Nov 2026 19:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629743; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=amXACxc6kvuFOioEPYVn0GJszMbjP2vQ2jHUimjGnwU=;
	b=qc/fJomL7OWuco4DNUdISPLPOLQbm1ca6x2KqzJ55u1ygNUJ7XS1a0tr3Lt38vWKY2QT0c
	k9bENsX3PlTwU3mVAta3QyUE3hro/h9hNUWWhIO3IFWPIqb9jk9anybyCZ5t4qo8ALLM/y
	HoTJUgUia9E9aTqAyN89enKS3nLiMyPu0hLrC/mqERDjj/05KGXmjTQJG5fCmFQQuwpIIa
	Wfcn6+4oRiW3n26XcPY5g6jpy6aAXR8NBlRzMTPYuWV/8scNzESXbWK8vlG7Fk0OBqZCjo
	1OgirsMoGbH4olu0KqhB3JzLxbyAMby7W2RR5VIrXY8wqIlnpzCl93hsQff45A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 19:01:35 +0100
Subject: [PATCH 2/4] mtd: spi-nor: macronix: Clear the RDCR opcode on
 MX25L3255E
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_100230_670298_73680B32 
X-CRM114-Status: GOOD (  11.54  )
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

The MX25L3255E BFPT table is incorrect which leads to the RDCR opcode to
be reset. Make sure the configuration for this chip remains correct.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 2c6f507a2dde..0331f9f3f853 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -64,13 +64,14 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = nor->params;
 
 	/*
-	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
-	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing
-	 * the quad_enable mask is reset. Therefore, it is necessary to
-	 * correct this setting by late_init.
+	 * SFDP of MX25L3255E does not include the Quad Enable bit
+	 * Requirement in BFPT. As a result, during BFPT parsing the
+	 * quad_enable mask and RDCR opcode are reset. Ensure these
+	 * values remain valid.
 	 */
 	params->qe_mask[0] = BIT(6);
 	params->qe_mask[1] = 0;
+	params->opcodes.read_sr2 = 0;
 
 	/*
 	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
