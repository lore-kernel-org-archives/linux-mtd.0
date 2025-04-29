Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373DEC3ABA9
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG7QwsTAM5Za8OnpbJNJbQhzZGiMBLIHmy/kBs4ZUns=; b=qZ8Q7yARQE3eOk
	zxwv2PHoEIOQ6LAPD8Ex+PSEHYIhl6DzAO35pMFETD+x1ttxwJZ+7VbsW5ROW7F1J6eT1AMjOkvX/
	etZgGMAvY4aEpcgVwYkFdm90xvQUY19bs8q+gUGgdAeU+D9/ZonGF+jjMYa4lXqWCb1TEmk206EmZ
	P8i4eC0Muk28tqyxm+QJj7B2dDR54KrLAxDF1mlYPJj9w5Fd9F0EiPUAqAj44UJaBmKuFkGEh8EZd
	CLHEABfLtVdIIUzAvpWDsQhYvgmn6aHg96RAAl9WzAlLu3bramv5NJOJBn+Dc45MaP7ILBvTGORzy
	vXinRySDnUIA1WPAK5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hEe-000000097xc-3Olx;
	Tue, 29 Apr 2025 09:26:40 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hEc-000000097w0-0Jlt
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:26:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E94C43AD5;
	Tue, 29 Apr 2025 09:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zBSOJ8PZCIJkVI0RwB72XCG1uSclea039h0mEzj+SA=;
	b=S3+PEoYnUm9uzhdF5bN5wK/Kw45LUnE7GFYWD1oKTIhFFByEx6DaR6QT0FI6l25fIcxrrr
	wpv5Wv6NK8KYo4yOqY5inXyzR2qREvhjN8smC/1Sf6ntqMD1mtEM+LjYuXRUf1KP5Kw2FC
	LjfNk8i80tGmb2NDM0EHj7m7+zjWuBy4UF65Up7+3kVXAmvIjvpbV5+raOCQ9WvB33stVH
	c/2rq6rqsUDh2LvtgCybFBrF87BpMY3m8MNkMurGV7VcrgKOI9y9hry2KsxYG9+Om5hUEh
	WU6yTnCEdFXvIS6YxiAzF6UXIBKeLijPU7QGRzAAwQOz1V1EAtu7oAcxF2OHBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Arkhipov <m.arhipov@rosa.ru>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20250408213906.23129-1-m.arhipov@rosa.ru>
References: <20250408213906.23129-1-m.arhipov@rosa.ru>
Subject: Re: [PATCH] mtd: nand: ecc-mxic: Fix use of uninitialized variable
 ret
Message-Id: <174591879451.993707.7630596131927470519.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:26:34 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhrghdprhgtphhtthhopehmrdgrrhhhihhpohhvsehrohhsrgdrrhhup
 dhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022638_277092_5FA8CE5A 
X-CRM114-Status: UNSURE (   7.76  )
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

T24gV2VkLCAwOSBBcHIgMjAyNSAwMDozOTowNiArMDMwMCwgTWlraGFpbCBBcmtoaXBvdiB3cm90
ZToKPiBJZiBjdHgtPnN0ZXBzIGlzIHplcm8sIHRoZSBsb29wIHByb2Nlc3NpbmcgRUNDIHN0ZXBz
IGlzIHNraXBwZWQsCj4gYW5kIHRoZSB2YXJpYWJsZSByZXQgcmVtYWlucyB1bmluaXRpYWxpemVk
LiBJdCBpcyBsYXRlciBjaGVja2VkCj4gYW5kIHJldHVybmVkLCB3aGljaCBsZWFkcyB0byB1bmRl
ZmluZWQgYmVoYXZpb3IgYW5kIG1heSBjYXVzZQo+IHVucHJlZGljdGFibGUgcmVzdWx0cyBpbiB1
c2VyIHNwYWNlIG9yIGtlcm5lbCBjcmFzaGVzLgo+IAo+IFRoaXMgc2NlbmFyaW8gY2FuIGJlIHRy
aWdnZXJlZCBpbiBlZGdlIGNhc2VzIHN1Y2ggYXMgbWlzY29uZmlndXJlZAo+IGdlb21ldHJ5LCBF
Q0MgZW5naW5lIG1pc3VzZSwgb3IgaWYgY3R4LT5zdGVwcyBpcyBub3QgdmFsaWRhdGVkCj4gYWZ0
ZXIgaW5pdGlhbGl6YXRpb24uCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IG5hbmQ6IGVjYy1teGljOiBGaXggdXNlIG9mIHVuaW5pdGlhbGl6ZWQg
dmFyaWFibGUgcmV0CiAgICAgIGNvbW1pdDogZDk1ODQ2MzUwYWFjNzIzMDMwMzZhNzBjNGNkYzY5
YWUzMTRhYTI2ZAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4Lmdp
dCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90
IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
