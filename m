Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A19C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:49:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 843ED21738
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:49:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QNd8EfN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 843ED21738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=575fLaJdKP3yLrr0VKSn2KMnf5/43vjTLB0au6qkJXE=; b=QNd8EfN2sc2iOC
	8wZ9hY5uS/hygM9UmCICm/475OLSTk9pego1t6evVICQTaDMYXGRfE3hB/5GEQyaYwC4EwKuRscnM
	l4Znv8XdvPXoOh94xGmGPDV1Fki3hpGI2nAMNvn9cNcpNtXk/Ckuuw/+Q2Zua2ndaeknzrJj0lndm
	rAkAbpRn0lj1lIgX1e9PpbPvSOgzHCj9Ts7vPsVyxY38vIJC/d6nR1Hcxii1NNQVgTWg2Ivh18V1S
	gGF3pCAkkQKOnR/dmM/RAPWjpy4humcv335yoftEhWrgzTN/Era6JcFjDg79PXW5Uo5m2Bog38BPx
	iGoLOXxsU1j1jQLdHl6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLSx-00016d-2s; Fri, 05 Apr 2019 09:48:55 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLSn-0000y7-BS; Fri, 05 Apr 2019 09:48:47 +0000
X-Originating-IP: 90.88.30.125
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5BF84FF806;
 Fri,  5 Apr 2019 09:48:36 +0000 (UTC)
Date: Fri, 5 Apr 2019 11:48:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: select target before setting up
 data interface
Message-ID: <20190405114835.2696ef69@xps13>
In-Reply-To: <20190330192036.193e9e1c@collabora.com>
References: <20190321212010.3995-1-daniel@zonque.org>
 <20190322093046.71df010d@xps13>
 <6bcd6f18-6e57-2221-9e32-5bbabfffc48d@zonque.org>
 <20190325100909.5f3558b9@xps13>
 <60179efc-122f-2439-bd20-ab27b29afa32@zonque.org>
 <20190330192036.193e9e1c@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_024845_694147_EAF70855 
X-CRM114-Status: GOOD (  26.38  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 Richard Weinberger <richard.weinberger@gmail.com>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, haojian.zhuang@gmail.com,
 robert.jarzmik@free.fr, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4gd3JvdGUgb24gU2F0LCAzMCBNYXIKMjAxOSAxOToyMDozNiArMDEwMDoKCj4gT24gTW9uLCAy
NSBNYXIgMjAxOSAxNzoyMTo0MiArMDEwMAo+IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9y
Zz4gd3JvdGU6Cj4gCj4gPiBIaSBNaXF1ZWwsCj4gPiAKPiA+IE9uIDI1LzMvMjAxOSAxMDowOSBB
TSwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4gPiBEYW5pZWwgTWFjayA8ZGFuaWVsQHpvbnF1
ZS5vcmc+IHdyb3RlIG9uIEZyaSwgMjIgTWFyIDIwMTkgMTk6NDg6MDgKPiA+ID4gKzAxMDA6Cj4g
PiA+ICAgICAKPiA+ID4+IEhpIE1pcXVlbCwKPiA+ID4+Cj4gPiA+PiBPbiAyMi8zLzIwMTkgOToz
MCBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZTogICAgCj4gPiA+Pj4gKyBSaWNoYXJkOiB0aGlzIGlz
IGZpeGVzIG1hdGVyaWFscwo+ID4gPj4+Cj4gPiA+Pj4gRGFuaWVsIE1hY2sgPGRhbmllbEB6b25x
dWUub3JnPiB3cm90ZSBvbiBUaHUsIDIxIE1hciAyMDE5IDIyOjIwOjEwCj4gPiA+Pj4gKzAxMDA6
Cj4gPiA+Pj4gICAgICAgCj4gPiA+Pj4+IE5vdyB0aGF0IHRoZSBuYW5kIGRyaXZlcnMgYXJlIHJl
c3BvbnNpYmxlIGZvciBzZWxlY3RpbmcgdGhlIHRhcmdldAo+ID4gPj4+PiBwcmlvciB0byBoYXJk
d2FyZSBhY2Nlc3MsIGEgY2FsbCB0byBtYXJ2ZWxsX25mY19zZWxlY3RfdGFyZ2V0KCkgaXMKPiA+
ID4+Pj4gbmVjZXNzYXJ5IGZyb20gbWFydmVsbF9uZmNfc2V0dXBfZGF0YV9pbnRlcmZhY2UoKS4K
PiA+ID4+Pj4KPiA+ID4+Pj4gVGhpcyBpcyBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBieSBjb21t
aXQgYjI1MjUxNDE0ZjZlICgibXRkOgo+ID4gPj4+PiByYXduYW5kOiBtYXJ2ZWxsOiBTdG9wIGlt
cGxlbWVudGluZyAtPnNlbGVjdF9jaGlwKCkiKS4KPiA+ID4+Pj4KPiA+ID4+Pj4gRml4ZXM6IGIy
NTI1MTQxNGY2ZSAoIm10ZDogcmF3bmFuZDogbWFydmVsbDogU3RvcCBpbXBsZW1lbnRpbmcgLT5z
ZWxlY3RfY2hpcCgpIikKPiA+ID4+Pj4gQ2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+Cj4gPiA+Pj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4K
PiA+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIE1hY2sgPGRhbmllbEB6b25xdWUub3JnPgo+
ID4gPj4+PiAtLS0KPiA+ID4+Pj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5j
IHwgMiArKwo+ID4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPj4+
Pgo+ID4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+ID4gPj4+PiBpbmRleCA4
NDI4M2M2YmIwZmYuLjkzYWJlNWJlODk5NSAxMDA2NDQKPiA+ID4+Pj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiA+ID4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbWFydmVsbF9uYW5kLmMKPiA+ID4+Pj4gQEAgLTIzMjUsNiArMjMyNSw4IEBAIHN0YXRp
YyBpbnQgbWFydmVsbF9uZmNfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwgaW50IGNoaXBuciwKPiA+ID4+Pj4gIAlzdHJ1Y3QgbWFydmVsbF9uZmNfdGltaW5ncyBu
ZmNfdG1nOwo+ID4gPj4+PiAgCWludCByZWFkX2RlbGF5Owo+ID4gPj4+PiAgCj4gPiA+Pj4+ICsJ
bWFydmVsbF9uZmNfc2VsZWN0X3RhcmdldChjaGlwLCBjaGlwLT5jdXJfY3MpOwo+ID4gPj4+PiAr
Cj4gPiA+Pj4+ICAJc2RyID0gbmFuZF9nZXRfc2RyX3RpbWluZ3MoY29uZik7Cj4gPiA+Pj4+ICAJ
aWYgKElTX0VSUihzZHIpKQo+ID4gPj4+PiAgCQlyZXR1cm4gUFRSX0VSUihzZHIpOyAgICAgIAo+
ID4gPj4+Cj4gPiA+Pj4gSSBoYWQgYSBzaG9ydCBsb29rIHllc3RlcmRheSBhbmQgdGhpcyBpcyB2
ZXJ5IGxpa2VseSB0byBiZSB0aGUgcm9vdAo+ID4gPj4+IGNhdXNlIG9mIHRoZSByZWdyZXNzaW9u
LCB0aGFuayB5b3UgdmVyeSBtdWNoISAgICAgIAo+ID4gPj4KPiA+ID4+IFllcyBpdCBpcywgaXQg
Zml4ZXMgdGhlIHJlZ3Jlc3Npb24gSSBoYXZlIHJlcG9ydGVkLgo+ID4gPj4KPiA+ID4+IERvIHlv
dSB3YW50IG1lIHRvIHJlc2VuZCB3aXRoIHRoYXQgbml0IGFkZHJlc3NlZCB5b3UgbWVudGlvbmVk
PyBNeQo+ID4gPj4gdmVyc2lvbiB3b3JrcyB3ZWxsLCBJIGtub3cgdGhhdCBtdWNoIDopICAgIAo+
ID4gPiAKPiA+ID4gWWVzIHBsZWFzZSwgcmVzZW50IHdpdGggQm9yaXMnIGNvbW1lbnQgYWRkcmVz
c2VkIGFuZCB3ZSdsbCBiZSBmaW5lLiAgICAKPiA+IAo+ID4gSSB0cmllZCB0aGlzIG5vdywgYW5k
IHdpdGggJ2NoaXAtPmN1cl9jcycgaW5zdGVhZCBvZiAnY2hpcG5yJywgdGhlCj4gPiByZWdyZXNz
aW9uIGlzIGJhY2suIFRoaXMgZnVuY3Rpb24gaXMgaW52b2tlZCB0d2ljZSBkdXJpbmcgYm9vdCwg
YW5kIGluCj4gPiBib3RoIGNhc2VzLCAnY2hpcC0+Y3VyX2NzJyBpcyAtMSwgd2hpbGUgJ2NoaXBu
cicgaXMgMC4gVGhlIDJuZCB0aW1lIHRoaXMKPiA+IGZ1bmN0aW9uIGlzIGludm9rZWQsIHRoZSAn
c2VsZWN0ZWRfZGllJyBjYWNoZSB2YWx1ZSBpcyAwLCBzbwo+ID4gbWFydmVsbF9uZmNfc2VsZWN0
X3RhcmdldCgpIGJhaWxzIGVhcmx5LCB3aGljaCBzZWVtcyB0byBiZSBhIHByb2JsZW0uCj4gPiAK
PiA+IEkgY2FuJ3QgcXVpdGUgbWFrZSBzZW5zZSBvZiB0aGF0IHlldCwgYWxsIEkga25vdyBpcyB0
aGF0IGNhbGxpbmcKPiA+IG1hcnZlbGxfbmZjX3NlbGVjdF90YXJnZXQoKSB3aXRoIC0xIGZyb20K
PiA+IG1hcnZlbGxfbmZjX3NldHVwX2RhdGFfaW50ZXJmYWNlKCkgbWFrZXMgdGhlIGRyaXZlciBm
dW5jdGlvbmFsIGFnYWluLiBIbW0uICAKPiAKPiBDYW4geW91IHRyeSB3aXRoIHRoZSBmb2xsb3dp
bmcgZGlmZiBhcHBsaWVkPwo+IC0tLT44LS0tICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25h
bmQuYwo+IGluZGV4IGYzOGU1YzFiODdlNC4uZThlY2NmNmFmYzhmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbWFydmVsbF9uYW5kLmMKPiBAQCAtNzIyLDkgKzcyMiw2IEBAIHN0YXRpYyB2b2lkIG1h
cnZlbGxfbmZjX3NlbGVjdF90YXJnZXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgICAgICAg
IHN0cnVjdCBtYXJ2ZWxsX25mYyAqbmZjID0gdG9fbWFydmVsbF9uZmMoY2hpcC0+Y29udHJvbGxl
cik7Cj4gICAgICAgICB1MzIgbmRjcl9nZW5lcmljOwo+ICAKPiAtICAgICAgIGlmIChjaGlwID09
IG5mYy0+c2VsZWN0ZWRfY2hpcCAmJiBkaWVfbnIgPT0gbWFydmVsbF9uYW5kLT5zZWxlY3RlZF9k
aWUpCj4gLSAgICAgICAgICAgICAgIHJldHVybjsKPiAtCj4gICAgICAgICB3cml0ZWxfcmVsYXhl
ZChtYXJ2ZWxsX25hbmQtPm5kdHIwLCBuZmMtPnJlZ3MgKyBORFRSMCk7Cj4gICAgICAgICB3cml0
ZWxfcmVsYXhlZChtYXJ2ZWxsX25hbmQtPm5kdHIxLCBuZmMtPnJlZ3MgKyBORFRSMSk7Cj4gIAoK
SSB0ZXN0ZWQgb24gYSBweGEgYm9hcmQgYW5kIGFuIGFybWFkYSBib2FyZCBhbmQgSSBkb24ndCBy
ZXByb2R1Y2UgdGhlCmJ1ZyB3aXRob3V0IHRoaXMgY2hhbmdlLiBXaGF0IGlzIHNwZWNpYWwgd2l0
aCB5b3VyIHNldHVwPwoKSSB3YXMgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIGZpeCB0byB3cml0
ZSBhIGRlY2VudCBjb21taXQgbG9nIGJ1dCBhcwpJIGNhbm5vdCByZXByb2R1Y2UgSSBhbSBzdHVj
ay4gU28gaWYgeW91IG5lZWQgdGhpcyBmaXggcGxlYXNlIHNlbmQgdGhlCnBhdGNoIHdpdGgsIGhv
cGVmdWxseSwgYW4gZXhwbGFuYXRpb24gb2Ygd2hhdCdzIHdyb25nLgoKVGhhbmsgeW91IQpNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
