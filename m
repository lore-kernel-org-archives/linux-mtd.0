Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E94C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 08:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D92F86187A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 08:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D92F86187A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfEe15x896KbIiI3cUQGZGN0WJeVIUJxopRf8o79fHA=; b=e2krRjoesWhiBA
	h+lCpqcLIWjZo8QRzw9An9hBrHYUtLgffdENcj0k8Dcuxgnj6FVpoXY2X9kUDOvnb+sc7GhAIrySX
	GTMztFoEeRjcSVOT3b8NSUme9D7s7UZMiBYEJnNT9nH2/uwW/HmNzCg6WZktyhwVls5FUoFwXFCbO
	mn+z3/PBLWEmUn1QS9ex1kDJmGYo5Vv7wsoru/4gRd8xRz/Mv8jOoEM+6PbCaYQ+DTQICi8stZGXw
	nWOCzVi0kKJk604krReyKizMz8zfz2ft39SJ8wYSLvfGgrDEKThx853pX6llXTPgImu90vyq1quA7
	8DHQCg5Z5W8i+0Smt4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrj5-00DSre-Ud; Thu, 30 Sep 2021 08:47:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrj0-00DSqK-De
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 08:47:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0C60A200007;
 Thu, 30 Sep 2021 08:47:21 +0000 (UTC)
Date: Thu, 30 Sep 2021 10:47:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Boris
 Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: add MEMREAD ioctl
Message-ID: <20210930104721.03dc45bb@xps13>
In-Reply-To: <20210930085133.13b5a228@collabora.com>
References: <20210920070221.10173-1-kernel@kempniu.pl>
 <20210928155859.433844cb@xps13>
 <20210928162402.6bb64fcf@collabora.com>
 <20210928163519.08cd1138@xps13>
 <YVTBoAnQKYLNpOPc@larwa.hq.kempniu.pl>
 <20210930085133.13b5a228@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_014730_755343_A263B7F8 
X-CRM114-Status: GOOD (  37.44  )
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

CmJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tIHdyb3RlIG9uIFRodSwgMzAgU2VwIDIwMjEg
MDg6NTE6MzMgKzAyMDA6Cgo+IEh1IE1pY2hhbCwKPiAKPiBPbiBXZWQsIDI5IFNlcCAyMDIxIDIx
OjQyOjI0ICswMjAwCj4gTWljaGHFgiBLxJlwaWXFhCA8a2VybmVsQGtlbXBuaXUucGw+IHdyb3Rl
Ogo+IAo+ID4gTWlxdWVsLCBCb3JpcywKPiA+IAo+ID4gVGhhbmsgeW91IGJvdGggZm9yIHlvdXIg
aW5wdXQuCj4gPiAgIAo+ID4gPiA+IEkgZG8gYWdyZWUgdGhhdCBhIG5ldyBpbnRlcmZhY2UgaXMg
bmVlZGVkLCBidXQgaWYgd2UncmUgYWRkaW5nIGEgbmV3Cj4gPiA+ID4gZW50cnkgcG9pbnQsIGxl
dCdzIG1ha2Ugc3VyZSBpdCBjb3ZlcnMgYWxsIHBvc3NpYmxlIHVzZSBjYXNlcyB3ZSBoYXZlCj4g
PiA+ID4gbm93LiBBdCB0aGUgdmVyeSBsZWFzdCwgSSB0aGluayB3ZSdyZSBtaXNzaW5nIGluZm8g
YWJvdXQgdGhlIG1heGltdW0KPiA+ID4gPiBudW1iZXIgb2YgY29ycmVjdGVkIGJpdHMgcGVyIEVD
QyByZWdpb24gb24gdGhlIHBvcnRpb24gYmVpbmcgcmVhZC4KPiA+ID4gPiBQcm9wYWdhdGluZyBF
VUNMRUFOIGVycm9ycyBpcyBuaWNlLCBidXQgaXQncyBub3QgcHJlY2lzZSBlbm91Z2ggSU1ITy4K
PiA+ID4gPiAKPiA+ID4gPiBJIHJlbWVtYmVyIGRpc2N1c3Npbmcgc2VhcmNoIGEgbmV3IFJFQUQg
aW9jdGwgd2l0aCBTYXNjaGEgSGF1ZXIgYSBmZXcKPiA+ID4gPiB5ZWFycyBiYWNrLCBidXQgSSBj
YW4ndCBmaW5kIHRoZSBkaXNjdXNzaW9uLi4uICAgIAo+ID4gCj4gPiBJIHRoaW5rIHRoaXMgaXMg
dGhlIHRocmVhZCBpbiBxdWVzdGlvbjoKPiA+IAo+ID4gICAgIGh0dHBzOi8vd3d3LmluZnJhZGVh
ZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE2LUFwcmlsL3RocmVhZC5odG1sIzY3MDg1Cj4g
PiAKPiA+IEluIGZhY3QsIGl0IGxvb2tzIGxpa2UgQm9yaXMgYmVhdCBtZSB0byBwcmVwYXJpbmcg
YSBkcmFmdCBwYXRjaCBhZGRpbmcgYQo+ID4gTUVNUkVBRCBpb2N0bCBieSBzb21lIGZpdmUgeWVh
cnM6Cj4gPiAKPiA+ICAgICBodHRwczovL3d3dy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51
eC1tdGQvMjAxNi1BcHJpbC8wNjcxODcuaHRtbCAgCj4gCj4gRXhhY3RseSB0aGUgb25lIEkgd2Fz
IHJlZmVycmluZyB0by4gTm90ZSB0aGF0IHRoaXMgcGF0Y2ggc3RpbGwgY29udGFpbnMKPiB0aGUg
dW5ib3VuZGVkIG1hbGxvYyB3aGljaCBJIHRoaW5rIGlzIHdvcnRoIGZpeGluZywgYnV0IG90aGVy
IHRoYW4KPiB0aGF0IGFuZCB0aGUgYWRkaXRpb24gb2YgRUNDIHN0YXRzLCBpdCBsb29rcyBwcmV0
dHkgc2ltaWxhciB0byB5b3Vycy4KPiAKPiA+IAo+ID4gSXQgaXMgYXBwYXJlbnRseSB0cnVlIHRo
YXQgImV2ZXJ5dGhpbmcgdGhhdCBjYW4gYmUgaW52ZW50ZWQgaGFzIGJlZW4KPiA+IGludmVudGVk
Ii4uLiA6LSkgIEkgZGlkIHNlYXJjaCB0aGUgd2ViIGZvciBleGlzdGluZyBtZW50aW9ucyBvZiBh
Cj4gPiBNRU1SRUFEIGlvY3RsIGJlZm9yZSBzdWJtaXR0aW5nIG15IHBhdGNoLCBidXQgdGhpcyB0
aHJlYWQgZGlkIG5vdCB0dXJuCj4gPiB1cCBpbiB0aGUgcmVzdWx0cyA6KAo+ID4gCj4gPiBBbnl3
YXksIGJhY2sgaW4gMjAxNiwgU2FzY2hhIGhpbnRlZCB0aGF0IGhlIG1pZ2h0IG1vdmUgZm9yd2Fy
ZCB3aXRoIHRoZQo+ID4gZHJhZnQgcHJlcGFyZWQgYnkgQm9yaXM6Cj4gPiAKPiA+ICAgICBodHRw
czovL3d3dy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAxNi1BcHJpbC8wNjcy
MTUuaHRtbAo+ID4gCj4gPiBidXQgSSBjYW5ub3QgZmluZCBhbnkgcmVsYXRlZCBzdWJtaXNzaW9u
cyBmcm9tIFNhc2NoYSBpbiBsaW51eC1tdGQncwo+ID4gUGF0Y2h3b3JrLgo+ID4gICAKPiA+ID4g
V2UgYWxzbyBkaXNjdXNzZWQgYSBtdGRfaW9fb3Agc29tZSB0aW1lIGFnbywgd2hpY2ggd291bGQg
ZXF1aXZhbGVudGx5Cj4gPiA+IHJlcGxhY2UgbXRkX29vYl9vcHMgYXQgc29tZSBwb2ludCwgaW5j
bHVkaW5nIG1vcmUgaW5mb3JtYXRpb24gc3VjaCBhcwo+ID4gPiB0aGUgYml0ZmxpcHMgd2hpY2gg
aGFwcGVuZWQgb24gZXZlcnkgY2h1bmsgaW5zdGVhZCBvZiB0aGUgaW5mb3JtYXRpb24KPiA+ID4g
cmVnYXJkaW5nIHRoZSBtYXhpbXVtIG51bWJlciBvZiBiaXRmbGlwcyBpbiBvbmUgb2YgdGhlIGNo
dW5rcyBvbmx5LiAgICAKPiA+IAo+ID4gSXMgdGhhdCBkaXNjdXNzaW9uIGF2YWlsYWJsZSBvbmxp
bmU/ICBTZWFyY2ggZW5naW5lcyBzZWVtIHRvIGJlCj4gPiBvYmxpdmlvdXMgdG8gdGhhdCB0ZXJt
LCB3aGljaCBtYWtlcyBpdCBoYXJkIGZvciBtZSB0byBnZXQgYWNxdWFpbnRlZAo+ID4gd2l0aCB0
aGF0IGlkZWEgYW5kL29yIHRvIGNvbW1lbnQgb24gaXQgOykgIAo+IAo+IE5vdCBzdXJlIHRoaXMg
aGFzIGJlZW4gZGlzY3Vzc2VkIHB1YmxpY2x5LCBidXQgSSByZW1lbWJlciBzdWdnZXN0aW5nCj4g
dGhhdCB0byBNaXF1ZWwgYSB3aGlsZSBhZ28gdG8gc2ltcGxpZnkgdGhlIGluLWtlcm5lbCBNVEQg
aW50ZXJmYWNlLgoKSXQgY2VydGFpbmx5IGhhcHBlbmVkIG9uIElSQyBpbmRlZWQuCgo+ID4gPiBJ
SVJDIHRoZSBwb2ludCB3YXMgdG8gZ2V0IHJpZCBvZiB0aGUgbXRkX3tyZWFkLHdyaXRlfXssX29v
Yn0gaG9va3MgYW5kCj4gPiA+IHN0cnVjdHVyZXMgaW4gZmF2b3Igb2YgYSBtb3JlIHJvYnVzdCBh
bmQgY29tcGxldGUgc2V0IG9mIG9wZXJhdGlvbnMuICAgIAo+ID4gCj4gPiBUaGF0IHNvdW5kcyBs
aWtlIGEgbWFqb3Igb3ZlcmhhdWwsIHJpZ2h0Pwo+ID4gCj4gPiBJIGd1ZXNzIHRoZSBiaWcgcXVl
c3Rpb24gZnJvbSBteSBwZXJzcGVjdGl2ZSBpczogc2hvdWxkIEkgcmV2aXZlIEJvcmlzJwo+ID4g
b3JpZ2luYWwgZWZmb3J0IG9uIHRoZSBNRU1SRUFEIGlvY3RsICh3aGljaCByZXR1cm5zIG1vcmUg
ZGV0YWlsZWQKPiA+IGJpdGZsaXAgc3RhdHMgaW4gdGhlIHN0cnVjdHVyZSBwYXNzZWQgYnkgdXNl
ciBzcGFjZSkgb3Igd291bGQgdGhhdCBiZSBhCj4gPiB3YXN0ZSBvZiB0aW1lIGJlY2F1c2UgdGhl
IHN1YnN5c3RlbSB3aWxsIGJlIHN3aXRjaGVkIG92ZXIgd2hvbGVzYWxlIHRvIGEKPiA+IG5ldyB3
YXkgb2YgZG9pbmcgSS9PIChtdGRfaW9fb3ApIGluIHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUgYW5k
IHRoZXJlZm9yZQo+ID4gZXhwb3NpbmcgeWV0IGFub3RoZXIgaW9jdGwgdG8gdXNlciBzcGFjZSB0
b2RheSB3b3VsZCBiZSBmcm93bmVkIHVwb24/Cj4gPiAgIAo+IAo+IFRoYXQncyBub3QgbXkgY2Fs
bCB0byBtYWtlLCBidXQgSSB0aGluayB0aG9zZSAyIHRoaW5ncyBhcmUgb3J0aG9nb25hbAo+IGFu
ZCBjYW4gYmUgYWRkcmVzc2VkIHNlcGFyYXRlbHkuCgpBZ3JlZWQuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
