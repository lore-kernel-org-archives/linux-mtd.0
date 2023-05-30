Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134EFC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KjdvmmIveiIEAB5SwuPsA3qnag8bY0jobZxPUDEScc=; b=TTh0KWLFkvCeh6
	OsrEyonp1LJG0gBEtKUim002o2NHd2ZGjALETUdmOs1mHRLZKoOoM+EXMifE18ipDGPqOPqwsrXr3
	ZkzYPiv5UNDSYaieR5tj+yuxQt+/LcRiIm6n7mgLdcdPSY+Xb5ORmlvSRDSRFECwKwJgy/FubVoJG
	HeSfJCk++pdZOYRaQsqtFyflDzRvTxmJyoKAjE6K90uzA3UHpipuq44mXtZetThVdHOISkEe2KXo7
	7NIGHWyMxojXbgEelCPwfAF0VjrZwVBssFnh0WxOS2bmuhTjwDDvEw8HAB8Kd2h5liTLM1y6gpn3m
	Tjhk1rzNzEXGMFWtxyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zsV-00E80H-08;
	Tue, 30 May 2023 13:59:11 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zsQ-00E7z3-1C;
	Tue, 30 May 2023 13:59:08 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685455140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPKl0w/v3sbTqMK8trZ1QoQzZIkuiRuU+iuDTR4PM7w=;
	b=i+lgq76jw4UBnAvmGTjz1XNJYzfeipH8VUCxaBpcXsPCRpL+2ebVNd7FAOQgDXWKlPn+zh
	DLNnHiORlxkXCoaxSPHDHOnTnEVsyAGF3JETcU3Mf2K/sH8nDlO+EeEPG9W0Sl8IWCL6ac
	+UWW0Qb2XVl0U+Zjq8P8r4Iv0Q4lMOfaOCrJxT9DztW3/dklpIXTVq0IM2XXQsQ3cDJenF
	MTeyYBAEx/EifOTodiKZGxTrxlLCVzPFkZOBR/2BMsLA/YgwMleYKu0uK/TU/mtI7MTgYW
	vw/geCnyfMwFBQDKbi0sG4mPLa0Ryk1kyntZqCY7nN8mD0Dvkj9oQvhYVwRDng==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 509141C0005;
	Tue, 30 May 2023 13:58:59 +0000 (UTC)
Date: Tue, 30 May 2023 15:58:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil
 Armstrong<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 JeromeBrunet <jbrunet@baylibre.com>, Martin
 Blumenstingl<martin.blumenstingl@googlemail.com>, Yixun Lan
 <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] mtd: rawnand: meson: fix command sequence for
 read/write
Message-ID: <20230530155858.6bfbed89@xps-13>
In-Reply-To: <9d3ada22-0176-2113-bff2-27f8a4ad5c23@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
	<20230515094440.3552094-2-AVKrasnov@sberdevices.ru>
	<20230522170526.6486755a@xps-13>
	<9013b0e2-c923-43f8-0bd6-979bf0c23ebc@sberdevices.ru>
	<abeadc03-a69c-be1c-3c6a-6ce492a5e4f6@sberdevices.ru>
	<20230526192205.4a69ca79@xps-13>
	<6077c959-f566-d399-d2be-8460eb063415@sberdevices.ru>
	<20230530150556.498c1fae@xps-13>
	<9d3ada22-0176-2113-bff2-27f8a4ad5c23@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_065906_862503_556E9B31 
X-CRM114-Status: GOOD (  31.64  )
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
eSAyMDIzIDE2OjM1OjU5ICswMzAwOgoKPiBPbiAzMC4wNS4yMDIzIDE2OjA1LCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgQXJzZW5peSwKPiA+IAo+ID4gYXZrcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1IHdyb3RlIG9uIFR1ZSwgMzAgTWF5IDIwMjMgMTQ6MTk6MDggKzAzMDA6Cj4gPiAgIAo+ID4+
IE9uIDI2LjA1LjIwMjMgMjA6MjIsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+Pj4gSGkgQXJz
ZW5peSwKPiA+Pj4KPiA+Pj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwg
MjQgTWF5IDIwMjMgMTI6MDU6NDcgKzAzMDA6Cj4gPj4+ICAgICAKPiA+Pj4+IE9uIDIzLjA1LjIw
MjMgMTI6MTIsIEFyc2VuaXkgS3Jhc25vdiB3cm90ZTogICAgCj4gPj4+Pj4gSGVsbG8gTWlxdWVs
LCBMaWFuZwo+ID4+Pj4+Cj4gPj4+Pj4gT24gMjIuMDUuMjAyMyAxODowNSwgTWlxdWVsIFJheW5h
bCB3cm90ZTogICAgICAKPiA+Pj4+Pj4gSGkgQXJzZW5peSwKPiA+Pj4+Pj4KPiA+Pj4+Pj4gQVZL
cmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgMTUgTWF5IDIwMjMgMTI6NDQ6MzUg
KzAzMDA6Cj4gPj4+Pj4+ICAgICAgCj4gPj4+Pj4+PiBUaGlzIGZpeGVzIHJlYWQvd3JpdGUgZnVu
Y3Rpb25hbGl0eSBieToKPiA+Pj4+Pj4+IDEpIENoYW5naW5nIE5GQ19DTURfUkJfSU5UIGJpdCB2
YWx1ZS4gICAgICAKPiA+Pj4+Pj4KPiA+Pj4+Pj4gSSBndWVzcyB0aGlzIGlzIGEgc2VwYXJhdGUg
Zml4Cj4gPj4+Pj4+ICAgICAgCj4gPj4+Pj4KPiA+Pj4+PiBPaywgSSdsbCBtb3ZlIGl0IHRvIHNl
cGFyYXRlIHBhdGNoCj4gPj4+Pj4gICAgICAgCj4gPj4+Pj4+PiAyKSBBZGRpbmcgZXh0cmEgTkFO
RF9DTURfU1RBVFVTIGNvbW1hbmQgb24gZWFjaCByL3cgcmVxdWVzdC4gICAgICAKPiA+Pj4+Pj4K
PiA+Pj4+Pj4gSXMgdGhpcyByZWFsbHkgbmVlZGVkPyBMb29rcyBsaWtlIHlvdSdyZSBkZWxheWlu
ZyB0aGUgbmV4dCBvcCBvbmx5LiBJcwo+ID4+Pj4+PiB1c2luZyBhIGRlbGF5IGVub3VnaD8gSWYg
eWVzLCB0aGVuIGl0J3MgcHJvYmFibHkgdGhlIHdyb25nIGFwcHJvYWNoLiAgICAgIAo+ID4+Pj4K
PiA+Pj4+IEhpIE1pcXVlbCwgc21hbGwgdXBkYXRlLCBJIGZvdW5kIHNvbWUgZGV0YWlscyBmcm9t
IEBMaWFuZydzIG1lc3NhZ2UgaW4gdjEgdGFsa3MgZnJvbSB0aGUgbGFzdCBtb250aDoKPiA+Pj4+
Cj4gPj4+PiAqCj4gPj4+PiBBZnRlciBzZW5kaW5nIE5BTkRfQ01EX1JFQUQwLCBhZGRyZXNzLCBO
QU5EX0NNRF9SRUFEU1RBUlQgYW5kIHJlYWQgc3RhdHVzKE5BTkRfQ01EX1NUQVRVUyA9IDB4NzAp
IGNvbW1hbmRzLCBpdCBzaG91bGQgc2VuZAo+ID4+Pj4gTkFORF9DTURfUkVBRDAgY29tbWFuZCBm
b3IgZXhpdGluZyB0aGUgcmVhZCBzdGF0dXMgbW9kZSBmcm9tIHRoZSBkYXRhc2hlZXQgZnJvbSBO
QU5EIGRldmljZS4gICAgCj4gPj4+Cj4gPj4+IFRoYXQgaXMgdHJ1ZS4KPiA+Pj4gICAgIAo+ID4+
Pj4gYnV0IHByZXZpb3VzIG1lc29uX25mY19xdWV1ZV9yYigpCj4gPj4+PiBvbmx5IGNoZWNrcyB0
aGUgUmVhZHkvQnVzeSBwaW4gYW5kIGl0IGRvZXNuJ3Qgc2VuZCByZWFkIHN0YXR1cyhOQU5EX0NN
RF9TVEFUVVMgPSAweDcwKSBjb21tYW5kLgo+ID4+Pj4gaSB0aGluayB0aGVyZSBpcyBzb21ldGhp
bmcgd3Jvbmcgd2l0aCB0aGUgUmVhZHkvQnVzeSBwaW4ocGxlYXNlIGNoZWNrIHRoZSBoYXJkd2Fy
ZSB3aGV0aGVyIHRoaXMKPiA+Pj4+IFJlYWR5L0J1c3kgcGluIGlzIGNvbm5lY3RlZCB3aXRoIFNP
Qykgb3IgdGhlIHNvdXJjZSBjb2RlLiBpIGhhdmUgdGhlIGJvYXJkIHdpdGhvdXQgUmVhZHkvQnVz
eSBwaW4gYW5kIHByZWZlciB0byB1c2UgdGhlCj4gPj4+PiBuZmMgY29tbWFuZCBjYWxsZWQgUkJf
SU82LiBpdCBzZW5kcyBOQU5EX0NNRF9TVEFUVVMgY29tbWFuZCBhbmQgY2hlY2tzIGJpdDYgb2Yg
dGhlIHN0YXR1cyByZWdpc3RlciBvZiBOQU5EIGRldmljZSBmcm9tIHRoZQo+ID4+Pj4gZGF0YSBi
dXMgYW5kIGdlbmVyYXRlIElSUSBpZiByZWFkeS4KPiA+Pj4+ICoKPiA+Pj4+Cj4gPj4+PiBJIGd1
ZXNzLCB0aGF0IHNlcXVlbmNlIG9mIGNvbW1hbmRzIGZyb20gdGhpcyBwYXRjaCBpcyBkZXNjcmli
ZWQgaW4gZGF0YXNoZWV0ICh1bmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBpdCBhbmQgcmVsaWVk
IG9uIHRoZSBvbGQgZHJpdmVyKS4KPiA+Pj4+IFllc3RlcmRheSBJIHRyaWVkIHRvIHJlbW92ZSBz
ZW5kaW5nIG9mIE5BTkRfQ01EX1NUQVRVUyBmcm9tIHRoaXMgcGF0Y2gsIGJ1dCBpdCBicm9rZSBj
dXJyZW50IGRyaXZlciAtIGkgaGFkIEVDQyBlcnJvcnMsIHNvIGl0IGxvb2tzIGxpa2UKPiA+Pj4+
ICJzaG90IGluIHRoZSBkYXJrIiBzaXR1YXRpb24sIHRvIHVuZGVyc3RhbmQgdGhpcyBsb2dpYy4g
ICAgCj4gPj4+Cj4gPj4+IFdoZW4gYW4gb3BlcmF0aW9uIG9uIHRoZSBOQU5EIGFycmF5IGhhcHBl
bnMgKGVnLiByZWFkLCBwcm9nLCBlcmFzZSksCj4gPj4+IHlvdSBuZWVkIHRvIHdhaXQgInNvbWUg
dGltZSIgYmVmb3JlIGFjY2Vzc2luZyB0aGUgaW50ZXJuYWwgc3JhbSBvciBldmVuCj4gPj4+IHRo
ZSBjaGlwIHdoaWNoIGlzICJidXN5IiB1bnRpbCBpdCBnZXRzICJyZWFkeSIgYWdhaW4uIFlvdSBj
YW4gcHJvYmUgdGhlCj4gPj4+IHJlYWR5L2J1c3kgcGluICh0aGF0J3MgdGhlIGhhcmR3YXJlIHdh
eSwgZmFzdCBhbmQgcmVsaWFibGUpIG9yIHlvdSBjYW4KPiA+Pj4gcG9sbCBhIHN0YXR1cyB3aXRo
IE5BTkRfQ01EX1NUQVRVUy4gVGhlIGNoaXBzIGFyZSBkZXNpZ25lZCBzbyB0aGV5IGNhbgo+ID4+
PiBhY3R1YWxseSBwcm9jZXNzIHRoYXQgY29tbWFuZCB3aGlsZSB0aGV5IGFyZSBkb2luZyB0aW1l
IGNvbnN1bWluZyB0YXNrcwo+ID4+PiB0byB1cGRhdGUgdGhlIGhvc3QuIEJ1dCBJSVJDIGV2ZXJ5
IGJ5dGUgcmVhZCB3aWxsIHJldHVybiB0aGUgc3RhdHVzCj4gPj4+IHVudGlsIHlvdSBzZW5kIFJF
QUQwIGFnYWluLCB3aGljaCBtZWFucyAiSSdtIGRvbmUgd2l0aCB0aGUgc3RhdHVzCj4gPj4+IHJl
YWQiIHNvbWVob3cuCj4gPj4+Cj4gPj4+IFBsZWFzZSBzZWUgbmFuZF9zb2Z0X3dhaXRyZHkoKSBp
biBvcmRlciB0byB1bmRlcnN0YW5kIGhvdyB0aGlzIGlzCj4gPj4+IHN1cHBvc2VkIHRvIHdvcmsu
IFlvdSBjYW4gZXZlbiB1c2UgdGhhdCBoZWxwZXIgKHdoaWNoIGlzIGV4cG9ydGVkKQo+ID4+PiBp
bnN0ZWFkIG9mIG9wZW4tY29kaW5nIGl0IGluIHlvdXIgZHJpdmVyLiBTZWUgYXRtZWwgb3Igc3Vu
eGkKPiA+Pj4gaW1wbGVtZW50YXRpb25zIGZvciBpbnN0YW5jZS4KPiA+Pj4KPiA+Pj4gQXMgdXNp
bmcgdGhlIG5hdGl2ZSBSQiBwaW4gaXMgYmV0dGVyLCB5b3Ugd291bGQgbmVlZCB0byBpZGVudGlm
eQo+ID4+PiB3aGV0aGVyIHlvdSBoYXZlIG9uZSBvciBub3QgYXQgcHJvYmUgdGltZSBhbmQgdGhl
biBlaXRoZXIgcG9sbCB0aGUKPiA+Pj4gcmVsZXZhbnQgYml0IG9mIHlvdXIgY29udHJvbGxlciBp
ZiB0aGVyZSBpcyBvbmUsIG9yIGZhbGxiYWNrIHRvIHRoZQo+ID4+PiBzb2Z0IHJlYWQgKHdoaWNo
IHNob3VsZCBmYWxsYmFjayBvbiBleGVjX29wIGluIHRoZSBlbmQpLiAgICAKPiA+Pgo+ID4+IFRo
YW5rcyBmb3IgdGhpcyBpbmZvcm1hdGlvbiEgSSdsbCB1c2UgJ25hbmRfc29mdF93YWl0cmR5KCkn
IGF0IGxlYXN0LCBiZWNhdXNlIGkgZ3Vlc3MgdGhhdAo+ID4+IHRoZXJlIGlzIG5vIFJCIHBpbiBv
biBteSBkZXZpY2UuICAKPiA+IAo+ID4gQ3VycmVudGx5IHRoZXJlIGlzIG9ubHkgc3VwcG9ydCBm
b3IgdGhlIHBoeXNpY2FsIHBpbiBJSVJDLiBUaGlzIG1lYW5zCj4gPiB5b3UgY2Fubm90IGp1c3Qg
ZHJvcCBpdC4gWW91IG5lZWQgdG8gc3VwcG9ydCBib3RoLiAgCj4gCj4gWWVzLCBpJ20gbm90IGdv
aW5nIHRvIGRyb3AgUkIgcGluIHN1cHBvcnQsIGJ1dCBhcyBJIGRvbid0IGhhdmUgZGV2aWNlIHRv
IHRlc3QgaXQoaSBndWVzcyksIGknbGwgYWRkCj4gJ25hbmRfc29ydF93YWl0cmR5KCknIGFueXdh
eS4KCkNsZWFyLiBUaGVuIGdvIGZvciBpdCA6KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
