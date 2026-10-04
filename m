Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D604BCA5FF0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRtzF0vuOLxdoLxYD6KY8OV+PsAggMkNlJ75vAnlUeo=; b=nJg70zbK+N8cdU
	Byu6LxWuBXnCa5Yc6cz1dPjKUxMV3DFZo0AkF3SA/Vw+T/e8bitMhiSMHBD4GGO0573+cOLzOBFpZ
	d7YLUVwZcA0EkUqcs2SkDNx3PUd0nlKoy0x+P7UiHV10Gzk5hd39Tu+VFblSYJ42Xjv63WGLKVmcL
	QFZKn0xQ2UcubjOJpLhiGcbOdKVf27g2tXCB1ehp3g+YCu1eSvZM6ux3IFQinVwHUKP0GRpcK+OdI
	3gylOZVyBaSNENuigNndtH1DVCNFMvd+1mhlMhyLCPCgEj38l9SJXRxSwVNZL2gQBMzEBEn4FFZg2
	PnqztXWwK4fpF5g1IpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDToE-0000000FMiY-1PmP;
	Sun, 04 Oct 2026 21:31:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDToB-0000000FMfS-0Cel
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:31:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 92FDE4E4116A;
	Sun,  4 Oct 2026 21:31:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62133604FE;
	Sun,  4 Oct 2026 21:31:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53FCD1032845D;
	Sun,  4 Oct 2026 23:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vOHz17WNePLEEE9OMB3edY/QK4xTISPUZ92W5KwmCK0=;
	b=Zm3jl24gCn1bLzbNerqM2mQYKNHjH8hcJ2RD+7dm2r4qy0A6fe8bi/uMVsXx9eDKKeVYLh
	dlDKs1N9tNI9Er2WXXWoQbRnGfTPMde3Bm2A1inNctjwvd9ywUMpEVlCFev2F5wfI4EeC+
	Ql1yn2McObq3LQnnrgeH0Mc9kSVLKgQIKQMdwtUcNe3Zp72HgoATrRE9FGoM8SqMPJ5286
	Zmlei3mEILkMyBetcSMQfXUYE5JFYkhoQpeQii/d3qcAPgiUp1Dr9WGdGO8ByEUXJUGuej
	Czw3L0RVX9/VcZOwIYsuZtVgT4q7YmSbzgDsIsbRqZR1sR3EANpc8MlXK4dPKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:20 +0200
Subject: [PATCH v2 06/17] mtd: spi-nor: Drop stale values
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-6-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_143147_241961_7BB56911 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

These apparently Micron-specific flash opcodes are used nowhere. They
are not exposed by a UAPI header either, so just drop them, they are
stale definitions.

I discovered them while working on Winbond VCR registers. For a
moment I thought VCR registers were wide spread (but, no).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spi-nor.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3e3c6b10186..1a2f15d8426a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -89,10 +89,6 @@
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 
-/* Used for Micron flashes only. */
-#define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-#define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
-
 /* Used for GigaDevices and Winbond flashes. */
 #define SPINOR_OP_ESECR		0x44	/* Erase Security registers */
 #define SPINOR_OP_PSECR		0x42	/* Program Security registers */

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
