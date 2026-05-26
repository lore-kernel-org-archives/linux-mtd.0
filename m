Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F5DCD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fvMwgA/7+lJnAaUGe8VLqcV4q3M5K+APgfWVbZ8c8Q=; b=Dh2zcu8wWTdw4J
	nOpEc+5bjD82C0Tk50U91hplR8iXRCOKtlYzyuLqZpK+iw4HzwDaAoxSBz4SLh9hMravJiDe8sIsM
	LkPPLgVyY3/x8/TA/o5uPnOKKScb511WnMnhXxNrkAePfvAvFAp7ziFj/qX1g6nb6S4NODyynCRwL
	epZLm9/6Mn4rOFsn+NCisSswbe+9AFiCsOZJ910WiZOfrJFF+lCTRo2iOcKymZup2Xq3Af/FCJ9G6
	YE5nE4dR4++L8c4GrQesS6yym+5dRqZb1cVZnlbn3CeDuvgIVRzLP1Xp7xTICFftWUNM249YE1C4y
	GgO/MtigUfwT0VxtW73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDj-00000002Fm6-2fMa;
	Tue, 26 May 2026 14:57:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDi-00000002Fjo-20Ao
	for linux-mtd@bombadil.infradead.org;
	Tue, 26 May 2026 14:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4eOxwXGdBa/N/cxA091GkSGGYkj0VIM36RQVYQqTbRQ=; b=TQovw3WftzbJ2WqNnrvzuGwYjn
	drPwGByWxxqJAVyBx9Mk3vX9x1Nq92iFNePyG8NXuw+kAO0S26qT6fTWNT2JWlUfPVowhMGftjglo
	G3juErDBJ527eaxhEIyhxjJBWkqDUdU6v0YRuoqV69msrrRLscYBTNgDT65Q96vnjrXUpRPFuAoTb
	xQHdxFGbLc3/fwYm1wk56aSzH72YQld9EFQ7I/jyD0QBKLZTgp9A4t+2IVLAReNZNsbjmUWX1I/mn
	vAsFTzW6nKwz1da35vEpEDPsCEOKj/1Pzg979F3yf7GKjk4clyI94DdcBInlQ6yVXfwjjTB9QTz+m
	7649GuGA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDc-0000000BalF-3zCN
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 99EFC4E42D5E;
	Tue, 26 May 2026 14:57:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E8A76073B;
	Tue, 26 May 2026 14:57:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0706C108888D4;
	Tue, 26 May 2026 16:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807431; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4eOxwXGdBa/N/cxA091GkSGGYkj0VIM36RQVYQqTbRQ=;
	b=BKNZo7frA6/ZOrUI+7NGbYpd3jsiXHr1sCYqHQAuO8ooGoXk8JEG/mv3EbDK4/GTe74JFP
	3X7SFy8tEYHxKdAPw0IMJedIQ7FKgBBkSBu+vgr0NNN5UZZ2TWZ/hJk2MCA6776LcC7jgh
	FDRYQ7ywM5nMtt+RJKcRnmHbtw236Tm8BgAdiGWDjmAyYiFvmLET5SJVJ1EjK0jvN2Rnc8
	OohmwHJ18OQrkzD7cxISnFdC5JqUEgXk8k1Rt14ii/D7JqpIfg+v62bAfZthl71gS52X4i
	x3EU7LzeOIBqtnW1NsVcvlFndZHHBoT0aGoyO7Jp4J5duxNqoiIN4ngKTwaF5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:37 +0200
Subject: [PATCH v6 13/28] mtd: spi-nor: swp: Create a TB intermediate
 variable
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-13-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_155721_423712_3D221059 
X-CRM114-Status: UNSURE (   9.35  )
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

Ease the future reuse of the tb (Top/Bottom) boolean by creating an
intermediate variable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 07269e09370a..540cd221c455 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -62,6 +62,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
+	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -81,7 +82,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
+	if (tb)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
