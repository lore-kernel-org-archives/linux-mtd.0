Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA95C02194
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0w5o9LhpSK/Rynb0B9+8F74ZX0dnCijVHbugRYyGdU=; b=x5W8a5uja/6HH1
	+TU0CuUMC1gkiJJiRnSUQY7rLxUg4nDKzpGs300Sn44krZWtxpH187k2aEvIj4GzeZXB7oBN+dcqG
	FSnRau5DmvLbAojqz+t64cuE4+XBqqbGLmdqBsKWjGHQUNoNK37IbtljFXit+8uCo5QgZwwFxTB7W
	tqMNXn2y5ttbO9sibsR6YcJfk2cXD3hVJAsWPGf2U+C3mnuYc8CzfwC2mn4agqdfqkpyHJtWe2UE5
	W99ESMrCeI5JjKvi2nbblJvVs8JswsIvGXqdtizF4g2Jazun/a7HDhQk6Gqt/RP+eQQqhW2jrCtGX
	6EkZsXIEcDEFn9W7/F9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPgW-00000009wv2-2XsJ;
	Fri, 07 Feb 2025 14:50:24 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPcj-00000009vZz-04kh;
	Fri, 07 Feb 2025 14:46:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3673B443B8;
	Fri,  7 Feb 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zotNU7rJ3SVVOWKtFNsAK5uaTmDszXvpsTrfKkmZ7NQ=;
	b=mmKeQca3SwF0SEnls1X8Rt3DCjE9SSenlQicXMWpoMt80HZKE8t/yStGUuRpJDAe4pMWHw
	zhoFObvhK5kggHmjxfi5iPqqlUGcaSo+AbSTR5DdC9IHDOCYEiFGwHEy0uKsj/oYp8w9b4
	sBw9TTqa6xnTFGtBCZ4r+iklF1MxdUn8Qmrz/eeGB9ExgOQeaFAnJnfCQyI3g10WgZSebM
	ybSpBOM+iJ2qZC6GSNrpJYyHpecBfhgDuqTP3vVg2HnCLRQic0gnWVXxA2ifh3wgTnbI2a
	mmYiGE6n/C8xSaCUSNz7b6RV1NfSIX0hhdFV8EApSH/hrXXkalDfM1jykpjfCA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250203213036.9816-1-robh@kernel.org>
References: <20250203213036.9816-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: Ensure all properties are
 defined
Message-Id: <173893958505.2918383.10809886449430911872.b4-ty@bootlin.com>
Date: Fri, 07 Feb 2025 15:46:25 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtp
 hhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064629_208987_7B7FE030 
X-CRM114-Status: UNSURE (   6.04  )
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

T24gTW9uLCAwMyBGZWIgMjAyNSAxNTozMDozNSAtMDYwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3Jv
dGU6Cj4gRGV2aWNlIHNwZWNpZmljIHNjaGVtYXMgc2hvdWxkIG5vdCBhbGxvdyB1bmRlZmluZWQg
cHJvcGVydGllcyB3aGljaCBpcwo+IHdoYXQgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlJyBh
bGxvd3MuIEFkZCB0aGUgbWlzc2luZyAncmFuZ2VzJwo+IHByb3BlcnR5LCBhbmQgZml4IHRoaXMg
Y29uc3RyYWludC4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIGR0
LWJpbmRpbmdzOiBtdGQ6IHBoeXNtYXA6IEVuc3VyZSBhbGwgcHJvcGVydGllcyBhcmUgZGVmaW5l
ZAogICAgICBjb21taXQ6IDAzOGUyYmEwMWNmNWZmOTRkYzhmNzQwMzI4ZWM1NjVkMThiYjc2NGUK
ClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwg
YmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMg
YnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
