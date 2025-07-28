Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712EDC83F17
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KD72bCSSLeD80bm6eAWspy4XmkkDChAxxbkbXtXgkv0=; b=iOH5GMaXucP5q0
	W6aQWR2JX76nJ82OCJ1sUiYqJKoDbKKtcKdfkdKtndsDyLKdDDcqr63X4TFgMKFuJo5EqfFqqvzsw
	0xx0AgyskFKp3VLp0mwDONjJc16yBafWhB0czMtzBmfbNOIyQmwh2VYOFfnLKczqr5141JJo69ink
	3Kjz1K5zccYOuBB3DKZPkXbdBpK7BCZBQRjULnuSrvhCHzv49CNJH1qzUfY2OEseUwCqSFAltQxHD
	mu0RVZfHjvyRnaWHKHqA7TP1jDrQv1EeaySXltwXmyimTAzrpTGwcfY/4mcMZ7mfg3QfmUVyhSKj/
	6kcdjnEoXGH4lkiwUlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugM17-0000000ELgp-459I;
	Mon, 28 Jul 2025 11:27:41 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKuq-0000000ECVg-17He
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 10:17:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0240431EE;
	Mon, 28 Jul 2025 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Pg1s39hr7gfRoFJ2EYpnz4xFGDCFEkvrgRZa3+yLCA=;
	b=JchHN/qW2Y0ACMeZGRRlqpWF8Tuagy7WEwsi1sy7ZbAc38S7q2aHe4RF1yRjfOu4SqFOo7
	7bfdxZPP+8v5LbjDg34ahxofq6N6SBNnlq7PkQE9xIspJeSc/7MTc7wrabdmuosPR577iZ
	7fgJQK6mqS5uprgX/743zuaOhFxDEvW992Wj/PwP99xUUVnBsvlfidvXFD4taiVvulgO5W
	FWYEvK9dUCwHiGrgRn/9EhkdAmPo4zZ3Jc0YBC7Dv+mMGTudaCt2jJNGJlBXC4EMPO5uh0
	H3NwjCYfBhC2wh9gi/JBcz+lyeCsuEKdnXqhvDTQ4uZht5TaKO+t8uqoNQ766g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250626-qpic_common-unused-defines-v1-1-e31c9e2074c8@gmail.com>
References: <20250626-qpic_common-unused-defines-v1-1-e31c9e2074c8@gmail.com>
Subject: Re: [PATCH] mtd: nand: qpic-common: remove a bunch of unused
 defines
Message-Id: <175369782264.102528.9311179617675976585.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:02 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehjgehgkeihjeesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_031708_450992_F0034714 
X-CRM114-Status: UNSURE (   6.23  )
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

T24gVGh1LCAyNiBKdW4gMjAyNSAxNzo1MjozOSArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
QSBidW5jaCBvZiBkZWZpbml0aW9ucyBpbiB0aGUgJ25hbmQtcXBpYy1jb21tb24uaCcgaGVhZGVy
IGJlY2FtZQo+IHVudXNlZCBhZnRlciB0aGUgY29udmVyc2lvbiBvZiB0aGUgJ3Fjb21fbmFuZGMn
IGFuZCAnc3BpLXFwaWMtc25hbmQnCj4gZHJpdmVycyB0byB1c2UgdGhlIEZJRUxEX1BSRVAoKSBt
YWNybywgc28gcmVtb3ZlIHRob3NlLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiAK
PiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbmFuZDog
cXBpYy1jb21tb246IHJlbW92ZSBhIGJ1bmNoIG9mIHVudXNlZCBkZWZpbmVzCiAgICAgIGNvbW1p
dDogOGUzN2FhZjk3MTUzN2Y1YTQyOGQyZTkwYjA4MzJkZGNlZTJiNjc1ZgoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
