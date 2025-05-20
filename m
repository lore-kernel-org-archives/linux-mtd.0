Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99CBC3ABDD
	for <linux-mtd@archiver.kernel.org>; Tue, 20 May 2025 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQzZ0Ui0W52LThILB7lPAX0l5FhSA6vgorcjnj9T/hg=; b=kNAi0ExR6bVOGn
	nDnW9n7v29ADSOoz5eSpdAV7fWjpOD1nCyvMCQDLoNz1JWKbrgYDWKWZupTPe8/YXHpkyqB9Pqz8y
	ZI7v3l66lFUbjsBMZhFQqpZlx3qczyL9+QIj78O401vHUCNLgnyyTjNdEDpoXdNsKsXpcLcPYFUTV
	juw+GCT+9lnxDm12W8ZpQo1h9YYW//tzRy8BQqkaeg4A96sRKm+hOrO5mJcHxhL0kY7cgzbYkemE0
	4TcEX1oNz0IB38H6pCR5jV25PPnSRQAoe5spv0s3BsV21zW8n+jbgY11D32QeF38/T1d9TwMQ5Vub
	gpOYBgiDtNvFj6kdzAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPPD-0000000DR7l-3pR8;
	Tue, 20 May 2025 16:01:27 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOzk-0000000DMsY-37uM;
	Tue, 20 May 2025 15:35:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB11A432FA;
	Tue, 20 May 2025 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747755303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtli7qrKdDqJDEKpaUtEPgLih8RTCPqJd1HrwnUKnAs=;
	b=XhrodVPKe2Da9aIjEgLFROZaIR+dwQscLhUZdqThMEllrC+kwxvD/y1Ytxkw22DIKBtpTz
	tcwo6aIfjMlt3QLRhhq6b3/9Ywaw5w4uP2D1XY2coO245jfBFW8oAWFNhgZppstOgIDOEj
	CXqtM1lv5TzvzC9XHKLtzGR0/mo3YgITipMR8XBuFzEg5yS4R+zMoTLS/Rx6N23vGFUklY
	UzUnfAbv49s8IJwrPyRh2QusLZaoJC+y0JpahMcQyvrh1RZ/xYEgcVTvZmZTpYbTCIxU/p
	fvEGxxolSE4tbmX1icEJcTcnjhjv7SHw0CsGnePan6FDrAglZREa0z3B6Rt1Uw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, wens@csie.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, ruanjinjie@huawei.com, 
 u.kleine-koenig@baylibre.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250519154225.2928-1-vulab@iscas.ac.cn>
References: <20250519154225.2928-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: sunxi: Add randomizer configuration before
 randomizer enable
Message-Id: <174775530075.689292.3024700439135563644.b4-ty@bootlin.com>
Date: Tue, 20 May 2025 17:35:00 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnf
 hhrrgguvggrugdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083508_913986_D7031CCA 
X-CRM114-Status: UNSURE (   6.46  )
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

T24gTW9uLCAxOSBNYXkgMjAyNSAyMzo0MjoyNCArMDgwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IEluIHN1bnhpX25mY19od19lY2NfcmVhZF9jaHVuaygpLCB0aGUgc3VueGlfbmZjX3JhbmRvbWl6
ZXJfZW5hYmxlKCkgaXMKPiBjYWxsZWQgd2l0aG91dCB0aGUgY29uZmlnIG9mIHJhbmRvbWl6ZXIu
IEEgcHJvcGVyIGltcGxlbWVudGF0aW9uIGNhbiBiZQo+IGZvdW5kIGluIHN1bnhpX25mY19od19l
Y2NfcmVhZF9jaHVua3NfZG1hKCkuCj4gCj4gQWRkIHN1bnhpX25mY19yYW5kb21pemVyX2NvbmZp
ZygpIGJlZm9yZSB0aGUgc3RhcnQgb2YgcmFuZG9taXphdGlvbi4KPiAKPiAKPiBbLi4uXQoKQXBw
bGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbmFuZDogc3VueGk6IEFkZCBy
YW5kb21pemVyIGNvbmZpZ3VyYXRpb24gYmVmb3JlIHJhbmRvbWl6ZXIgZW5hYmxlCiAgICAgIGNv
bW1pdDogNGE1YTk5YmM3OWNkYzRiZTYzOTMzNjUzNjgyYjAyNjFhNjdhMGM5ZgoKUGF0Y2hlKHMp
IHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9m
IHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4K
CktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
