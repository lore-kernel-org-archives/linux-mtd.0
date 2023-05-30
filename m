Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608B6C77B73
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0P79srheSgdYdiHimxFzRek40zgbB8hj0JjLL1aX8xw=; b=aN/KEbppn5Jo0F
	DzXneAC07w2IQQiYi+bjHglq0RGdn5FVWM0Y05r8f0rb4Q+nlPtAWz4ZwA0jl1+Ra672p4443as6J
	z+ik61KWz+0RmRRPV4AmjCTurY9FHNE2HstVey3V7jEK7jcSFVtKDpFr7gBUBjoKYu9r0B8ZCnKkz
	Ql7RTvO9wUpsoDy4HfQaN7JtG3vU50GHkirZwhVJvpc0y/kKxkACRrtVkv3+0Xe9O3zRHrPXutUbk
	UyotSPXwoy9c37D9kPz9n/ow4WZaiaNwtc13MtC0NtgKUjeweV1ZtN+Tov0U5HcU3vJDxEGiQNrpf
	eeSvpM4wUe+IEOdGKx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3z3A-00Dz3m-0L;
	Tue, 30 May 2023 13:06:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3z35-00Dz1z-0e;
	Tue, 30 May 2023 13:06:05 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685451958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJLi8QpRBcTrZOqyw2sMWb8HJv4CpI2HNWB1bo22p9A=;
	b=Utnumz2g04AOauVu5cA4bSY8c9GZXM53nBt2MaMdy6F1tbopcwDaYwF7wMiR7NLaVqhv8l
	DgFD0pfPQ8wuCh1c1H+iB5aN7KN/8Iyne++AGOAc/il3bVaglHdSB1BB387jfNYz6fGIRJ
	d7e3zj5Gl73fHktMqHNoxrypXA6aWZMUU+HmASGK8FhkyoujcF18SrrDiBRtgiyuFQ0HS3
	KLGFb5OlwEveX9BV17MZDSYH9zGDTzlg6PytmWMLzKMDAe9YQi3U/LLbzV7QZm7xWTTKcv
	kaZfI6maAgkzxkyPnwC6LC7mYmh6MFv8yI0nfiX0mChAAe4imARRciOnziEAmg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE03C1C000C;
	Tue, 30 May 2023 13:05:56 +0000 (UTC)
Date: Tue, 30 May 2023 15:05:56 +0200
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
Subject: Re: [PATCH v4 1/5] mtd: rawnand: meson: fix command sequence for
 read/write
Message-ID: <20230530150556.498c1fae@xps-13>
In-Reply-To: <6077c959-f566-d399-d2be-8460eb063415@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
	<20230515094440.3552094-2-AVKrasnov@sberdevices.ru>
	<20230522170526.6486755a@xps-13>
	<9013b0e2-c923-43f8-0bd6-979bf0c23ebc@sberdevices.ru>
	<abeadc03-a69c-be1c-3c6a-6ce492a5e4f6@sberdevices.ru>
	<20230526192205.4a69ca79@xps-13>
	<6077c959-f566-d399-d2be-8460eb063415@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_060603_504363_9E51A5E2 
X-CRM114-Status: GOOD (  36.19  )
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
eSAyMDIzIDE0OjE5OjA4ICswMzAwOgoKPiBPbiAyNi4wNS4yMDIzIDIwOjIyLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgQXJzZW5peSwKPiA+IAo+ID4gYXZrcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1IHdyb3RlIG9uIFdlZCwgMjQgTWF5IDIwMjMgMTI6MDU6NDcgKzAzMDA6Cj4gPiAgIAo+ID4+
IE9uIDIzLjA1LjIwMjMgMTI6MTIsIEFyc2VuaXkgS3Jhc25vdiB3cm90ZTogIAo+ID4+PiBIZWxs
byBNaXF1ZWwsIExpYW5nCj4gPj4+Cj4gPj4+IE9uIDIyLjA1LjIwMjMgMTg6MDUsIE1pcXVlbCBS
YXluYWwgd3JvdGU6ICAgIAo+ID4+Pj4gSGkgQXJzZW5peSwKPiA+Pj4+Cj4gPj4+PiBBVktyYXNu
b3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gTW9uLCAxNSBNYXkgMjAyMyAxMjo0NDozNSArMDMw
MDoKPiA+Pj4+ICAgIAo+ID4+Pj4+IFRoaXMgZml4ZXMgcmVhZC93cml0ZSBmdW5jdGlvbmFsaXR5
IGJ5Ogo+ID4+Pj4+IDEpIENoYW5naW5nIE5GQ19DTURfUkJfSU5UIGJpdCB2YWx1ZS4gICAgCj4g
Pj4+Pgo+ID4+Pj4gSSBndWVzcyB0aGlzIGlzIGEgc2VwYXJhdGUgZml4Cj4gPj4+PiAgICAKPiA+
Pj4KPiA+Pj4gT2ssIEknbGwgbW92ZSBpdCB0byBzZXBhcmF0ZSBwYXRjaAo+ID4+PiAgICAgCj4g
Pj4+Pj4gMikgQWRkaW5nIGV4dHJhIE5BTkRfQ01EX1NUQVRVUyBjb21tYW5kIG9uIGVhY2ggci93
IHJlcXVlc3QuICAgIAo+ID4+Pj4KPiA+Pj4+IElzIHRoaXMgcmVhbGx5IG5lZWRlZD8gTG9va3Mg
bGlrZSB5b3UncmUgZGVsYXlpbmcgdGhlIG5leHQgb3Agb25seS4gSXMKPiA+Pj4+IHVzaW5nIGEg
ZGVsYXkgZW5vdWdoPyBJZiB5ZXMsIHRoZW4gaXQncyBwcm9iYWJseSB0aGUgd3JvbmcgYXBwcm9h
Y2guICAgIAo+ID4+Cj4gPj4gSGkgTWlxdWVsLCBzbWFsbCB1cGRhdGUsIEkgZm91bmQgc29tZSBk
ZXRhaWxzIGZyb20gQExpYW5nJ3MgbWVzc2FnZSBpbiB2MSB0YWxrcyBmcm9tIHRoZSBsYXN0IG1v
bnRoOgo+ID4+Cj4gPj4gKgo+ID4+IEFmdGVyIHNlbmRpbmcgTkFORF9DTURfUkVBRDAsIGFkZHJl
c3MsIE5BTkRfQ01EX1JFQURTVEFSVCBhbmQgcmVhZCBzdGF0dXMoTkFORF9DTURfU1RBVFVTID0g
MHg3MCkgY29tbWFuZHMsIGl0IHNob3VsZCBzZW5kCj4gPj4gTkFORF9DTURfUkVBRDAgY29tbWFu
ZCBmb3IgZXhpdGluZyB0aGUgcmVhZCBzdGF0dXMgbW9kZSBmcm9tIHRoZSBkYXRhc2hlZXQgZnJv
bSBOQU5EIGRldmljZS4gIAo+ID4gCj4gPiBUaGF0IGlzIHRydWUuCj4gPiAgIAo+ID4+IGJ1dCBw
cmV2aW91cyBtZXNvbl9uZmNfcXVldWVfcmIoKQo+ID4+IG9ubHkgY2hlY2tzIHRoZSBSZWFkeS9C
dXN5IHBpbiBhbmQgaXQgZG9lc24ndCBzZW5kIHJlYWQgc3RhdHVzKE5BTkRfQ01EX1NUQVRVUyA9
IDB4NzApIGNvbW1hbmQuCj4gPj4gaSB0aGluayB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0
aCB0aGUgUmVhZHkvQnVzeSBwaW4ocGxlYXNlIGNoZWNrIHRoZSBoYXJkd2FyZSB3aGV0aGVyIHRo
aXMKPiA+PiBSZWFkeS9CdXN5IHBpbiBpcyBjb25uZWN0ZWQgd2l0aCBTT0MpIG9yIHRoZSBzb3Vy
Y2UgY29kZS4gaSBoYXZlIHRoZSBib2FyZCB3aXRob3V0IFJlYWR5L0J1c3kgcGluIGFuZCBwcmVm
ZXIgdG8gdXNlIHRoZQo+ID4+IG5mYyBjb21tYW5kIGNhbGxlZCBSQl9JTzYuIGl0IHNlbmRzIE5B
TkRfQ01EX1NUQVRVUyBjb21tYW5kIGFuZCBjaGVja3MgYml0NiBvZiB0aGUgc3RhdHVzIHJlZ2lz
dGVyIG9mIE5BTkQgZGV2aWNlIGZyb20gdGhlCj4gPj4gZGF0YSBidXMgYW5kIGdlbmVyYXRlIElS
USBpZiByZWFkeS4KPiA+PiAqCj4gPj4KPiA+PiBJIGd1ZXNzLCB0aGF0IHNlcXVlbmNlIG9mIGNv
bW1hbmRzIGZyb20gdGhpcyBwYXRjaCBpcyBkZXNjcmliZWQgaW4gZGF0YXNoZWV0ICh1bmZvcnR1
bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBpdCBhbmQgcmVsaWVkIG9uIHRoZSBvbGQgZHJpdmVyKS4KPiA+
PiBZZXN0ZXJkYXkgSSB0cmllZCB0byByZW1vdmUgc2VuZGluZyBvZiBOQU5EX0NNRF9TVEFUVVMg
ZnJvbSB0aGlzIHBhdGNoLCBidXQgaXQgYnJva2UgY3VycmVudCBkcml2ZXIgLSBpIGhhZCBFQ0Mg
ZXJyb3JzLCBzbyBpdCBsb29rcyBsaWtlCj4gPj4gInNob3QgaW4gdGhlIGRhcmsiIHNpdHVhdGlv
biwgdG8gdW5kZXJzdGFuZCB0aGlzIGxvZ2ljLiAgCj4gPiAKPiA+IFdoZW4gYW4gb3BlcmF0aW9u
IG9uIHRoZSBOQU5EIGFycmF5IGhhcHBlbnMgKGVnLiByZWFkLCBwcm9nLCBlcmFzZSksCj4gPiB5
b3UgbmVlZCB0byB3YWl0ICJzb21lIHRpbWUiIGJlZm9yZSBhY2Nlc3NpbmcgdGhlIGludGVybmFs
IHNyYW0gb3IgZXZlbgo+ID4gdGhlIGNoaXAgd2hpY2ggaXMgImJ1c3kiIHVudGlsIGl0IGdldHMg
InJlYWR5IiBhZ2Fpbi4gWW91IGNhbiBwcm9iZSB0aGUKPiA+IHJlYWR5L2J1c3kgcGluICh0aGF0
J3MgdGhlIGhhcmR3YXJlIHdheSwgZmFzdCBhbmQgcmVsaWFibGUpIG9yIHlvdSBjYW4KPiA+IHBv
bGwgYSBzdGF0dXMgd2l0aCBOQU5EX0NNRF9TVEFUVVMuIFRoZSBjaGlwcyBhcmUgZGVzaWduZWQg
c28gdGhleSBjYW4KPiA+IGFjdHVhbGx5IHByb2Nlc3MgdGhhdCBjb21tYW5kIHdoaWxlIHRoZXkg
YXJlIGRvaW5nIHRpbWUgY29uc3VtaW5nIHRhc2tzCj4gPiB0byB1cGRhdGUgdGhlIGhvc3QuIEJ1
dCBJSVJDIGV2ZXJ5IGJ5dGUgcmVhZCB3aWxsIHJldHVybiB0aGUgc3RhdHVzCj4gPiB1bnRpbCB5
b3Ugc2VuZCBSRUFEMCBhZ2Fpbiwgd2hpY2ggbWVhbnMgIkknbSBkb25lIHdpdGggdGhlIHN0YXR1
cwo+ID4gcmVhZCIgc29tZWhvdy4KPiA+IAo+ID4gUGxlYXNlIHNlZSBuYW5kX3NvZnRfd2FpdHJk
eSgpIGluIG9yZGVyIHRvIHVuZGVyc3RhbmQgaG93IHRoaXMgaXMKPiA+IHN1cHBvc2VkIHRvIHdv
cmsuIFlvdSBjYW4gZXZlbiB1c2UgdGhhdCBoZWxwZXIgKHdoaWNoIGlzIGV4cG9ydGVkKQo+ID4g
aW5zdGVhZCBvZiBvcGVuLWNvZGluZyBpdCBpbiB5b3VyIGRyaXZlci4gU2VlIGF0bWVsIG9yIHN1
bnhpCj4gPiBpbXBsZW1lbnRhdGlvbnMgZm9yIGluc3RhbmNlLgo+ID4gCj4gPiBBcyB1c2luZyB0
aGUgbmF0aXZlIFJCIHBpbiBpcyBiZXR0ZXIsIHlvdSB3b3VsZCBuZWVkIHRvIGlkZW50aWZ5Cj4g
PiB3aGV0aGVyIHlvdSBoYXZlIG9uZSBvciBub3QgYXQgcHJvYmUgdGltZSBhbmQgdGhlbiBlaXRo
ZXIgcG9sbCB0aGUKPiA+IHJlbGV2YW50IGJpdCBvZiB5b3VyIGNvbnRyb2xsZXIgaWYgdGhlcmUg
aXMgb25lLCBvciBmYWxsYmFjayB0byB0aGUKPiA+IHNvZnQgcmVhZCAod2hpY2ggc2hvdWxkIGZh
bGxiYWNrIG9uIGV4ZWNfb3AgaW4gdGhlIGVuZCkuICAKPiAKPiBUaGFua3MgZm9yIHRoaXMgaW5m
b3JtYXRpb24hIEknbGwgdXNlICduYW5kX3NvZnRfd2FpdHJkeSgpJyBhdCBsZWFzdCwgYmVjYXVz
ZSBpIGd1ZXNzIHRoYXQKPiB0aGVyZSBpcyBubyBSQiBwaW4gb24gbXkgZGV2aWNlLgoKQ3VycmVu
dGx5IHRoZXJlIGlzIG9ubHkgc3VwcG9ydCBmb3IgdGhlIHBoeXNpY2FsIHBpbiBJSVJDLiBUaGlz
IG1lYW5zCnlvdSBjYW5ub3QganVzdCBkcm9wIGl0LiBZb3UgbmVlZCB0byBzdXBwb3J0IGJvdGgu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
