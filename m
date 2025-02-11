Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951D9C021A1
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kwe9BG16xTZkw8tl/NQK27B2ANbPMwUdsxLSn6hf0zE=; b=rEPhyAW0jx1s7t
	tr59JQWGLKRfHuuZxvNXVT4thFfLY6eVcpbheuqX+wFSatsxv3qZv6ylpI9kcrGWpFB7r2kMVl+ti
	LTXGJT3dXBljozNfBKuPIweINyRqKFzAUSYdJTib66AZ4pDAU9ZUDiuNqmxoPazqP7mrJ9SnNR15b
	jNNfD/kL/83cQrckTVNt6c4n5a4G16epnh1Sj7JwamGamvijv53yJmU0+eV2f/WnwM6g1+LEbbTJS
	SkmC3It/kJfxxbh4itu1fa6baCJQETCPQ1FQJWfH7Z4kibF/oyqkOqaUXCJZaX8rm1jQ1Xb3mhTT6
	Ml+CeUHnEeq4/VYT2VgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thq5Z-00000003uGY-0iRe;
	Tue, 11 Feb 2025 13:14:09 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpnd-00000003qjh-1iBL
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 12:55:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B06C9433E5;
	Tue, 11 Feb 2025 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739278535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RXfSl7prs9dlKymYiyvEDBNrnmt/hzro4w6GBu5Hzg=;
	b=mnHuo3D9rUdG8LDBamKSLPrQv49SKJu+feypUhxcxZ/jqERSGmbeDHUwKVZQT05amTK7hn
	vHw/2DGWuC9lgjYJl9Vf17Z/z+EzoCl1Y1BUVJZRKcqL3d1iJ4/Ay0WASWcqbwB4CLKihp
	EsGBRZp0C/qObtcUDR+enNJgZlNRve+TEZpk5qfOMRr1g7g55oBuzwx6sHKAQzmnvMI94s
	6ZFJ6IbfY/Yl2sCytOmUN9jJikm3G7T8+uG8lk/lP7Z3ZMTe9bAm40qVX/XWzsbU4xJ1fK
	SlihIFnc04p7sU6AZHxcEw5+LukAbdjruF07J9dyff2ZBcd0v54NKT19Dg9JGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250209145439.19047-1-ansuelsmth@gmail.com>
References: <20250209145439.19047-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: finish converting register to
 FIELD_PREP
Message-Id: <173927853450.127165.16898289318508765683.b4-ty@bootlin.com>
Date: Tue, 11 Feb 2025 13:55:34 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffhfdufefgueeuheeuveduieeijefhjeduveduveeitedvteeftdffhfejieelfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnshhuvghlshhmthhhsehgmhgrihhlrdgtohhmp
 dhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_045537_575100_CE6F8DD5 
X-CRM114-Status: UNSURE (   8.05  )
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

T24gU3VuLCAwOSBGZWIgMjAyNSAxNTo1NDozMiArMDEwMCwgQ2hyaXN0aWFuIE1hcmFuZ2kgd3Jv
dGU6Cj4gV2l0aCBzb21lIHJlc2VhcmNoIGluIHNvbWUgb2JzY3VyZSBvbGQgUVNESywgaXQgd2Fz
IHBvc3NpYmxlIHRvIGZpbmQgdGhlCj4gTUFTSyBvZiB0aGUgbGFzdCByZWdpc3RlciB0aGVyZSB3
ZXJlIHN0aWxsIHNldCB3aXRoIHJhdyBzaGlmdCBhbmQKPiBjb252ZXJ0IHRoZW0gdG8gRklFTERf
UFJFUCBBUEkuCj4gCj4gVGhpcyBpcyBvbmx5IGEgY2xlYW51cCBhbmQgbW9kZXJuaXplIHRoZSBj
b2RlIGEgYml0IGFuZCBkb2Vzbid0IG1ha2UKPiBhbnkgYmVoYXZpb3VyIGNoYW5nZS4KPiAKPiBb
Li4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDog
cWNvbTogZmluaXNoIGNvbnZlcnRpbmcgcmVnaXN0ZXIgdG8gRklFTERfUFJFUAogICAgICBjb21t
aXQ6IDFkYjUwYjk2YjA1OWNhOGU1NTQ4Y2IzZTBlMzhhODg4YjMyNWY5NmIKClBhdGNoZShzKSBz
aG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0
aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpL
aW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
