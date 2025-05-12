Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08E1C3ABCB
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 14:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcj5ETuqj4wXs4EYRShPo0Jg1q1jgB/Syufmy9uVE0M=; b=Efdj9TnigWGsk5
	JgWwfM4fbM8X36pFg0TvZgkqj0eGjDsc3sHyy94zjARUt+4a5Hd0sM/4qCr5pX4rmY2EVMBqS+0py
	iHdK7MGgnYbJ/0n6f6+owgvl0GGMseMTpTLK1m5aHrJCQxyA3S9UkHtpDHiPX3AfvyDkUbgQPu5Bj
	RJbQ1XL7SuXEmFQ3FC9t0gjV8muP6OUtteF2CTDyH7TyQ4LTRWbtWNHtLlSprSAUSHiNGzIg5ykt0
	wnUrBwN4ISvg8eRvZfyOUzcd+5Y7fNwrxFjgeZrKJugiEmDiQVNCq6c8hsMukqxIrhMrID8BAAuDs
	YCXPSj3VUWzA8G90gU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUcA-00000009ogr-07ls;
	Mon, 12 May 2025 14:58:46 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU9V-00000009jVo-0TpT
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 14:29:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23FA61FD4B;
	Mon, 12 May 2025 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747060146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iBPnSaiAJcr5gZIUPTcjGQ3VrRVsTSrjfazWik3ev0=;
	b=YI3VWCo7+gQZloxiq6EKTwvO+3/EHIZaNmTOJ9q8IwMbnu+JK02AqiM4lxyIo2dtLY6CR5
	/OSwjW+tj6c9jnwLKf0DIQ6/9AMi8QW0linycY2Xu5Iti5PFaOwWMjxNKizXOEnfMvPc2i
	ha48eoBK12uHadB4bNAYsiXe3IbanqEQfxpjW6BkFHGaleHjxjrbJo4zZKkDuR45YCEC16
	ulhu259LARrYR9HD0i/175U3zoXPYayIwydD2NiPuFww3PCK8o2Mm3Db8BqAjZdWKX+x5y
	oAN8hM1OCg7Ho2SmTrTaKMf0f2zuqT1szKu1pP9alUiPXOcbYGTEo3eHBF4YiA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250508-loongson1-nand-fix-v1-1-27b26234c62c@gmail.com>
References: <20250508-loongson1-nand-fix-v1-1-27b26234c62c@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: loongson1: Fix inconsistent refcounting
 in ls1x_nand_chip_init()
Message-Id: <174706014608.62075.16091315527360829377.b4-ty@bootlin.com>
Date: Mon, 12 May 2025 16:29:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072909_611546_6CE93C9C 
X-CRM114-Status: UNSURE (   4.92  )
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

T24gVGh1LCAwOCBNYXkgMjAyNSAxMToyODo0MiArMDgwMCwgS2VndWFuZyBaaGFuZyB3cm90ZToK
PiBBcyByZXBvcnRlZCBieSBEYW4sCj4gY29tbWl0IGQyZDEwZWRlMDRiMSAoIm10ZDogcmF3bmFu
ZDogQWRkIExvb25nc29uLTEgTkFORCBDb250cm9sbGVyCj4gRHJpdmVyIiksIGxlYWRzIHRvIHRo
ZSBmb2xsb3dpbmcgU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9t
dGQvbmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jOjczMCBsczF4X25hbmRfY2hp
cF9pbml0KCkKPiB3YXJuOiBpbmNvbnNpc3RlbnQgcmVmY291bnRpbmcgJ2NoaXBfbnAtPmtvYmou
a3JlZi5yZWZjb3VudC5yZWZzLmNvdW50ZXInOgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQv
bmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBsb29uZ3NvbjE6IEZpeCBpbmNvbnNp
c3RlbnQgcmVmY291bnRpbmcgaW4gbHMxeF9uYW5kX2NoaXBfaW5pdCgpCiAgICAgIGNvbW1pdDog
NjE1ZjhmNTA3N2ZjOGQzOTk4MThiZGEyYTE4YmNjODlkZWJlYjdhOAoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
