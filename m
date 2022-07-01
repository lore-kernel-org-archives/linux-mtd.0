Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FDEC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Jul 2022 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y6c+L74Pj87xTKNwwLJ0PMEVWsCNyoroVdgJaySsu4=; b=HU7gDMT6Wx4DE2
	lN86ZiILYibcGLIP4watIGiQsFhMslfge8oenartCx1Jv4wmYU7B3WnvpaFViBLRKMLWfGMgBfK5z
	lJH7IZpcG4+RxrApLFieFYbnIt6pXJweky8PF8aE0aRJYB8ZwC+8BECoj+dGpqrQ7D13lGJd0H7vM
	mPRfp31eSSn4+kKYqtaMjPHMmM4y5T1mbFcZyhZKIUjKCkVLxKidsoLLkQYLAtdnp8KarJN8VsTAV
	xZRQGy1uRhYdfWnXdFcKt9ily1AFONxwrpkBDHjyK+5UjKw9JD8jsXY9B/S+zt0AmAOti75sV3bUL
	ETcLuho/HNjnS2Wvj/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7DG0-003w8P-5A; Fri, 01 Jul 2022 09:48:12 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7DFv-003w4e-Ht
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2022 09:48:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 36B3A1BF210;
	Fri,  1 Jul 2022 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656668880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyTxDhBLFffQoAQWpdfCYpKV1FuXiRgegvXhr3OWAi8=;
	b=DS5umpkO4oDSUNKUhvNDfOFicRck4JdLt3CN+ooR4SIUqXtUjEVMv33hVwrM7nT/qbDZM1
	udhIGliEnb/lPObkrApb2Z9jGSt8hTq4NQGRhjaypgeXwea4ILwEyJTKaei9dkPmXAni6F
	lzRgxsakdpcLRKwjm8zQy3Tk9LYyPa6jVhJtErdnSJFLwDYaJn3GeJIXUGCu6sEZl0gqzu
	3lekSwH9WRnKUHwdKJZTpyhsncAvZ93AQoC0d6++IAECLetM85H79Ug1zR2V0GlYA0ZNgS
	pfGVe47GaJXcMrD8n2LCi4+uelmc0qbgX+4YtHeGPYrXS/Xu+L32oPDaKNcA6A==
Date: Fri, 1 Jul 2022 11:47:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 kernel@pengutronix.de, stable@vger.kernel.org, richard@nod.at
Subject: Re: [PATCH] [REALLY REALLY BROKEN] mtd: rawnand: gpmi: Fix setting
 busy timeout setting
Message-ID: <20220701114756.467f8a03@xps-13>
In-Reply-To: <20220701091909.GE2387@pengutronix.de>
References: <20220614083138.3455683-1-s.hauer@pengutronix.de>
	<20220701091909.GE2387@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_024807_980485_72F6D3E6 
X-CRM114-Status: GOOD (  33.21  )
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

SGkgU2FzY2hhLAoKKyBSaWNoYXJkCgpzLmhhdWVyQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIEZy
aSwgMSBKdWwgMjAyMiAxMToxOTowOSArMDIwMDoKCj4gT24gVHVlLCBKdW4gMTQsIDIwMjIgYXQg
MTA6MzE6MzhBTSArMDIwMCwgU2FzY2hhIEhhdWVyIHdyb3RlOgo+ID4gVGhlIERFVklDRV9CVVNZ
X1RJTUVPVVQgdmFsdWUgaXMgZGVzY3JpYmVkIGluIHRoZSBSZWZlcmVuY2UgTWFudWFsIGFzOgo+
ID4gCj4gPiB8IFRpbWVvdXQgd2FpdGluZyBmb3IgTkFORCBSZWFkeS9CdXN5IG9yIEFUQSBJUlEu
IFVzZWQgaW4gV0FJVF9GT1JfUkVBRFkKPiA+IHwgbW9kZS4gVGhpcyB2YWx1ZSBpcyB0aGUgbnVt
YmVyIG9mIEdQTUlfQ0xLIGN5Y2xlcyBtdWx0aXBsaWVkIGJ5IDQwOTYuCj4gPiAKPiA+IFNvIGlu
c3RlYWQgb2YgbXVsdGlwbHlpbmcgdGhlIHZhbHVlIGluIGN5Y2xlcyB3aXRoIDQwOTYsIHdlIGhh
dmUgdG8KPiA+IGRpdmlkZSBpdCBieSB0aGF0IHZhbHVlLiBVc2UgRElWX1JPVU5EX1VQIHRvIG1h
a2Ugc3VyZSB3ZSBhcmUgb24gdGhlCj4gPiBzYWZlIHNpZGUsIGVzcGVjaWFsbHkgd2hlbiB0aGUg
Y2FsY3VsYXRlZCB2YWx1ZSBpbiBjeWNsZXMgaXMgc21hbGxlcgo+ID4gdGhhbiA0MDk2IGFzIHR5
cGljYWxseSB0aGUgY2FzZS4KPiA+IAo+ID4gVGhpcyBidWcgbGlrZWx5IG5ldmVyIHRyaWdnZXJl
ZCBiZWNhdXNlIGFueSB0aW1lb3V0ICE9IDAgdXN1YWxseSB3aWxsCj4gPiBkby4gSW4gbXkgY2Fz
ZSB0aGUgYnVzeSB0aW1lb3V0IGluIGN5Y2xlcyB3YXMgb3JpZ2luYWxseSBjYWxjdWxhdGVkIGFz
Cj4gPiAyNDA4LCB3aGljaCBtdWx0aXBsaWVkIHdpdGggNDA5NiBpcyAweDk2ODAwMC4gVGhlIGxv
d2VyIDE2IGJpdHMgd2VyZQo+ID4gdGFrZW4gZm9yIHRoZSAxNiBiaXQgd2lkZSByZWdpc3RlciBm
aWVsZCwgc28gdGhlIHJlZ2lzdGVyIHZhbHVlIHdhcwo+ID4gMHg4MDAwLiBXaXRoIDI5NzBiZjVh
MzJmMCAoIm10ZDogcmF3bmFuZDogZ3BtaTogZml4IGNvbnRyb2xsZXIgdGltaW5ncwo+ID4gc2V0
dGluZyIpIGhvd2V2ZXIgdGhlIHZhbHVlIGluIGN5Y2xlcyBiZWNhbWUgMjM4NCwgd2hpY2ggbXVs
dGlwbGllZAo+ID4gd2l0aCA0MDk2IGlzIDB4OTUwMDAwLiBUaGUgbG93ZXIgMTYgYml0IGFyZSAw
eDAgbm93IHJlc3VsdGluZyBpbiBhbgo+ID4gaW50ZXJtZWRpYXRlIHRpbWVvdXQgd2hlbiByZWFk
aW5nIGZyb20gTkFORC4KPiA+IAo+ID4gRml4ZXM6IGIxMjA2MTIyMDY5YWEgKCJtdGQ6IHJhd25h
bmQ6IGdwbWk6IHVzZSBjb3JlIHRpbWluZ3MgaW5zdGVhZCBvZiBhbiBlbXBpcmljYWwgZGVyaXZh
dGlvbiIpCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTog
U2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+ID4gLS0tCj4gPiAKPiA+IEp1
c3QgYSByZXNlbmQgd2l0aCArQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IAo+ID4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8IDIgKy0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+ID4gaW5kZXggMGI2OGQwNTg0
NmUxOC4uODg5ZTQwMzI5OTU2OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bt
aS1uYW5kL2dwbWktbmFuZC5jCj4gPiBAQCAtODkwLDcgKzg5MCw3IEBAIHN0YXRpYyBpbnQgZ3Bt
aV9uZmNfY29tcHV0ZV90aW1pbmdzKHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcywKPiA+ICAJ
aHctPnRpbWluZzAgPSBCRl9HUE1JX1RJTUlORzBfQUREUkVTU19TRVRVUChhZGRyX3NldHVwX2N5
Y2xlcykgfAo+ID4gIAkJICAgICAgQkZfR1BNSV9USU1JTkcwX0RBVEFfSE9MRChkYXRhX2hvbGRf
Y3ljbGVzKSB8Cj4gPiAgCQkgICAgICBCRl9HUE1JX1RJTUlORzBfREFUQV9TRVRVUChkYXRhX3Nl
dHVwX2N5Y2xlcyk7Cj4gPiAtCWh3LT50aW1pbmcxID0gQkZfR1BNSV9USU1JTkcxX0JVU1lfVElN
RU9VVChidXN5X3RpbWVvdXRfY3ljbGVzICogNDA5Nik7Cj4gPiArCWh3LT50aW1pbmcxID0gQkZf
R1BNSV9USU1JTkcxX0JVU1lfVElNRU9VVChESVZfUk9VTkRfVVAoYnVzeV90aW1lb3V0X2N5Y2xl
cywgNDA5NikpOyAgCj4gCj4gVGhpcyBwYXRjaCBpcyBicm9rZW4uIFRoZSBjaGFuZ2UgaXRzZWxm
IGlzIGZpbmUsIGJ1dCBidXN5X3RpbWVvdXRfY3ljbGVzCj4gaXMgY2FsY3VsYXRlZCB3cm9uZy4K
PiAKPiBidXN5X3RpbWVvdXRfY3ljbGVzIGlzIGNhbGN1bGF0ZWQgYmFzZWQgb24gc2RyLT50Ul9t
YXggd2hpY2ggaXMgdGhlIHBhZ2UKPiByZWFkIHRpbWUuIFRoaXMgdGltZW91dCBpcyBhbHNvIHVz
ZWQgZm9yIHRoZSBwYWdlIHByb2dyYW0gYW5kIGJsb2NrCj4gZXJhc2Ugb3BlcmF0aW9ucyB3aGlj
aCBoYXZlIG9yZGVycyBvZiBtYWduaXR1ZGUgYmlnZ2VyIHRpbWVvdXRzLiBUaGlzCj4gbWVhbnMg
d2l0aCB0aGlzIHBhdGNoIHRoZSBjb250cm9sbGVyIHRpbWVzIG91dCBvbiBwYWdlcyBwcm9ncmFt
cyBhbmQKPiBibG9jayBlcmFzZSBvcGVyYXRpb25zLiBXaXRoIHRoZSBjdXJyZW50IGNvZGUgdGhp
cyB0aW1lb3V0IHdpbGwgYmUKPiBzaWxlbnQgYXMgdGhlIHRpbWVvdXQgaW50ZXJydXB0IGlzIG5v
dCBhY3RpdmUuCj4gCj4gKiogVEhJUyBQQVRDSCBXSUxMIENBVVNFIERBVEEgTE9TUyBPTiBZT1VS
IE5BTkQhISAqKgo+IAo+IEZvcnR1bmF0ZWx5IHRoaXMgcGF0Y2ggaGFzbid0IGJlZW4gaW5jbHVk
ZWQgaW4gYW55IG1haW5saW5lIHJlbGVhc2UsIGJ1dAo+IHVuZm9ydHVuYXRlbHkgaXQgc2hvd2Vk
IHVwIGluIHNldmVyYWwgc3RhYmxlIGtlcm5lbHMuIERvbid0IHVzZQo+IHY1LjQuMjAyLCB2NS4x
MC4xMjcsIHY1LjE1LjUxIG9yIHY1LjE4Ljggb24gaS5NWFs2NzhdIG9yIGkuTVgyOCBib2FyZHMK
PiB3aXRoIE5BTkQuCj4gCj4gSSBhbSBzb3JyeSBmb3IgdGhlIHRyb3VibGUgSSBoYXZlIGxpa2Vs
eSBjYXVzZWQuIEkgYW0gd29ya2luZyBvbiBhIGZpeAo+IGFuZCB3aWxsIHBvc3QgaXQgbGF0ZXIg
dGhlIGRheS4KCk9oIGNyYXAuIEp1c3QgZm9yIHRoZSByZWNvcmQgSSdtIGxlYXZpbmcgZm9yIHNl
dmVyYWwgd2Vla3MgdG9kYXksIHNvCnBsZWFzZSBkb24ndCBmb3JnZXQgdG8ga2VlcCBSaWNoYXJk
IGluIGNvcHksIGhlIHdpbGwgYXBwbHkgdGhlIGZpeCBvZgp0aGUgZml4IHdoZW4gcmVhZHkuCgpS
aWNoYXJkLCBsb29rcyBsaWtlIGEgcHJldHR5IGJ1c3kgY3ljbGUsIHNvcnJ5IGZvciBhbGwgdGhp
cyB0cm91YmxlIDotLwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
