Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78058C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/TcAvS0R1MSbjL4gLyUDnEasw2ZYqBljQ5aF41p5rs=; b=TA9wW0wdWW4cmF
	mOV5WwFzpLXKk/3kuf16J/dKsSYUwvEqC/TXq6NnUKnu+53oK+29XlxLJlsJopwDMoxNn7j0Xbobw
	DbMaJjASoYXSaH6zWxavMU2VSVTofrefiTEzDEjoCeE6gnsl4aTRj/vHLxnsv/ycSoyRsZPK5ip8k
	AvPJSnDDykTIXM6197vyh3ViPT65WhSmCa7VcKKcpkEMXSxtpG9jJRwP/SuC8BXcI7Gpx4PGmeEuL
	mFWZ1aiENPiryK+4FxYA3rnPdnVR4VJaYha9tgf5VJBvcJoEVXQn2ICHZB8jeVabWaSy3F/vig55e
	crqjUZZc6Wruo/XIbE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uc7-00CuS9-1h;
	Tue, 30 May 2023 08:21:55 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uc2-00CuPz-2s;
	Tue, 30 May 2023 08:21:53 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685434906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7k/WfCxpV4Wb3Zf5dT6zrNqHZZm4+YA1ttDwgyZUUY=;
	b=hr0vWnFnLsrmGlwaEPeP0BZVQwmQQBY7HJ0zKb/nJ7Jh9iXFeqJpxXFjLeQHR89kaxYXrH
	YyjAhBfk0o8KXYQqHT5DUz9SVLYG7cWIgLCEkQBiQI4Nf2FG8oD8HW+DFn2H4Mo9Zhr1z5
	G7iwIg557uEeAhSJoBBmmAjNEFjMpxq0sjbNNQZSIptstl1ZYNwqwScOEyZ5RlpWBDB25l
	CKDu3PaBETbpHzbbyTdjehvI3qkiUZUCfyZDMTyc+tjFpdYbSqRVgbJlfpOldlAzBa7fEm
	DOy8oC4s9vgRp5Gy4nOonwL9f+j6BMr3QOIOSDy0sHtfyKkDUa70DeBJy3ab5g==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 282FDC0005;
	Tue, 30 May 2023 08:21:43 +0000 (UTC)
Date: Tue, 30 May 2023 10:21:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] mtd: rawnand: meson: move OOB to non-protected
 ECC area
Message-ID: <20230530102143.6b2a199a@xps-13>
In-Reply-To: <1f4c90c4-e436-c53f-bb6f-416db374ae52@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
	<20230515094440.3552094-3-AVKrasnov@sberdevices.ru>
	<20230522173334.7aa6f917@xps-13>
	<ebbc26e3-6a1c-eead-051c-8f93beba41f3@sberdevices.ru>
	<20230526190347.6e34a2be@xps-13>
	<b9f0a38a-0d50-23f0-4509-c38362d05f12@sberdevices.ru>
	<20230530094420.06281ab5@xps-13>
	<1f4c90c4-e436-c53f-bb6f-416db374ae52@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_012151_368115_89978FB4 
X-CRM114-Status: GOOD (  26.60  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDMwIE1h
eSAyMDIzIDExOjA5OjEwICswMzAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMzAuMDUuMjAyMyAx
MDo0NCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEFyc2VuaXksCj4gPiAgIAo+ID4+Pj4+
PiAtc3RhdGljIHZvaWQgbWVzb25fbmZjX2dldF91c2VyX2J5dGUoc3RydWN0IG5hbmRfY2hpcCAq
bmFuZCwgdTggKm9vYl9idWYpCj4gPj4+Pj4+IC17Cj4gPj4+Pj4+IC0Jc3RydWN0IG1lc29uX25m
Y19uYW5kX2NoaXAgKm1lc29uX2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+ID4+Pj4+PiAt
CV9fbGU2NCAqaW5mbzsKPiA+Pj4+Pj4gLQlpbnQgaSwgY291bnQ7Cj4gPj4+Pj4+ICsJaW50IGk7
Cj4gPj4+Pj4+ICAKPiA+Pj4+Pj4gLQlmb3IgKGkgPSAwLCBjb3VudCA9IDA7IGkgPCBuYW5kLT5l
Y2Muc3RlcHM7IGkrKywgY291bnQgKz0gMikgewo+ID4+Pj4+PiArCWZvciAoaSA9IDA7IGkgPCBu
YW5kLT5lY2Muc3RlcHM7IGkrKykgewo+ID4+Pj4+PiAgCQlpbmZvID0gJm1lc29uX2NoaXAtPmlu
Zm9fYnVmW2ldOwo+ID4+Pj4+PiAtCQlvb2JfYnVmW2NvdW50XSA9ICppbmZvOwo+ID4+Pj4+PiAt
CQlvb2JfYnVmW2NvdW50ICsgMV0gPSAqaW5mbyA+PiA4Owo+ID4+Pj4+PiArCQkvKiBBbHdheXMg
aWdub3JlIHVzZXIgYnl0ZXMgcHJvZ3JhbW1pbmcuICovICAgICAgCj4gPj4+Pj4KPiA+Pj4+PiBX
aHk/ICAgICAgCj4gPj4+Pgo+ID4+Pj4gSSB0aGluayBjb21tZW50IG1lc3NhZ2UgaXMgd3Jvbmcg
YSBsaXR0bGUgYml0LiBIZXJlICJ1c2VyIGJ5dGVzIiBhcmUKPiA+Pj4+IHVzZXIgYnl0ZXMgcHJv
dGVjdGVkIGJ5IEVDQyAoZS5nLiBsb2NhdGlvbiBvZiB0aGVzZSBieXRlcyBkaWZmZXJzIGZyb20g
bmV3Cj4gPj4+PiBPT0IgbGF5b3V0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCkuIER1cmluZyBw
YWdlIHdyaXRlIHRoaXMgaGFyZHdhcmUKPiA+Pj4+IGFsd2F5cyB3cml0ZXMgdGhlc2UgYnl0ZXMg
YWxvbmcgd2l0aCBkYXRhLiBCdXQsIG5ldyBPT0IgbGF5b3V0IGFsd2F5cyBpZ25vcmVzCj4gPj4+
PiB0aGVzZSA0IGJ5dGVzLCBzbyBzZXQgdGhlbSB0byAweEZGIGFsd2F5cy4gICAgCj4gPj4+Cj4g
Pj4+IFdoZW4gcGVyZm9ybWluZyBwYWdlIHJlYWRzL3dyaXRlcywgeW91IG5lZWQgdG8gdGFrZSB0
aGUgZGF0YSBhcyBpdCdzCj4gPj4+IGJlZW4gcHJvdmlkZWQuIFlvdSBtYXkgbW92ZSB0aGUgZGF0
YSBhcm91bmQgaW4gdGhlIGJ1ZmZlciBwcm92aWRlZCB0bwo+ID4+PiB0aGUgY29udHJvbGxlciwg
c28gdGhhdCBpdCBnZXQgdGhlIEVDQyBkYXRhIGF0IHRoZSByaWdodCBsb2NhdGlvbiwgYW5kCj4g
Pj4+IHlvdSBuZWVkIG9mIGNvdXJzZSB0byByZW9yZ2FuaXplIHRoZSBkYXRhIHdoZW4gcmVhZGlu
ZyBhcyB3ZWxsLCBzbyB0aGF0Cj4gPj4+IHRoZSB1c2VyIHNlZXMgWGtpQiBvZiBkYXRhICsgWUIg
b2YgT09CLiBUaGF0J3MgYWxsIHlvdSBuZWVkIHRvIGRvIGluCj4gPj4+IHRoZXNlIGhlbHBlcnMu
Cj4gPj4+ICAgICAKPiA+Pgo+ID4+IEkgdGhpbmsgdGhlcmUgaXMgc29tZSBtaXN1bmRlcnN0YW5k
aW5nIGFib3V0IHRoZXNlICJ1c2VyIGJ5dGVzIiBhYm92ZTogdGhlcmUgYXJlIDQKPiA+PiBieXRl
cyB3aGljaCB0aGlzIE5BTkQgY29udHJvbGxlciBhbHdheXMgd3JpdGVzIHRvIHBhZ2UgaW4gRUND
IG1vZGUgLSBpdCB3YXMgZnJlZSBPT0IKPiA+PiBieXRlcyBjb3ZlcmVkIGJ5IEVDQy4gQ29udHJv
bGxlciBncmFicyB2YWx1ZXMgZnJvbSBETUEgYnVmZmVyIChzZWNvbmQgRE1BIGJ1ZmZlciB3aGlj
aAo+ID4+IGRvZXNuJ3QgY29udGFpbnMgcGFnZSBkYXRhKSBhbmQgd3JpdGVzIGl0IGFsb25nIHdp
dGggZGF0YSBhbmQgRUNDIGNvZGVzLiBJZGVhIG9mIHRoaXMKPiA+PiBjaGFuZ2UgaXMgdG8gYWx3
YXlzIHN1cHByZXNzIHRoaXMgd3JpdGUgYnkgc2V0dGluZyB0aGVtIHRvIDB4RkYgKG1heSBiZSB0
aGVyZSBpcyBzb21lCj4gPj4gY29tbWFuZCBvcHRpb24gdG8gbm90IHdyaXRlIGl0LCBidXQgSSBk
b24ndCBoYXZlIGRvYyksIGJlY2F1c2UgYWxsIG9mIHRoZW0gKDQgYnl0ZXMpCj4gPj4gYmVjb21l
IHVuYXZhaWxhYmxlIHRvIHJlYWRlci93cml0ZXIuICAKPiA+IAo+ID4gQXQgdGhlIE5BTkQgY29u
dHJvbGxlciBsZXZlbCwgSSB3b3VsZCByYXRoZXIgYXZvaWQgZG9pbmcgdGhpbmdzIGxpa2UKPiA+
IHRoYXQuCj4gPiAKPiA+IEkgYmVsaWV2ZSB5b3UgY2FuIGp1c3QgdXBkYXRlIHRoZSBvb2JsYXlv
dXQgc28gdGhhdCBwcm90ZWN0ZWQgT09CIGJ5dGVzCj4gPiBhcmUgbm90IGV4cG9zZWQgdG8gdGhl
IHVzZXIgYXMgZnJlZSBieXRlcy4gVGhlbiB5b3VyIGJ1ZmZlcnMgc2hvdWxkCj4gPiBhbHJlYWR5
IGNvbnRhaW4gMHhmZmZmZmYgYXQgdGhlIHByb2JsZW1hdGljIGxvY2F0aW9uLiAgCj4gCj4gU28g
WW91ciBpZGVhIGlzIHRvIGNvbnRpbnVlIGZpbGwgRE1BIGJ1ZmZlciAoZm9yIHRoZXNlIDQgYnl0
ZXMpIGZyb20gcHJvdmlkZWQgT09CIGJ1ZmZlciwKPiByZWx5aW5nIG9uIHRoYXQgYXMgdGhlc2Ug
Ynl0ZXMgYXJlIHVudXNlZCwgdGhleSB3aWxsIGJlIDB4RkYgaW4gT09CIGJ1ZmZlciBzbyB3ZSBn
ZXQgdGhlIHNhbWUgcmVzdWx0PwoKWWVzLgoKVGhlIHByb2JsZW0geW91IGZhY2UgaXMgZHVlIHRv
IGpmZnMyIHVzaW5nIGZyZWUgT09CIGJ5dGVzIHRvIHN0b3JlIHNvbWUKZGF0YS4gSWYgdGhpcyBk
YXRhIGlzIGluIHRoZSBwcm90ZWN0ZWQgYXJlYSAtPiBCT09NLgoKSWYgYW5vdGhlciBhcHBsaWNh
dGlvbiB3YW50cyB0byB1c2UgYWxsIHRoZSBieXRlcyBhbmQgd3JpdGVzIHRoZW0gYWxsCmluIHRo
ZSBzYW1lIFBST0dSQU0gb3BlcmF0aW9uIGl0J3MgZmluZS4KCkpmZnMyIGFjY2Vzc2VzIHRoZSBm
cmVlIGFyZWEgdGhyb3VnaCB0aGUgT09CIGxheW91dHMgb25seSwgc28ganVzdAp0d2Vha2luZyB0
aGUgT09CIGxheW91dHMgc2hvdWxkIHdvcmsuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
