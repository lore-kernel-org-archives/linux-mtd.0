Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6355FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Mar 2022 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4I294Gho08iUdUOXCug2prvC8Nda1ppM8aPs92O4JY=; b=2SGjY2dH+zUBT9
	bIlCCVV5Id0ETC2BxEhA/4j90210VWKHTwxjdY48AN3X2qHxUJkNfP90hog/JrKmKPQa4JkkrG6uQ
	DloQkwHXzIrkEQJtopEsvcXk29blzBA413aX6AhCTPFfPpiEmM+F4FFPb/TmeEaExaT5Q3se9bt/M
	iM3OvG4/TA/Jw8DxnxGGghfMICgqbSQkLHRoLJ5sGtBCd1sImmoVrJxv1HtO1fH1W+WrlCr72Bbtt
	P+Jp2/ZbwFysbL5c4ce+HkTJuL7igCobH2NQD4mfiCfuSlhlyFUUsbHrzTArxNwGhjeF8Qg9h0QST
	yUPJ+ump87fZbxvGsFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRW6w-003Sd2-8p; Tue, 08 Mar 2022 09:26:30 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRW6s-003Sal-Lo
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2022 09:26:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4995820000E;
 Tue,  8 Mar 2022 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646731582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryvVPl4TdU3ql0jktEpltI3IgYRpF014rqv2eBbmRuo=;
 b=RGMBEHafTdFE5z8Q02y/oKvOkNSNMavbHDBaHc+A88k/zngM/PyEQ08OcKpcUW6AjPpIwF
 9zECMjVGhBrxRLedidriyL7nlf92YV2z0rX44pWUayCb0eSC/QviS2JlrEKC0BY3KNKKMe
 WDrYPpeuU4BdpFhtCooL6EIV4nzS8vBgg6CC43MS3SPF+k+8+oSreBEYKB0yp4laJxYPzU
 nytb45OgBDB5t1POL+8EoXkbkcSvryYjOpLQ/tzwkt+q+foAH49zjNp4rJiErG2qkPud1+
 X1ahPZXJDKw3TE2lSLcgKLlIEEPi3UmcYt1qFtKKkYR3Yzr88P2MyUr01398YA==
Date: Tue, 8 Mar 2022 10:26:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck
 <linux@roeck-us.net>, krzysztof.kozlowski@canonical.com, vigneshr@ti.com,
 nm@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Message-ID: <20220308102619.71aa9e4e@xps13>
In-Reply-To: <c91edeac-817c-d30d-ae45-f216670b9e69@kernel.org>
References: <20220220004415.GA1519274@roeck-us.net>
 <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
 <20220304165451.0129012e@xps13>
 <6c09de15-1ab2-5ca8-7003-69ff3f7c4dc5@kernel.org>
 <20220307110357.20d50176@xps13>
 <c39d64f0-deef-4cae-fab7-555a48e31811@kernel.org>
 <20220307151249.7e5b7210@xps13>
 <c91edeac-817c-d30d-ae45-f216670b9e69@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_012627_093222_468E8B86 
X-CRM114-Status: GOOD (  39.39  )
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

SGkgUm9nZXIsCgpyb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDcgTWFyIDIwMjIgMjM6
MDU6NDcgKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAwNy8wMy8yMDIyIDE2OjEyLCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgUm9nZXIsCj4gPiAKPiA+IHJvZ2VycUBrZXJuZWwub3Jn
IHdyb3RlIG9uIE1vbiwgNyBNYXIgMjAyMiAxNDoyNTo0OCArMDIwMDoKPiA+ICAgCj4gPj4gSGkg
TWlxdWVsLAo+ID4+Cj4gPj4gT24gMDcvMDMvMjAyMiAxMjowMywgTWlxdWVsIFJheW5hbCB3cm90
ZTogIAo+ID4+PiBIaSBSb2dlciwKPiA+Pj4KPiA+Pj4gcm9nZXJxQGtlcm5lbC5vcmcgd3JvdGUg
b24gU2F0LCA1IE1hciAyMDIyIDAwOjUwOjE0ICswMjAwOgo+ID4+PiAgICAgCj4gPj4+PiBIaSBN
aXF1ZWwsCj4gPj4+Pgo+ID4+Pj4gT24gMDQvMDMvMjAyMiAxNzo1NCwgTWlxdWVsIFJheW5hbCB3
cm90ZTogICAgCj4gPj4+Pj4gSGkgR3VlbnRlciwgUm9nZXIsCj4gPj4+Pj4KPiA+Pj4+PiByZHVu
bGFwQGluZnJhZGVhZC5vcmcgd3JvdGUgb24gU2F0LCAyNiBGZWIgMjAyMiAyMjo1NToyOCAtMDgw
MDoKPiA+Pj4+PiAgICAgICAKPiA+Pj4+Pj4gT24gMi8xOS8yMiAxNjo0NCwgR3VlbnRlciBSb2Vj
ayB3cm90ZTogICAgICAKPiA+Pj4+Pj4+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDA5OjM2OjAw
UE0gKzAyMDAsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6ICAgICAgICAKPiA+Pj4+Pj4+PiBUaGUgcm9v
dCBvZiB0aGUgcHJvYmxlbSBpcyB0aGF0IHdlIGFyZSBzZWxlY3Rpbmcgc3ltYm9scyB0aGF0IGhh
dmUKPiA+Pj4+Pj4+PiBkZXBlbmRlbmNpZXMuIFRoaXMgY2FuIGNhdXNlIHJhbmRvbSBjb25maWd1
cmF0aW9ucyB0aGF0IGNhbiBmYWlsLgo+ID4+Pj4+Pj4+IFRoZSBjbGVhbmVzdCBzb2x1dGlvbiBp
cyB0byBhdm9pZCB1c2luZyBzZWxlY3QuCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBUaGlzIGRyaXZl
ciB1c2VzIGludGVyZmFjZXMgZnJvbSB0aGUgT01BUF9HUE1DIGRyaXZlciBzbyB3ZSBoYXZlIHRv
Cj4gPj4+Pj4+Pj4gZGVwZW5kIG9uIGl0IGluc3RlYWQuCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBG
aXhlczogNGNkMzM1ZGFlM2NmICgibXRkOiByYXduYW5kOiBvbWFwMjogUHJldmVudCBpbnZhbGlk
IGNvbmZpZ3VyYXRpb24gYW5kIGJ1aWxkIGVycm9yIikKPiA+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVsLm9yZz4gICAgICAgIAo+ID4+Pj4+Pj4KPiA+
Pj4+Pj4+IFRlc3RlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiAgICAg
ICAgCj4gPj4+Pj4+Cj4gPj4+Pj4+IFRlc3RlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+ICAgICAgCj4gPj4+Pj4KPiA+Pj4+PiBTb3JyeSBmb3Igbm90aWNpbmcgdGhh
dCBqdXN0IG5vdywgYnV0IHRoZXJlIGlzIHN0aWxsIGEgcHJvYmxlbSB3aXRoCj4gPj4+Pj4gdGhp
cyBwYXRjaDogd2Ugbm93IGFsd2F5cyBjb21waWxlLWluIHRoZSBPTUFQX0dQTUMgZHJpdmVyIHdo
ZW5ldmVyIHdlCj4gPj4+Pj4gbmVlZCB0aGUgTkFORCBjb250cm9sbGVyLCBldmVuIHRob3VnaCBp
dCBpcyBub3QgbmVlZGVkLiBUaGlzIGdyb3dzIHRoZQo+ID4+Pj4+IGtlcm5lbCBmb3Igbm8gcmVh
c29uLiAgICAgIAo+ID4+Pj4KPiA+Pj4+IFNvcnJ5LCBJIGRpZCBub3QgdW5kZXJzdGFuZCB3aGF0
IHlvdSBtZWFudC4KPiA+Pj4+Cj4gPj4+PiBXZSBubyBsb25nZXIgZXhwbGljaXRseSBlbmFibGUg
T01BUF9HUE1DIHNpbmNlIHdlIGRyb3BwZWQgdGhlICJzZWxlY3QiLgo+ID4+Pj4gVGhpcyBmaXhl
cyBhbGwgYnVpbGQgaXNzdWVzIHRoYXQgd2VyZSByZXBvcnRlZCByZWNlbnRseS4KPiA+Pj4+Cj4g
Pj4+PiBNVERfTkFORF9PTUFQMiB3aWxsIG5vdCBiZSBlbmFibGVkIGlmIE9NQVBfR1BNQyBpcyBu
b3Qgc2luY2Ugd2UgYWRkZWQKPiA+Pj4+IHRoZSAiZGVwZW5kcyBvbiIuIFRoaXMgZml4ZXMgdGhl
IG9yaWdpbmFsIGJ1aWxkIGlzc3VlIHRoYXQgd2Ugc3RhcnRlZCB0bwo+ID4+Pj4gZml4IHdpdGgg
c2VsZWN0IGluaXRpYWxseS4gICAgCj4gPj4+Cj4gPj4+IFllcywgdGhpcyBzaWRlIGlzIGZpbmUu
Cj4gPj4+Cj4gPj4+IEluIHRoZSBpbml0aWFsIGNvbW1pdCwgeW91IHByb3Bvc2VkOgo+ID4+Pgo+
ID4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPj4+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiA+Pj4gQEAgLTQyLDcgKzQyLDggQEAgY29uZmlnIE1U
RF9OQU5EX09NQVAyCj4gPj4+ICAgICAgICAgdHJpc3RhdGUgIk9NQVAyLCBPTUFQMywgT01BUDQg
YW5kIEtleXN0b25lIE5BTkQgY29udHJvbGxlciIKPiA+Pj4gICAgICAgICBkZXBlbmRzIG9uIEFS
Q0hfT01BUDJQTFVTIHx8IEFSQ0hfS0VZU1RPTkUgfHwgQVJDSF9LMyB8fCBDT01QSUxFX1RFU1QK
PiA+Pj4gICAgICAgICBkZXBlbmRzIG9uIEhBU19JT01FTQo+ID4+PiArICAgICAgIHNlbGVjdCBP
TUFQX0dQTUMgaWYgQVJDSF9LMwo+ID4+Pgo+ID4+PiBXaGljaCBjcmVhdGVzIGEgZGVwZW5kZW5j
eSBvdmVyIE9NQVBfR1BNQyBvbmx5IGZvciBhIHNpbmdsZQo+ID4+PiBhcmNoaXRlY3R1cmUuIFdo
aWNoIG1lYW5zIHRoYXQgb3RoZXIgT01BUCBwbGF0Zm9ybXMgZG8gbm90IG5lY2Vzc2FyaWx5Cj4g
Pj4+IG5lZWQgT01BUF9HUE1DIGZvciB0aGUgTkFORCBjb250cm9sbGVyIHRvIHdvcmsuIE5vdywg
eW91IHByb3Bvc2U6ICAgIAo+ID4+Cj4gPj4gTm8gdGhhdCBpcyBub3QgdHJ1ZS4gT3RoZXIgcGxh
dGZvcm1zIHRoYXQgbmVlZCBNVERfTkFORF9PTUFQMiBhcmUKPiA+PiBleHBsaWNpdGx5IHNlbGVj
dGluZyBPTUFQX0dQTUMKPiA+PiBpLmUuIGluIGFyY2gvYXJtL21hY2gtb21hcDIvS2NvbmZpZyAg
Cj4gPiAKPiA+IE9rYXksIGluIHRoaXMgY2FzZSB0aGUgZml4IGlzIGZpbmUgYnV0IHdlIHdpbGwg
bmVlZCB0byBjbGVhbiB0aGlzIHVwIGluCj4gPiBhIHNlY29uZCB0aW1lLiAgCj4gCj4gV2hhdCBj
bGVhbiB1cCBhcmUgeW91IGltcGx5aW5nIGhlcmU/IFRob3NlIGxlZ2FjeSBwbGF0Zm9ybSBtaWdo
dCBuZWVkCj4gT01BUF9HUE1DIGZvciBib290aW5nIHNvIHRoZXkgc2VsZWN0IGl0LiBUaGVyZSBp
cyBub3RoaW5nIG11Y2ggd2UgY2FuIGRvIHRoZXJlLgoKSWYgYWxsIHRoZSBib2FyZCB0aGF0IG5l
ZWQgdGhlIE9NQVBfR1BNQyBzZWxlY3QgaXQsIHRoZW4gd2Ugc2hvdWxkIGp1c3QKdGFrZSBjYXJl
IHRoYXQgdGhlIEszIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBiZWhhdmUgZGlmZmVyZW50bHkgdW5s
ZXNzCnRoZXJlIGlzIGEgZ29vZCByZWFzb24gdG8gZG8gaXQgZGlmZmVyZW50bHkuIEFGQUlSIHlv
dSB0b2xkIG1lIHRoaXMKYXJjaGl0ZWN0dXJlIGRpZCBub3Qgc2VsZWN0IE9NQVBfR1BNQyB5ZXQu
Cgo+IFdoYXQgaXMgbGVmdCB0byBkbyBub3cgaXMgbWFrZSB1c2VyL2RlZmNvbmZpZyBmaWxlcyB0
byBlbmFibGUgT01BUF9HUE1DIGRyaXZlcgo+IHNvIG90aGVyIHBsYXRmb3JtcyB0aGF0IGRvbid0
IG5lZWQgT01BUF9HUE1DIGZvciBiYXNpYyBvcGVyYXRpb24gY2FuIHN0aWxsCj4gZW5hYmxlIHRo
ZW0gbGF0ZXIgdmlhIGRlZmNvbmZpZyBvciBtYW51YWxseSBieSB1c2VyLgoKQW5kIHllcywgdGhh
dCBpcyBhbHNvIHdoYXQgSSBtZWFudCB0byBiZSAiY2xlYW5lZCB1cCIgOikKCj4gPj4+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiA+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvS2NvbmZpZwo+ID4+PiBAQCAtNDIsOCArNDIsNyBAQCBjb25maWcgTVREX05BTkRfT01B
UDIKPiA+Pj4gIAl0cmlzdGF0ZSAiT01BUDIsIE9NQVAzLCBPTUFQNCBhbmQgS2V5c3RvbmUgTkFO
RCBjb250cm9sbGVyIgo+ID4+PiAgCWRlcGVuZHMgb24gQVJDSF9PTUFQMlBMVVMgfHwgQVJDSF9L
RVlTVE9ORSB8fCBBUkNIX0szIHx8IENPTVBJTEVfVEVTVAo+ID4+PiAgCWRlcGVuZHMgb24gSEFT
X0lPTUVNCj4gPj4+IAlkZXBlbmRzIG9uIE9NQVBfR1BNQwo+ID4+Pgo+ID4+PiBUaGlzIG1lYW5z
IGFueSBvZiB0aGUgb3RoZXIgT01BUCBhcmNoaXRlY3R1cmVzIHdpbGwgY29tcGlsZSB0aGUgR1BN
Qwo+ID4+PiBkcml2ZXIgZXZlbiB0aG91Z2ggdGhleSBtaWdodCBub3QgbmVlZCBpdCwgd2hpY2gg
d291bGQgdW5uZWNlc3NhcmlseQo+ID4+PiBpbmNyZWFzZSB0aGUga2VybmVsIHNpemUuCj4gPj4+
Cj4gPj4+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/ICAgIAo+ID4+Cj4gPj4gTVREX05BTkRfT01B
UDIgTkFORCBjb250cm9sbGVyIGlzIGEgc3VibW9kdWxlIG9mIHRoZSBPTUFQIEdQTUMgSVAuIFNv
IGl0Cj4gPj4gY2Fubm90IHdvcmsgd2l0aG91dCBPTUFQX0dQTUMgZHJpdmVyLiAgCj4gPiAKPiA+
IEkgZGlkbid0IHJlbWVtYmVyIGV4YWN0bHkgYnV0IGluIHRoYXQgY2FzZSBpdCdzIG9rYXksIEkg
d2FzIGp1c3QKPiA+IHN1cnByaXNlZCBieSB0aGUgInNlbGVjdCBHUE1DIGlmIEFSQ0hfSzMiIGJ1
dCBpbmRlZWQgd2l0aCB0aGlzCj4gPiBleHBsYW5hdGlvbiBpdCBtYWtlcyBtb3JlIHNlbnNlLgo+
ID4gICAKPiA+PiBIb3BlIHRoaXMgY2xhcmlmaWVzIHRoZSBkb3VidHMuICAKPiA+IAo+ID4gWWVz
LCB0aGFua3MuIEkgd2lsbCBzZW5kIHRoZSBmaXggdG8gTGludXMgdGhlbi4KPiA+IAo+ID4gQ2hl
ZXJzLAo+ID4gTWlxdcOobCAgCj4gCj4gY2hlZXJzLAo+IC1yb2dlcgoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
