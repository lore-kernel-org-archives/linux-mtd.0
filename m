Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F7E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqfxW9WGEI5kccQegslqm0lXHBg/E8js6S5UQraWD5U=; b=rCdKfOK+MgKKKe
	r8MFAj+RMJ+RvDdffRgurFfk18MdRyQ2htvBg+ulG3pkDfVhoYxPdMQDLxk4NdVrZ9c5kpUOw2QnA
	PyZlJgtDylB7erE5mK44XJIL5LtC9O6/mJb7ufOXGtu7dIUggLfjerTSBAjhBlOENsv09p0yAPaEi
	IeROmfQEIpPqXH2qlHJ6l4AwN0wDIz9ZZigZHP+nVuJ7hbAMFWjojyKq5+SlkVlRG8EsfkHcltZRf
	uRE4fLUIejeN46/FbqSvJQgUix5ZwyvRBjOpNw4lIMH64qM9SIhKM9XdyhQwfaQ3ZIuUL7n24uIt6
	hbflphp7xLn9IvopOgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ6Kk-0000000CB5S-0qoD;
	Tue, 24 Dec 2024 14:56:30 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ6Ki-0000000CB4x-06iv
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 14:56:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E4E3FF804;
	Tue, 24 Dec 2024 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735052185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VM4nJRCCle7MKUP75aKpomupMr8oBLJNUzb69DlQVxE=;
	b=VMxLZ01S7QPbCR/ZlPVyrylgSzAE6QuR3NB3JATFedN2ndl6V+n5qRXRZPIn0Zjr/HNJiT
	byb7IPZ77ZoKjcgQHHbG4495pAnotbsbi4AoiJaQaLBxAQaKYZoXzw6/JOC6V9/GFp3nnF
	RdPN1B/pzbiWN/pcBdqtTvlVy9Hm0fqSK6CJmyACawNmWmLgBFdqxUVADkxb1Jn8AykYON
	hQuxFVLz1B5zWtDDKIGBowG8CJ5y4YPYEEfIdTFhXFCQLiPfuIvNetFQ9gksApR6o/zQas
	kjDOqamWLyqKu/huzojxyZTrCyiIypwkI3Hi1nm9RVgkP/J6M4MEjAC51Rw3lQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] memory: stable tag with TI AEMIF for v6.14
Date: Tue, 24 Dec 2024 15:50:54 +0100
Message-ID: <173505178650.1655785.14123599870236556836.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241214103429.17501-1-krzysztof.kozlowski@linaro.org>
References: <20241214103429.17501-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_065628_341236_57CC2D25 
X-CRM114-Status: UNSURE (   6.30  )
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

T24gU2F0LCAxNCBEZWMgMjAyNCAxMTozNDoyOCArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBUSSBBRU1JRiBtZW1vcnkgYml0cyBmb3IgTkFORC9NVEQuCj4gCj4gQmVzdCByZWdh
cmRzLAo+IEtyenlzenRvZgo+IAo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgNDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4ZWNmMGIzNzoKPiAKPiBbLi4uXQoK
TWVyZ2VkIGludG8gbmFuZC9uZXh0LCB0aGFua3MhCi0+IG1lcmdlIGNvbW1pdDogMzc2YTBiOTk5
NzU4MDYzYjkzY2M4YWEyNWMzNTc0NjY5YTNjNjI4ZQoKSSBhbHNvIGFwcGxpZWQgdGhlIHRocmVl
IHJlbWFpbmluZyBwYXRjaGVzIGZyb20gQmFzdGllbiBvbiB0b3AuCgpLaW5kIHJlZ2FyZHMsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
