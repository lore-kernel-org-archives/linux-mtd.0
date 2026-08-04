Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEC5C5518F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prHC/jZQkGw+x5hL2nXACrQ5ZZ1aGd/Rs15ZwVYQdY4=; b=s5Pp4K24vxcQps
	2/nL93sv5W5atapsdn3A6kfr+HXNn8250tbBduJAAZImv7mw69HDwMmY7YDosf3ngTvOskkpRgqx0
	SpAoblFIlSQUPwtDcLRN8WyEiKw1Rkeo0o68CFkKh+g5Z7j61EG8sdaFjlFGjVgga6EIkc0uxFtBY
	KEUWH3GWIYltoud9Dv4g4qXmqtvmE7cFvGOQzfdluIez3LziGCg9cpZwpzA0c6YvWQ066E0fVCY9P
	SpWTV4Wz1H/jZFhpORtIk5Goj6gPz+gGuV2XVKR9Av//VDSX/c10JtXfVB/5vAnvXvRGYtt5fSK6r
	5qZ+wlYb0dViLBYzyarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCru-00000001bhL-3a8I;
	Tue, 04 Aug 2026 10:59:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCrp-00000001bgP-18uy
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 10:59:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C965A4E410D9;
	Tue,  4 Aug 2026 10:59:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A074D6029E;
	Tue,  4 Aug 2026 10:59:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2EF411C3046B;
	Tue,  4 Aug 2026 12:59:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yvQfAQ6ul/Yz+2+1gG0R0lXCRBcilkGM4EtQVFdD13c=;
	b=ves8LHN7EEQjV46dG/TKsLUd5nFErjw1XDHuia/fqquUsCE6CCroRSmZrv9hDKv6U+B4gd
	7h70WaVQgLPWfLkGjs+pkIL3pFXLmq9khPBeEkpTgzzV+vUhyzmF6W6mkFFH3n1JhBKTg0
	5ND7zoYoLrn/HybwoB9lPp7nQRUqV1rfEMr4hqEiCTL7pyAMckaeAgrqNE51Ksy6BFOYna
	0Q6zjtTpJLYLUT4k89pyOJXzO+7wDh3e2gmmHycaMEuKCUjiqAq5fIVJxeWb+xjVRc1zxZ
	Q2bu7xjOKypJL4IxCh7YrhREAWVwv2cWdxvGUDx+Emltjhg27Mie4m/wx6u/Nw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:58:59 +0200
Subject: [PATCH v3 01/27] mtd: spi-nor: sfdp: Fix spacing in function call
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-1-542ce107bc92@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_035929_453385_CFC8D57F 
X-CRM114-Status: UNSURE (   9.47  )
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
