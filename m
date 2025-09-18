Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931CFCAC59A
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Sep 2025 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6zUm0X/anP/CrgEUHdcZafXVVrBw1z88coW4/v1t6c=; b=mPtDhHxh33y6rJ
	YzL0Nn44wNDmd8e7aPunUjv3BMiG99iHGFQ9cskyI82zrABm/Rnq5iIrboT/hG6wM2Ex62LBktwok
	OXJHvWaaU1UPihI3rkAK9jKyHLeXdsDBdI9wnDTVwURvnLuGtXy/OFMIMFFv0Y6RFupAwxZDs+qE8
	WdFoSx4Phc7asaB/GKnPC7F/Pdb+SpQAz2e600s6udjWejYJx8m8jeeqfcJ9g+x93R3Yr+Q+jAUlL
	Kd+b4oTjWjjyTYtuCuIz2UKxqF6TzqsDk9joTdjeLNmz4sezm5Kr7ZikJTI+CNMxZWBgQaVOfovyM
	7x+dC2xWNmGLVkJPBSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA5m-0000000Gi7g-0X8G;
	Thu, 18 Sep 2025 08:34:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA5j-0000000Gi6T-0wxj
	for linux-mtd@lists.infradead.org;
	Thu, 18 Sep 2025 08:34:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D11EF4E40D0C;
	Thu, 18 Sep 2025 08:34:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 987AE606A8;
	Thu, 18 Sep 2025 08:34:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E355102F1CBB;
	Thu, 18 Sep 2025 10:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758184447; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QAP8j0sFNO+kaPGw+Uifwiy1pTKJhAweEfZkEJAW+pA=;
	b=iduhdYpaY8KqcgoUqfEOu0+BnDST/OkBW9Fngkul8G/A6eFkdK53CSCl5G/iJLUHmwYiiP
	yoSRS/5rLDCnAwkZ/URonuSn/XsGpxGUdN/GoOHvYsb/VjC77nFo84eNZrFbYStcsCosZA
	13l2FnYVaI1dgx6bJRmk2ZI2d1lC/g6pGDRgE7Ebbh/OSUgUuS+ahMzxPffVP+eES8Ikia
	s17NKx31MRm//gpHJlRHHPQ9Cjavqt2kPZqaRXNVlhOKrV9jxNoS7XKNuDmmLZnF/BpPC6
	rVrqYY/6CINqWySYrc6paZ9KJI+SkPpuhcR8XlJOM7E0Ou97O9Vb+Enig/dESw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20250910123645.541569-1-miquel.raynal@bootlin.com>
References: <20250910123645.541569-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: nand: ecc-mxic: Lower log level during init
Message-Id: <175818444324.1151539.2542251046009400905.b4-ty@bootlin.com>
Date: Thu, 18 Sep 2025 10:34:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_013411_401347_638A7351 
X-CRM114-Status: UNSURE (   5.88  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMCBTZXAgMjAyNSAxNDozNjo0NSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBBIHdvcmtpbmcgaW5pdCBzaGFsbCBiZSBzaWxlbnQgcmF0aGVyIHRoYW4gZXhwb3NpbmcgdGhl
IGNvbmZpZ3VyYXRpb24KPiB3aXRoIGtlcm5lbCBtZXNzYWdlcyBhdCB0aGUgZXJyb3IgbGV2ZWwu
Cj4gCj4gVGh3YXJ0IG15c2VsZiBmcm9tIHRoZSBwYXN0IGFuZCB1c2UgdGhlIGRlYnVnIGxldmVs
IGZvciB0aGVzZS4KPiAKPiAKCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBt
dGQ6IG5hbmQ6IGVjYy1teGljOiBMb3dlciBsb2cgbGV2ZWwgZHVyaW5nIGluaXQKICAgICAgY29t
bWl0OiAwMWFkYzgyMDdjZjNjNDJjNWNmMzg5YmU3NTc4ZmQ3MjZlZjI2ZmUxCgpQYXRjaGUocykg
c2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2Yg
dGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoK
S2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
