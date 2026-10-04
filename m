Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83826CA5FFE
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/7yCxbK2z0UxOIFiyUHXg6eWHnGmRApq7soW5vTIYI=; b=JCjM17Wk9Tr4sM
	MOY7M8b9eL3t0Ehu23iRNutVJqEtskyJYIY3Em0A8lWuTDnxlsOpWepm6+3zEQAUIS2yUFxlt41TB
	cVizrOfhM7ZBSN8z24yjFNDqFfFvoX0Arj9fdRy9l0Yc4RbKEmuj3g9bNzxVTVd4CMbEq+bGw/BPi
	/7nyFgZQKUCypDRCFeYnnJbid41geUHGsJ8yYa/Egf5q2UVMCVlJjnQHI5RPgOnmhAsTzJNXEj+qF
	MPPpEJ4YdOaaTtHYI8EOks1IUNTNFBVsDqBighwbfAaqcpsNm2qqATUuG/b/8TYa2Y48xnR7GaRtf
	8kDwNIwRudvEnF30+cdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTo4-0000000FMaJ-32N4;
	Sun, 04 Oct 2026 21:31:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTo1-0000000FMZ2-2d6G
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:31:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 398F41A113D;
	Sun,  4 Oct 2026 21:31:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DF41604FE;
	Sun,  4 Oct 2026 21:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E46A103283ED;
	Sun,  4 Oct 2026 23:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3rH+xtaEE72c/dMWl13TrWCqgtJCjAS6ZGNblkbLQAU=;
	b=0EnWPPD3ggBKGvFs6CgKb2aHwY9etiPuWzufJrr9D/dox9WIxjt7YeH4d5oegxMeSWLxnR
	65uccEclUTA9sA2V5jMhu5MVagsEa8xj4yY72dlsrbjCVym2NO6phHDEesGU9OPkW++m3V
	wxMv+RSC0ahfQZT5Asfy6tU2cxz3FkQx7sSl59kurbUHaPSwVA9cQlJbbLl9grUY7+Gzl2
	UW2bcnfzhy+3tIN3Lt+hwVNSusJZVilVMsMzv0GqkifG6v3LMEjCXfxmD8En0M4GWDdDA8
	kov8uHVUFj+KpvIzLfU99KU1tq4OV1CgiPR+z+81PZ49xxAJmaIH09zsjDD50g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:17 +0200
Subject: [PATCH v2 03/17] mtd: spi-nor: Fix spacing between arguments
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-3-592f3300a70f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261004_143137_807232_DABEB87D 
X-CRM114-Status: UNSURE (   7.46  )
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

A spurious tab got inserted there.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9c61ff4b93c3..4b9e0410f2f5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -773,7 +773,7 @@ int spi_nor_read_sr_ll(struct spi_nor *nor, u8 opcode, u8 *sr,
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode,	const u8 *sr,
+static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 			       unsigned int len)
 {
 	int ret, i;

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
