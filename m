Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D0BE6FE2F
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+V24U6xg09sFwMqNAv7R02Q9z4pgn8Z+6mEl5AHz3QQ=; b=t/LJjtl5vEX23K
	KIrfFwZjXMiGAHQob/xkeg6YbUykT/goikvhbNSIHlFaN1zAEnGScBLY63z7PshSUmb09H/rheN5K
	GUWqsZdNgoRW8MQV/O4m6RMCQoXLaCh+DhFUuIDOrz2dVK3uaH/XkIYPZFnRVJ8tsHYuzMqwxT2Dz
	hhunxaQFh1qoZKQbSZPLTR4sMoIeW22Eibu7jC6FhoGMMyQHKsLGLbtZxCgYxMfib5qru79XzHlfn
	YaM/Ubj6Wx52LENA/MjBBZZ6TiV/A7JC22xCDTrl8JIsFYEOMQqATZLvI76ouZtJLZQc3y2iZO9v0
	zU5viRLay52CMKlHUGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjglU-009AaH-0G;
	Fri, 22 Sep 2023 14:04:16 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjglQ-009AZD-1r
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:04:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C79AD24000A;
	Fri, 22 Sep 2023 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695391445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pExq5EY/86tUqekvDpJYB6m3SynqP56IDF4E/AB4Z5k=;
	b=CStiiwB68UhFaWNyJvW23wdDSD3ddwH74WFVgCG8U6545bJhHiRYjRaS4ZcEqiDpvQPYIH
	tMrGKNyuwQ8Xx+2UbGKbJUnn0wbXn/KylVZzA9nXKFW4/4AjzqDJ38ccV4/agKr4NNPBRF
	/LsM+yKlMcGtAU7+nrXZfUbEfdd+HqnDMlyLvex/uEw1bb+V1WCPlSfvmxJrH5AcVYyxOa
	+MiK5TE1w+uMP1GTp+A7Hmss0wDLYiMb3f6sQ1Zbi28zQkXidzbls8tZnliF73aYRQ31IA
	qaUP8cNWZlvj0TzysxwcUVKXgZUO/nFKSg9S61fFAuAB0hWZweEWKz4yFZhqzA==
Date: Fri, 22 Sep 2023 16:04:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Cc: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>,
 =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Alexander
 Shiyan <eagle.alexander923@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: check nand support for cache reads
Message-ID: <20230922160400.034ee828@xps-13>
In-Reply-To: <20230922100116.145090-1-r.czerwinski@pengutronix.de>
References: <20230922100116.145090-1-r.czerwinski@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_070412_885512_CAB34EC2 
X-CRM114-Status: GOOD (  20.94  )
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

SGkgUm91dmVuLAoKVGhhbmtzIGEgbG90IGZvciB0aGUgaW52ZXN0aWdhdGlvbiBhbmQgdGhlIHBh
dGNoIQoKci5jemVyd2luc2tpQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIEZyaSwgMjIgU2VwIDIw
MjMgMTI6MDE6MTMgKzAyMDA6CgpXb3VsZCB5b3UgbWluZCBjaGFuZ2luZyB0aGUgdGl0bGUgdG8K
Im10ZDogcmF3bmFuZDogRW5zdXJlIHRoZSBuYW5kIGNoaXAgc3VwcG9ydHMgY2FjaGVkIHJlYWRz
IgoKPiBCb3RoIHRoZSBKRURFQyBhbmQgT05GSSBzcGVjaWZpY2F0aW9uIHNheSB0aGF0IHJlYWQg
Y2FjaGUgc2VxdWVudGlhbAo+IHN1cHBvcnQgaXMgYW4gb3B0aW9uYWwgY29tbWFuZC4KCkkgY2xl
YXJseSBvdmVybG9va2VkIHRoYXQgcGFydCwganVzdCBjaGVja2luZyB0aGUgc2V0L2dldF9mZWF0
dXJlcygpCmVudHJpZXMgYXMgdXN1YWwsIGdvb2QgY2F0Y2guCgo+IFRoaXMgbWVhbnMgdGhhdCB3
ZSBub3Qgb25seSBuZWVkIHRvCj4gY2hlY2sgd2hldGhlciB0aGUgaW5kaXZpZHVhbCBjb250cm9s
bGVyIGltcGxlbWVudHMgdGhlIGNvbW1hbmQsIHdlIGFsc28KClRoZSBjb250cm9sbGVyIGl0c2Vs
ZiBkb2VzIG5vdCBpbXBsZW1lbnQgdGhlIGNvbW1hbmQsIGJ1dCBtYXkgb3IgbWF5Cm5vdCBzdXBw
b3J0IGl0IChjYW4geW91IHBsZWFzZSB1cGRhdGUgdGhlIHNlbnRlbmNlPykuCgo+IG5lZWQgdG8g
Y2hlY2sgdGhlIHBhcmFtZXRlciBwYWdlcyBmb3IgYm90aCBPTkZJIGFuZCBKRURFQyBOQU5EIGZs
YXNoZXMKPiBiZWZvcmUgZW5hYmxpbmcgc2VxdWVudGlhbCBjYWNoZSByZWFkcy4KPiAKPiBUaGlz
IGZpeGVzIHN1cHBvcnQgZm9yIE5BTkQgZmxhc2hlcyB3aGljaCBkb24ndCBzdXBwb3J0IGVuYWJs
aW5nIGNhY2hlCj4gcmVhZHMsIGkuZS4gU2Ftc3VuZyBLOUY0RzA4VTBGIG9yIFRvc2hpYmEgVEM1
OE5WRzBTM0hUQTAwLgo+IAo+IFNlcXVlbnRpYWwgY2FjaGUgcmVhZHMgYXJlIG5vIG9ubHkgYXZh
aWxhYmxlIGZvciBPTkZJIGFuZCBKRURFQyBkZXZpY2VzLAo+IGlmIGluZGl2aWR1YWwgdmVuZG9y
cyBpbXBsZW1lbnQgdGhpcywgaXQgbmVlZHMgdG8gYmUgZW5hYmxlZCBwZXIgdmVuZG9yLgoKQWdy
ZWVkLgoKPiBUZXN0ZWQgb24gaS5NWDZRIHdpdGggYSBTYW1zdW5nIE5BTkQgZmxhc2ggY2hpcCB0
aGF0IGRvZXNuJ3Qgc3VwcG9ydAo+IHNlcXVlbnRpYWwgcmVhZHMuCj4gCj4gRml4ZXM6IDAwM2Zl
NGI5NTQ1YiAoIm10ZDogcmF3bmFuZDogU3VwcG9ydCBmb3Igc2VxdWVudGlhbCBjYWNoZSByZWFk
cyIpCj4gCgpQbGVhc2UgcmVtb3ZlIHRoaXMgZW1wdHkgbGluZSBhbmQgaW5zdGVhZCBhZGQ6CgpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwoKPiBTaWduZWQtb2ZmLWJ5OiBSb3V2ZW4gQ3plcndp
bnNraSA8ci5jemVyd2luc2tpQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IEBNYXJ0aW4sIE3DpW5z
Ogo+IEkgd291bGQgYXBwcmVjaWF0ZSBpZiB5b3UgY291bGQgdGVzdCB0aGlzIG9uIHlvdXIgaGFy
ZHdhcmUuCgpUaGF0IHdvdWxkIG1lIG11Y2ggYXBwcmVjaWF0ZWQhCgpJIGFsc28gYWRkZWQgQWxl
eGFuZGVyIHdobyBhbHNvIGhhZCB0cm91YmxlcyB3aXRoIHRoaXMgcGF0Y2hzZXQsIGNvdWxkCnlv
dSBjaGVjayBvbiB5b3VyIHNldHVwIGlmIHRoYXQgc29sdmVzIHRoZSBpc3N1ZT8KCj4gQE1pZ3Vl
bDoKPiBJIGRpZG4ndCBoYXZlIHRoZSB0aW1lIHRvIHRlc3QgdGhpcyBvbiBPTkZJL0pFREVDIGRl
dmljZXMgd2l0aCBzdXBwb3J0Cj4geWV0LCBJJ2QgYmUgZmluZSBpZiB5b3UgaG9sZCBvZmYgbWVy
Z2luZyB0aGlzLgoKT2YgY291cnNlLiBJIHdhcyBhYm91dCB0byBzZW5kIGEgcmV2ZXJ0IGJ1dCB0
aGF0IGxvb2tzIGEgcHJvbWlzaW5nIGZpeCwKbGV0J3Mgc2VlIGhvdyBpdCBnb2VzLgoKPiAKPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgIHwgMyArKysKPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9qZWRlYy5jIHwgMyArKysKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9vbmZpLmMgIHwgMyArKysKPiAgaW5jbHVkZS9saW51eC9tdGQvamVkZWMuaCAgICAgICAgIHwg
MyArKysKPiAgaW5jbHVkZS9saW51eC9tdGQvb25maS5oICAgICAgICAgIHwgMSArCj4gIGluY2x1
ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgICB8IDEgKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKykKPiAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
