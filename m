Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283CEC7EE23
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 07:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftWDpRl3MRMYsaaMPkpz1wfYjsgwXGiJqiESIaDnHic=; b=NaQ0FFpUJMhN31
	93Hux71Xc4JnZ1tN83TZBBUOwiboLdrLUdma2JL9P71Ru28ZSZaxzJjZ5R3109YiYO6/yzSSdbkTm
	RK2cy9UqTmdJgs4OlJKwwSzJj/gpsU/51Alnc+C8HyDgoAd6HKcYXExuuN3bFVyUhhVS5Q4edxr7R
	2yTxzMKo0PYHFkCuK0Yjvu8PGqPwPifATSnxYi+cCsohVVWZaq6Tn7SozssXjVPKk/QxXqkv1DUHV
	iQ7fVx6cVssLju735/TQqIQBXkHkm7NLCjMNL6bzAaJmWTkMJpnqyW4JptE3VdpEsWXvnXV82AEJl
	I4sujeqQFUT1Xy88pZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q64KL-00EV4J-2y;
	Mon, 05 Jun 2023 07:08:29 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q64KH-00EV1Z-1P;
	Mon, 05 Jun 2023 07:08:27 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685948897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxKZJB11fucc8eEXUnpEucsBbBt1WAs5b1tL7WQ4njU=;
	b=bZJIQ6GqDyE+/lFoGLwhdH4n0Xj5mzbU9R3SnXiISv/R9oaQnBC0b+0I+TdKMaRpe/TjwO
	3bAUBUS6mZWhejmBm+aOUJv6FUCB4M9tUNB1RgkxPcktaLdth0Euf9YcJ7HAiQ7QDmFWzD
	GCyNr+HegKX0U6aGKo8rkJS5L47phwGgOLsNkUh8PvE4xnQEyt54p1Rxyo/EJrxVE37d6r
	UYzoh0jRmMMzcHeQRH9JyLbrjedeCGiYC22fAhdbhtvdiqaJgxNth/8Q23SB04RX6seEWc
	fMBvxF7eSJHrYR4P9lUicc1VDzXUXU3ua8+TTfG3racxHrq31Zkdc1qhqaS4zQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5621A1BF203;
	Mon,  5 Jun 2023 07:08:16 +0000 (UTC)
Date: Mon, 5 Jun 2023 09:08:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v5 1/6] mtd: rawnand: meson: fix ready/busy command
Message-ID: <20230605090815.48bc2074@xps-13>
In-Reply-To: <1ede0f53-8513-e346-b5a8-fc8a804cfa8d@sberdevices.ru>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
	<20230601061850.3907800-2-AVKrasnov@sberdevices.ru>
	<20230601095142.3a611b5a@xps-13>
	<1ede0f53-8513-e346-b5a8-fc8a804cfa8d@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_000825_801724_DF57BAA4 
X-CRM114-Status: GOOD (  16.18  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBGcmksIDIgSnVu
IDIwMjMgMDE6NDQ6MDEgKzAzMDA6Cgo+IEhlbGxvIE1pcXVlbCEKPiAKPiBNYXkgYmUgSSBjYW4g
ZXhjbHVkZSB0aGlzIHBhdGNoIGZyb20gdGhpcyBwYXRjaHNldCBhbmQgc2VuZCBpdCBhcyBhIHNp
bmdsZSBwYXRjaAo+IGFzIGl0IGlzIGZpeCBhbmQgbm90IHJlbGF0ZWQgd2l0aCBvdGhlciBwYXRj
aGVzPwoKWWVzIGFic29sdXRlbHkuCgo+IAo+IFRoYW5rcywgQXJzZW5peQo+IAo+IE9uIDAxLjA2
LjIwMjMgMTA6NTEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4g
PiBBVktyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gVGh1LCAxIEp1biAyMDIzIDA5OjE4
OjQ0ICswMzAwOgo+ID4gICAKPiA+PiBUaGlzIGZpeGVzIHJlYWR5L2J1c3kgY29tbWFuZCB2YWx1
ZS4gIAo+ID4gCj4gPiBuaXQ6ICJGaXggdGhlIHJlYWR5L2J1c3kgY29tbWFuZCB2YWx1ZS4iICAK
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJk
ZXZpY2VzLnJ1Pgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5k
LmMgfCAyICstCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25h
bmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4+IGluZGV4IDA3NGUx
NDIyNWMwNi4uOWRkNGE2NzY0OTdiIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L21lc29uX25hbmQuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25h
bmQuYwo+ID4+IEBAIC0zNyw3ICszNyw3IEBACj4gPj4gICNkZWZpbmUgTkZDX0NNRF9TQ1JBTUJM
RVJfRU5BQkxFCUJJVCgxOSkKPiA+PiAgI2RlZmluZSBORkNfQ01EX1NDUkFNQkxFUl9ESVNBQkxF
CTAKPiA+PiAgI2RlZmluZSBORkNfQ01EX1NIT1JUTU9ERV9ESVNBQkxFCTAKPiA+PiAtI2RlZmlu
ZSBORkNfQ01EX1JCX0lOVAkJQklUKDE0KQo+ID4+ICsjZGVmaW5lIE5GQ19DTURfUkJfSU5UCQko
KDB4YiA8PCAxMCkgfCBCSVQoMTgpIHwgQklUKDE2KSkKPiA+PiAgCj4gPj4gICNkZWZpbmUgTkZD
X0NNRF9HRVRfU0laRSh4KQkoKCh4KSA+PiAyMikgJiBHRU5NQVNLKDQsIDApKQo+ID4+ICAgIAo+
ID4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
