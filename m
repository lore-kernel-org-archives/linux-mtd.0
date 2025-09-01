Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9960FCA1007
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgPD6B2DYBR5TrKdXYRJTayecymU9pD80JvcTSdboQo=; b=Bnk/la0uQQbii8
	tUdJR3+YKvRZUFhPzR5JqRInA0JIDAcmuPzsrr1sMZ+8oscAnFf1EieGVzfq/kp91sCKbdYQ7fzgT
	rt76lG0kCgmHxP8+XF6Iidg9M6eV5jJLg907Lm9736a55Gi8qO9qjmSvNjt2DuHtbr0VxEXtemYEO
	FdxW58dlw7JUZ+Iv1hLlhj2FKBlbDTHukkt61rh6ai99fIgD7YjvJp+neHlJfnNKP9B1wP/t7QA7X
	hAHcIjl2TBx4HvNloOVor9feixE7VFIuEzYLtN8LHU/Bg7bNww2WgFJ8pJUzyw/q4NNWHR3hYVQeC
	H/0sgO12a0d8LIA/JpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6AX-0000000CzHc-2M47;
	Mon, 01 Sep 2025 15:10:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3ds-0000000CRwc-26PO
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:28:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5BDAD1A0D2B;
	Mon,  1 Sep 2025 12:28:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33DB860699;
	Mon,  1 Sep 2025 12:28:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 153F91C22DA1B;
	Mon,  1 Sep 2025 14:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729690; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ur5gPEONmA8zR2mkETJKSgE70gid+jSi6gNy0OMfO3s=;
	b=CCyJyNzUAdIp9fZ4994dyIPTp7C/xHQMagErb2a9UCWyPEB3aEyzeJYtXJwVv8ZemrZR29
	B16znJSIN5vRJpAH64GZweHJBzd/Ue2SK3CqqJmRyhrK8+Tnkrv2bgRb+1HPNGF/lGPGMI
	rjoUl3rSrSOQLONzcGNKZuBDjHDN3irqOxEIYx1ZHs+3c6cvYdUJ4c0ILI6jxN93u6eXYx
	PtBQ4vCpqtr/nneDSyogIVvJCBYAxDZ4p7CAk15IH5UNWfSpHCgiErXIvKyW5y5PyD8ljF
	e1KrAlanxk+xg9/enBbNyp1P6+0JNEjs0etUHY5fnPN5XhWkrsQKjBy6WQly1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
References: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
Subject: Re: [PATCH] mtd: nand: qpic_common: use {cmd,data}_sgl_nitems for
 sg_init_table()
Message-Id: <175672968988.48694.15291064215961087931.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:28:09 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052812_672786_AE850A81 
X-CRM114-Status: UNSURE (   7.04  )
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

T24gTW9uLCAxMSBBdWcgMjAyNSAxMDozMDo0MiArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
U2luY2UgY29tbWl0IGRkYWFkNGFkNzc0ZCAoIm10ZDogbmFuZDogcXBpY19jb21tb246IHByZXZl
bnQgb3V0IG9mCj4gYm91bmRzIGFjY2VzcyBvZiBCQU0gYXJyYXlzIiksIHRoZSB7Y21kLGRhdGF9
X3NnbF9uaXRlbXMgbWVtYmVycyBpbgo+IHRoZSAnYmFtX3RyYW5zYWN0aW9uJyBzdHJ1Y3R1cmUg
YXJlIGNvbnRhaW5pbmcgdGhlIG51bWJlciBvZiBlbGVtZW50cwo+IGluIHRoZSBjbWQvZGF0YSBz
Y2F0dGVyLWdhdGhlciBsaXN0cy4KPiAKPiBDaGFuZ2UgdGhlIHFjb21fY2xlYXJfYmFtX3RyYW5z
YWN0aW9uKCkgZnVuY3Rpb24gdG8gdXNlIHRoZXNlIG51bWJlcnMKPiB3aGlsZSByZWluaXRpYWxp
emluZyB0aGUgc2cgbGlzdHMgaW5zdGVhZCBvZiByZWNvbXB1dGluZyB0aGUgbnVtYmVyIG9mCj4g
ZWxlbWVudHMgdG8gbWFrZSBpdCBsZXNzIGVycm9yIHByb25lLgo+IAo+IFsuLi5dCgpBcHBsaWVk
IHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBuYW5kOiBxcGljX2NvbW1vbjogdXNl
IHtjbWQsZGF0YX1fc2dsX25pdGVtcyBmb3Igc2dfaW5pdF90YWJsZSgpCiAgICAgIGNvbW1pdDog
NWI1ZGM3ZGI1YThkYzJjMjIxNTI2YWNmODFiMzIzZWMxZjk3MmQwZgoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
