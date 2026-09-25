Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041BDC98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zXOKqZXGFmFyVfmEDmrtyLCOb0k/I/jJt/GOX7TnLk=; b=ge8aPLeMGIOFZG
	KgFd6G2NCZZzjqaFsikYURFcHy3WkH0oZ+TwQ84CjcqoJQdkUMmiaPkoIAM9QJUDSJx5OY6S9scKX
	erFYrJj3ouCrOSdS3HBvG54uZlkqcl8WM8iDpn629XK1jAAsnbh07PxnePqL/UAf4/48sTMZi3li/
	V/UPxZZ7hHUZjz7xMPYcKT5yFLtBahvLqTJbK+BTv2HnJqAZjNuHYV733J2P3GuWzowYD+848cD6v
	gkqMS5pwKeABlvMz9amb1tC0J+X0n5vWT+0VANgotdRAzM1OQTUTCHNJNOdfO2vWrmoD0kDwS0h7N
	q3nx3EsT1JcZ0y5Yr8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vZ-0000000DaQA-1cmy;
	Fri, 25 Sep 2026 14:29:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vW-0000000DaLN-07aD
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:29:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 798BF4E41078;
	Fri, 25 Sep 2026 14:29:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ED656073B;
	Fri, 25 Sep 2026 14:29:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03A47102F1E10;
	Fri, 25 Sep 2026 16:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346563; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IBVKpGo9SdYMDRKnYktj3GgwhPWfwfIQopIZhYXTq0s=;
	b=ha7iA+5FB5czU/gl00bimvtAFfEzrKpIeSIDT8GGcAMZ2Pwpp5C3Loxf4YOpQgauA0Ayf+
	cp5YugBOr2B9uI30L+QhCbQ0TtUoVWMSZmJpIYryj6NaVo5bBKnXuOdnFjDEcTWwyqtwwn
	bEC46Iz6E5e13Ig5lAUZZnsc2kLDGCCfrdGjVeUA0Aw9LW2sH81GoiMIpkrNNm913Gr+CB
	FaKWRw8iyg9TGky6ys6JH09ZT6rv66Uhy7UUXYCu6Q/zd6Hl39PUbt3pUiq3y8MjFFF5fs
	cjaD+0+B4tZVxKRQn0Aql0UZaq9XUcqnEHOsjCK4/5Ux11dxYxNiaiZ5odKrgw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Stephen Bancroft <stevereaver@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260923092626.873202-1-stevereaver@gmail.com>
References: <20260921021459.283023-1-stevereaver@gmail.com>
 <20260923092626.873202-1-stevereaver@gmail.com>
Subject: Re: [PATCH v4] mtd: maps: add INT0800 firmware-flash map driver
Message-Id: <179034656183.1166139.3557202983918719250.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072926_257787_27FAFA84 
X-CRM114-Status: GOOD (  10.01  )
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

T24gV2VkLCAyMyBTZXAgMjAyNiAxOToyNjoyNCArMTAwMCwgU3RlcGhlbiBCYW5jcm9mdCB3cm90
ZToKPiBBZGQgYSByZWFkLW9ubHkgbWFwcGluZyBkcml2ZXIgdGhhdCBiaW5kcyB0aGUgQUNQSSBJ
TlQwODAwICJJbnRlbAo+IDgyODAyIGZpcm13YXJlIGh1YiIgZGV2aWNlIGFuZCBleHBvc2VzIHRo
ZSBzeXN0ZW0gZmlybXdhcmUgZmxhc2ggYXMgYW4KPiBNVEQgUk9NIGRldmljZS4KPiAKPiBPbiB4
ODYgbWFjaGluZXMgdGhlIGJvb3QgZmxhc2ggaXMgZGVjb2RlZCBpbnRvIHRoZSBwaHlzaWNhbCBh
ZGRyZXNzCj4gc3BhY2UgYmVsb3cgNCBHQiwgc28gYSBwbGFpbiBpb3JlbWFwKCkgb2YgdGhlIGRl
Y2xhcmVkIHJlc291cmNlIHdpbmRvdwo+IGlzIHN1ZmZpY2llbnQgZm9yIHJlYWRzIC0gbm8gU1BJ
IG9yIExQQyBjb250cm9sbGVyIGFjY2VzcyBpcyBuZWVkZWQuCj4gVGhlIHdpbmRvdyBtYXkgYmUg
bGFyZ2VyIHRoYW4gdGhlIHJlYWwgZmxhc2g7IHVuZGVjb2RlZCBob2xlcyByZWFkIGFzCj4gMHhm
Zi4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBt
YXBzOiBhZGQgSU5UMDgwMCBmaXJtd2FyZS1mbGFzaCBtYXAgZHJpdmVyCiAgICAgIGNvbW1pdDog
YzRmNjRhODZhMjhkMjE4ZjNiMTZjZDdiMTg2OTE5OTNhYTYwZGI2MAoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
