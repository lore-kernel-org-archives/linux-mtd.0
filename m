Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E71FC5CFDB
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4xjiCboZn3B8rHoewWob4/5MqNBI8rj6rhJc1ZtoK4=; b=myT7F+SU2wQ/hU
	iUxXxUbSH+9v1nx36E1kcOKLPJItgYfJ7479IRbOd6wOSZ0ox3PxME2wrDh1jE/q8BJEvb8zt9rCG
	M4dOHiu2cF8UIrJJgDOwZyZU/bcBfwQRvMinuea7PzQ1GRUmuOG4/M4wDRopMDeZa+Y4OQavwHMsz
	PZv452NdpZGJkR/rgkespqJ3oxIGX4rz5YcTQux8Q97iFR0a2pUc3W5XNwXEOVlGnQ4ob8DGojRzX
	lJFhD3RICr+Bqlss0J0NWyXFt48j7P6NxaRvTrkiarZECQhq6+wz24AHyUpaa/QBuopXV4u3rayzV
	U8kF2V7/tzmfqB7UX11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSvb-00000000VS6-3Ggr;
	Thu, 13 Aug 2026 10:44:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSvW-00000000VRa-4BIX
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 10:44:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C7CE4E411EC;
	Thu, 13 Aug 2026 10:44:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6332602B8;
	Thu, 13 Aug 2026 10:44:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB95F11C4DD77;
	Thu, 13 Aug 2026 12:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786617876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JttpmspCHapwDXzhlD1M7SP5FQ7R1H7xGCIvIw9IXQ0=;
	b=bMwGV/bYalyy5/e0q5CjDErG2pnW7P2fMkwY1kHpWSDlV0jJCXeGlBYR2yI1VLbbtLiGwu
	+1ug/+h5b76aY5yibDCIVKfOZkSlHHhxaS8JrN/WEtyafhp3mkDDIqrbfIZzxuqI7gXsR8
	BoZEWoOFNuE00vh8vy/VxlltZWCk7KzHsbnEsncMJOIzjVZO3ftG4KVYsOJkqPB4658qrN
	zHxSo1GjzyvwDLnsZqTdlAf1RCEl/QEnJSJiJBmSFWIaX79pgecO0dn7S/e7tM7vtACAbi
	JceU+uyfAhKOoTDTXII1fe674+/0k5h5Cf7lmozWlN/YzKi67WmSX7XsWTJauA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Richard Weinberger <richard@nod.at>,  Md Sadre Alam
 <md.alam@oss.qualcomm.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Daisuke
 Mizobuchi <mizo@atmark-techno.com>
Subject: Re: [PATCH RFC v2] mtd: spinand: winbond: add support for W25N04LW
In-Reply-To: <an2OtHX62YRg0ZYZ@atmark-techno.com> (Dominique Martinet's
	message of "Thu, 13 Aug 2026 18:30:28 +0900")
References: <20260812-w25n04lw-v2-1-deee97602fc4@atmark-techno.com>
	<87mruql9fn.fsf@bootlin.com> <an2OtHX62YRg0ZYZ@atmark-techno.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 13 Aug 2026 12:44:32 +0200
Message-ID: <875x1el2pb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_034447_219511_2E59DAB1 
X-CRM114-Status: GOOD (  32.86  )
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

T24gMTMvMDgvMjAyNiBhdCAxODozMDoyOCArMDksIERvbWluaXF1ZSBNYXJ0aW5ldCA8ZG9taW5p
cXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8uY29tPiB3cm90ZToKCj4gVGhhbmtzIGZvciB0aGUg
ZmVlZGJhY2shCj4KPiBNaXF1ZWwgUmF5bmFsIHdyb3RlIG9uIFRodSwgQXVnIDEzLCAyMDI2IGF0
IDEwOjE5OjA4QU0gKzAyMDA6Cj4+ID4gT09CIGxheW91dCB3YXMgZGVmaW5lZCB0byBvbmx5IHNo
b3cgRUNDLXByb3RlY3RlZCAidXNlciBkYXRhIEkiLCBsZWF2aW5nCj4+ID4gInVzZXIgZGF0YSBJ
SSIgdW5hdmFpbGFibGUuCj4+IAo+PiBGaW5lLCB0aGVyZSBpcyBub3Qgc3Ryb25nIHJ1bGUsIGFu
ZCBhbnl3YXkgdGhpcyBpcyBvbmx5IHVzZWZ1bCBmb3Igbm9uCj4+IFVCSSB1c2VycyAoamZmczIs
IHR5cGljYWxseSkuCj4KPiBZZWFoLCBJIHdhcyBleHBlY3RpbmcgVUJJIHRvIHVzZSBpdCB0b28g
YnV0IEkgbG9va2VkIGl0IHVwIGFmdGVyIHBvc3RpbmcKPiBhbmQgc2F3IGl0IGRvZXNuJ3QsIHNv
IEkgYWdyZWUgaXQgZG9lc24ndCBtYXR0ZXIgbXVjaCBmb3IgdXMgZWl0aGVyIHdheS4KPgo+PiA+
IEFzIGFuIGV4dHJhIGRhdGEgcG9pbnQsIHRoaXMgInVzZXIgYXJlYSBJIGFuZCBJSSIgZGlzdGlu
Y3Rpb24gaXMgdGhlIHNhbWUKPj4gPiBpbiBXMjVOMDRLVyAoc2FtZSAyKzEyKSwgYnV0IHcyNW4w
Mmt2X29vYmxheW91dF9mcmVlKCkgdXNlIHRoZXJlIHJldHVybnMKPj4gPiB0aGUgd2hvbGUgMTQg
Ynl0ZXMgYXMgYSBzaW5nbGUgY2h1bmssIHNvIEkgZXhwbGljaXRseSBtYWRlIGEgZGlmZmVyZW50
Cj4+ID4gY2hvaWNlIGhlcmUuCj4+ID4gKEkgYmVsaWV2ZSB0aGF0J3Mgbm90IHNvbWV0aGluZyB0
aGF0IGNhbiBiZSBjaGFuZ2VkIGVhc2lseSwgc28gd2Ugc2hvdWxkCj4+ID4gZGlzY3VzcyB0aGlz
IGJlZm9yZSBtZXJnaW5nKQo+PiAKPj4gSWYgaXQncyB0aGUgc2FtZSBsYXlvdXQsIEkgd291bGQg
Z28gZm9yIGtlZXBpbmcgdGhlIGV4aXN0aW5nIG9uZSBhbmQKPj4gYXZvaWQgdGhlIHByb2xpZmVy
YXRpb24gb2YgdGhlc2UgaGVscGVycy4KPgo+IFRoZSBsYXlvdXQgaXMgc2ltaWxhciAoZWFjaCBz
ZWN0aW9uIGhhcyAyIGJ5dGVzIGZvciBCQiBtYXJrZXIgLyAyIGJ5dGVzCj4gdXNlciBkYXRhIElJ
IC8gMTIgYnl0ZXMgdXNlciBkYXRhIEkpLCBidXQgdGhlIG51bWJlciBvZiBzZWN0aW9ucyBwZXIK
PiBlcmFzZSBibG9jayBpcyBkaWZmZXJlbnQgKHdlbnQgZnJvbSA0IHRvIDgpCj4gRm9yIEVDQyBp
dCdzIHRoZSBzYW1lICg0IHRvIDggc2VjdGlvbnMsIGFuZCBvZmZzZXQgY2hhbmdlZCBmcm9tIDY0
IHRvCj4gMTI4IGFjY29yZGluZ2x5IGJlY2F1c2UgdGhlcmUgd2VyZSBtb3JlIGRhdGEgc2VjdGlv
bnMgYmVmb3JlKQo+Cj4gSSBzZWUgc2ltaWxhciBoZWxwZXJzIGluIG90aGVyIGRyaXZlcnMgKGUu
Zy4gYWxsaWFuY2VtZW1vcnkuYykgdXNlCj4gbXRkLT5vb2JzaXplOyBzbyBpZiB5b3UgcHJlZmVy
IEkgY2FuIHJldXNlIHRoZSBleGlzdGluZwo+IHcyNW4wMmt2X29vYmxheW91dCogaGVscGVycyBi
YXNlZCBvbiB0aGlzPwoKWWVzLCB0aGF0IHdvdWxkIGJlIGlkZWFsLgoKPiAoCj4gICBUZWNobmlj
YWxseSBjb3VsZCBnbyBhcyBmYXIgYXMgY2hlY2tpbmcgdGhlIGVjYyBzdHJlbmd0aFsxXSBhbmQg
YWxzbwo+ICAgbWVyZ2UgaW4gdzI1bjAxa3Zfb29ibGF5b3V0X2VjYyAodmFyaWFibGUgZWNjIGxl
bmd0aC9vZmZzZXQgc3RlcCksCj4gICB0aGVuIGlmIHdlJ3JlIGdyZWVkeSBhbHNvIGhhbmRsZSBv
b2JzaXplID09IDY0IHRvIHJlcGxhY2UKPiAgIHcyNW0wMmd2X29vYmxheW91dF9lY2MvdzI1bTAy
Z3Zfb29ibGF5b3V0X2ZyZWUsIGJ1dCB0aGF0J3Mgc3RhcnRpbmcgdG8KPiAgIG1ha2UgdGhlIGZ1
bmN0aW9ucyBtb3JlIGNvbXBsZXggdGhhbiBJJ20gY29uZmlkZW50IGluLi4uIDopCj4gICBbMV0g
bXRkX3RvX25hbmRkZXYobXRkKS0+ZWNjcmVxLnN0cmVuZ3RoCj4gKQoKVXAgdG8geW91IDopCgo+
IChBbmQgaW4gdGhhdCBjYXNlIEknbGwgaGFwcGlseSBnaXZlIHVwIG9uIHRoZSBub24tRUNDIGRp
c3RpbmN0aW9uIGFuZAo+IGtlZXAgdGhlIGN1cnJlbnQgYmVoYXZpb3IgdGhhdCBleHBvc2VzIHRo
ZSBub24tcHJvdGVjdGVkIGJpdHMpCj4KPj4gPiBUaGF0IGFzaWRlOgo+PiA+IC0gQWxhbSwgd291
bGQgeW91IGxpa2UgeW91ciBuYW1lIHNvbWV3aGVyZSBpbiB0aGUgY29tbWl0PyBJIGRpZG4ndCBr
ZWVwCj4+ID4gICBhbnl0aGluZyBmcm9tIHlvdXIgY29tbWl0IGJlY2F1c2UgSSBhbHJlYWR5IGhh
ZCBvbmUsIGJ1dCBoYXBweSB0byBhZGQKPj4gPiAgIGEgQ28tZGV2ZWxvcGVkLWJ5IG9yIHNvbWV0
aGluZwo+PiA+IC0gSSBrZXB0IE5BTkRfRUNDUkVRKDgsIDUxMikgbGlrZSBXMjVOMDRLVyBidXQg
dGhlIGRhdGFzaGVldCBzYXlzIGl0J3MKPj4gPiAgIGJhc2VkIG9uIDgtYml0cy81NDQtYnl0ZXMg
RUNDLCBzbyBJIHNob3VsZCBzZXQgaXQgYXMgKDgsIDU0NCk/Cj4+IAo+PiBObywgd2UgYXJlIHBy
b3RlY3RpbmcgNTEyIGJ5dGVzIG9mIGRhdGEuIDU0NCBpcyB0aGUgYXJlYSBpbmNsdWRpbmcgYnl0
ZXMKPj4gdXNlZCBmb3IgdGhlIEVDQyBvcGVyYXRpb24gaXRzZWxmIGFuZCB3ZSBhcmUgbm90IGlu
dGVyZXN0ZWQgYnkgdGhvc2UgaW4KPj4gdGhpcyBmaWVsZC4KPgo+IFRoZXJlJ3MgYWxzbyB0aGUg
MTIgYnl0ZXMgaW4gInVzZXIgZGF0YSBJIiwgYnV0IEkgYWdyZWUgaXQncyBwcm9iYWJseQo+IGZp
bmUgdG8gaWdub3JlIGhlcmUuCj4gbmFuZGJpdGVycnMgcGFzc2VzLCBzbyBJJ2xsIGxlYXZlIGl0
IGFzIGlzLgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMS44L3NvdXJjZS9p
bmNsdWRlL2xpbnV4L210ZC9uYW5kLmgjTDE4NwpJdCBpcyBub3QgdmVyeSBjbGVhciwgYnV0IHRo
aXMgbWFjcm8gaXMgYWJvdXQgdGhlIG1haW4gZGF0YSAoImJ5dGVzIHBlciBzdGVwIikuCgo+PiA+
IC0gSSdsbCBzaGFtZWZ1bGx5IGFkbWl0IEkgZG8gbm90IHVuZGVyc3RhbmQgdGhlIHJlYWQgLyB3
cml0ZSAvCj4+ID4gICB1cGRhdGVfY2FjaGVfdmFyaWFudHMoKSBJIGNvcGllZCBmcm9tIEtXLAo+
PiA+ICAgQWxhbSBoYWQgdGhlIHNhbWUgYnV0IGl0J2QgYmUgZ3JlYXQgdG8gY29uZmlybSB1c2lu
ZyB0aGUgc2FtZQo+PiA+ICAgY2FsbGJhY2tzIG1ha2VzIHNlbnNlPwo+PiAKPj4gVGhlcmUgYXJl
IHZhcmlvdXMgb3BlcmF0aW9ucyBhdmFpbGFibGUgZm9yIEkvT3MuIERlcGVuZGluZyBvbiB0aGUg
c3BpCj4+IGNvbnRyb2xsZXIgY2FwYWJpbGl0eSBhbmQgdGhlIHJvdXRpbmcgYXQgdGhlIGJvYXJk
IGxldmVsLCB5b3UgbWlnaHQgd2FudAo+PiB0byB1c2Ugc2luZ2xlLCBkdWFsLCBxdWFkLCBkdHIg
b3Igbm90IHRyYW5zZmVycy4gQW5kIGRlcGVuZGluZyBvbiB0aGUKPj4gc3BlZWQgeW91IG1heSBu
ZWVkIGV4dHJhIGR1bW15IGN5Y2xlcy4gQWxsIG9mIHRoaXMgaXMgY2FwdHVyZWQgaW4gdGhpcwo+
PiBhcnJheS4KPgo+IE9rLCBzbyBJIG91Z2h0IHRvIGNoZWNrIHRoYXQgZS5nLgo+IFNQSU5BTkRf
UEFHRV9SRUFEX0ZST01fQ0FDSEVfMVNfNFNfNFNfT1Agc3RpbGwgbmVlZHMgMiBkdW1teSBvcAo+
IGRlbGF5Pwo+IChJIGNvdWxkbid0IGZpbmQgdGhlIF8xU180U180U18gbWVhbmluZyBleHBsYWlu
ZWQgYW55d2hlcmUsIGJ1dCBsb29raW5nCj4gYXQgdGhlIGNvbW1hbmRzIHVzZWQgdGhlIG51bWJl
ciBpcyB0aGUgbnVtYmVyIG9mIGxpbmVzIHVzZWQgZm9yIHRoZQo+IGNvbW1hbmQgaW5zdHJ1Y3Rp
b24gaXRzZWxmLCB0aGUgY29sdW1uIGFkZHJlc3MgYW5kIHRoZSBkYXRhIGl0c2VsZj8KClllcy4K
CkR1bW15IHdpZHRoIGlzIHRoZSBzYW1lIGFzIGFkZHJlc3Mgd2lkdGggQlRXLgoKPiB0aGUgZGF0
YXNoZWV0IGRvZXNuJ3Qgc2VlbSB0byBoYW5kbGUgYW55IGNvbW1hbmQgd2l0aCBhICpEIHNvIEkn
bGwKPiBpZ25vcmUgdGhlIFMvRC4uLikKClNEUiB2cyBEVFIuIFlvdSBjaGlwIG1heSBvciBtYXkg
bm90IHN1cHBvcnQgaXQuCgpHb29kIGx1Y2shCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
