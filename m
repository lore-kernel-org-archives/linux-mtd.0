Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA78C3ABC9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 May 2025 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZWT3ub89nYHISpbiHq4T+ltdgvKlc0xl6EX6jIOkTo=; b=pCu3SYl48ciJkN
	ewiJLCCVsTiQtxNwyj7xU3Xldda1K0/xV6exLhTR2oeWVyWpygRQLit9kyKCKg0MaRPQ9ufpfYtlE
	eQH7SrAgr3RlIHz/mgeTouocqFFKqrzJdVD1r1GGqT0w+DAg1PsgdaVgsw5os/ZiWEQCypl9FVTgN
	D1tZBKBPTWi1QPwXRbf7HpFXqQTDQqcq4TaKSdcdWTRHw1IT98i8znc2ZsGtjI96xZm1Tg2+TSrzP
	qd93CofQwBE0G80f8amNwwyIDVYd63PvGVEp9b0P9PmX3TkHZB/CauiU6JJb+DbfU24oj11kvR9W4
	AUIMBpHK390RIGMYcGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwl1-00000003oEi-3Klp;
	Fri, 16 May 2025 15:13:55 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwSt-00000003jv3-0nbM
	for linux-mtd@lists.infradead.org;
	Fri, 16 May 2025 14:55:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AEDE438F5;
	Fri, 16 May 2025 14:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747407308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MllZcQ2bO9GQsGYfaiwajTodevCMTQdfFYfoNKWe1k0=;
	b=bvh/eri/KUzx+FHmSdKJtnSvMPyicZigNW/D23TEITymuN49Of+OBy9/ZWiOdRok11+tjR
	11Tv4Kv75RPdmDTRSxlhFfE0U+w9ZCt03AHqYpatjXA38stELJDaTJImikK55la0VVxFMl
	SQ4cLgt6Ccmv6uVaRh6jJQsnGwOjGOJfuqXV2Jc5vv0qnfxqWg5C/9Jyakf4Jnd1v2CLUb
	3k1+rvPsAKYmD5Ywslm5Oub0QeZB4pn0TcimdFyJ9leu7/wbTPT4cKMdgYf370X+USX08Y
	yIV4TRIacGMmcQdHQc4605PuFJI9x/N7k2CAQay9HyawEyo09ECJgKiOS+XUfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@broadcom.com, florian.fainelli@broadcom.com, 
 computersforpeace@gmail.com, kamal.dasu@broadcom.com, 
 bcm-kernel-feedback-list@broadcom.com, richard@nod.at, vigneshr@ti.com, 
 jonas.gorski@gmail.com, dgcbueu@gmail.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20250514061454.772340-1-noltari@gmail.com>
References: <20250514061454.772340-1-noltari@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: brcmnand: remove unused parameters
Message-Id: <174740730696.360599.1374295611729816560.b4-ty@bootlin.com>
Date: Fri, 16 May 2025 16:55:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffhfdufefgueeuheeuveduieeijefhjeduveduveeitedvteeftdffhfejieelfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegughgtsghuvghusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrr
 ghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehjohhnrghsrdhgohhrshhkihesghhmrghilhdrtghomhdprhgtphhtthhopegtohhmphhuthgvrhhsfhhorhhpvggrtggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_075511_605317_7D4D4418 
X-CRM114-Status: UNSURE (   4.81  )
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

T24gV2VkLCAxNCBNYXkgMjAyNSAwODoxNDo1NCArMDIwMCwgw4FsdmFybyBGZXJuw6FuZGV6IFJv
amFzIHdyb3RlOgo+IGxhc3RfY21kIGFuZCBsYXN0X2J5dGUgYXJlIG5vdyB1bnVzZWQgYnJjbW5h
bmRfaG9zdCBtZW1iZXJzLgo+IGxhc3RfYWRkciBpcyBvbmx5IHdyaXR0ZW4gYW5kIG5ldmVyIHJl
YWQgc28gd2UgY2FuIHJlbW92ZSBpdCB0b28uCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwg
dGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBicmNtbmFuZDogcmVtb3ZlIHVudXNlZCBwYXJh
bWV0ZXJzCiAgICAgIGNvbW1pdDogNTZmY2U3NTQ3MDA0MWI1YjBkOTJhZTEwNjM3NDE2ZTFhNGNj
ZWIxYgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
