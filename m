Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147E4C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D817a9AQ5ggvTMwGXGwQTHRAe+EEHOTnepAkp7NmuVo=; b=Mu0pEiZbo0REh/
	NO/kgmB2k8zbcfObUg3aOYRt5OHZlCwIUFVPQQ9YAZyqvbVB3i4j4+yepbhBxSN8weA4h9bLmyGbV
	PSRwFanmPelwuuoUy04sEgpB321w2j11I46b+sG6DYWGXu9n7NwHkXjjIaF8D6At85FZx++t3qLpK
	1gx8LCqazO8rF9MJNMPzPLtmErC3xXXvMJ1lzzPuvTQiB5KdwGgeBcXgU1g9acoizplLRpOSuvby5
	EuoTgTpVZ24yHo2zqqLgcWHgQwJKzzgCBrIrxua2iuBCgudUP4o4TDU1vn9epjBiVna1L9O9UZ6n1
	A1CGHGDtxsLOqAZCZGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pma2R-003EdS-25;
	Wed, 12 Apr 2023 12:57:27 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pma2M-003Ebm-0T;
	Wed, 12 Apr 2023 12:57:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1BB20100012;
	Wed, 12 Apr 2023 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681304237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OeBGkyxviQ45xtIDss2eS2Kn0s5eylHaRXiAWIfUL8=;
	b=LPNpkMyOIdzbu40qsrGXMQRoMuPs3jK4MPjKM92k4BSt0OjZd0zs4W7S6nD/aEiCQzH8oA
	lD4LH/NrXixYJbYm+UdF2AzM55S7EMBD7bagbTRgvH2Sk4yR3Aox+H2ifeQez9TxulI8/0
	rsIkaHSemafO6lsxbq2OHcLleZgCEoxAArFUllu8VrC5DeJJ0Ze+R4AynFqp+CpgXJgE0U
	DHv/aTXOmP4pDgncoSwrEQDIRqpAg96rzGuDFcczdfp1EXKYUuHvJELkiDD9+dspXetoaP
	dogNUwz6kUOfsyKorNp4ofcI2Xg4jb94Dl8BPRy+84qyhpxOVMf/PdL9vXwfZQ==
Date: Wed, 12 Apr 2023 14:57:15 +0200
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
Message-ID: <20230412145715.58c2be4a@xps-13>
In-Reply-To: <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
	<20230412094400.3c82f631@xps-13>
	<ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
	<20230412113654.183350d0@xps-13>
	<4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
	<20230412141824.755b2bca@xps-13>
	<eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_055722_660496_DA2241C0 
X-CRM114-Status: GOOD (  29.39  )
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
ciAyMDIzIDE1OjIyOjI2ICswMzAwOgoKPiBPbiAxMi4wNC4yMDIzIDE1OjE4LCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgQXJzZW5peSwKPiA+IAo+ID4gYXZrcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTM6MTQ6NTIgKzAzMDA6Cj4gPiAgIAo+ID4+
IE9uIDEyLjA0LjIwMjMgMTI6MzYsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+Pj4gSGkgQXJz
ZW5peSwKPiA+Pj4KPiA+Pj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwg
MTIgQXByIDIwMjMgMTI6MjA6NTUgKzAzMDA6Cj4gPj4+ICAgICAKPiA+Pj4+IE9uIDEyLjA0LjIw
MjMgMTA6NDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAgIAo+ID4+Pj4+IEhpIEFyc2VuaXksCj4g
Pj4+Pj4KPiA+Pj4+PiBBVktyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2VkLCAxMiBB
cHIgMjAyMyAwOToxNjo1OCArMDMwMDoKPiA+Pj4+PiAgICAgICAKPiA+Pj4+Pj4gVGhpcyBOQU5E
IHJlYWRzIG9ubHkgZmV3IHVzZXIncyBieXRlcyBpbiBFQ0MgbW9kZSAobm90IGZ1bGwgT09CKSwg
c28gICAgICAKPiA+Pj4+Pgo+ID4+Pj4+ICJUaGlzIE5BTkQgcmVhZHMiIGRvZXMgbm90IGxvb2sg
cmlnaHQsIGRvIHlvdSBtZWFuICJTdWJwYWdlIHJlYWRzIGRvCj4gPj4+Pj4gbm90IHJldHJpZXZl
IGFsbCB0aGUgT09CIGJ5dGVzLCI/Cj4gPj4+Pj4gICAgICAgCj4gPj4+Pj4+IGZpbGwgT09CIGJ1
ZmZlciB3aXRoIHplcm9lcyB0byBub3QgcmV0dXJuIGdhcmJhZ2UgZnJvbSBwcmV2aW91cyByZWFk
cwo+ID4+Pj4+PiB0byB1c2VyLgo+ID4+Pj4+PiBPdGhlcndpc2UgJ25hbmRkdW1wJyB1dGlsaXR5
IHByaW50cyBzb21ldGhpbmcgbGlrZSB0aGlzIGZvciBqdXN0IGVyYXNlZAo+ID4+Pj4+PiBwYWdl
Ogo+ID4+Pj4+Pgo+ID4+Pj4+PiAuLi4KPiA+Pj4+Pj4gMHgwMDAwMDdmMDogZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKPiA+Pj4+Pj4gICBPT0IgRGF0YTog
ZmYgZmYgZmYgZmYgMDAgMDAgZmYgZmYgODAgY2YgMjIgOTkgY2IgYWQgZDMgYmUKPiA+Pj4+Pj4g
ICBPT0IgRGF0YTogNjMgMjcgYWUgMDYgMTYgMGEgMmYgZWIgYmIgZGQgNDYgNzQgNDEgOGUgODgg
NmUKPiA+Pj4+Pj4gICBPT0IgRGF0YTogMzggYTEgMmQgZTYgNzcgZDQgMDUgMDYgZjIgYTUgN2Ug
MjUgZWIgMzQgN2MgZmYKPiA+Pj4+Pj4gICBPT0IgRGF0YTogMzggZWEgZGUgMTQgMTAgZGUgOWIg
NDAgMzMgMTYgNmEgY2MgOWQgYWEgMmYgNWUKPiA+Pj4+Pj4KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+Cj4gPj4+Pj4+IC0t
LQo+ID4+Pj4+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgNSArKysrKwo+
ID4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4+Pj4+Pgo+ID4+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPj4+Pj4+IGluZGV4IGY4NGExMDIzOGU0ZC4u
ZjJmMjQ3MmNiNTExIDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9t
ZXNvbl9uYW5kLmMKPiA+Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFu
ZC5jCj4gPj4+Pj4+IEBAIC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3Jl
YWRfcGFnZV9zdWIoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiA+Pj4+Pj4gIHN0YXRpYyBpbnQg
bWVzb25fbmZjX3JlYWRfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwK
PiA+Pj4+Pj4gIAkJCQkgICBpbnQgb29iX3JlcXVpcmVkLCBpbnQgcGFnZSkKPiA+Pj4+Pj4gIHsK
PiA+Pj4+Pj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKG5hbmQpOwo+ID4+
Pj4+PiAgCXU4ICpvb2JfYnVmID0gbmFuZC0+b29iX3BvaTsKPiA+Pj4+Pj4gIAlpbnQgcmV0Owo+
ID4+Pj4+PiAgCj4gPj4+Pj4+ICsJbWVtc2V0KG9vYl9idWYsIDAsIG10ZC0+b29ic2l6ZSk7ICAg
ICAgCj4gPj4+Pj4KPiA+Pj4+PiBJJ20gc3VycHJpc2VkIHJhdyByZWFkcyBkbyBub3QgcmVhZCB0
aGUgZW50aXJlIE9PQj8gICAgICAKPiA+Pj4+Cj4gPj4+PiBZZXMhIFNlZW1zIGluIGNhc2Ugb2Yg
cmF3IGFjY2VzcyAod2hhdCBpIHNlZSBpbiB0aGlzIGRyaXZlcikgbnVtYmVyIG9mIE9PQiBieXRl
cyByZWFkCj4gPj4+PiBzdGlsbCBkZXBlbmRzIG9uIEVDQyBwYXJhbWV0ZXJzOiBmb3IgZWFjaCBw
b3J0aW9uIG9mIGRhdGEgY292ZXJlZCB3aXRoIEVDQyBjb2RlIHdlIGNhbgo+ID4+Pj4gcmVhZCBp
dCdzIEVDQyBjb2RlIGFuZCAidXNlciBieXRlcyIgZnJvbSBPT0IgLSBpdCBpcyB3aGF0IGkgc2Vl
IGJ5IGR1bXBpbmcgRE1BIGJ1ZmZlciBieQo+ID4+Pj4gcHJpbnRrKCkuIEZvciBleGFtcGxlIEkn
bSB3b3JraW5nIHdpdGggMksgTkFORCBwYWdlcywgZWFjaCBwYWdlIGhhcyAyIHggMUsgRUNDIGJs
b2Nrcy4KPiA+Pj4+IEZvciBlYWNoIEVDQyBibG9jayBJIGhhdmUgMTYgT09CIGJ5dGVzIHdoaWNo
IEkgY2FuIGFjY2VzcyBieSByZWFkL3dyaXRlLiBFYWNoIDE2IGJ5dGVzCj4gPj4+PiBjb250YWlu
cyAyIGJ5dGVzIG9mIHVzZXIncyBkYXRhIGFuZCAxNCBieXRlcyBFQ0MgY29kZXMuIFNvIHdoZW4g
SSByZWFkIHBhZ2UgaW4gcmF3IG1vZGUKPiA+Pj4+IGNvbnRyb2xsZXIgcmV0dXJucyAzMiBieXRl
cyAoMiB4ICgyICsgMTQpKSBvZiBPT0IuIFdoaWxlIE9PQiBpcyByZXBvcnRlZCBhcyA2NCBieXRl
cy4gICAgCj4gPj4+Cj4gPj4+IEluIGFsbCBtb2Rlcywgd2hlbiB5b3UgcmVhZCBPT0IsIHlvdSBz
aG91bGQgZ2V0IHRoZSBmdWxsIE9PQi4gVGhlIGZhY3QKPiA+Pj4gdGhhdCBFQ0MgY29ycmVjdGlv
biBpcyBlbmFibGVkIG9yIGRpc2FibGVkIGRvZXMgbm90IG1hdHRlci4gSWYgdGhlIE5BTkQKPiA+
Pj4gZmVhdHVyZXMgT09CIHNlY3Rpb25zIG9mIDY0IGJ5dGVzLCB5b3Ugc2hvdWxkIGdldCB0aGUg
NjQgYnl0ZXMuCj4gPj4+Cj4gPj4+IFdoYXQgaGFwcGVucyBzb21ldGltZXMsIGlzIHRoYXQgc29t
ZSBvZiB0aGUgYnl0ZXMgYXJlIG5vdCBwcm90ZWN0ZWQKPiA+Pj4gYWdhaW5zdCBiaXRmbGlwcywg
YnV0IHRoZSBwb2xpY3kgaXMgdG8gcmV0dXJuIHRoZSBmdWxsIGJ1ZmZlci4gICAgCj4gPj4KPiA+
PiBPaywgc28gdG8gY2xhcmlmeSBjYXNlIGZvciB0aGlzIE5BTkQgY29udHJvbGxlcjoKPiA+PiAx
KSBJbiBib3RoIEVDQyBhbmQgcmF3IG1vZGVzIGkgbmVlZCB0byByZXR1cm4gdGhlIHNhbWUgcmF3
IE9PQiBkYXRhIChlLmcuIHVzZXIgYnl0ZXMKPiA+PiAgICArIEVDQyBjb2Rlcyk/ICAKPiA+IAo+
ID4gV2VsbCwgeW91IG5lZWQgdG8gY292ZXIgdGhlIHNhbWUgYW1vdW50IG9mIGRhdGEsIHllcy4g
QnV0IGluIHRoZSBFQ0MKPiA+IGNhc2UgdGhlIGRhdGEgd29uJ3QgYmUgcmF3IChhdCBsZWFzdCBu
b3QgYWxsIG9mIGl0KS4gIAo+IAo+IFNvICJzYW1lIGFtb3VudCBvZiBkYXRhIiwgaW4gRUNDIG1v
ZGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiByZXR1cm5zIG9ubHkgdXNlciBPT0IgYnl0ZXMgKGUu
Zy4KPiBPT0IgZGF0YSBleGNsdWRpbmcgRUNDIGNvZGVzKSwgaW4gcmF3IGl0IHJldHVybnMgdXNl
ciBieXRlcyArIEVDQyBjb2Rlcy4gSUlVQyBjb3JyZWN0Cj4gYmVoYXZpb3VyIGlzIHRvIGFsd2F5
cyByZXR1cm4gdXNlciBieXRlcyArIEVDQyBjb2RlcyBhcyBPT0IgZGF0YSBldmVuIGluIEVDQyBt
b2RlID8KCklmIHRoZSBwYWdlIGFyZSAyays2NEIgeW91IHNob3VsZCByZWFkIDJrKzY0QiB3aGVu
IE9PQiBhcmUgcmVxdWVzdGVkLgoKSWYgdGhlIGNvbnRyb2xsZXIgb25seSByZXR1cm5zIDJrKzMy
QiwgdGhlbiBwZXJmb3JtIGEgcmFuZG9tIHJlYWQgdG8KanVzdCBtb3ZlIHRoZSByZWFkIHBvaW50
ZXIgdG8gbXRkLT5zaXplICsgbXRkLT5vb2JzaXplIC0gMzIgYW5kCnJldHJpZXZlIHRoZSBtaXNz
aW5nIDMyIGJ5dGVzPwoKVGhpcyBhcHBsaWVzIHRvIHRoZSB0d28gbW9kZXMsIHRoZSBvbmx5IGRp
ZmZlcmVuY2UgaXM6Ci0gd2l0aCBjb3JyZWN0aW9uIChjb21tb25seSBuYW1lZCAiRUNDIG1vZGUi
KTogdGhlIHVzZXIgYnl0ZXMgYW5kIEVDQwogIGJ5dGVzIHNob3VsZCBiZSBmaXhlZCBpZiB0aGVy
ZSBhcmUgYW55IGJpdGZsaXBzCi0gd2l0aG91dCBjb3JyZWN0aW9uIChjb21tb25seSByZWZlcnJl
ZCBhcyAicmF3IG1vZGUiKTogbm8gY29ycmVjdGlvbgogIGFwcGxpZXMsIGlmIHRoZXJlIGFyZSBi
aXRmbGlwcywgZ2l2ZSB0aGVtCgpQbGVhc2UgbWluZCB0aGUgcmF3IG1vZGUgY2FuIGJlIHNsb3cs
IGl0J3MgbWVhbnQgZm9yIGRlYnVnZ2luZyBhbmQKdGVzdGluZywgbWFpbmx5LiBQYWdlIHJlYWRz
IGhvd2V2ZXIgc2hvdWxkIGJlIGZhc3QsIHNvIGlmIGp1c3QgbW92aW5nCnRoZSBjb2x1bW4gcG9p
bnRlciB3b3JrcywgdGhlbiBkbyBpdCwgb3RoZXJ3aXNlIHdlJ2xsIGNvbnNpZGVyCnJldHVybmlu
ZyBGRnMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
