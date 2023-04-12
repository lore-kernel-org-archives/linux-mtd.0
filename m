Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CBBC7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60rz3Mp2VyUf/bWfopbyZHl9ffVoPFJbpTZLo34jaik=; b=Ro52aT90C4nGL5
	1wxukC19cgAKoM9I6LCy+WZ12hxy3AXop3l+lGvc5UxpfSNmPMTRY7nFnZOQbVfU/pbTxxZE91zU2
	Fp7yyk/vh+Nqa6zMA2q112F62IQn+7KYcXsV9dmHrjD2bwKkPNwJwcRror+uu1U6smO8da5mcExiB
	s/hJKNMq9hCRDi/DEDkBcchfctWEJ6p6kkWjzm1nl94TO8IfFwCWnSNYuPrMorRO8ZWDOlWiUysJl
	c+ojwK/YnNYVJI5722mx7WPyd9tV0tGofmt+7CXslwpwtFjR5/Xq82/w6DBsC74wMj73QzfpSNSOw
	0Zsl+Kp8M2krOA3rgXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZQr-0033Z9-1l;
	Wed, 12 Apr 2023 12:18:37 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZQm-0033XZ-1G;
	Wed, 12 Apr 2023 12:18:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C8495100005;
	Wed, 12 Apr 2023 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681301907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ari64ibrXeBZr1oJcL8eONeaaIGC3ERYNDijfDPX6C0=;
	b=H/6tM8Io1DfAGX9v9ttE5SkAZGoMGZAsc3DWINLyZClBbGTac3EizJwsJWf+yGjAB836eY
	7Ki6Gh9ALfuigZ9lkTuby6lFqvQ2hdS9AU459CD1M8I01JfLc462cE6P7T7s/w4VLN7sFh
	0WAMY3oiY5QFX5qSd/bARXk07qI4mprDQyQKYrH33HBEVFPuOPYshbOn1zt5a1d2+E/rD6
	2TaOKYIS3CVBuHso2mL19Agnjt/eftcyRW6U5O3XqE6bGZWBtOWtg9GTAHeoQQ7dk9SwJr
	FR8sIOTLA2NXfBF+fwKn9qgda0LPjdHRoOR4LWHJessuxZ17V38mAvFI121sSg==
Date: Wed, 12 Apr 2023 14:18:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before
 read
Message-ID: <20230412141824.755b2bca@xps-13>
In-Reply-To: <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
	<20230412094400.3c82f631@xps-13>
	<ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
	<20230412113654.183350d0@xps-13>
	<4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_051832_830312_7BC29F77 
X-CRM114-Status: GOOD (  27.14  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFw
ciAyMDIzIDEzOjE0OjUyICswMzAwOgoKPiBPbiAxMi4wNC4yMDIzIDEyOjM2LCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgQXJzZW5peSwKPiA+IAo+ID4gYXZrcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTI6MjA6NTUgKzAzMDA6Cj4gPiAgIAo+ID4+
IE9uIDEyLjA0LjIwMjMgMTA6NDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+Pj4gSGkgQXJz
ZW5peSwKPiA+Pj4KPiA+Pj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwg
MTIgQXByIDIwMjMgMDk6MTY6NTggKzAzMDA6Cj4gPj4+ICAgICAKPiA+Pj4+IFRoaXMgTkFORCBy
ZWFkcyBvbmx5IGZldyB1c2VyJ3MgYnl0ZXMgaW4gRUNDIG1vZGUgKG5vdCBmdWxsIE9PQiksIHNv
ICAgIAo+ID4+Pgo+ID4+PiAiVGhpcyBOQU5EIHJlYWRzIiBkb2VzIG5vdCBsb29rIHJpZ2h0LCBk
byB5b3UgbWVhbiAiU3VicGFnZSByZWFkcyBkbwo+ID4+PiBub3QgcmV0cmlldmUgYWxsIHRoZSBP
T0IgYnl0ZXMsIj8KPiA+Pj4gICAgIAo+ID4+Pj4gZmlsbCBPT0IgYnVmZmVyIHdpdGggemVyb2Vz
IHRvIG5vdCByZXR1cm4gZ2FyYmFnZSBmcm9tIHByZXZpb3VzIHJlYWRzCj4gPj4+PiB0byB1c2Vy
Lgo+ID4+Pj4gT3RoZXJ3aXNlICduYW5kZHVtcCcgdXRpbGl0eSBwcmludHMgc29tZXRoaW5nIGxp
a2UgdGhpcyBmb3IganVzdCBlcmFzZWQKPiA+Pj4+IHBhZ2U6Cj4gPj4+Pgo+ID4+Pj4gLi4uCj4g
Pj4+PiAweDAwMDAwN2YwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZgo+ID4+Pj4gICBPT0IgRGF0YTogZmYgZmYgZmYgZmYgMDAgMDAgZmYgZmYgODAgY2Yg
MjIgOTkgY2IgYWQgZDMgYmUKPiA+Pj4+ICAgT09CIERhdGE6IDYzIDI3IGFlIDA2IDE2IDBhIDJm
IGViIGJiIGRkIDQ2IDc0IDQxIDhlIDg4IDZlCj4gPj4+PiAgIE9PQiBEYXRhOiAzOCBhMSAyZCBl
NiA3NyBkNCAwNSAwNiBmMiBhNSA3ZSAyNSBlYiAzNCA3YyBmZgo+ID4+Pj4gICBPT0IgRGF0YTog
MzggZWEgZGUgMTQgMTAgZGUgOWIgNDAgMzMgMTYgNmEgY2MgOWQgYWEgMmYgNWUKPiA+Pj4+Cj4g
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNl
cy5ydT4KPiA+Pj4+IC0tLQo+ID4+Pj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
YyB8IDUgKysrKysKPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPj4+
Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4+Pj4gaW5kZXggZjg0YTEwMjM4
ZTRkLi5mMmYyNDcyY2I1MTEgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tZXNvbl9uYW5kLmMKPiA+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25h
bmQuYwo+ID4+Pj4gQEAgLTg1OCw5ICs4NTgsMTIgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVh
ZF9wYWdlX3N1YihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLAo+ID4+Pj4gIHN0YXRpYyBpbnQgbWVz
b25fbmZjX3JlYWRfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwKPiA+
Pj4+ICAJCQkJICAgaW50IG9vYl9yZXF1aXJlZCwgaW50IHBhZ2UpCj4gPj4+PiAgewo+ID4+Pj4g
KwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKG5hbmQpOwo+ID4+Pj4gIAl1OCAq
b29iX2J1ZiA9IG5hbmQtPm9vYl9wb2k7Cj4gPj4+PiAgCWludCByZXQ7Cj4gPj4+PiAgCj4gPj4+
PiArCW1lbXNldChvb2JfYnVmLCAwLCBtdGQtPm9vYnNpemUpOyAgICAKPiA+Pj4KPiA+Pj4gSSdt
IHN1cnByaXNlZCByYXcgcmVhZHMgZG8gbm90IHJlYWQgdGhlIGVudGlyZSBPT0I/ICAgIAo+ID4+
Cj4gPj4gWWVzISBTZWVtcyBpbiBjYXNlIG9mIHJhdyBhY2Nlc3MgKHdoYXQgaSBzZWUgaW4gdGhp
cyBkcml2ZXIpIG51bWJlciBvZiBPT0IgYnl0ZXMgcmVhZAo+ID4+IHN0aWxsIGRlcGVuZHMgb24g
RUNDIHBhcmFtZXRlcnM6IGZvciBlYWNoIHBvcnRpb24gb2YgZGF0YSBjb3ZlcmVkIHdpdGggRUND
IGNvZGUgd2UgY2FuCj4gPj4gcmVhZCBpdCdzIEVDQyBjb2RlIGFuZCAidXNlciBieXRlcyIgZnJv
bSBPT0IgLSBpdCBpcyB3aGF0IGkgc2VlIGJ5IGR1bXBpbmcgRE1BIGJ1ZmZlciBieQo+ID4+IHBy
aW50aygpLiBGb3IgZXhhbXBsZSBJJ20gd29ya2luZyB3aXRoIDJLIE5BTkQgcGFnZXMsIGVhY2gg
cGFnZSBoYXMgMiB4IDFLIEVDQyBibG9ja3MuCj4gPj4gRm9yIGVhY2ggRUNDIGJsb2NrIEkgaGF2
ZSAxNiBPT0IgYnl0ZXMgd2hpY2ggSSBjYW4gYWNjZXNzIGJ5IHJlYWQvd3JpdGUuIEVhY2ggMTYg
Ynl0ZXMKPiA+PiBjb250YWlucyAyIGJ5dGVzIG9mIHVzZXIncyBkYXRhIGFuZCAxNCBieXRlcyBF
Q0MgY29kZXMuIFNvIHdoZW4gSSByZWFkIHBhZ2UgaW4gcmF3IG1vZGUKPiA+PiBjb250cm9sbGVy
IHJldHVybnMgMzIgYnl0ZXMgKDIgeCAoMiArIDE0KSkgb2YgT09CLiBXaGlsZSBPT0IgaXMgcmVw
b3J0ZWQgYXMgNjQgYnl0ZXMuICAKPiA+IAo+ID4gSW4gYWxsIG1vZGVzLCB3aGVuIHlvdSByZWFk
IE9PQiwgeW91IHNob3VsZCBnZXQgdGhlIGZ1bGwgT09CLiBUaGUgZmFjdAo+ID4gdGhhdCBFQ0Mg
Y29ycmVjdGlvbiBpcyBlbmFibGVkIG9yIGRpc2FibGVkIGRvZXMgbm90IG1hdHRlci4gSWYgdGhl
IE5BTkQKPiA+IGZlYXR1cmVzIE9PQiBzZWN0aW9ucyBvZiA2NCBieXRlcywgeW91IHNob3VsZCBn
ZXQgdGhlIDY0IGJ5dGVzLgo+ID4gCj4gPiBXaGF0IGhhcHBlbnMgc29tZXRpbWVzLCBpcyB0aGF0
IHNvbWUgb2YgdGhlIGJ5dGVzIGFyZSBub3QgcHJvdGVjdGVkCj4gPiBhZ2FpbnN0IGJpdGZsaXBz
LCBidXQgdGhlIHBvbGljeSBpcyB0byByZXR1cm4gdGhlIGZ1bGwgYnVmZmVyLiAgCj4gCj4gT2ss
IHNvIHRvIGNsYXJpZnkgY2FzZSBmb3IgdGhpcyBOQU5EIGNvbnRyb2xsZXI6Cj4gMSkgSW4gYm90
aCBFQ0MgYW5kIHJhdyBtb2RlcyBpIG5lZWQgdG8gcmV0dXJuIHRoZSBzYW1lIHJhdyBPT0IgZGF0
YSAoZS5nLiB1c2VyIGJ5dGVzCj4gICAgKyBFQ0MgY29kZXMpPwoKV2VsbCwgeW91IG5lZWQgdG8g
Y292ZXIgdGhlIHNhbWUgYW1vdW50IG9mIGRhdGEsIHllcy4gQnV0IGluIHRoZSBFQ0MKY2FzZSB0
aGUgZGF0YSB3b24ndCBiZSByYXcgKGF0IGxlYXN0IG5vdCBhbGwgb2YgaXQpLgoKPiAyKSBJZiBJ
IGhhdmUgYWNjZXNzIHRvIG9ubHkgMzIgYnl0ZXMgb2YgT09CIChpbiBjYXNlIGFib3ZlKSwgSSBt
dXN0IHJlcG9ydCB0aGF0IHNpemUKPiAgICBvZiBPT0IgaXMgb25seSAzMiBieXRlcyBkdXJpbmcg
aW5pdGlhbGl6YXRpb24/CgpJIGJlbGlldmUgaXQncyBqdXN0IGFuIGltcGxlbWVudGF0aW9uIGVy
cm9yIGluIHRoZSBjb250cm9sbGVyIGRyaXZlci4KVGhpcyBjb250cm9sbGVyIGNhbiBiZSB1c2Vk
IG9uIE5BTkQgY2hpcHMgd2l0aCBvdGhlciBnZW9tZXRyaWVzLCBwbGVhc2UKZG9uJ3QgcGxheSB3
aXRoIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
