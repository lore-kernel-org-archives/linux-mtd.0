Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C06EC44523
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CblxcN1Ju8XI+oMcMwH0SvXAjqw04gtESrkm0GDo50Q=; b=C0CnCwwLXsuNiW
	TUUXldyNd/YjuapCJIoHtwSnsVEGaS3vu1ygNiafzCsnFoGMwwjRDHSCy9RUh0NhLkOeskF/8s4Dt
	4RSb5W1KF9KzTp/J2hH/aVxrDYKaxjlrPw4s+UJZ+thgpJHdSmTsXluNTgcWmf3/PaROdNBisg1kE
	zOCm/VUyrigMJwab89CUWUixtQdSvqpaMcBIboESLn+9dd59JgRrJp/vRjrcS/veTxsleeu7pf+9o
	y2GRKTmetx81CySoZFaK4IXnZ5YRQVm7y3LmE5v4H9i7DRrSL+/RMfjre4V7dRzHnPn6/WaLMVMyY
	om0lyAUocWzrnxZpIDRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkoC-00000002elI-134s;
	Fri, 17 Jul 2026 15:49:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkko9-00000002ej3-3HaY
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:49:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 54E421A1067;
	Fri, 17 Jul 2026 15:49:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21B8F60361;
	Fri, 17 Jul 2026 15:49:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B32411BD0B3F;
	Fri, 17 Jul 2026 17:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uTIIYIE6om+/XCvC1iyGmOlpuExfe0fVOZRcI5zo7h8=;
	b=J9HcSJMeSCGCasvs4WDFZFkm/IB1E5oGJmO4gqwy0hJ2sUwI/WLfMNoG0gVfua1Ge5FiE5
	P3Eb+ObuUQ6rp9BEZaBOvrybhNAaa708GvhI+frpKcJRrswHkINyI0iOY3mZUOCqhypkfD
	2ypwebzxTcvqT7Xk/6bxBiBCr2b5rEi776AtnqZ2kTy5GI5i2lTMYL6RKHPyk8Ggym1qTI
	c0jILYNguwpkCiR5Os7HUchIWOQRMn/SZ9UOdjEkhp+6FL77Drej7/CDmcOCa5rkApcWuA
	zF//gU/3Nxsyjs6JpNJf1kZU8ucYGSPNYWjAQ3zz0Gk3jTb8cnVTivKjjR+JIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Johan Hovold <johan@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Richard Weinberger <richard@nod.at>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <901ca5f67bc57219a9222115fabe1a1729b87e25.1784229863.git.ukleinek@kernel.org>
References: <901ca5f67bc57219a9222115fabe1a1729b87e25.1784229863.git.ukleinek@kernel.org>
Subject: Re: [PATCH] mtd: nand-omap2: Move omap_nand_ids[] to raw nand
 driver
Message-Id: <178430333794.4128272.17925627795201974759.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:48:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084902_017140_2E8D3C35 
X-CRM114-Status: UNSURE (   8.35  )
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

T24gVGh1LCAxNiBKdWwgMjAyNiAyMToyNToyMyArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRo
ZSBDYXBhYmxlIEh1Yikgd3JvdGU6Cj4gRGVmaW5pbmcgYSBzdGF0aWMgYXJyYXkgaW4gYSBoZWFk
ZXIgcmVzdWx0cyBpbiBlYWNoIC5jIGZpbGUgdGhhdAo+IGluY2x1ZGVzIHRoZSBoZWFkZXIgKGhl
cmU6IGRyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jIGFuZAo+IGRyaXZlcnMvbXRkL25hbmQvcmF3
L29tYXAyLmMpIHRvIGNvbnRhaW4gYSBjb3B5IG9mIHRoYXQgYXJyYXkgd2hlbgo+IGNvbXBpbGVk
IHRvIGFuIG9iamVjdCBmaWxlLgo+IAo+IFdpdGggc2l6ZW9mKHN0cnVjdCBvZl9kZXZpY2VfaWRb
M10pIOKJpSA1ODggaGF2aW5nIG9tYXBfbmFuZF9pZHNbXSB0d2ljZQo+IGp1c3QgdG8gZG8gdHdv
IHN0cmluZyBjb21wYXJpc29ucyBpcyBxdWl0ZSBzb21lIGJsb2F0LiBTbyBtb3ZlCj4gb21hcF9u
YW5kX2lkc1tdIHRvIHRoZSBuYW5kIGRyaXZlciB3aGljaCBhY3R1YWxseSBuZWVkcyB0aGF0IGFy
cmF5IGZvcgo+IGl0cyBtb2R1bGUgbWV0YSBkYXRhIGFuZCBkbyB0aGUgY29tcGF0aWJsZSBjaGVj
ayBieSBoYW5kLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEv
MV0gbXRkOiBuYW5kLW9tYXAyOiBNb3ZlIG9tYXBfbmFuZF9pZHNbXSB0byByYXcgbmFuZCBkcml2
ZXIKICAgICAgY29tbWl0OiBmOTdiZGM4ZWMxZGM3YjMzNzgxYTcwMmVlYmE1NTMyNmMyMDZiZTU2
CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxs
IGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5z
IGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
