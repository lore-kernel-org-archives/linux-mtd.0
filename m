Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACA4CC6B1E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRtzF0vuOLxdoLxYD6KY8OV+PsAggMkNlJ75vAnlUeo=; b=tPxkGo1jCqRZG1
	3nKgba0P5jw+mFdmBFtt9dufeAm2QZUfmng73puyLzKQ7QwYrBJ064WK3b9fDtq/k68dj8CoLBYin
	iRxObU/IGtHnBT2DO/Jc0798oEEInYTwkXuRzQ42CIm4J0IQi5PAPCJ1/bzs0f1v0ZHTf0D9o0QmN
	tIcvHWjMdPu9hYaT9mZVd6uNX0+ApzeRaGVe7tP6aujhHdB1YCAKhs1Ov32s80wvpIG2pdXviwo60
	GsSvWrLug/SF2iiXpS66jG6w3BNDLvM3enCVMxQqKL82nbPRz8Iny4MbfpOEdbtEF8e4Ua8UeEvvp
	aDp8He1pmw3zNzdxEruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSl-0000000DX79-0goL;
	Tue, 13 Oct 2026 16:34:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSe-0000000DX1S-3WM2
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6AAF21A1219;
	Tue, 13 Oct 2026 16:34:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FC8C60362;
	Tue, 13 Oct 2026 16:34:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DEB411D7180F;
	Tue, 13 Oct 2026 18:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vOHz17WNePLEEE9OMB3edY/QK4xTISPUZ92W5KwmCK0=;
	b=pP4fxmJkjpoJRHJYc8F/oh3a2ZOORwxZEM5LjuQH7fpLyD5VvmWrwKB5cUaeImwoIlRzpA
	QpIloeZ+/wawspmPL8NiX44QXSYqaPsWxmo3my8cfuzNYwzcs/OeAm2Xq0pybObjhvVPog
	uLj6avMxMJptQsSJrnKv7M5Ln3EQpzBywITZ5utsNy7L47n+mu54lmjKXjBLUMUSdAzRoz
	9BHdGvxbO3pp1utze0uV5Z1o3YhtxblK/U7V3D8Pio2PfAhryIc0vZZd4lyo+Ik4kCqqFK
	0QxPuwurk/pra4UFfYkJdynoH2VhauLE6Oyntp17KwFvFY89qp6fBPYSndV+jw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:57 +0200
Subject: [PATCH v3 07/17] mtd: spi-nor: Drop stale values
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-7-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093447_984140_40E8DD0A 
X-CRM114-Status: UNSURE (   8.51  )
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
