Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1506DC61D97
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nv3PZfPNCR2dPvIiJsPXoYUMz9rbjYCoZheyX6CIbiM=; b=2PU36MGgwSbay1
	RPmZj1bUocOGIeOucsyVcfPDGKIhR2sB5ClSx6gJ55TS1k+f6QZJexQscptFZO/b1k0319tLeBow7
	HdqAJRwNJjbIIZ9gG1DPhhbRrJ5ybr7mdJ5An1C7lPgyWCTNlJUCACQYaz34jNZdbKbS8jjYwjULW
	fqTYLAwNvPbL7vr/W4YkCTZJj235RjFLemKqal5riuaJ3gbW1OUTI7fS1WpfcJJzh3k5hSsiHdZlA
	F6mywr2aCtqDDk0nokfU6QmrLW7+pB+KcuP6abkyy7BvqD+5Daii8oyGcQ3mXJu/NAsGT/E3c6j0Y
	cbmEAbnEtSfOO3EBdj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6SA2-006cNZ-1p;
	Fri, 24 Nov 2023 09:07:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6S9v-006cGk-35;
	Fri, 24 Nov 2023 09:07:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DF50240013;
	Fri, 24 Nov 2023 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700816820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcaWZO0Dkmbqcz5MfADesr8jRHXPKhmFcuSLiJu9N6c=;
	b=OxWvtk/PaHumDm4DrHkspMlPL9mIMLBuTz4yXJb5tYm/lJVB/J3hTg1v00iw0ZgEPpeLeq
	0uRC5uy7xD5LueyouRR6+Er3w04yEgkLq5XZoEsFmy6oebOB/45j/tj237CsroX4aXNqKE
	ftiQvBgxZlbh3l8wsYFwFdMs+x6dhO7nSwPy/5SOgYvBJIsb1lF3exerDASnSOi9fCpIa3
	4vONdWZP717ZLGgAQpSh1K+bV4dSF1rgmVKxJzEUwDdbBG2fFFXJ5+9HKEqOJcfnZ4gnxb
	wAB0yZar5TpeAXH8yhRZnJXNKV52DEZ3hYSVBjZ7fJRN+P4FGaqOOy/MEUPrHA==
Date: Fri, 24 Nov 2023 10:06:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Viacheslav Bocharov <adeep@lexina.in>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] mtd: rawnand: meson: handle OOB buffer according OOB
 layout
Message-ID: <20231124100657.245d258f@xps-13>
In-Reply-To: <ab3f6734-357c-9937-2e21-a935850d3af8@salutedevices.com>
References: <20231109053953.3863664-1-avkrasnov@salutedevices.com>
	<5a82e3b96c94b45821707eb5d392384e1a026c2e.camel@lexina.in>
	<98c5a6ef-3865-9254-0af7-2d041a64d368@salutedevices.com>
	<ab3f6734-357c-9937-2e21-a935850d3af8@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_010736_300092_3DAD24CB 
X-CRM114-Status: GOOD (  23.01  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBGcmksIDI0
IE5vdiAyMDIzIDEwOjUwOjU0ICswMzAwOgoKPiBIZWxsbyBhbGwsIDIgd2Vla3MgZnJvbSA5LjEx
LCBwbGVhc2UgcGluZwoKSSdtIHdhaXRpbmcgZm9yIFZpYWNoZXNsYXYuCgo+IAo+IFRoYW5rcywg
QXJzZW5peQo+IAo+IAo+IE9uIDA5LjExLjIwMjMgMTI6MDksIEFyc2VuaXkgS3Jhc25vdiB3cm90
ZToKPiA+IEhlbGxvLCB0aGFua3MgZm9yIHJldmlldyEKPiA+IAo+ID4gT24gMDkuMTEuMjAyMyAx
MTowNiwgVmlhY2hlc2xhdiBCb2NoYXJvdiB3cm90ZTogIAo+ID4+IEhpIQo+ID4+Cj4gPj4gT24g
VGh1LCAyMDIzLTExLTA5IGF0IDA4OjM5ICswMzAwLCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6ICAK
PiA+Pj4gSW4gY2FzZSBvZiBNVERfT1BTX0FVVE9fT09CIG1vZGUsIE1URC9OQU5EIGxheWVyIGZp
bGxzL3JlYWRzIE9PQiBidWZmZXIKPiA+Pj4gYWNjb3JkaW5nIGN1cnJlbnQgT09CIGxheW91dCBz
byB3ZSBuZWVkIHRvIGZvbGxvdyBpdCBpbiB0aGUgZHJpdmVyLgo+ID4+Pgo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPGF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbT4KPiA+
Pj4gLS0tCj4gPj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA0ICsrLS0K
PiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Pj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+Pj4gaW5kZXggNTYxZDQ2ZDg2
MGI3Li4wZDRkMzU4MTUyZDcgMTAwNjQ0Cj4gPj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L21lc29uX25hbmQuYwo+ID4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5k
LmMKPiA+Pj4gQEAgLTUxMCw3ICs1MTAsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNfc2V0X3Vz
ZXJfYnl0ZShzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqb29iX2J1ZikKPiA+Pj4gIAlfX2xl
NjQgKmluZm87Cj4gPj4+ICAJaW50IGksIGNvdW50Owo+ID4+PiAgCj4gPj4+IC0JZm9yIChpID0g
MCwgY291bnQgPSAwOyBpIDwgbmFuZC0+ZWNjLnN0ZXBzOyBpKyssIGNvdW50ICs9IDIpIHsKPiA+
Pj4gKwlmb3IgKGkgPSAwLCBjb3VudCA9IDA7IGkgPCBuYW5kLT5lY2Muc3RlcHM7IGkrKywgY291
bnQgKz0gKDIgKyBuYW5kLT5lY2MuYnl0ZXMpKSB7Cj4gPj4+ICAJCWluZm8gPSAmbWVzb25fY2hp
cC0+aW5mb19idWZbaV07Cj4gPj4+ICAJCSppbmZvIHw9IG9vYl9idWZbY291bnRdOwo+ID4+PiAg
CQkqaW5mbyB8PSBvb2JfYnVmW2NvdW50ICsgMV0gPDwgODsgIAo+ID4+IFNlZW1zIHNvbWV0aGlu
ZyB3cm9uZyB3aXRoIHlvdXIgbG9naWMgaGVyZS4KPiA+PiBJIHRoaW5rIHRoaXMgY29kZSBzaG91
bGQgbW9zdCBsaWtlbHkgbG9vayBsaWtlIHRoaXM6Cj4gPj4KPiA+PiBmb3IgKGkgPSAwLCBjb3Vu
dCA9IDA7IGkgPCBuYW5kLT5lY2Muc3RlcHM7IGkrKywgY291bnQgKz0gbmFuZC0+ZWNjLmJ5dGVz
KSB7Cj4gPj4gICAgIGluZm8gPSAmbWVzb25fY2hpcC0+aW5mb19idWZbaV07Cj4gPj4gICAgICpp
bmZvIHw9IG9vYl9idWZbY291bnRdOwo+ID4+ICAgICBpZiAobmFuZC0+ZWNjLmJ5dGVzID4gMSkK
PiA+PiAgICAgICAqaW5mbyB8PSBvb2JfYnVmW2NvdW50ICsgMV0gPDwgODsKPiA+PiB9ICAKPiA+
IAo+ID4gRm9yIDY0IGJ5dGVzIE9PQiBhbmQgNTEyIGJ5dGVzIEVDQyB0aGlzIGRyaXZlciByZXBv
cnRzIGZyZWUgYXJlYXMgYXM6Cj4gPiAKPiA+IEFBIEFBIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJC
IEJCIEJCIEJCIEJCIEJCIEJCCj4gPiBBQSBBQSBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQiBC
QiBCQiBCQiBCQiBCQgo+ID4gQUEgQUEgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIg
QkIgQkIgQkIKPiA+IEFBIEFBIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJC
IEJCCj4gPiAKPiA+IHdoZXJlIEFBIGlzIGZyZWUgYnl0ZSh1c2VyIGJ5dGUpLCBCQiAtIEVDQyBj
b2Rlcy4gU28gdG8gYWNjZXNzIHVzZXIgYnl0ZXMKPiA+IHdlIG5lZWQgYnl0ZXMgMCwxLDE2LDE3
LDMyLDMzLDQ4LDQ5LiBuYW5kLT5lY2MuYnl0ZXMgPT0gMTQsIHNvICdjb3VudCcgaXMKPiA+IGlu
Y3JlYXNlZCBhdCAxNiBldmVyeSBpdGVyYXRpb24sIHNvIGkgZ3Vlc3MgdGhpcyBpcyBjb3JyZWN0
Lgo+ID4gCj4gPiBXRFlUPwo+ID4gCj4gPiBUaGFua3MsIEFyc2VuaXkKPiA+ICAgCj4gPj4KPiA+
PiAgCj4gPj4+IEBAIC01MjMsNyArNTIzLDcgQEAgc3RhdGljIHZvaWQgbWVzb25fbmZjX2dldF91
c2VyX2J5dGUoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKm9vYl9idWYpCj4gPj4+ICAJX19s
ZTY0ICppbmZvOwo+ID4+PiAgCWludCBpLCBjb3VudDsKPiA+Pj4gIAo+ID4+PiAtCWZvciAoaSA9
IDAsIGNvdW50ID0gMDsgaSA8IG5hbmQtPmVjYy5zdGVwczsgaSsrLCBjb3VudCArPSAyKSB7Cj4g
Pj4+ICsJZm9yIChpID0gMCwgY291bnQgPSAwOyBpIDwgbmFuZC0+ZWNjLnN0ZXBzOyBpKyssIGNv
dW50ICs9ICgyICsgbmFuZC0+ZWNjLmJ5dGVzKSkgewo+ID4+PiAgCQlpbmZvID0gJm1lc29uX2No
aXAtPmluZm9fYnVmW2ldOwo+ID4+PiAgCQlvb2JfYnVmW2NvdW50XSA9ICppbmZvOwo+ID4+PiAg
CQlvb2JfYnVmW2NvdW50ICsgMV0gPSAqaW5mbyA+PiA4OyAgCj4gPj4gQW5kIHRoZXJlOgo+ID4+
Cj4gPj4gZm9yIChpID0gMCwgY291bnQgPSAwOyBpIDwgbmFuZC0+ZWNjLnN0ZXBzOyBpKyssIGNv
dW50ICs9IG5hbmQtPmVjYy5ieXRlcykgewo+ID4+ICAgICBpbmZvID0gJm1lc29uX2NoaXAtPmlu
Zm9fYnVmW2ldOwo+ID4+ICAgICBvb2JfYnVmW2NvdW50XSA9ICppbmZvOwo+ID4+ICAgICBpZiAo
bmFuZC0+ZWNjLmJ5dGVzID4gMSkKPiA+PiAgICAgICAgIG9vYl9idWZbY291bnQgKyAxXSA9ICpp
bmZvID4+IDg7Cj4gPj4gfQo+ID4+Cj4gPj4KPiA+PiBUaGlzIGlzIG1vcmUgc2ltaWxhciB0byB0
aGUgYmVoYXZpb3Igb2Ygc2ltaWxhciBmdW5jdGlvbnMgaW4gdGhlIHByb3ByaWV0YXJ5IFUtQm9v
dC4KPiA+Pgo+ID4+IC0tCj4gPj4gVmlhY2hlc2xhdiBCb2NoYXJvdgo+ID4+ICAKCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
