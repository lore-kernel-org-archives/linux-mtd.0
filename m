Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0916DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 08:21:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B96A961B49
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 08:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B96A961B49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoTPbsGBE0p+UzFUHkAhYzbdKHlHihAN3zB0Gvdm5co=; b=JHF0/fILXokfcv
	ZPYgsrEiaUofo6JUkTFV0j7sBVYefFQaCaLaflA6DbAPtL2tO2QT/ppfiLQRKPF8ctd5XThGsOoNB
	JiJBEfCxvA8++mhM/wuW0QABtWFXG+rtKaE4OuoXnjMNRgz5jRG2vikQrnhx0v+gVw7UtC3na7SoG
	K1M6BMaZYdDJ88I66VNoT1S2j5hL1X5ksFr7eFCqerw0AMccok1wm5XnIVLfzGkCNoQGrJA5KNm47
	1drTMPhHKj19OvF3G0DODkHy4BS+5QBd4+pOuWWRfsEzP2lGiYmAiJw+GT+W+wp7wXfsY6cB+ZkPD
	skY1QPp32G9lDHSAihiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmtiN-000fwW-Cv; Tue, 16 Nov 2021 08:21:15 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmtiK-000fvH-BE
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 08:21:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4C7AEE0012;
 Tue, 16 Nov 2021 08:21:07 +0000 (UTC)
Date: Tue, 16 Nov 2021 09:21:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Mark Brown
 <broonie@kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek
 <monstr@monstr.eu>
Subject: Re: [RFC PATCH 1/3] spi: dt-bindings: Allow describing flashes with
 two CS
Message-ID: <20211116092105.008432b8@xps13>
In-Reply-To: <CAL_JsqL5A3RfvzRy+7+9OhyPv8sdU1ars2Jso-RyhDwrUqMb2A@mail.gmail.com>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
 <20211112152411.818321-2-miquel.raynal@bootlin.com>
 <CAL_JsqL5A3RfvzRy+7+9OhyPv8sdU1ars2Jso-RyhDwrUqMb2A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_002112_545812_C051C759 
X-CRM114-Status: GOOD (  25.99  )
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

SGkgUm9iLAoKcm9iaCtkdEBrZXJuZWwub3JnIHdyb3RlIG9uIEZyaSwgMTIgTm92IDIwMjEgMTA6
NTI6NDQgLTA2MDA6Cgo+IE9uIEZyaSwgTm92IDEyLCAyMDIxIGF0IDk6MjQgQU0gTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIFhpbGlu
eCBRU1BJIGNvbnRyb2xsZXIgaGFzIHR3byBhZHZhbmNlZCBtb2RlcyB3aGljaCBhbGxvdyB0aGUK
PiA+IGNvbnRyb2xsZXIgdG8gYmVoYXZlIGRpZmZlcmVudGx5IGFuZCBjb25zaWRlciB0d28gZmxh
c2hlcyBhcyBvbmUgc2luZ2xlCj4gPiBzdG9yYWdlLgo+ID4KPiA+IE9uZSBvZiB0aGVzZSB0d28g
bW9kZXMgaXMgcXVpdGUgY29tcGxleCB0byBzdXBwb3J0IGZyb20gYSBiaW5kaW5nIHBvaW50Cj4g
PiBvZiB2aWV3IGFuZCBpcyB0aGUgZHVhbCBwYXJhbGxlbCBtZW1vcmllcy4gSW4gdGhpcyBtb2Rl
LCBlYWNoIGJ5dGUgb2YKPiA+IGRhdGEgaXMgc3RvcmVkIGluIGJvdGggZGV2aWNlczogdGhlIGV2
ZW4gYml0cyBpbiBvbmUsIHRoZSBvZGQgYml0cyBpbgo+ID4gdGhlIG90aGVyLiBUaGUgc3BsaXQg
aXMgYXV0b21hdGljYWxseSBoYW5kbGVkIGJ5IHRoZSBRU1BJIGNvbnRyb2xsZXIgYW5kCj4gPiBp
cyB0cmFuc3BhcmVudCBmb3IgdGhlIHVzZXIuCj4gPgo+ID4gVGhlIG90aGVyIG1vZGUgaXMgc2lt
cGxlciB0byBzdXBwb3J0LCBpdCBpcyBjYWxsZWQgZHVhbCBzdGFja2VkCj4gPiBtZW1vcmllcy4g
VGhlIGNvbnRyb2xsZXIgc2hhcmVzIHRoZSBzYW1lIFNQSSBidXMgYnV0IGVhY2ggb2YgdGhlIGRl
dmljZXMKPiA+IGNvbnRhaW4gaGFsZiBvZiB0aGUgZGF0YS4gT25jZSBpbiB0aGlzIG1vZGUsIHRo
ZSBjb250cm9sbGVyIGRvZXMgbm90Cj4gPiBmb2xsb3cgQ1MgcmVxdWVzdHMgYnV0IGluc3RlYWQg
aW50ZXJuYWxseSB3aXJlcyB0aGUgdHdvIENTbGV2ZWxzIHdpdGgKPiA+IHRoZSB2YWx1ZSBvZiB0
aGUgbW9zdCBzaWduaWZpY2FudCBhZGRyZXNzIGJpdC4KPiA+Cj4gPiBTdXBwb3J0aW5nIHRoZXNl
IHR3byBtb2RlcyB3aWxsIGludm9sdmUgY29yZSBjaGFuZ2VzIHdoaWNoIGluY2x1ZGUgdGhlCj4g
PiBwb3NzaWJpbGl0eSBvZiBwcm92aWRpbmcgdHdvIENTIGZvciBhIHNpbmdsZSBTUEkgZGV2aWNl
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3Mvc3BpL3NwaS1jb250cm9sbGVyLnlh
bWwgICAgICAgICAgfCAgNiArKy0tLSAgCj4gCj4gTmVlZHMgdG8gZ28gdG8gZHQgbGlzdC4uLgo+
IAo+ID4gIHNjcmlwdHMvZHRjL2NoZWNrcy5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI0
ICsrKysrKysrKysrKy0tLS0tLS0gIAo+IAo+IFdlIGRvbid0IHRha2UgY2hhbmdlcyB0byBkdGMg
aW4gdGhlIGtlcm5lbC4gSXQgbXVzdCBnbyB0byB1cHN0cmVhbQo+IGZpcnN0IGFuZCB0aGVuIHdl
IHN5bmMgaXQuCj4gCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sCj4gPiBpbmRleCA4MjQ2ODkxNjAy
ZTcuLjUxODc3YjYzN2JmZSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zcGkvc3BpLWNvbnRyb2xsZXIueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sCj4gPiBAQCAtMjAs
NyArMjAsNyBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICBwYXR0ZXJuOiAiXnNwaShALip8LVswLTlh
LWZdKSokIgo+ID4KPiA+ICAgICIjYWRkcmVzcy1jZWxscyI6Cj4gPiAtICAgIGVudW06IFswLCAx
XQo+ID4gKyAgICBlbnVtOiBbMCwgMSwgMl0gIAo+IAo+IEEgc2luZ2xlICdkZXZpY2UnIHdpdGgg
MiBjaGlwLXNlbGVjdHMgd291bGQgYmUgMiAncmVnJyBlbnRyaWVzLCBub3QgMgo+IGFkZHJlc3Mg
Y2VsbHMuIDIgYWRkcmVzcyBjZWxscyB3b3VsZCBiZSBhIGNoaXAtc2VsZWN0IHBsdXMgc29tZSBv
dGhlcgo+IGRhdGEgbmVlZGVkIHRvIGFjY2VzcyB0aGUgZGV2aWNlLiBTb3VuZHMgbGlrZSB5b3Vy
IGNhc2UgaXMgdGhlIGZvcm1lci4KCk9oIHllYWggSSBnb3QgY29uZnVzZWQgd2hpbGUgcGxheWlu
ZyB3aXRoIHRoZSBkaWZmZXJlbnQgdG9vbHMsIGluZGVlZAp0aGlzIGNoYW5nZSBzaG91bGQgbm90
IGJlIG5lZWRlZCwgaXQncyB0aGUgbnVtYmVyIG9mICdyZWcnIGVudHJpZXMgdGhhdAp3ZSBzaG91
bGQgZXh0ZW5kLCBub3QgaXRzIGludGVybmFsIHNpemUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
