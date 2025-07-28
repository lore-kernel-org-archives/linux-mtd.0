Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D35EC87FCE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaTEPRPG8BhoTOThvGD8N7sI4HaPbOfhyDmAqb5DoZg=; b=VDuudYhg93amQh
	wTgJXN3D2Bas0z6TEeGs8DIasBHLAHBEOyVt7/7c+cpyrL2MhjkTC+SE0xrd27jdIemWpYlUs/mPu
	nBz3EWSMIXZAm7kJ+XRqHEBl2icPzLu69b0mboYqCigo+HvIFyQSyiZO7GVD+e+T1lREXhW7B4coE
	oASwypg4Z9inKPTk3y7TY0vHiBSgrbAXXQ+jALJoeGT2MuQcZ0+NPb+eB66Unx9lAi4cVQAPFzWNJ
	GikW2dIaIm/EEzkZpA50hcy/+uzZDuXT56ACHN9T2BhdmC5dkhVQsqqYYv3AiUdTdI5fn6ymcDLol
	Xqt0VUQeIgs/UNCe2whQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL2K-0000000EDqb-03OC;
	Mon, 28 Jul 2025 10:24:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKv5-0000000ECYK-09nO
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Jul 2025 10:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mIdf1rusMM2utxFOgdWZXg7UVjylZoesGKXTK2HALPM=; b=e3OnyKGODHQwepA2DZyXwKu9sr
	X0KEciAIxEij4xVNBkisZYZzVQioo4zFV/40AJ5KKO5P5csH2Iz5d22bY9vsaxznM1zz+b25nkfqN
	V7jcyBmlu0Gl9IruTeULo5NVm+aECUrRp3wAt70ZKLW76M1kfaV3nV6BnDp+KOrZAs04KVRF5hv1o
	hPOohx+FNEEMJU+698BuFnoNFxEeU1Xlgc00Jeim63Wxfum3U+/4WBelTjt8VuRFBWHLQHvJRaqJl
	8BUCnbn9nLmusDSy+q1TygPEw2RStJOaeHeUPnm5JLTgq/389WJtgJXh8fg1eI54DyyUtvqLRp+zg
	JzlGLDZw==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKur-0000000CQxA-41R3
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 10:17:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7860343252;
	Mon, 28 Jul 2025 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIdf1rusMM2utxFOgdWZXg7UVjylZoesGKXTK2HALPM=;
	b=EGlSUO0FLvU4g/5I6IeveWOzyL7GdC+2HBdNmoMfaq837fyt4Zz7PrADj/lZpgepqZA6Ws
	E4DSNtypYSEhe5Q0Plz2zQSFqvl12uYdpnuPaGFXnQmI/dbo1SuZs+CS26WhD4fWde3u87
	TMsd8s0Pt4D92eJc+vJpIh8UQsbzA9/Q59I6v155gT7eWpWjVS+UHEqaNmcCI1NxsZLdj1
	mbJrwvYB5lpmTpSS0CfnY2PVx1IRV+TdTRdY35icVp6dmNw/fyBWXrCApnWSqXWlpvz5+W
	SUA4+M/Rv14nYkmE8qGSffzDoVnG2lU/mXanZdZSNxdoXI8iBB28NicjBL9FSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: bbrezillon@kernel.org, Hector Palacios <hector.palacios@digi.com>
Cc: korotkov.maxim.s@gmail.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250704094109.3646314-1-hector.palacios@digi.com>
References: <20250704094109.3646314-1-hector.palacios@digi.com>
Subject: Re: [PATCH] mtd: rawnand: hynix: don't try read-retry on SLC NANDs
Message-Id: <175369782644.102528.12960625311289516996.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegssghrvgiiihhllhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhorhhothhkohhvrdhmrgigihhmrdhssehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgvtghtohhrrdhprghlrggtihhoshesughighhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111720_149146_FBAC92A4 
X-CRM114-Status: UNSURE (   5.18  )
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

T24gRnJpLCAwNCBKdWwgMjAyNSAxMTo0MTowOSArMDIwMCwgSGVjdG9yIFBhbGFjaW9zIHdyb3Rl
Ogo+IFNvbWUgU0xDIE5BTkRzIGxpa2UgSDI3VTRHOEYyRCBleHBvc2UgYSB2YWxpZCBKRURFQyBJ
RCB5ZXQgdGhleSBkb24ndAo+IHN1cHBvcnQgdGhlIHJlYWQtcmV0cnkgbWVjaGFuaXNtLCBhbmQg
ZmFpbC4KPiBTaW5jZSBTTEMgTkFORHMgZG9uJ3QgcmVxdWlyZSByZWFkLXJldHJ5LCBjb250aW51
ZSBvbmx5IGlmIHRoZSBiaXRzIHBlcgo+IGNlbGwgaXMgYmlnZ2VyIHRoYW4gMS4KPiAKPiAKCkFw
cGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGh5bml4OiBk
b24ndCB0cnkgcmVhZC1yZXRyeSBvbiBTTEMgTkFORHMKICAgICAgY29tbWl0OiA3ZjIxMjI5ZmNj
MzVkYmRkNmZmODY2YmNkNjg2NjFjYzI4MDgwYTQ3CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWls
YWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHBy
b3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApN
aXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
