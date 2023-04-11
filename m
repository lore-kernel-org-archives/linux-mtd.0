Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B1AC77B6F
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTqzxt+oN4nBX7ctk8F7VRdDZqNKBBBsgvctlzOxMuU=; b=HlJWlS/nJXa/PH
	YMlgZkYzo4n5uXnLxmO7qwoDR6Q0godGiFpxbj4Pfsx42b3Ne+zj8swqRzdhgUVPQOnLPFIm/y1GV
	YSCxvCfAiL1eBHKEkVk0armzEKfbyV3B1sCfsxeD02aKoYoIcGxOZ5fsnbp5YbD3TwH5Pq/YbBDu5
	gnNtHZ2hm1GMHf9yU+DDEgqdwDema+HcrrNa1CKfoLO/dnUVnvEJWn1Uzxbqbk2WZ7U9ttEJVKbJ5
	Z5mKnKJbXCtnTppgt9Lp/Rdz0ksj5jdYFNEVsAhyNUvFZDqFpsSlcuNNZPj/UhphZxOCU8KRRbpVg
	DWQuQ10d4yajLqAPNjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmDSj-0000Q9-2o;
	Tue, 11 Apr 2023 12:51:05 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmDSg-0000P5-33;
	Tue, 11 Apr 2023 12:51:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0B7A60004;
	Tue, 11 Apr 2023 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681217459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EzjCluY+fsm+tmqMn/ireWB6naVRUjOxRjMO1s5pTg=;
	b=UXEGKb+ID3tQoFH057kCpdw6o9s1BXad+EkxkXkkFDBbb/Ftp4wNx6ZcP8w7LgXdkY4vBO
	8bcEzpIsJplTzunU6Cm6RYSdFS6jnkE9RK8u7e7hGm2oUdPdYG9bU6l9/Ii61MZnUg++Xg
	rvVIxhqGrDWDFwhKn33IG+UxcQHm+qV2rB9iR1nS6ekbr16LaVRxTQ70L1oMCeWumpOrJ8
	IKAtTzRLosCW7+8VxzQkpKkmD3UJfx+lwXJduXpTuC6HvYcQhN75OcWTgaBzw/qv7yTURv
	b1gCu1CNNRPcqFRGOOpLgXlLyZFrMILlO8OIdja/WCv2K5hK32sadqewTE7ZyA==
Date: Tue, 11 Apr 2023 14:50:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: postmaster@lists.infradead.org, linux-mtd@lists.infradead.org, Richard
 Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: nand: Convert to platform remove callback
 returning void
Message-ID: <20230411145056.49e39cf9@xps-13>
In-Reply-To: <20230411112634.qtaiqzjj4ceqejfd@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
	<20230407101043.299f5e22@xps-13>
	<20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
	<20230411102025.6b2fdc9e@xps-13>
	<20230411111148.yefmzohsvk3facq3@pengutronix.de>
	<20230411112634.qtaiqzjj4ceqejfd@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_055103_264858_ACE07431 
X-CRM114-Status: GOOD (  17.30  )
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

SGkgVXdlLAoKKyBSaWNoYXJkCgp1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUgd3JvdGUg
b24gVHVlLCAxMSBBcHIgMjAyMyAxMzoyNjozNCArMDIwMDoKCj4gSGVsbG8sCj4gCj4gT24gVHVl
LCBBcHIgMTEsIDIwMjMgYXQgMDE6MTE6NDhQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gPiA+ID4gQlRXLCBJIGNvbnN0cnVjdGVkIHRoZSBsaXN0cyBvZiBhY2tzL3Jldmlld3Mg
bXlzZWxmIGFuZCBmb3VuZCB0aGUgc2FtZQo+ID4gPiA+IHNldC4gSG93ZXZlciBiNCB3YWlsZWQg
YWJvdXQgZWFjaCBwYXRjaCBjbGFpbWluZzoKPiA+ID4gPiAKPiA+ID4gPiAJICAgIOKclyBCQURT
SUc6IERLSU0vaW5mcmFkZWFkLm9yZyAgCj4gPiA+IAo+ID4gPiBObyBpZGVhIHdoYXQgdGhpcyBt
ZWFucywgYW55IHBvaW50ZXI/ICAKPiA+IAo+ID4gbGlzdHMuaW5mcmFkZWFkLm9yZyBzaWducyBh
bGwgb3V0Z29pbmcgbWFpbCBhbmQgc29tZXRoaW5nIGJldHdlZW4gdGhlc2UKPiA+IG91dGdvaW5n
IG1haWxzIGFuZCBiNCBjb25zdW1pbmcgdGhlbSBicmVha3MgdGhlIHNpZ25hdHVyZS4gSSBkaWRu
J3QKPiA+IGRlYnVnLCBidXQgZGVwZW5kaW5nIG9uIHdoZXJlIHRoZSBwcm9ibGVtIGlzLCBlaXRo
ZXIKPiA+IHBvc3RtYXN0ZXJAbGlzdHMuaW5mcmFkZWFkLm9yZyBvciB0aGUgYWRtaW5zIG9mIGxv
cmUua2VybmVsLm9yZyBvciB0aGUKPiA+IG1haW50YWluZXIgb2YgYjQgbWlnaHQgd2FudCB0byBr
bm93IGFuZCBmaXguICAKPiAKPiBJIGNoZWNrZWQgYW5kIGl0J3Mgbm90IGFsbCBwYXRjaGVzIHRo
YXQgZmFpbC4gT25lIG9mIHRoZSBtYWlscyB0aGF0Cj4gZmFpbHMgdG8gdmVyaWZ5IGlzCj4gCj4g
CWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQwMTE2MTkzOC4yNTAzMjA0LTQ5LXUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZS9yYXcKPiAKPiBJdCBoYXMgdHdvIERLSU0tU2ln
bmF0dXJlcywgb25lIGZyb20gY2FzcGVyLmluZnJhZGVhZC5vcmcgYW5kIGFub3RoZXIgYnkKPiBi
b21iYWRpbC5pbmZyYWRlYWQub3JnICg9IGxpc3RzLmluZnJhZGVhZC5vcmcpLiBJIGd1ZXNzIHRo
ZSBwcm9ibGVtIGlzCj4gdGhhdCBjYXNwZXIgc2lnbnMgdGhlIG1haWwgYmVmb3JlIG1haWxtYW4g
b24gYm9tYmFkaWwgbWFuZ2xlcyB0aGUgbWFpbC4KPiBUaGUgZml4IHdvdWxkIGJlIHRvIG5vdCBs
ZXQgY2FzcGVyIHNpZ24gbWFpbHMgdGhhdCBzaG91bGQgYmUgZm9yd2FyZGVkCj4gdG8gYm9tYmFk
aWwsIG9yIG1haWxtYW4gc2hvdWxkIGJlIGZpeGVkIHRvIG5vdCBjaGFuZ2UgdGhlIG1haWwuIChU
aGUKPiBsYXR0ZXIgaXMgdGhlIG5pY2VyIGJ1dCBhbHNvIGhhcmRlciB0aGluZyB0byBkby4pCgpI
ZWxsbyBSaWNoYXJkLCBhbnkgaWRlYSBpZiB3ZSBjYW4gZG8gc29tZXRoaW5nIG9uIHRoZQppbmZy
YWRlYWQub3JnIHNpZGUgdG8gc29sdmUgdGhpcz8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
