Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED6EC3ABBC
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07lp5NJhpmhu1SC0pxHCzFxcqQI1JREqkWM+jWAwRH0=; b=xS3MDu1gMuuB9x
	VKcYKIL8pkkY9Y552C9rEX+/HGx1sQDSAVORMJMBB437cjlCwWEYM0hqyfvO1hnBEvoAE/XCR8K1V
	iSxvwT06VMHXJ3wJhRwp1Xc1q/ZxdhblIR0to8cW4bi3Xu4HXrKw+w571s9a9xUcPt3anArp8s0tX
	hq5RLmpNjda5sI7GjnjrGgTfz4e20vXovtHb7NQLqqytL4VyXOrvadFqcbMzon8wapk3m6f1V3QYQ
	gR0uIqBfYb3F0l9I47jA0vaNt3OMvSXiXfHUgfpt6Pr/XSsjq1GhRU8PLZvJspeJ7wQonLOpjorun
	yNdBik3m6JNH+06Iy4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOAw-00000008gvk-3e3J;
	Mon, 12 May 2025 08:06:14 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOAu-00000008gv9-2wuV
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 08:06:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAEBD43A1F;
	Mon, 12 May 2025 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747037170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6k5IQ2owltrUjGvtqvStBVaUUNElR1qEISLexeVmvd0=;
	b=TTQW3nRRZYp7iyLU9B8gPDNQaOO0O+l6dtCt7l1TIU0xGoudYxkE88nL9oXKRiO+M8H8Gj
	C8WmsPlMTbw9XF3re3XQJ1xkBV51F3GwV4M3SpoyPHLYryIUY5OW9cmbbqtRuUc0L0ALr/
	I6iDbqta73W8+oMJ+KkduZsXLWx+Ha4Y1MZkEzL5s9gW0ZvKAANDZcdr4LB4hW3fnSvfJO
	IX+WaY3cJOO4XcuDFYG4cWl8cxs55NSdygup1jZ6929Ioi+YksbMTfar9hxC+lvoJPQcC/
	LBtG/V5qKlQxPLgsxkPqRGgNvfua0tIiG+tfROgRH6ugTBGy/CZ242/+HFNZJw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bence =?utf-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  =?utf-8?B?Q3PDs2vDoXMs?=  "Michael Walle" <mwalle@kernel.org>,  Richard
 Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: Verify written data in paranoid mode
In-Reply-To: <20250508183733.514124-3-csokas.bence@prolan.hu> ("Bence
	=?utf-8?B?Q3PDs2vDoXMiJ3M=?= message of "Thu, 8 May 2025 20:37:34 +0200")
References: <20250508183733.514124-3-csokas.bence@prolan.hu>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 10:06:09 +0200
Message-ID: <874ixqp826.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptghsohhkrghsrdgsvghntggvsehprhholhgrnhdrhhhupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_010612_925675_D354D5A7 
X-CRM114-Status: UNSURE (   9.42  )
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

SGVsbG8sCgpPbiAwOC8wNS8yMDI1IGF0IDIwOjM3OjM0ICswMiwgQmVuY2UgQ3PDs2vDoXMgPGNz
b2thcy5iZW5jZUBwcm9sYW4uaHU+IHdyb3RlOgoKPiBGcm9tOiBDc8Oza8OhcywgQmVuY2UgPGNz
b2thcy5iZW5jZUBwcm9sYW4uaHU+Cj4KPiBBZGQgTVREX1BBUkFOT0lEIGNvbmZpZyBvcHRpb24g
Zm9yIHZlcmlmeWluZyBhbGwgd3JpdHRlbiBkYXRhIHRvIHByZXZlbnQKPiBzaWxlbnQgYml0IGVy
cm9ycyBiZWluZyB1bmRldGVjdGVkLCBhdCB0aGUgY29zdCBvZiBzb21lIGJhbmR3aWR0aCBvdmVy
aGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IENzw7Nrw6FzLCBCZW5jZSA8Y3Nva2FzLmJlbmNlQHBy
b2xhbi5odT4KPiAtLS0KCi4uLgoKPiAraW50IG10ZF93cml0ZV9vb2Ioc3RydWN0IG10ZF9pbmZv
ICptdGQsIGxvZmZfdCB0bywKPiArCQkgIHN0cnVjdCBtdGRfb29iX29wcyAqb3BzKQo+ICt7Cj4g
KwlpbnQgcmV0ID0gX210ZF93cml0ZV9vb2IobXRkLCB0bywgb3BzKTsKPiArCj4gKyNpZiBJU19F
TkFCTEVEKENPTkZJR19NVERfUEFSQU5PSUQpCj4gKwlpZiAocmV0IDwgMCkKPiArCQlyZXR1cm4g
cmV0Owo+ICsKPiArCXJldCA9IF9tdGRfdmVyaWZ5KG10ZCwgdG8sIG9wcy0+cmV0bGVuLCBvcHMt
PmRhdGJ1Zik7Cj4gKyNlbmRpZiAvLyBDT05GSUdfTVREX1BBUkFOT0lECj4gKwlyZXR1cm4gcmV0
Owo+ICt9CgpJJ2QgcHJlZmVyIHRvIGV4dGVuZCBtdGRfd3JpdGVfb29iKCkgd2l0aCBhIHNpbXBs
ZQoKICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19NVERfUEFSQU5PSUQpKQogICAgICAgICAgICBt
dGRfdmVyaWZ5KCk7CgpJdCB3aWxsIGFsc28gbGlrZWx5IHNvbHZlIHRoZSBrZXJuZWwgdGVzdCBy
b2JvdCByZXBvcnQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
