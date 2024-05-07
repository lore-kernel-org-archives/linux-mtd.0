Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18A2C25B4F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JYLIYOCbUIj6XXyDL42ZaWZ3jJbWVraN+XZza5xIjQ=; b=09oEv2PR0of4RF
	2b/oHNCTF40iEIO7/omAixCAlN0TCUpWHRVqUtELVtsfnewzRvvbF67K2lWrW6ckEt3jgM8LwxDyy
	UgVdp7PXzqK6j0vb4p7cfpjpmEEVxfygzDuUacIPwWPlO3LD9zwN1E1txlG9wqCJw6giVwqFyCXTY
	0QsBuFWhyH81MGPOycmI/2a9SrttiBfsnwGtpMY0xFdjvlYw8lDCUpIHOnRJXfglHG9wLUiKnptFi
	1KjhjY0Bez4ITN+aNSULk4nixFIfxiu6BiKXNJwDDZZn2gIl5t2NiVdvKXgArypud+rJpP9gGM4V5
	p1nV8ydSxYBXDjiKkBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NMc-0000000Bt06-0Jkt;
	Tue, 07 May 2024 16:08:22 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NMY-0000000BsvI-2pai
	for linux-mtd@lists.infradead.org;
	Tue, 07 May 2024 16:08:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 400BA40008;
	Tue,  7 May 2024 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715098094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Au/FiLdAQaAOsRhiET0hvMShuZ2QUAjnOph/Boy0Bac=;
	b=Nhu90y+ggrRiJZOWgA9+81iLbHXVKouSI2xtpwoKiv2mcpXuoeoWl4rqBuNxVY2N7lRToi
	uTobBq6ctV8IifvKnjhDWQKqpKMYz4SFIbjX1qjSbFMKkKlP5nrfNgSqXKraG2jPZkNz5d
	0sB/nMTHriyCXIl8p1svz2KhyD4KSbkLupWQD6RKEHEdQF2NoCP2JJu5UfoZ5DHS+o26Cy
	i/mJxjnujc0fqhAGHJe6lDrU8tcjrhdaWMx02Xv69dd3oBwXVcwmGjAOoEkYOo17xw65fv
	d8bAU6s56KpGQBKOecN6xq0EncJYMT79Dg2eodTUMgAN+yZRLIFVI3X1QdVRkQ==
Date: Tue, 7 May 2024 18:08:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "ada@thorsis.com" <ada@thorsis.com>
Cc: Steven Seeger <steven.seeger@flightsystems.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>
Subject: Re: NAND parameter page read fails with bitflip and no column
 change support
Message-ID: <20240507180812.42c588b3@xps-13>
In-Reply-To: <20240411-candied-plod-8e55373d63cd@thorsis.com>
References: <mailman.25709.1712772710.1280.linux-mtd@lists.infradead.org>
	<DM6PR05MB4506C6DFD7ED777C5896B83BF7062@DM6PR05MB4506.namprd05.prod.outlook.com>
	<20240411-candied-plod-8e55373d63cd@thorsis.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_090819_022424_84E74F82 
X-CRM114-Status: GOOD (  26.56  )
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

SGVsbG8sCgphZGFAdGhvcnNpcy5jb20gd3JvdGUgb24gVGh1LCAxMSBBcHIgMjAyNCAxMDo1Mjo0
OCArMDIwMDoKCj4gSGVsbG8gU3RldmVuLCBNaXF1ZWwsCj4gCj4gQW0gV2VkLCBBcHIgMTAsIDIw
MjQgYXQgMDY6NDU6NThQTSArMDAwMCBzY2hyaWViIFN0ZXZlbiBTZWVnZXI6Cj4gPiA+SSBoYWQg
cmVhY2hlZCBvdXQgdG8gTWlxdWVsIHByaXZhdGVseSB3aXRoIHRoaXMgaXNzdWUsIG9ubHkgZHVl
IHRvIHRoZSBkZXNpcmUgdG8KPiA+ID5oZWxwIGluZm9ybSBtYWludGFpbmVycyBvZiB0aGUgaXNz
dWUuIEkgd2FzIHRvbyBidXN5IGF0IHRoZSB0aW1lIHRvIGpvaW4gdGhlIGxpc3QKPiA+ID5hbmQg
d3JpdGUgdXAgc29tZXRoaW5nIG1vcmUgZm9ybWFsLiBNaXF1ZWwgcHJvdmlkZWQgYSBzbWFsbCBw
YXRjaCBmb3IgbWUKPiA+ID50aGF0IGRpZCBub3Qgd29yayBhdCB0aGUgdGltZSwgYW5kIHRoZW4g
SSBsb3N0IGFjY2VzcyB0byB0aGUgYm9hcmQgZm9yIGEgd2hpbGUuCj4gPiA+Tm93IEkgaGF2ZSBh
IGxpdHRsZSB0aW1lIGFuZCBhIGJvYXJkLCBzbyBJIGFtIGhlcmUgdG8gcmVwb3J0IHRoZSBpc3N1
ZSBhbmQgbWFrZSBpdCBwdWJsaWMuICAKPiA+IAo+ID4gSSB0cmllZCB0aGUgcGF0Y2ggZnJvbSBN
aXF1ZWwgYmFjayBpbiBGZWJydWFyeSBhbmQgaXQgd29ya3MgY29ycmVjdGx5IHdpdGggNi42LjEy
Cj4gPiBhbmQgbXkgb2xkZXIgZHJpdmVyIHdpdGhvdXQgY29sdW1uIGNoYW5nZSBzdXBwb3J0Lgo+
ID4gCj4gPiBIZXJlIGlzIGggaXMgcGF0Y2ggZm9yIHJlZmVyZW5jZToKPiA+IAo+ID4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfYmFzZS5jCj4gPiBAQCAtMjEyMyw3ICsyMTIzLDcgQEAgRVhQT1JUX1NZTUJP
TF9HUEwobmFuZF9yZXNldF9vcCk7Cj4gPiAgaW50IG5hbmRfcmVhZF9kYXRhX29wKHN0cnVjdCBu
YW5kX2NoaXAgKmNoaXAsIHZvaWQgKmJ1ZiwgdW5zaWduZWQgaW50IGxlbiwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICBib29sIGZvcmNlXzhiaXQsIGJvb2wgY2hlY2tfb25seSkKPiA+ICB7Cj4g
PiAtICAgICAgIGlmICghbGVuIHx8ICFidWYpCj4gPiArICAgICAgIGlmICghbGVuIHx8ICghY2hl
Y2tfb25seSAmJiAhYnVmKSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+
ICAKPiA+ICAgICAgICAgaWYgKG5hbmRfaGFzX2V4ZWNfb3AoY2hpcCkpIHsgIAo+IAo+IExvb2tp
bmcgYXQgdGhlIGNvbnRleHQgYWthIHRoZSB3aG9sZSBmdW5jdGlvbiBuYW5kX3JlYWRfZGF0YV9v
cCgpIHRoaXMKPiBsb29rcyBmaW5lLiAgSSBoYWQgcmVwb3J0ZWQgdGhlIHNhbWUgaXNzdWUgaW4g
TWFyY2gsIHJlZmVyZW5jaW5nIHRoZQo+IHNhbWUgY29tbWl0IDlmODIwZmMwNjUxYyAoIm10ZDog
cmF3bmFuZDogQ2hlY2sgdGhlIGRhdGEgb25seSByZWFkCj4gcGF0dGVybiBvbmx5IG9uY2UiKSB5
b3UgbWVudGlvbmVkIGluIHlvdXIgb3RoZXIgbWFpbDoKPiAKPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tdGQvMjAyNDAzMDctcGFudHJ5LWRlY2VpdC03OGNlMjBmNDc4OTlA
dGhvcnNpcy5jb20vCj4gCj4gV2l0aCBuYW5kX3JlYWRfZGF0YV9vcCgpIGZpeGVkIGluIG5hbmRf
b25maV9kZXRlY3QoKSB0aGUgYm9vbGVhbgo+IGB1c2VfZGF0YWluYCBpcyB0cnVlIG5vdyBpbnN0
ZWFkIG9mIGZhbHNlIChiZWNhdXNlCj4gcmF3bmFuZF9jaGVja19kYXRhX29ubHlfcmVhZF9zdXBw
b3J0KCkgY2FsbHMgdGhhdCBmdW5jdGlvbiwgdG9vKS4gIFNvCj4gaW4gbmFuZF9vbmZpX2RldGVj
dCgpIGNvZGUganVtcHMgdG8gbmFuZF9yZWFkX2RhdGFfb3AoKSBpbiB0aGUgc2Vjb25kCj4gbG9v
cCBydW4gbm93IGluc3RlYWQgb2YgbmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AoKSB3aGljaCBw
cm9iYWJseQo+IG1hc2tzIHRoYXQgb3RoZXIgcHJvYmxlbSB3aXRoIG10ZC0+d3JpdGVzaXplIG5v
dCBzZXQgbWVudGlvbmVkIGluIG91cgo+IGVhcmxpZXIgZGlzY3Vzc2lvbi4KPiAKPiBMb25nIHN0
b3J5IHNob3J0OiB0aGUgZGlmZiBhYm92ZSBpbiBpdHNlbGYgc2VlbXMgY29ycmVjdCB0byBtZS4g
IEEKPiB0ZXN0IHdpdGggdGhhdCBmaXggYXBwbGllZCBvbiBvdXIgc2FtOXg2MCBib2FyZCB1c2lu
Zwo+IG5hbmRfc29mdF93YWl0cmR5IGluc3RlYWQgb2YgUkIjIGdwaW8gc3VjY2Vzc2Z1bGx5IGdl
dHMgT05GSSBwYXJhbQo+IHBhZ2UgMSB3aXRoIG5hbmRfcmVhZF9kYXRhX29wKCkgYWZ0ZXIgZ2V0
dGluZyBPTkZJIHBhcmFtIHBhZ2UgMCB3aXRoCj4gbmFuZF9yZWFkX3BhcmFtX3BhZ2Vfb3AoKSBm
YWlsZWQuCj4gCj4gWW91IHNhaWQgdGhpcyBpcyBhIHBhdGNoL2RpZmYgZnJvbSBNaXF1ZWwuICBN
aXF1ZWwgZG8geW91IHNlbmQgdGhpcwo+IGFzIGEgcHJvcGVyIHBhdGNoIHRoZW4sIG9yIHNob3Vs
ZCBzb21lb25lIGVsc2U/Cj4gCj4gR3JlZXRzCj4gQWxleAo+IAo+IFAuUy46IHN0aWxsIGJ1c3kg
d2l0aCBvdGhlciB0aGluZ3MsIG5vIHRpbWUgeWV0IGZvciBwcm9wZXIgdGltaW5nCj4gYW5hbHlz
aXMgb2Ygb3VyIG90aGVyIE5BTkQgZmxhc2ggcHJvYmxlbXMgd2l0aCBsb2dpYyBhbmFseXplciBl
dGMuCj4gCgpTb3JyeSBmb3IgdGhlIGRlbGF5LCBoZXJlIGlzIHRoZSBwcm9wb3NhbCBmb3IgZml4
aW5nIHRoaXMgbWVzczoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjQwNTA3
MTYwNTQ2LjEzMDI1NS0xLW1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20vVC8jdAoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
