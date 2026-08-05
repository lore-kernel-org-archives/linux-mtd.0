Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169CFC55822
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prHC/jZQkGw+x5hL2nXACrQ5ZZ1aGd/Rs15ZwVYQdY4=; b=rqppYM0DAXYYi+
	2MwXQcS2OS8Ie33RJClX9MlbcFm3Rq6bpyfn0RH2HAWAdYdYDBhojVvueO/9a20sVGqLdrybFtmYB
	qnSO27MjexSgbOIi9BW0KT7/NEGrFrpdDmyo2Ztv4XMYxYtxPISnT6hH9hdURnQcXdHgkxIuhcRBC
	2EBUduhmKK/wQdcQfWhIri0N/p/oDVyUYGtfzs4zERTXlF2Ko/hn92yyQ3r6VAKsgMajwDrCfZJ+6
	688F9l96ZQzxl5FGIKFAme7DoIJ+ycpPFMU7u357Rot2VQmhPNbwSpwffRoJEanemyFswl1KRKiqx
	QRMFi+d0cK27TlnSwBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaC-00000003SN3-4Bhw;
	Wed, 05 Aug 2026 08:02:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWa9-00000003SLt-2svz
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:02:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 297684E410C9;
	Wed,  5 Aug 2026 08:02:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1C23602AB;
	Wed,  5 Aug 2026 08:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0AC611C3435D;
	Wed,  5 Aug 2026 10:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yvQfAQ6ul/Yz+2+1gG0R0lXCRBcilkGM4EtQVFdD13c=;
	b=yN8MtbrzgAtDIea1DJY/rtXX5gdHuy2erTtotLHSAPEHNcKP8CwEvu3136GaIMVk9rlAY5
	kLnRCoxsGsjsgkLomPDgSD5lwTEJqUlcMF+4xjMyVFh0KHN9fqHYCVkSudlCEgvSmo5l8i
	6jY6NIQyc4LsDSMQoMwVHzWlMQAP3OV9d/d8BsizpCVkrrLcBteFjBc+XtpbZBx7+AvfRY
	7p1pPKIJJGUXx8Cl6BsWhiW6oqA6CX6EjRrjd5ZoP+hyjti4LzL44QW9rY+gxAXDVUWiq5
	mPQOpcxCuPf9YRq52HeRKJZTxs6L3RkPofrx2PUqkLJTizsLpml+YLhhAXKqKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:26 +0200
Subject: [PATCH v5 01/28] mtd: spi-nor: Fix spacing in function call
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-1-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010233_932456_BB0E18C7 
X-CRM114-Status: UNSURE (   9.61  )
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

Remove the double space.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 4600983cb579..6a571d8d822c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -453,7 +453,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		    bfpt_header->length * sizeof(u32));
 	addr = SFDP_PARAM_HEADER_PTP(bfpt_header);
 	memset(&bfpt, 0, sizeof(bfpt));
-	err = spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, &bfpt);
+	err = spi_nor_read_sfdp_dma_unsafe(nor, addr, len, &bfpt);
 	if (err < 0)
 		return err;
 

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
