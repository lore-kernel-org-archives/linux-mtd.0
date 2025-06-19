Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EF7C7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAw6lPtZzKIIbFd8bbelQXd3io22xaV8o+wGc32xERE=; b=AeZykw+UnZHRsD
	gjPEChsThVIS4PuDXxAD1lE4i1V4zsSuQ9Sj76c2P070dj1EI5JeI+KOxZYMisYCDe6Z0qHa997XO
	onGoWsta53oCrLIYT51jS6XFblboQJ6AqCoNOmV4LgRg0+E19+tKKE18ehYoEklOry7K8VbqEDm9S
	vlVc0BlCyY9N4ojGm5Q7pHA+oVqOTaOO659irfI0X7fvL7OI8et/S0+UboergDxNdYKVk7lYLGAzq
	H0I10bjyQp6SqrY3iGCORmgjul0usw5Y5DJgJ7yN16RkH+6r51Hp42az9E8i4UloRLDX0p3xMh/Af
	kJR4Q54dUqilnfp4xYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKCR-0000000DzAg-0aNZ;
	Thu, 19 Jun 2025 18:41:23 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIp3-0000000DivT-2IUE
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 17:13:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B079444F5;
	Thu, 19 Jun 2025 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750353186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnrBPcuDeZpkF7ZhZ2OMnH1hwfxuL5OqEGqEBj8EKzU=;
	b=Bp+/DO9krC99j726hfFKhic4ovc2WOJnkfD8guMAyQDSKZ7kM/J5lWP+6igKWsukxYyGyD
	GBr8HX7FSQLN+2xW8eYjYufYpsuUHkLIrcqf2sN7xGnv9t/g82ETzQp8WI49WnZCg9JWMY
	O6rVm5Mzr2LmKwacCc7nXLDpx16K+Eozq13FEZsFi6iZNyA75OIUEf+GRAlJCsopDgPxwi
	Bg0cvU5WDLgFPQZNPEk7U0ZCkRNyHLvbqn6mc8tJXGLQ6LqCFfrDSnjl3BM+q+UdDZAaFa
	KA6MER215rKpQxtO1cvmIlqUc6S+1ro0yZOmexvLI+RI5bBJq+tTE5WQGohV3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/3] mtd: spinand: winbond: Some fixes
Date: Thu, 19 Jun 2025 19:12:57 +0200
Message-ID: <175035310480.437524.17816575530484542994.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
References: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefuefgvdfffefhudfhteffgfeiieduueegffdvhedvvdeludejjeevvdfgtdevgfenucfkphepledvrddukeegrdduuddtrdduudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduudejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhin
 hhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_101309_874774_5F9FCC55 
X-CRM114-Status: GOOD (  10.84  )
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

T24gV2VkLCAxOCBKdW4gMjAyNSAxMDo0Nzo1NyArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBUaGUgVzM1TiBnZW9tZXRyeSB3YXMgc2xpZ2h0bHkgaW5jb3JyZWN0bHkgZGVzY3JpYmVkLCBh
bmQgc29tZSBvZiB0aGUKPiB2YXJpYW50cyBvbiBib3RoIGR1YWwvcXVhbmQgYW5kIG9jdGFsIHZh
cmlhbnRzIG5lZWRlZCB0byBiZSBmdXJ0aGVyCj4gZGVmaW5lZCBpbiBvcmRlciB0byBiZSBmdWxs
eSBhY2N1cmF0ZS4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gRml4IGNvbXBpbGF0aW9uIGlzc3Vl
IHdpdGggdGhlIGxhc3QgcGF0Y2guIEkgZGlkbid0IG5vdGljZSBpdCBpbiB0aGUKPiAgIGZpcnN0
IHBsYWNlLCBhcyBJIGhhdmUgbWFueSBtb3JlIHBhdGNoZXMgb24gdG9wIHdoaWNoIGRpZCBzb2x2
ZSB0aGUKPiAgIHByb2JsZW0uCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLgoKWzEv
M10gbXRkOiBzcGluYW5kOiB3aW5ib25kOiBGaXggVzM1TiBudW1iZXIgb2YgcGxhbmVzL0xVTgog
ICAgICBjb21taXQ6IDYwZGZmZTk2ZmFiMDBjZWU3ZWY3ZjFiMTUxZGE0ODVkNDJjY2IzM2EKWzIv
M10gbXRkOiBzcGluYW5kOiB3aW5ib25kOiBJbmNyZWFzZSBtYXhpbXVtIGZyZXF1ZW5jeSBvbiBh
biBvY3RhbCBvcGVyYXRpb24KICAgICAgY29tbWl0OiAyOTM4NGJiYjFhMmE1OTI2Zjk3YjhjYmU0
NjkwODFlN2ExNzcwZGVhClszLzNdIG10ZDogc3BpbmFuZDogd2luYm9uZDogUHJldmVudCB1bnN1
cHBvcnRlZCBmcmVxdWVuY2llcyBvbiBkdWFsL3F1YWQgSS9PIHZhcmlhbnRzCiAgICAgIGNvbW1p
dDogZGJhOTBmNWE3OWMxMzkzNmRlNDI3M2ExOWU2NzkwOGEwYzI5NmFmZQoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
