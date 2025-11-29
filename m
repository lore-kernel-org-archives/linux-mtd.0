Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC31CFD2F6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nw4FE0Z+5BQlv7eYguzSi3YI5wkXfj7PgKKxk8gAtjQ=; b=nOKMQP/d5cQtgD
	gzQSw7kMH1qYp3LgPnlDWy8DeskYooCrGJQzJgZ4x2CYk5tjDc1hKJQ5bCnLzOVS+DaR+19JVhHS8
	UPg6LCAcuOpEeHT2RhJapfwF3swPcU4DBZ26OPV83zDVr26oyysVWSGIdn+tPWFHoFikBFrQvbyez
	dvV7fLX7gh+z/SAA5P1OfEWhy1XGM1s0AIXGVDRhp//QY41KKzMQidbWZbWF1eYP4L+NZeqPf9pqo
	3GLR3XsuezLoWEVMcofAOtklF1HLOUFyMekKqbvrgHMZAkCNnQI2hItPjzww5zy96weaj9hMxZalH
	t1H0KOLq/9ZWinuJurdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQE-00000001XTF-07G8;
	Sat, 29 Nov 2025 12:51:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQB-00000001XSp-1iPw
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 12:51:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 183714E41973;
	Sat, 29 Nov 2025 12:51:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA43360706;
	Sat, 29 Nov 2025 12:51:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 272A911910699;
	Sat, 29 Nov 2025 13:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EGdxJtKMRY9EcZYy7eVr8O82Gcq/pgUqdwlMD9ghv+g=;
	b=26+1qO2aRKXueBb3nK+3FyIoyeKEJVOkHqyOmVCs2R016I0wnXnobEcvyV6qlVfLz2g6XK
	6yyxjlJNiEwYL8iKbo7t1kgHHpjyHP6ZQs/A/t74kTG8t+kCqvc31Os545Cm1cLG4gJwH2
	24HiuBq6ByRcWTD2078J1YqddPf7HOhggB7Wa67andnytBmG1AgZSm1Y3CwQbpX2vpHMuS
	NUb8qOWKCrx3KJ3AjUqG/6TFdAieMTDiVgBFFP3zhfEL6fzNMO2f7x6Fh0joeYjEWjlGh4
	JpNxqJKqVlwqLZt32ifuu8vXJTbSnD7BFBOpysOgNXwJb8NqOBqF1WW8a4LqAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20251117193045.517052-1-rdunlap@infradead.org>
References: <20251117193045.517052-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] mtd: docg3: fix kernel-doc warnings
Message-Id: <176442068140.77093.11057296146856373127.b4-ty@bootlin.com>
Date: Sat, 29 Nov 2025 13:51:21 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_045127_608125_68919495 
X-CRM114-Status: UNSURE (   6.37  )
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

T24gTW9uLCAxNyBOb3YgMjAyNSAxMTozMDo0NSAtMDgwMCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+
IEZpeCBrZXJuZWwtZG9jIHdhcm5pbmdzIGluIGRvY2czLmggdG8gYXZvaWQgYnVpbGQgd2Fybmlu
Z3M6Cj4gCj4gV2FybmluZzogLi4vZHJpdmVycy9tdGQvZGV2aWNlcy9kb2NnMy5oOjI3NiBiYWQg
bGluZToKPiBXYXJuaW5nOiBkcml2ZXJzL210ZC9kZXZpY2VzL2RvY2czLmg6Mjk5IHN0cnVjdCBt
ZW1iZXIgJ21heF9ibG9jaycgbm90Cj4gIGRlc2NyaWJlZCBpbiAnZG9jZzMnCj4gCj4gCj4gWy4u
Ll0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogZG9jZzM6IGZpeCBr
ZXJuZWwtZG9jIHdhcm5pbmdzCiAgICAgIGNvbW1pdDogMWNjZTVhNWVjYWZlYjhhNzlhYTkxNjVj
ZjEzNGM5N2RhN2JiYzdkYgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
