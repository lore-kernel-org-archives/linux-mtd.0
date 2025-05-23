Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70430C54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ONKTWkZ0znWcgxSCopoul0hIYD8PVtI3kqugDYDYKg=; b=4NIEXL7tvvsAY9
	Vgsa6UD+X7GZTeWgN2Znq2YdbfX9iG4MtP66hjmG/DEbNXvRTVNA/rJ2YUyuwWrr3U3XYdyHAdfkW
	B14TmcXFkkoQKa33aHgyay4AtmhD14vUF4K/Pk/gfTSt4g4VxerJVsFD58pZYEmmtBuOMW7oy2jTy
	E+JXNQQIdNJyAmaJeBQOuoUoQQ/bdlYoQu3VMdVZRiBvnKcN7pZR961hPhIblCzZn9TxwXLdQruJz
	BknN850YZxqOMVem0pfsbKamUXFmoHrxPxxiD9TqrqL+BEXtgbeKzgDcpSLEh/vOu/0CVPfpppk3x
	xWttjeOCpuRjq5YTw1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU3r-00000004D1a-2NHa;
	Fri, 23 May 2025 15:11:51 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITjl-0000000498k-1m0M
	for linux-mtd@lists.infradead.org;
	Fri, 23 May 2025 14:51:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B65AA43B0C;
	Fri, 23 May 2025 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748011862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSgX7S40xopOK0v+O35hOo/TqGd2mvAhf1SqDu4HKcc=;
	b=JhBXPYsH5PxPq19gYzDB9J3tWUmqaqsXkNK7BD9cxPYC23Z4rRE44HR26G3sxnUjlyy/9g
	vQGZcgr0oJDZFArugTZdMyLag6dd/fbgAeNxqMqcz8oVr8IhX1uX1EOCihklFq1fOqK83i
	bfC9FqpvSXq7AB1NRZ+p5J1qOyQNGbuZO83Q61+6o/52QvxTpRwnHmOnEBAJ0m5fHbJ87p
	djKKFU5cLB0IsZN77g5S8rNYVDr3gmZ7cJtGhZkY6snKTVHxiZi6NYerSmVnV14dizgM6r
	91Uobx/Sqen0PbPL3dBzWIwJT+Yy2NoTVoomdxEZPc49bFV3VQZaPJT4vzPlyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 bcm-kernel-feedback-list@broadcom.com, william.zhang@broadcom.com, 
 anand.gore@broadcom.com, florian.fainelli@broadcom.com, 
 kamal.dasu@broadcom.com, dan.beygelman@broadcom.com, 
 =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, 
 rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
 vigneshr@ti.com, richard@nod.at, bbrezillon@kernel.org, 
 kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, kilobyte@angband.pl, 
 jonas.gorski@gmail.com, dgcbueu@gmail.com, dregan@mail.com, 
 dregan@broadcom.com
In-Reply-To: <20250522172526.3926633-1-dregan@broadcom.com>
References: <20250522172526.3926633-1-dregan@broadcom.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: fix NAND timeout when accessing
 eMMC
Message-Id: <174801185752.990005.9184545428707751994.b4-ty@bootlin.com>
Date: Fri, 23 May 2025 16:50:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeludegucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffhfdufefgueeuheeuveduieeijefhjeduveduveeitedvteeftdffhfejieelfeenucfkphepledvrddukeegrdelkedrtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrddtpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrnhgrnhgurdhgohhrvgessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopegurhgvghgrnhesmhgrihhlrdgtohhmpdhrtghpthhtohepnhholhhtrghrihesghhmrghilhdrtghomhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepsggtm
 hdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehjrghimhgvlhhirghordhtfiesghhmrghilhdrtghomhdprhgtphhtthhopehfrhhivgguvghrrdhstghhrhgvmhhpfheskhhonhhtrhhonhdruggv
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_075105_642369_7EBE1449 
X-CRM114-Status: UNSURE (   6.94  )
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

T24gVGh1LCAyMiBNYXkgMjAyNSAxMDoyNToxNyAtMDcwMCwgZHJlZ2FuQGJyb2FkY29tLmNvbSB3
cm90ZToKPiBXaGVuIGJvb3RpbmcgYSBib2FyZCB0byBOQU5EIGFuZCBhY2Nlc3NpbmcgTkFORCB3
aGlsZSBlTU1DCj4gdHJhbnNhY3Rpb25zIGFyZSBvY2N1cnJpbmcgdGhlIE5BTkQgd2lsbCBzb21l
dGltZXMgdGltZW91dC4gVGhpcwo+IGlzIGR1ZSB0byBib3RoIE5BTkQgYW5kIGVNTUMgY29udHJv
bGxlciBzaGFyaW5nIHRoZSBzYW1lIGRhdGEgYnVzCj4gb24gQkNNQkNBIGNoaXBzLiBGaXggaXMg
dG8gZXh0ZW5kIE5BTkQgdGltZW91dCB0byBhbGxvdyBlTU1DCj4gdHJhbnNhY3Rpb25zIHRpbWUg
dG8gY29tcGxldGUuCj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3Mh
CgpbMS8xXSBtdGQ6IG5hbmQ6IGJyY21uYW5kOiBmaXggTkFORCB0aW1lb3V0IHdoZW4gYWNjZXNz
aW5nIGVNTUMKICAgICAgY29tbWl0OiA1MjhiNTQxYjcxY2YwM2UyNjMyNzJiMDUxYjcwNjk2Zjky
MjU4ZTlkCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFu
ZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29t
cGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
