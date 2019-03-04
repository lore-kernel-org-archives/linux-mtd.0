Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69550C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 12:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 369B720815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 12:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X2ATGdUz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 369B720815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tw/v+dxabJ2h+vLZMYToLEeRNeTecWFV9PYSp98nnek=; b=X2ATGdUzrvXacs
	wQlZOtlE9qaDDPJND5wSwmxsCS79k9BeTppWz44CzWugO6X3CLLMmSCYkxyW39vVGvXyk81fVGdx/
	KyEj78TxoivC0BKZ0N3yWLaAtHVTAW1hpi0PCHQt8nJvyq55dVg3syqMUxBzRWrwEHMonzbtP0Mhr
	uVtRqiZEK+Fbc9eAJ9a4Skg6u2hFAyCO0d22V6cemPwMo+uEabnH7ouc7Ac+h/Hu3MGHSxxJziMn5
	Sm8Hdk8P9ZPdTJ9eoWnYe0WfzgIHK4tqfdJi/DjagMkrjXfhTiEfwTs0Zul3UpnC7QZgDaa9x7vas
	2H98jskb4yx4naNrcUgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0n3S-0000I1-RC; Mon, 04 Mar 2019 12:50:50 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0n3P-0000HE-BC
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 12:50:49 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7B98520010;
 Mon,  4 Mar 2019 12:50:35 +0000 (UTC)
Date: Mon, 4 Mar 2019 13:50:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Emil Lenngren <emil.lenngren@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
Message-ID: <20190304135034.3e90a176@xps13>
In-Reply-To: <CAO1O6se_88kxN0qvk_0ULLQ0jWMvqP1C9kq5ukUwzBkyke4wBg@mail.gmail.com>
References: <20181221115831.9595-1-emil.lenngren@gmail.com>
 <20190105145845.7a28d8f8@bbrezillon>
 <CAO1O6se_1oPv6SogDkkMaF1K9N7XxtTzeHAruibB8fph+mam=A@mail.gmail.com>
 <20190106091049.01e2e3d9@bbrezillon>
 <CAO1O6scHuaGJsS1wXtEpxi930K57yDBUZggb1Sik9XoZMJA+8A@mail.gmail.com>
 <20190304122348.3824447b@xps13>
 <CAO1O6se_88kxN0qvk_0ULLQ0jWMvqP1C9kq5ukUwzBkyke4wBg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_045047_696325_D280722E 
X-CRM114-Status: GOOD (  36.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRW1pbCwKCkVtaWwgTGVubmdyZW4gPGVtaWwubGVubmdyZW5AZ21haWwuY29tPiB3cm90ZSBv
biBNb24sIDQgTWFyIDIwMTkKMTI6NTU6MzAgKzAxMDA6Cgo+IEhpLAo+IAo+IERlbiBtw6VuIDQg
bWFycyAyMDE5IGtsIDEyOjIzIHNrcmV2IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+Ogo+ID4KPiA+IEhpIEVtaWwsCj4gPgo+ID4gRW1pbCBMZW5uZ3JlbiA8ZW1pbC5s
ZW5uZ3JlbkBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMTggRmViIDIwMTkKPiA+IDEyOjI3OjI1
ICswMTAwOgo+ID4gIAo+ID4gPiBIaSwKPiA+ID4KPiA+ID4gRGVuIHPDtm4gNiBqYW4uIDIwMTkg
a2wgMDk6MTEgc2tyZXYgQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+OiAg
Cj4gPiA+ID4KPiA+ID4gPiBPbiBTYXQsIDUgSmFuIDIwMTkgMjI6MDE6NDQgLTA4MDAKPiA+ID4g
PiBFbWlsIExlbm5ncmVuIDxlbWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4g
IAo+ID4gPiA+ID4gSGksCj4gPiA+ID4gPgo+ID4gPiA+ID4gRGVuIGzDtnIgNSBqYW4uIDIwMTkg
a2wgMDU6NTkgc2tyZXYgQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+OiAg
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIEZyaSwgMjEgRGVjIDIwMTggMTI6NTg6MTQgKzAx
MDAKPiA+ID4gPiA+ID4gRW1pbCBMZW5uZ3JlbiA8ZW1pbC5sZW5uZ3JlbkBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+ID4gU1BJIE5BTkQgZmxhc2hlcyBkb24ndCBh
Y2NlcHQgbmV3IGNvbW1hbmRzIHdoaWxlIGFuIGVyYXNlIGlzIG9uZ29pbmcuCj4gPiA+ID4gPiA+
ID4gTWFrZSBzdXJlIHRvIHdhaXQgdW50aWwgdGhlIGRldmljZSBpcyByZWFkeSBiZWZvcmUgd3Jp
dGluZyB0aGUgbWFya2VyLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSnVzdCBhcyB3aXRo
IHRoZSBlcmFzZSBvcCwgbm8gZXJyb3IgY2hlY2sgaXMgcGVyZm9ybWVkIHNpbmNlIHdlIHdhbnQK
PiA+ID4gPiA+ID4gPiB0byBjb250aW51ZSB3cml0aW5nIHRoZSBtYXJrZXIgZXZlbiBpZiB0aGUg
ZXJhc2UgZmFpbHMuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBF
bWlsIExlbm5ncmVuIDxlbWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4KPiA+ID4gPiA+ID4gPiAtLS0K
PiA+ID4gPiA+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgMiArKwo+ID4gPiA+
ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gPiA+ID4gPiA+ID4gaW5kZXggNDc5YzJmMmNmMS4u
YzI3MjRkMzRlNiAxMDA2NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMK
PiA+ID4gPiA+ID4gPiBAQCAtNjg1LDYgKzY4NSw4IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9tYXJr
YmFkKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qgc3RydWN0IG5hbmRfcG9zICpwb3Mp
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgICBzcGluYW5kX2VyYXNlX29wKHNwaW5h
bmQsIHBvcyk7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiArICAgICBzcGluYW5kX3dhaXQo
c3BpbmFuZCwgTlVMTCk7Cj4gPiA+ID4gPiA+ID4gKyAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IEFmdGVyIHRoaW5raW5nIGEgYml0IG1vcmUgYWJvdXQgaXQsIEkgdGhpbmsgd2Ugc2hvdWxkIHNp
bXBseSB3cml0ZSB0aGUKPiA+ID4gPiA+ID4gQkJNIGFuZCBza2lwIHRoZSBlcmFzZSBvcGVyYXRp
b24uIE1hcmtpbmcgYSBibG9jayBiYWQgaXMganVzdCBhYm91dAo+ID4gPiA+ID4gPiB3cml0aW5n
IDAgdG8gdGhlIGZpcnN0IDIgYnl0ZXMgb2YgdGhlIE9PQiBhcmVhLCBhbmQgd2UgZG9uJ3QgbmVl
ZCB0aGUKPiA+ID4gPiA+ID4gYmxvY2sgdG8gYmUgZXJhc2VkIHRvIGRvIHRoYXQuCj4gPiA+ID4g
PiA+ICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGNvbXBhcmVkIHdpdGggdGhlIHJhdyBhbmQgaW1w
bGVtZW50YXRpb24gaW4KPiA+ID4gPiA+IG5hbmRfYmxvY2tfbWFya2JhZF9sb3dsZXZlbCwgaXQg
YWxzbyBlcmFzZXMgZmlyc3QsIGlnbm9yaW5nIGEKPiA+ID4gPiA+IHBvdGVudGlhbCBlcnJvci4g
IAo+ID4gPiA+Cj4gPiA+ID4gWWVzLCBhbmQgSSB0aGluayB0aGlzIGltcGxlbWVudGF0aW9uIHdh
cyBpbnNwaXJlZCBieSB0aGUgcmF3bmFuZCBvbmUsCj4gPiA+ID4gYnV0IEknbSBub3Qgc3VyZSB0
aGUgcmF3bmFuZCBpbXBsZW0gaXMgY29ycmVjdC4KPiA+ID4gPiAgCj4gPiA+ID4gPgo+ID4gPiA+
ID4gT24gdGhlIG90aGVyIGhhbmQsIGEgY29tbW9uIHNwaSBmbGFzaCBjaGlwIE1YMzVMRjFHRTRB
QiBzdGF0ZXMgaW4gdGhlCj4gPiA+ID4gPiBkYXRhc2hlZXQgdGhhdCBpdCdzIG5vdCByZWNvbW1l
bmRlZCB0byBlcmFzZSBhIGJhZCBibG9jaywgYnV0IG5vCj4gPiA+ID4gPiByZWFzb24gd2h5LiAg
Cj4gPiA+ID4KPiA+ID4gPiBCZWNhdXNlIHRoZSBlcmFzZSBtaWdodCBzdWNjZWVkIGFuZCByZXNl
dCB0aGUgQkJNIHRvIDB4ZmYsIHRodXMgbWFya2luZwo+ID4gPiA+IHRoZSBibG9jayBnb29kIGV2
ZW4gaWYgaXQncyB1bnJlbGlhYmxlLgo+ID4gPiA+ICAKPiA+ID4gPiA+IEF0IHRoZSBzYW1lIHRp
bWUsIGl0J3MgZ2VuZXJhbGx5IGRpc2FsbG93ZWQgdG8gd3JpdGUgdGhlCj4gPiA+ID4gPiBzYW1l
IHBhZ2UgdHdpY2UuLi4gIAo+ID4gPiA+Cj4gPiA+ID4gVGhhdCdzIG9ubHkgaWYgeW91IGNhcmUg
YWJvdXQgdGhlIGRhdGEgeW91IHdyaXRlIHRvIHRoZSBwYWdlLiBNYXJraW5nIGEKPiA+ID4gPiBi
bG9jayBiYWQgaXMganVzdCBhYm91dCBzZXR0aW5nIHRoZSBCQk0gdG8gMHgwLCB3aGljaCBzaG91
bGQgYWx3YXlzIHdvcmsKPiA+ID4gPiBldmVuIGlmIHRoZSBwYWdlIHlvdSdyZSB3cml0aW5nIHRv
IGhhcyBhbHJlYWR5IGJlZW4gd3JpdHRlbiwgc2ltcGx5Cj4gPiA+ID4gYmVjYXVzZSBhIDEgLT4g
MCBjZWxsIHRyYW5zaXRpb24gZG9lcyBub3QgcmVxdWlyZSBhbiBlcmFzZSAob25seSBhIDAgLT4K
PiA+ID4gPiAxIHRyYW5zaXRpb24gZG9lcykuICAKPiA+ID4KPiA+ID4gU2hvdWxkIHRoZSBCQk0g
YmUgd3JpdHRlbiB3aXRoIG9yIHdpdGhvdXQgRUNDPyBOb3cgaXQgdXNlcyB3aGF0ZXZlcgo+ID4g
PiBtb2RlIHdhcyB1c2VkIGluIHRoZSBsYXN0IG9wZXJhdGlvbi4gQWxzbyBmb3IgcmVhZGluZywg
SSBzZWUgdGhlCj4gPiA+ICJzcGluYW5kX2lzYmFkIiBmdW5jdGlvbiBzZXRzIC5tb2RlIHRvIE1U
RF9PUFNfUkFXIGJ1dCB0aGF0IGZpZWxkCj4gPiA+IGRvZXNuJ3Qgc2VlbSB0byBiZSBpbnNwZWN0
ZWQsIGFnYWluIHVzaW5nIHRoZSBzYW1lIEVDQyBtb2RlIGFzIGluIHRoZQo+ID4gPiBsYXN0IG9w
ZXJhdGlvbi4KPiA+ID4gSXNuJ3QgaXQgYmVzdCB0byB1c2UgdGhlIG5vbi1FQ0MgbW9kZSBmb3Ig
Ym90aCByZWFkaW5nIGFuZCB3cml0aW5nIHRoZQo+ID4gPiBCQk0/IElmIHdlIHdvdWxkIHVzZSBF
Q0MgbW9kZSBhbmQgb3ZlcndyaXRlIHRoZSBwYWdlIHdoZW4gd3JpdGluZyB0aGUKPiA+ID4gQkJN
IG1hcmtlciwgSSBndWVzcyB0aGUgY29udHJvbGxlciBuZWVkcyB0byBzdG9yZSBhIHNlY29uZCBl
cnJvcgo+ID4gPiBjb3JyZWN0aW9uIGNvZGUgKG92ZXJ3cml0aW5nIHRoZSBwcmV2aW91cyBvbmUp
LCB3aGljaCB3aWxsIHByb2JhYmx5Cj4gPiA+IGxlYWQgdG8gRUNDIGZhaWx1cmUgaWYgbGF0ZXIg
cmVhZCBpbiBFQ0MtbW9kZSAoYW5kIHdobyBrbm93cyBpZiBpdAo+ID4gPiB3aWxsICJjb3JyZWN0
IiB0aGUgemVybyBiaXRzIHRvIG9uZXMuLi4pLgo+ID4gPiAgCj4gPgo+ID4gSSBzdXBwb3NlIHdy
aXRpbmcgdGhlIEJCTSB3aXRob3V0IGNvcnJlY3Rpb24gaXMgd2hhdCB3ZSB3YW50LiAgCj4gCj4g
SSB3YXMgYWxzbyB0aGlua2luZywgaXMgaXQgYSBnb29kIG9yIGJhZCBpZGVhIHRvIG1vdmUgdGhl
IEJCTQo+IHdyaXRpbmcvcmVhZGluZyB0byBOQU5EIGNvcmU/IEkgbWVhbiwgYXMgSSB1bmRlcnN0
YW5kLCBib3RoIHBhcmFsbGVsCj4gbmFuZCBhbmQgc3BpIG5hbmQgdXNlIHRoZSBzYW1lIGxvZ2lj
IHRvIGhhbmRsZSB0aGUgQkJNIChhdCB0aGUKPiBiZWdpbm5pbmcgb2YgdGhlIE9PQiBhcmVhKS4g
T3IgaXMgdGhlcmUgc29tZSBzcGVjaWZpYyB0cmVhdG1lbnQgdGhhdAo+IG11c3QgYmUgZG9uZSBp
bmRpdmlkdWFsbHkgZm9yIHNwaSBhbmQgcGFyYWxsZWwgZmxhc2ggY2hpcHM/CgpJIGRvbid0IHRo
aW5rIHRoZXJlIGlzIGEgZGlmZmVyZW5jZS4gTW92aW5nIGl0IHRvIHRoZSBOQU5EIGNvcmUgaXMK
cHJvYmFibHkgYSBnb29kIGNob2ljZS4gSG93ZXZlciwgYXMgZmFyIGFzIEkgcmVtZW1iZXIsIHRo
ZXJlIGlzIG5vIEJCVApzdXBwb3J0IGluIHRoZSBTUEktTkFORCBjb3JlIHlldC4KCj4gCj4gQWZ0
ZXIgcmVhZGluZyB0aGUgQkJNIGluZm8gb2Ygc29tZSBkYXRhc2hlZXRzLCBpdCBhcHBlYXJzIHRo
ZSB2YXJpYW5jZQo+IGxpZXMgYmV0d2VlbiBkaWZmZXJlbnQgbWFudWZhY3R1cmVycywgbm90IHRo
ZSB0ZWNobm9sb2d5IHVzZWQKPiAocGFyYWxsZWwgb3Igc3BpKS4gRm9yIGV4YW1wbGUsIFRvc2hp
YmEgZmlsbHMgYSB3aG9sZSBiYWQgYmxvY2sgd2l0aAo+IDAwaCBhbmQgaW5zdHJ1Y3RzIHRvIHJl
YWQgYW55IGJ5dGUgaW4gYW55IHBhZ2UgYW5kIGNoZWNrIGlmIGl0Cj4gY29udGFpbnMgMDBoLiBN
YWNyb25peCBvbiB0aGUgb3RoZXIgaGFuZCBpbnN0cnVjdHMgdG8gY2hlY2sgdGhlIGZpcnN0Cj4g
Ynl0ZSBvZiB0aGUgT09CIGFyZWEgaW4gdGhlIGZpcnN0IGFuZCBzZWNvbmQgcGFnZSB0byBzZWUg
dGhleSBjb250YWluCj4gMDBoLiBTbWFydE1lZGlhIGluc3RydWN0cyB0byBjaGVjayB0aGUgNnRo
IGJ5dGUgb2YgdGhlIE9PQiBhcmVhIG9mIHRoZQo+IGZpcnN0IHBhZ2UgYW5kIHNlZSBpZiBpdCBj
b250YWlucyBhdCBsZWFzdCB0d28gemVybyBiaXRzLgoKSSB0aGluayB0aGUgQkJNIHdhcyBzdXBw
b3NlZCB0byBiZSBhdCB0aGUgNnRoIGJ5dGVzIG9mIHRoZSBPT0IgYXJlYSBmb3IKc21hbGwgcGFn
ZSBOQU5EIGRldmljZXMgKHByb2JhYmx5IHRoZSBjYXNlIG9mIHRoZSBTbWFydE1lZGlhIGRhdGFz
aGVldAp5b3UgcmVhZCksIG90aGVyd2lzZSBpdCBpcyBzdXBwb3NlZCB0byBiZSBsb2NhdGVkIGF0
IHRoZSAxc3QgKGFuZCAybmQ/KQpieXRlKHMpIHdoaWNoIHdvdWxkIHdvcmsgZm9yIGJvdGggVG9z
aGliYSBhbmQgTWFjcm9uaXggcGFydHMsIGZvcgppbnN0YW5jZS4KCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
