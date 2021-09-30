Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24F3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 06:52:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520DF61528
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 06:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 520DF61528
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SEyEfqq4dAJgDlDAYI4CmwsHa8uBarxkoKnP/Ks/FU=; b=3Nw9ddr2Kx2Ijd
	eMMd0FzdCILcBOxAIsEzG0oO30gtne5A0mV48g/fW57U0HGpwEbIZKcz53h3QmIo8/uesp0BWo8Bg
	mFXVgKUZ6IOdQa98sAmS7WcFlwOrxkj+VMQBLlSIRBgKtGtmOTi9cD3b76YtluuoJH8Jjir7ocx04
	/Ysy9O6ylCYXVwBUKNNlO4p5vy/i7+X0UJZXjrMbO4Vp6x8nSVFLhEgtaQwf8iumfVy5cFKDVWBIt
	w+SpEQirrwv0ur8X92WWZjohJcuSGjzoFV3TrR9jlNofvjYw2/g0JiK4lEg01lCPQgupdFlPMM09F
	OLGu1n4d93hwPzo52Zfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVpux-00D6dN-K1; Thu, 30 Sep 2021 06:51:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVpuu-00D6bl-0f
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 06:51:41 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9D0EE1F4491C;
 Thu, 30 Sep 2021 07:51:36 +0100 (BST)
Date: Thu, 30 Sep 2021 08:51:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Boris
 Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: add MEMREAD ioctl
Message-ID: <20210930085133.13b5a228@collabora.com>
In-Reply-To: <YVTBoAnQKYLNpOPc@larwa.hq.kempniu.pl>
References: <20210920070221.10173-1-kernel@kempniu.pl>
 <20210928155859.433844cb@xps13>
 <20210928162402.6bb64fcf@collabora.com>
 <20210928163519.08cd1138@xps13>
 <YVTBoAnQKYLNpOPc@larwa.hq.kempniu.pl>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_235140_237380_0C099C6E 
X-CRM114-Status: GOOD (  31.97  )
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

SHUgTWljaGFsLAoKT24gV2VkLCAyOSBTZXAgMjAyMSAyMTo0MjoyNCArMDIwMApNaWNoYcWCIEvE
mXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5wbD4gd3JvdGU6Cgo+IE1pcXVlbCwgQm9yaXMsCj4gCj4g
VGhhbmsgeW91IGJvdGggZm9yIHlvdXIgaW5wdXQuCj4gCj4gPiA+IEkgZG8gYWdyZWUgdGhhdCBh
IG5ldyBpbnRlcmZhY2UgaXMgbmVlZGVkLCBidXQgaWYgd2UncmUgYWRkaW5nIGEgbmV3Cj4gPiA+
IGVudHJ5IHBvaW50LCBsZXQncyBtYWtlIHN1cmUgaXQgY292ZXJzIGFsbCBwb3NzaWJsZSB1c2Ug
Y2FzZXMgd2UgaGF2ZQo+ID4gPiBub3cuIEF0IHRoZSB2ZXJ5IGxlYXN0LCBJIHRoaW5rIHdlJ3Jl
IG1pc3NpbmcgaW5mbyBhYm91dCB0aGUgbWF4aW11bQo+ID4gPiBudW1iZXIgb2YgY29ycmVjdGVk
IGJpdHMgcGVyIEVDQyByZWdpb24gb24gdGhlIHBvcnRpb24gYmVpbmcgcmVhZC4KPiA+ID4gUHJv
cGFnYXRpbmcgRVVDTEVBTiBlcnJvcnMgaXMgbmljZSwgYnV0IGl0J3Mgbm90IHByZWNpc2UgZW5v
dWdoIElNSE8uCj4gPiA+IAo+ID4gPiBJIHJlbWVtYmVyIGRpc2N1c3Npbmcgc2VhcmNoIGEgbmV3
IFJFQUQgaW9jdGwgd2l0aCBTYXNjaGEgSGF1ZXIgYSBmZXcKPiA+ID4geWVhcnMgYmFjaywgYnV0
IEkgY2FuJ3QgZmluZCB0aGUgZGlzY3Vzc2lvbi4uLiAgCj4gCj4gSSB0aGluayB0aGlzIGlzIHRo
ZSB0aHJlYWQgaW4gcXVlc3Rpb246Cj4gCj4gICAgIGh0dHBzOi8vd3d3LmluZnJhZGVhZC5vcmcv
cGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE2LUFwcmlsL3RocmVhZC5odG1sIzY3MDg1Cj4gCj4gSW4g
ZmFjdCwgaXQgbG9va3MgbGlrZSBCb3JpcyBiZWF0IG1lIHRvIHByZXBhcmluZyBhIGRyYWZ0IHBh
dGNoIGFkZGluZyBhCj4gTUVNUkVBRCBpb2N0bCBieSBzb21lIGZpdmUgeWVhcnM6Cj4gCj4gICAg
IGh0dHBzOi8vd3d3LmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE2LUFwcmls
LzA2NzE4Ny5odG1sCgpFeGFjdGx5IHRoZSBvbmUgSSB3YXMgcmVmZXJyaW5nIHRvLiBOb3RlIHRo
YXQgdGhpcyBwYXRjaCBzdGlsbCBjb250YWlucwp0aGUgdW5ib3VuZGVkIG1hbGxvYyB3aGljaCBJ
IHRoaW5rIGlzIHdvcnRoIGZpeGluZywgYnV0IG90aGVyIHRoYW4KdGhhdCBhbmQgdGhlIGFkZGl0
aW9uIG9mIEVDQyBzdGF0cywgaXQgbG9va3MgcHJldHR5IHNpbWlsYXIgdG8geW91cnMuCgo+IAo+
IEl0IGlzIGFwcGFyZW50bHkgdHJ1ZSB0aGF0ICJldmVyeXRoaW5nIHRoYXQgY2FuIGJlIGludmVu
dGVkIGhhcyBiZWVuCj4gaW52ZW50ZWQiLi4uIDotKSAgSSBkaWQgc2VhcmNoIHRoZSB3ZWIgZm9y
IGV4aXN0aW5nIG1lbnRpb25zIG9mIGEKPiBNRU1SRUFEIGlvY3RsIGJlZm9yZSBzdWJtaXR0aW5n
IG15IHBhdGNoLCBidXQgdGhpcyB0aHJlYWQgZGlkIG5vdCB0dXJuCj4gdXAgaW4gdGhlIHJlc3Vs
dHMgOigKPiAKPiBBbnl3YXksIGJhY2sgaW4gMjAxNiwgU2FzY2hhIGhpbnRlZCB0aGF0IGhlIG1p
Z2h0IG1vdmUgZm9yd2FyZCB3aXRoIHRoZQo+IGRyYWZ0IHByZXBhcmVkIGJ5IEJvcmlzOgo+IAo+
ICAgICBodHRwczovL3d3dy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAxNi1B
cHJpbC8wNjcyMTUuaHRtbAo+IAo+IGJ1dCBJIGNhbm5vdCBmaW5kIGFueSByZWxhdGVkIHN1Ym1p
c3Npb25zIGZyb20gU2FzY2hhIGluIGxpbnV4LW10ZCdzCj4gUGF0Y2h3b3JrLgo+IAo+ID4gV2Ug
YWxzbyBkaXNjdXNzZWQgYSBtdGRfaW9fb3Agc29tZSB0aW1lIGFnbywgd2hpY2ggd291bGQgZXF1
aXZhbGVudGx5Cj4gPiByZXBsYWNlIG10ZF9vb2Jfb3BzIGF0IHNvbWUgcG9pbnQsIGluY2x1ZGlu
ZyBtb3JlIGluZm9ybWF0aW9uIHN1Y2ggYXMKPiA+IHRoZSBiaXRmbGlwcyB3aGljaCBoYXBwZW5l
ZCBvbiBldmVyeSBjaHVuayBpbnN0ZWFkIG9mIHRoZSBpbmZvcm1hdGlvbgo+ID4gcmVnYXJkaW5n
IHRoZSBtYXhpbXVtIG51bWJlciBvZiBiaXRmbGlwcyBpbiBvbmUgb2YgdGhlIGNodW5rcyBvbmx5
LiAgCj4gCj4gSXMgdGhhdCBkaXNjdXNzaW9uIGF2YWlsYWJsZSBvbmxpbmU/ICBTZWFyY2ggZW5n
aW5lcyBzZWVtIHRvIGJlCj4gb2JsaXZpb3VzIHRvIHRoYXQgdGVybSwgd2hpY2ggbWFrZXMgaXQg
aGFyZCBmb3IgbWUgdG8gZ2V0IGFjcXVhaW50ZWQKPiB3aXRoIHRoYXQgaWRlYSBhbmQvb3IgdG8g
Y29tbWVudCBvbiBpdCA7KQoKTm90IHN1cmUgdGhpcyBoYXMgYmVlbiBkaXNjdXNzZWQgcHVibGlj
bHksIGJ1dCBJIHJlbWVtYmVyIHN1Z2dlc3RpbmcKdGhhdCB0byBNaXF1ZWwgYSB3aGlsZSBhZ28g
dG8gc2ltcGxpZnkgdGhlIGluLWtlcm5lbCBNVEQgaW50ZXJmYWNlLgoKPiAKPiA+IElJUkMgdGhl
IHBvaW50IHdhcyB0byBnZXQgcmlkIG9mIHRoZSBtdGRfe3JlYWQsd3JpdGV9eyxfb29ifSBob29r
cyBhbmQKPiA+IHN0cnVjdHVyZXMgaW4gZmF2b3Igb2YgYSBtb3JlIHJvYnVzdCBhbmQgY29tcGxl
dGUgc2V0IG9mIG9wZXJhdGlvbnMuICAKPiAKPiBUaGF0IHNvdW5kcyBsaWtlIGEgbWFqb3Igb3Zl
cmhhdWwsIHJpZ2h0Pwo+IAo+IEkgZ3Vlc3MgdGhlIGJpZyBxdWVzdGlvbiBmcm9tIG15IHBlcnNw
ZWN0aXZlIGlzOiBzaG91bGQgSSByZXZpdmUgQm9yaXMnCj4gb3JpZ2luYWwgZWZmb3J0IG9uIHRo
ZSBNRU1SRUFEIGlvY3RsICh3aGljaCByZXR1cm5zIG1vcmUgZGV0YWlsZWQKPiBiaXRmbGlwIHN0
YXRzIGluIHRoZSBzdHJ1Y3R1cmUgcGFzc2VkIGJ5IHVzZXIgc3BhY2UpIG9yIHdvdWxkIHRoYXQg
YmUgYQo+IHdhc3RlIG9mIHRpbWUgYmVjYXVzZSB0aGUgc3Vic3lzdGVtIHdpbGwgYmUgc3dpdGNo
ZWQgb3ZlciB3aG9sZXNhbGUgdG8gYQo+IG5ldyB3YXkgb2YgZG9pbmcgSS9PIChtdGRfaW9fb3Ap
IGluIHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUgYW5kIHRoZXJlZm9yZQo+IGV4cG9zaW5nIHlldCBh
bm90aGVyIGlvY3RsIHRvIHVzZXIgc3BhY2UgdG9kYXkgd291bGQgYmUgZnJvd25lZCB1cG9uPwo+
IAoKVGhhdCdzIG5vdCBteSBjYWxsIHRvIG1ha2UsIGJ1dCBJIHRoaW5rIHRob3NlIDIgdGhpbmdz
IGFyZSBvcnRob2dvbmFsCmFuZCBjYW4gYmUgYWRkcmVzc2VkIHNlcGFyYXRlbHkuCgpSZWdhcmRz
LAoKQm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
