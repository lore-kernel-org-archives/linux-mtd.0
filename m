Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44BDFF8867
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evjNMqZkKlbWLdJpnbDyj3zYSjp//QuOGEs/K71zEjE=; b=mVTII6m5h+dee1
	1By0PB15d7Afy+LbF/hSUj1Z4LkHTHUrkVlOmK4mvHKT1CQ4BegA017MTOIjacprPDPskXVQcJCd6
	9azmY6GOZqVLGyBZrumv5cn0qmRZwLtduLwqg79lYlHE/Xkir1LUQCqJ4IZziVSw56EFFFdok9qgL
	KMvXW2wmFw0ECZnpcDgkObk8fcnS+AYeyH5fVyhR4HJeEf0py2rkd7975luFpS7NAmuh+1+Rfx/02
	VoldeYY4Q6oSRdXpwPyxZeo/s1mO20Of3ypJfoeEZ4xbmJehkgfyxoBI6i5y40TfAisC3j/M9gRy5
	tijk2lafIE4+OJMcxfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5wt-00000003ljO-402Y;
	Wed, 29 Apr 2026 14:31:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5ws-00000003liu-3hv6
	for linux-mtd@bombadil.infradead.org;
	Wed, 29 Apr 2026 14:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c9iwjdiY9HfxG0fPYsz/o47Tp5boM0lZqduksjt0UfQ=; b=Ctw37pcM7Lt2WnJWX8Wc2OfE7a
	w+actjxAVFsFcfVXF9FCLoKDTJmWCVRAEOwTLhGEzauWNGCd90tNu8zdS8FuwZPA/SQK52k16biBE
	VMK0DhFYKwysq0+oL5W/VQuZdm+bmxKLflUqeprg4liDT/hJkrDINyy9v0wLLbHDgegzc67Rfpe4W
	F7j4ndjt7q7pegoIZf16mwtlUCJz52XaKUOH0tR5NQSeggq2eRC2jBlkgxyEMIOjPLX6ESb+0tlHQ
	OKZJr3LzX2CekrfVvkOrFufOpnw1DoktDYpcgxTXCkO5+kEbsBIHcF5YAq1mAqQQai2TIBM2iBJwu
	SHF8kg9w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5wp-00000005XKB-3xl9
	for linux-mtd@lists.infradead.org;
	Wed, 29 Apr 2026 14:31:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6DC1B1A33DA;
	Wed, 29 Apr 2026 14:31:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 338E0601DF;
	Wed, 29 Apr 2026 14:31:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0557B10729F10;
	Wed, 29 Apr 2026 16:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777473077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c9iwjdiY9HfxG0fPYsz/o47Tp5boM0lZqduksjt0UfQ=;
	b=BwRQtTWjuP4S0+ncmYcC4KRp2moY/crlDfs0ZYChN7x3hoVW1bafofhycD0Jo3IqKaHSId
	M6Ch/gSwzl/VILP03mHTjnOFPE6R1vLZpUqpzsqE4u7kRku21Ng6eMTuumqpoOvJg3qrZR
	lt/yCmVXP4N5099nG4A0bJmRQ/HmRShj5YoP1QsFdazUSz+rI/lu1Z+M51gWeKWJxKWc7o
	AG8VYtAqsUZfgcrmdXH0TPgb0zsmIqnuqzcRsTvps0jVZVsXfEjDPtWW+ap7idAg4DsE0P
	WCeUmyth+W8U8dv6fdu/pEclYXmt+cfHH7Yhu4Df3VO5NiPIoFrCb/Jp6HLAiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Russell King <linux@armlinux.org.uk>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
In-Reply-To: <20260429-blazing-thus-c1a4eb9b6b0c@thorsis.com> (Alexander
	Dahl's message of "Wed, 29 Apr 2026 15:02:22 +0200")
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
	<20260105-at91-probe-v3-3-594013ff2965@kernel.org>
	<20260423-stoke-ocean-139dbe306256@thorsis.com>
	<20260424-worried-renewal-924d34ed945c@thorsis.com>
	<87tsswfnmy.fsf@bootlin.com>
	<20260429-lushly-greasily-c14c01c1aee8@thorsis.com>
	<87lde6cdc4.fsf@bootlin.com>
	<20260429-blazing-thus-c1a4eb9b6b0c@thorsis.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 29 Apr 2026 16:31:16 +0200
Message-ID: <87fr4ddeiz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_153132_085601_C771DDE1 
X-CRM114-Status: GOOD (  14.38  )
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

T24gMjkvMDQvMjAyNiBhdCAxNTowMjoyMiArMDIsIEFsZXhhbmRlciBEYWhsIDxhZGFAdGhvcnNp
cy5jb20+IHdyb3RlOgoKPiBIZWxsbyBNaXF1ZWwsCj4KPiBBbSBXZWQsIEFwciAyOSwgMjAyNiBh
dCAxMTo0MjoxOUFNICswMjAwIHNjaHJpZWIgTWlxdWVsIFJheW5hbDoKPj4gSGkgQWxleGFuZGVy
LAo+PiAKPj4gPiAgICAgWyAgICAwLjk1ODI5OF0gYnVzOiAncGxhdGZvcm0nOiBhZGQgZHJpdmVy
IGF0bWVsLWViaQo+PiA+ICAgICBbICAgIDAuOTU4NDUxXSBwbGF0Zm9ybSAxMDAwMDAwMC5lYmk6
IGJ1czogJ3BsYXRmb3JtJzogX19kcml2ZXJfcHJvYmVfZGV2aWNlOiBtYXRjaGVkIGRldmljZSB3
aXRoIGRyaXZlciBhdG1lbC1lYmkKPj4gPiAgICAgWyAgICAwLjk1ODU2Nl0gcGxhdGZvcm0gMTAw
MDAwMDAuZWJpOiBlcnJvciAtRVBST0JFX0RFRkVSOiB3YWl0IGZvciBzdXBwbGllciAvYWhiL2Fw
Yi9waW5jdHJsQGZmZmZmNDAwL2ViaS9lYmktZGF0YS1sc2IKPj4gPiAgICAgWyAgICAwLjk1ODY0
OV0gcGxhdGZvcm0gMTAwMDAwMDAuZWJpOiBBZGRlZCB0byBkZWZlcnJlZCBsaXN0Cj4+ID4gICAg
IFsgICAgMC45NTk0MjldIGJ1czogJ3BsYXRmb3JtJzogcmVtb3ZlIGRyaXZlciBhdG1lbC1lYmkK
Pj4gPiAgICAgWyAgICAwLjk1OTU0MF0gZHJpdmVyOiAnYXRtZWwtZWJpJzogZHJpdmVyX3JlbGVh
c2UKPj4gCj4+IEludGVyZXN0aW5nLgo+PiAKPj4gSWYgeW91IGxvb2sgYXQgdGhlIHZlcnkgbGFz
dCBsaW5lIG9mIHRoZSBkcml2ZXIsIHRoZSBFQkkgZHJpdmVyIGRvZXMgbm90Cj4+IHVzZSBhIHN0
YW5kYXJkICJtb2R1bGVfcGxhdGZvcm1fZHJpdmVyIiBtYWNybywgaXQgdXNlcyBzb21lIGtpbmQg
b2YKPj4gcnVuLW9uY2UgcHJvYmUgdGhhdCBpcyBrZXB0IGluIGFuIF9faW5pdCBzZWN0aW9uOgo+
PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny4wLjEvc291cmNlL2RyaXZlcnMv
bWVtb3J5L2F0bWVsLWViaS5jI0w2MzcKPj4gCj4+IEFuZCB0aGlzIHNlZW1zIHRvIGJlIGluY29t
cGF0aWJsZSB3aXRoIHByb2JlIGRlZmVycmFsczoKPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjcuMC4xL3NvdXJjZS9kcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYyNMOTQ4Cj4KPiBJ
bmRlZWQuIG8uTwo+Cj4+IEkgd291bGQgc3VnZ2VzdCB0cnlpbmcgc29tZXRoaW5nIGFsb25lIHRo
ZXNlIGxpbmVzOgo+PiAKPj4gLS0tIGEvZHJpdmVycy9tZW1vcnkvYXRtZWwtZWJpLmMKPj4gKysr
IGIvZHJpdmVycy9tZW1vcnkvYXRtZWwtZWJpLmMKPj4gQEAgLTYzMyw1ICs2MzMsNiBAQCBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhdG1lbF9lYmlfZHJpdmVyID0gewo+PiAgICAgICAg
ICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gYXRtZWxfZWJpX2lkX3RhYmxlLAo+PiAgICAgICAg
ICAgICAgICAgLnBtID0gJmF0bWVsX2ViaV9wbV9vcHMsCj4+ICAgICAgICAgfSwKPj4gKyAgICAg
ICAucHJvYmUgPSBhdG1lbF9lYmlfcHJvYmUsCj4+ICB9Owo+PiAtYnVpbHRpbl9wbGF0Zm9ybV9k
cml2ZXJfcHJvYmUoYXRtZWxfZWJpX2RyaXZlciwgYXRtZWxfZWJpX3Byb2JlKTsKPj4gK2J1aWx0
aW5fcGxhdGZvcm1fZHJpdmVyKGF0bWVsX2ViaV9kcml2ZXIpOwo+PiAKPj4gTWVtb3J5IHRha2Vu
IGJ5IHRoZSBwcm9iZSBmdW5jdGlvbiB3aWxsIHJlbWFpbiBtYXBwZWQuIFRoYXQgc2VlbXMgdG8g
YmUKPj4gdGhlIGRyYXdiYWNrLgo+Cj4gVGhpcyB3b3Jrcy4gIFNlbnQgYSBwYXRjaCwgc2VlOgo+
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNDI5MTI1OTMwLjg0NDc5MC0xLWFk
YUB0aG9yc2lzLmNvbS8KPgo+IFJlZ2FyZGluZyB0aGUgZHJhd2JhY2s6IFRoaXMgY2FuJ3QgYmUg
bXVjaCBtZW1vcnksIGNhbiBpdD8KCkkgZ3Vlc3MgaXQgaXMgcHJlZmVyYWJsZSB0byBoYXZlIHRo
ZSBwcm9iZSBtYXBwZWQgYXQgdGhlIGNvc3Qgb2YgYSBmZXcKaHVuZHJlZCBtb3JlIFJBTSBieXRl
cyB0aGFuIGEgYnJpY2suLi4KCkdvb2QgdG8ga25vdyB0aGF0IHRoaXMgZml4ZWQgeW91ciBwcm9i
bGVtLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
