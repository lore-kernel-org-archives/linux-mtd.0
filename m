Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B342CCC6B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVthADAOi/Ks56LhhQ/gkJJxHQJ8x+whHyYvR54XSYo=; b=lGWWmc2S0AC3G3
	3uH5jd0Mx5GeHRFcTx1+xhN3nN8Hh+EclWtNHK9glge98TbOjSAmtqD/WwcX6gvZqSEAizvmrSFwA
	EAiSjWLe9tIfm79hWYhdmkXuK1Exf8XFml/hXLjaJ+uYtpWNFKlM13qdnNmvOisfkGVcQfdw4z7Zc
	CvaH/Ky/cwyxMHeTlJI1a5a4Bhey7QCha5wugFRKQjbcmRfu/mA8BIjS3O0L6rA/gRFHXu0mi6Ra/
	VnbnSxj0uxHr7Dt7kIkEUPpdWr4CQBvnLJW+B4cBNUM3zPCK+y+MvQ5JJcOTo8MbH70fkbrVYlDde
	w8VSo6roQrYUVhnao/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSk-0000000DX6M-3luY;
	Tue, 13 Oct 2026 16:34:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSc-0000000DX0U-1t6c
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 068771A1215;
	Tue, 13 Oct 2026 16:34:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D038C60362;
	Tue, 13 Oct 2026 16:34:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44DC411D7180E;
	Tue, 13 Oct 2026 18:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lKU3bfFA3TBWByBniXLhckIqiCwee1j7ncswMHgAQeQ=;
	b=BTW85LBViwnfm5OBJ3LTFFfA7Lqodc7Yv5MYD+c79B84THBm4iAmu2xGKrYagWjbmD2Rlo
	Vr0sanpeUzTlhxdYkrfsPRYEPDCFukcCuuVtQ/kj3g/Wryx1Pjn+S0yjFriHDPlbAAHdA9
	cAkhcCz160/OgdBfBGWwoGz1wDnTvDTtnMP5KK8RKJ1sYyqsJHR2nLpaWV6d9dmGcndavZ
	1bdzYzs/LtwYr52XD+QxrdgtuwIWtFFSTMcpNy4s2XZWt83bB43G6ZrTZWUEewaQgeiqEl
	/HRLukAz+sRMSnee3xHs3PZYZ36myHO4+V/p0/oEeKFzrO97rXPaMIIXYRW4NQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:55 +0200
Subject: [PATCH v3 05/17] mtd: spi-nor: sfdp: Enhance a comment
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-5-6dde1d513df8@bootlin.com>
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
X-CRM114-CacheID: sfid-20261013_093447_970183_21F1A4DA 
X-CRM114-Status: GOOD (  10.65  )
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

While working in spi_nor_parse_sccr_mc(), the actual meaning of the
comment was not obvious to me. Not sure my proposal greatly improves it,
but at a first glane it feels clearer to me.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..9d5c0bbb53ae 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1417,8 +1417,8 @@ static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
 	le32_to_cpu_array(dwords, sccr_mc_header->length);
 
 	/*
-	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
-	 * additional die. Hence, length = 2 * (number of additional dice).
+	 * There is a pair of DWORDs (volatile and non-volatile register offsets)
+	 * per additional die. Hence, length = 2 * (number of additional dice).
 	 */
 	n_dice = 1 + sccr_mc_header->length / 2;
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
