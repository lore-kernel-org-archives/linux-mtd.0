Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D06C369DC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixXU+RLdcwDGd5VCZM0yxxXqBSZAYeY//rWT10XoCzg=; b=gZ+KObs74Zszbc
	kXtOqnfAqYA7fD/gqLoYRuJ3CWocWwEweYItpLiwLN0XbLKZh7SkOC2jL0RZmnp83n7UbIA3aSGYX
	ufVFqAGXiZD9EWHJ8M0O6VH6ZWFwn5l+cYdSoa8wJAarLDSZMCD5DmUxWMCYzJiGDm2Odh8P6k0Qe
	owc2h/4RXByzoPRGi8O31oLQAaSDYqeC+Z4wQTMPiM9ZVEt8QJe0tgKfXg4MiQRgOM8kqgCmVeRax
	kMwAFat74mNLSFxLLJuUECg92yCDkPo4OY6zr/rAoKu9SvTMHIODvzzyN3t0pC85Y2jhAzxAJoIHt
	rR3urdFYmLNKIFv5QUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9iF6-00000009JyL-0Gt2;
	Tue, 29 Apr 2025 10:31:12 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h8X-000000096CC-2FRQ
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:20:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9333843214;
	Tue, 29 Apr 2025 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Za7lweaPx3/h71Ujv+ZsakGXEjzK+xddax/L9YP3OSU=;
	b=H63MdByW8Lv5bFIZsgpDAyJIUVJrtcY86NumkBFNLSWJapl8H890wC1jPdcKlWtuYM+sL+
	uC3neJftOFjWFTTFNOkp9hrTfolaHcAbT+tVIsg8oH5foHsliU0UEgcatNu4f6cJlzFROt
	S0ds0Rjgxb6fvJVLi6Ibegk6oq1rWbJTLkUyFV2TZGJlmIT5+rk1fSOxkh+YYU1/0tvM7a
	xKt5j46T8sorm1xMX0iuMSVqJyK0aDRe065TXxsgcELl50tIYBZQrwqBFL05k2vylg0cRL
	fUJGCU+nqQqEuEQezKif5nyKO0aLcn3wF3K756XTkeE/pi6TJdjOBvIn+82WPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250417074653.81593-1-krzysztof.kozlowski@linaro.org>
References: <20250417074653.81593-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] mtd: Do not enable by default during compile testing
Message-Id: <174591841848.992719.6666489302913958102.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:20:18 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfgjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffhudefgfeuueehueevudeiieejhfejudevudevieetvdetfedtfffhjeeileefnecukfhppeelvddrudekgedruddtkedrvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdehhedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihsk
 hhisehlihhnrghrohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022021_748440_4D491290 
X-CRM114-Status: UNSURE (   5.89  )
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

T24gVGh1LCAxNyBBcHIgMjAyNSAwOTo0Njo1MiArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBFbmFibGluZyB0aGUgY29tcGlsZSB0ZXN0IHNob3VsZCBub3QgY2F1c2UgYXV0b21h
dGljIGVuYWJsaW5nIG9mIGFsbAo+IGRyaXZlcnMsIGJ1dCBvbmx5IGFsbG93IHRvIGNob29zZSB0
byBjb21waWxlIHRoZW0uCj4gCj4gCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8x
XSBtdGQ6IERvIG5vdCBlbmFibGUgYnkgZGVmYXVsdCBkdXJpbmcgY29tcGlsZSB0ZXN0aW5nCiAg
ICAgIGNvbW1pdDogOTFiNzE2M2IxZmYzN2QyNGJhM2E5ZDk4ZjNiNTNmM2ZlY2ZjNjlhNQoKUGF0
Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpw
YXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0
aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
