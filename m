Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68F9C9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEJELE6BaHqfNjpM9KQQFBKNQZSJ4CRhagU/N2cOxkI=; b=paDa+2oSgvIhm2
	Xpbyfbs663/oqinhd6FeTOx6VSPXspupVO1pY7fpP0tO8ygko8UiLHN6zujZbfXuOOOi9S2Gzwf27
	GZ36+Vfecx4N7qMGQuKuqOo5Iark8HTn6JJV8h+mn9UivUkKiFe1mN9V8G2Hwk6haoBEka0gRnfpf
	hO296hzFG4orAhO1STCpvAxAHfF3sTVOgxMra/F+Cyxq/5H1PbSEzg3zcpzmWQ8pUwL/+R1xonJqR
	SIqLVbE2vzLB0R4vfLEb7vUKw55rzL6kulp9lrXPXeQNNuab73vpq73xF4nKQUvIqE6nyPdMu1E8z
	AoaobZJ53DXsLeh7Z4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65g-0000000DSFD-1Js1;
	Fri, 25 Sep 2026 13:35:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65b-0000000DSAx-40sW
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 13:35:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 16F504E4106C;
	Fri, 25 Sep 2026 13:35:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E01C66073B;
	Fri, 25 Sep 2026 13:35:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D415103293B8;
	Fri, 25 Sep 2026 15:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1EJjIk661tikGJLhJppgEVPju+d+qJSsQCa/QerB5sk=;
	b=ny6LvokOTTzcILNazPwpbeNmw2xP3dG5bx+iKYLFy2S7VHg45a7UFIz9Dw+0ynvgHvaQSv
	EcSH7rgGCkxFYFYtcMqKgl2M5NQ8qshp0fCBAq1sBEwe2gq8QSuaN3dledvxWODzIxhxRG
	g/z3Tf+04TlnRnFywsGIdwtqgCkcODQdqwC04wl41+hiRQxA6Cgp9zg4pKVbaUH+RQ3Q/u
	mWB4j5wJf+Ei/SFzqjzDhW64Zk8PkicUxEGGAcB1FeITUsAYWii4USRLp5LBzpmtLIT2Qn
	0r1gasqQGhMtLI+74vRVJPxUj0GonOA3+e+Du6ulL0UKPuY4nNGL4gYqvXM47g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Hui-Ping Chen <hpchen0nvt@gmail.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20260915164537.2496540-1-lgs201920130244@gmail.com>
References: <20260915164537.2496540-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: nuvoton: fix clock cleanup on probe
 failure
Message-Id: <179034334209.1124555.2976716142691961983.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063548_554584_46EE3303 
X-CRM114-Status: UNSURE (   6.58  )
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

T24gV2VkLCAxNiBTZXAgMjAyNiAwMDo0NTozNyArMDgwMCwgR3VhbmdzaHVvIExpIHdyb3RlOgo+
IG1hMzVfbmFuZF9wcm9iZSgpIGdldHMgYW5kIGVuYWJsZXMgdGhlIE5BTkQgY2xvY2sgd2l0aAo+
IGRldm1fY2xrX2dldF9lbmFibGVkKCksIGJ1dCB0aGUgbWEzNV9uYW5kX2NoaXBzX2luaXQoKSBm
YWlsdXJlIHBhdGgKPiBhbHNvIGNhbGxzIGNsa19kaXNhYmxlKCkgYmVmb3JlIHJldHVybmluZy4K
PiAKPiBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIHJlZ2lzdGVycyBhIG1hbmFnZWQgY2xlYW51cCB0
aGF0IGNhbGxzCj4gY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgb24gcHJvYmUgZmFpbHVyZSBhbmQg
ZHJpdmVyIHJlbW92YWwuIENhbGxpbmcKPiBjbGtfZGlzYWJsZSgpIGV4cGxpY2l0bHkgZmlyc3Qg
ZHJvcHMgdGhlIGNsb2NrIGVuYWJsZSBjb3VudCwgc28gdGhlCj4gbWFuYWdlZCBjbGVhbnVwIGF0
dGVtcHRzIHRvIGRpc2FibGUgdGhlIGNsb2NrIGFnYWluIGFuZCB0cmlnZ2VycyB0aGUKPiBjbG9j
ayBmcmFtZXdvcmsgd2FybmluZyBmb3IgYW4gYWxyZWFkeSBkaXNhYmxlZCBjbG9jay4KPiAKPiBb
Li4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDog
bnV2b3RvbjogZml4IGNsb2NrIGNsZWFudXAgb24gcHJvYmUgZmFpbHVyZQogICAgICBjb21taXQ6
IDhhNDg1YTQwZjQ1YTE5YzVmY2FmYjVjYmVlNzM4N2MyNzYyYWY3YzQKClBhdGNoZShzKSBzaG91
bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUg
bmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5k
IHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
