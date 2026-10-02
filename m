Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042D4CA5FE6
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRtzF0vuOLxdoLxYD6KY8OV+PsAggMkNlJ75vAnlUeo=; b=owdvTTjvaziG1F
	FuGDJpmnMjjZHZklTfe+iBCJRIcgOfTib7WJ5R4aLPx36o5+RoCSTVA74GDgTUdlC3QR8+Xdd1aYV
	04rOcZhIuIJKvjSS2CTkOMIYm0Jj8gnPD4Yg8PFUbKq3xT8aQvnIPrBAbL2Ss94vn3pCkvBFjX5/O
	+wmOz/FYBWNngddhp2vqvN2Lx4JYN0CjxZXRlRHe/SXSipR9qRrzSze1g491AE0j2H3yanU3T+bl/
	7jwb9glkzNUv9m5+7s33msIrbjr5hTk524C10Flz8DAD22Fvw7WUtnxJZTlqM8lE0BpxVFKJeKeNw
	nokWhkaEWQVqkiYtE0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGn-0000000BYZn-3PDh;
	Fri, 02 Oct 2026 12:21:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGj-0000000BYWr-3gXE
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:21:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 60AA64E4110E;
	Fri,  2 Oct 2026 12:21:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 343B4603DC;
	Fri,  2 Oct 2026 12:21:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E383103281EC;
	Fri,  2 Oct 2026 14:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vOHz17WNePLEEE9OMB3edY/QK4xTISPUZ92W5KwmCK0=;
	b=fL2fj/g1CyEa8LiaAYYCKkHqQZ2AhkLho0RfRr7ceXNAS70OR0s9yiVp9vrDa87/QujGMb
	nMb3sUeUoBv1gebsz5ihjmRB3jrHwuN32YQXf6+3U58MEGxS+ePHXcANtjdW1ZLMyzBs/c
	YSWoHITqO4pXubQdc3fuG2SdNWe79MUqZ38waFU5eED0KWoAm8HNeZB+MaVnuGKbYsVj8S
	O0G1kGq81ktsZp4Zq+h2B3LFWysSr+NryYEs66TAZavEp2DWRw2YBg2bMkpQ3/ttjtHXId
	09M/BVbI2D5sDmr/Iccy1dXqswAT68c+Nbpu2paGu0s5fJc72He4zK/RRjBaYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:18 +0200
Subject: [PATCH 05/15] mtd: spi-nor: Drop stale values
MIME-Version: 1.0
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-5-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_052142_083470_9BB8FE62 
X-CRM114-Status: UNSURE (   8.59  )
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
