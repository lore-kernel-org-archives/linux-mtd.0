Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65216606A31E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cwsWnYqE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=izyB0PWS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MU+QpAu0jVepd8FhsDyEYyHdHYHUrLLNHu+fcR11DHE=; b=cwsWnYqEWpkhjAJ7okYwl0LA23
	Z+5pkDIrGXhQfwsgd62dLk+/7EbrAnQ+CWUrXXEHCQqmOtE4rY11sdTdDV7ThCS/hDUn/FbFI8mCO
	+adSWI0Bq4NmxD8l3VOIZVN7JWG4iU8zFUd5dtlXAoW/rCHnA74H8PHuBkp7iA+fJXqozknhrY/Lt
	Q8SX/Bce5kekhTYIKgJL+Bo/EICq5+vVB6+wDosERQy9Y9rgobBEW/fQCMooJpwdD9c5C3qFCS8Yj
	xGC6M8Tyxi4p+0A59mm1dbeuIkX58CTiayXv4PqLr1w0GHIqRNQbiViwiRR7jmCZSzJDqZuknuJhm
	wb9rQ1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZkN-0000000DPq2-0L36;
	Thu, 26 Nov 2026 13:42:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZkK-0000000DPnj-26ej
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 13:42:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04FF6C2B9D2;
	Thu, 26 Nov 2026 13:42:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A84C0604ED;
	Thu, 26 Nov 2026 13:42:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65DF611E68308;
	Thu, 26 Nov 2026 14:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wSEKEajLM9ooDBuCls/LQ3V2KNtkuaze/IwA+roNk8I=;
	b=izyB0PWSIzxIKmoyxnoEQZZb3gWF3uf51YOoccZFb7Rde7BITmlz84CUUeJvZHBuFpN1rM
	ekveZX6FGry8rPFyDv/FMKL4RQSHY5rS9l/eaMujcER37gCFcIgwK6fCopPt8reOdgy7k+
	fmEvPLik2u/TZ2QanOiXQGU4CKVKOa4/WkjhyFg0q9Lvl14BsOxS0UB8fid1ivFsH8dvO4
	I226j2xhQzjASHTsqE0mH2QHowhzf+58PaPymiA4pUXxYQj9guz1GPTKlRTXjA2BrrGymB
	wT5bgKtWBOfA8FLaQ3qbfjehlGo0Msl0h6FarEDQcFU4yh7DkuEq4ALFmpVZ0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 14:42:27 +0100
Subject: [PATCH v2 2/4] mtd: spi-nor: macronix: Drop redundant MX25L3255E
 QE settings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-2-672a59abed62@bootlin.com>
References: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
In-Reply-To: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
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
X-CRM114-CacheID: sfid-20261126_054244_706500_801072D4 
X-CRM114-Status: GOOD (  11.56  )
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

The MX25L3255E BFPT is JESD216 rev 0 (9 DWORDs), so spi_nor_parse_bfpt()
returns before it updates the QE mask. Since macronix_nor_default_init()
already sets a valid qe_mask[] for this part, there is no need to set
them here again.

Drop the now redundant assignments and keep only the 3-byte 1-4-4 page
program setup which is still required.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 163f1006130b..92241f7b0057 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -64,18 +64,9 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = nor->params;
 
 	/*
-	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
-	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing
-	 * the quad_enable mask is reset. Therefore, it is necessary to
-	 * correct this setting by late_init.
-	 */
-	params->qe_mask[0] = BIT(6);
-	params->qe_mask[1] = 0;
-
-	/*
-	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
-	 * address mode. However, since the 3-byte address 1-4-4 page program
-	 * is not defined in SFDP, it needs to be configured in late_init.
+	 * MX25L3255E supports 1-4-4 page program in 3-byte address mode.
+	 * However, since the 3-byte address 1-4-4 page program is not defined
+	 * in SFDP, it needs to be configured in late_init.
 	 */
 	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
 	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
