Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADDCC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 15:41:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD92D60F9E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 15:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD92D60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSx7clPTbANT6ezeImCwXG7KiiCwBxflaLMj1C3iJiY=; b=izLplOuxSUS2pG
	4o+M2yjJRv+YdkHRgD1/h0i0qSAoaiQce9LJmfXd77rM4GkA3tH7wpkhexz96MDw3S3im7DHJRowe
	pkc8ehSKXJLXdXbc6hmwS2x8LoHXcuPQLFUdsVS3Et0a2OI08d1P2nI3NbAxxRLTVySAzaW6l/+cy
	lR+63r3lVEvCpzz2GSOYipGqCGZD0Q2XTNfgjQQ+lamoZoVTOQsiJZWnh/kYVdHrlgiaNFqSKvKE9
	TXIk2FZ/aU2iFdN0e2zVtnOwzHxp+0jUQTHwza05npDO/samU9ZU9t6xf42C7eE4daOcArQSlucHs
	Ic9yjAbCPVIP8bsL8eqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXQ5I-006wMA-8E; Mon, 04 Oct 2021 15:40:56 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXQ5F-006wKM-Ck
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 15:40:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F40E9FF818;
 Mon,  4 Oct 2021 15:40:49 +0000 (UTC)
Date: Mon, 4 Oct 2021 17:40:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Jan Hoffmann <jan@3e8.eu>, Kestrel seventyfour
 <kestrelseventyfour@gmail.com>
Subject: Re: [PATCH 9/9] mtd: rawnand: xway: Keep the driver compatible with
 on-die ECC engines
Message-ID: <20211004174048.608b07ef@xps13>
In-Reply-To: <20210928222258.199726-10-miquel.raynal@bootlin.com>
References: <20210928222258.199726-1-miquel.raynal@bootlin.com>
 <20210928222258.199726-10-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_084053_749674_27FECD1E 
X-CRM114-Status: GOOD (  32.20  )
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

SGkgSmFuLAoKbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBXZWQsIDI5IFNlcCAy
MDIxIDAwOjIyOjQ4ICswMjAwOgoKPiBGb2xsb3dpbmcgdGhlIGludHJvZHVjdGlvbiBvZiB0aGUg
Z2VuZXJpYyBFQ0MgZW5naW5lIGluZnJhc3RydWN0dXJlLCBpdAo+IHdhcyBuZWNlc3NhcnkgdG8g
cmVvcmdhbml6ZSB0aGUgY29kZSBhbmQgbW92ZSB0aGUgRUNDIGNvbmZpZ3VyYXRpb24gaW4KPiB0
aGUgLT5hdHRhY2hfY2hpcCgpIGhvb2suIEZhaWxpbmcgdG8gZG8gdGhhdCBwcm9wZXJseSBsZWFk
IHRvIGEgZmlyc3QKPiBzZXJpZXMgb2YgZml4ZXMgc3VwcG9zZWQgdG8gc3RhYmlsaXplIHRoZSBz
aXR1YXRpb24uIFVuZm9ydHVuYXRlbHksIHRoaXMKPiBvbmx5IGZpeGVkIHRoZSB1c2Ugb2Ygc29m
dHdhcmUgRUNDIGVuZ2luZXMsIHByZXZlbnRpbmcgYW55IG90aGVyIGtpbmQgb2YKPiBlbmdpbmUg
dG8gYmUgdXNlZCwgaW5jbHVkaW5nIG9uLWRpZSBvbmVzLgo+IAo+IEl0IGlzIG5vdyB0aW1lIHRv
IChmaW5hbGx5KSBmaXggdGhlIHNpdHVhdGlvbiBieSBlbnN1cmluZyB0aGF0IHdlIHN0aWxsCj4g
cHJvdmlkZSBhIGRlZmF1bHQgKGVnLiBzb2Z0d2FyZSBFQ0MpIGJ1dCB3aWxsIHN0aWxsIHN1cHBv
cnQgZGlmZmVyZW50Cj4gRUNDIGVuZ2luZXMgc3VjaCBhcyBvbi1kaWUgRUNDIGVuZ2luZXMgaWYg
cHJvcGVybHkgZGVzY3JpYmVkIGluIHRoZQo+IGRldmljZSB0cmVlLgo+IAo+IFRoZXJlIGFyZSBu
byBjaGFuZ2VzIG5lZWRlZCBvbiB0aGUgY29yZSBzaWRlIGluIG9yZGVyIHRvIGRvIHRoaXMsIGJ1
dCB3ZQo+IGp1c3QgbmVlZCB0byBsZXZlcmFnZSB0aGUgbG9naWMgdGhlcmUgd2hpY2ggYWxsb3dz
Ogo+IDEtIGEgc3Vic3lzdGVtIGRlZmF1bHQgKHNldCB0byBIb3N0IGVuZ2luZXMgaW4gdGhlIHJh
dyBOQU5EIHdvcmxkKQo+IDItIGEgZHJpdmVyIHNwZWNpZmljIGRlZmF1bHQgKGhlcmUgc2V0IHRv
IHNvZnR3YXJlIEVDQyBlbmdpbmVzKQo+IDMtIGFueSB0eXBlIG9mIGVuZ2luZSByZXF1ZXN0ZWQg
YnkgdGhlIHVzZXIgKGllLiBkZXNjcmliZWQgaW4gdGhlIERUKQo+IAo+IEFzIHRoZSByYXcgTkFO
RCBzdWJzeXN0ZW0gaGFzIG5vdCB5ZXQgYmVlbiBmdWxseSBjb252ZXJ0ZWQgdG8gdGhlIEVDQwo+
IGVuZ2luZSBpbmZyYXN0cnVjdHVyZSwgaW4gb3JkZXIgdG8gcHJvdmlkZSBhIGRlZmF1bHQgRUND
IGVuZ2luZSBmb3IgdGhpcwo+IGRyaXZlciB3ZSBuZWVkIHRvIHNldCBjaGlwLT5lY2MuZW5naW5l
X3R5cGUgKmJlZm9yZSogY2FsbGluZwo+IG5hbmRfc2NhbigpLiBEdXJpbmcgdGhlIGluaXRpYWxp
emF0aW9uIHN0ZXAsIHRoZSBjb3JlIHdpbGwgY29uc2lkZXIgdGhpcwo+IGVudHJ5IGFzIHRoZSBk
ZWZhdWx0IGVuZ2luZSBmb3IgdGhpcyBkcml2ZXIuIFRoaXMgdmFsdWUgbWF5IG9mIGNvdXJzZQo+
IGJlIG92ZXJsb2FkZWQgYnkgdGhlIHVzZXIgaWYgdGhlIHVzdWFsIERUIHByb3BlcnRpZXMgYXJl
IHByb3ZpZGVkLgo+IAo+IEZpeGVzOiBkNTI1OTE0YjViZDggKCJtdGQ6IHJhd25hbmQ6IHh3YXk6
IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byAtPmF0dGFjaF9jaGlwKCkiKQo+IENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCj4gQ2M6IEphbiBIb2ZmbWFubiA8amFuQDNlOC5ldT4KCkkg
dGhpbmsgeW91IGFscmVhZHkgdGVzdGVkIHRoaXMgY2hhbmdlIGFuZCB2YWxpZGF0ZWQgaXQsIHdv
dWxkIHlvdSBtaW5kCnByb3ZpZGluZyB5b3VyIFRlc3RlZC1ieT8KCj4gQ2M6IEtlc3RyZWwgc2V2
ZW50eWZvdXIgPGtlc3RyZWxzZXZlbnR5Zm91ckBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMgfCAxMiArKysrKysrKystLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy94
d2F5X25hbmQuYwo+IGluZGV4IDI2NzUxOTc2ZTUwMi4uMjM2ZmQ4YzVhOTU4IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcveHdheV9uYW5kLmMKPiBAQCAtMTQ4LDkgKzE0OCw4IEBAIHN0YXRpYyB2b2lkIHh3
YXlfd3JpdGVfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHVfY2hhciAqYnVmLCBp
bnQgbGVuKQo+ICAKPiAgc3RhdGljIGludCB4d2F5X2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXApCj4gIHsKPiAtCWNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lO
RV9UWVBFX1NPRlQ7Cj4gLQo+IC0JaWYgKGNoaXAtPmVjYy5hbGdvID09IE5BTkRfRUNDX0FMR09f
VU5LTk9XTikKPiArCWlmIChjaGlwLT5lY2MuZW5naW5lX3R5cGUgPT0gTkFORF9FQ0NfRU5HSU5F
X1RZUEVfU09GVCAmJgo+ICsJICAgIGNoaXAtPmVjYy5hbGdvID09IE5BTkRfRUNDX0FMR09fVU5L
Tk9XTikKPiAgCQljaGlwLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsKPiAgCj4g
IAlyZXR1cm4gMDsKPiBAQCAtMjE5LDYgKzIxOCwxMyBAQCBzdGF0aWMgaW50IHh3YXlfbmFuZF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJCSAgICB8IE5BTkRfQ09OX1NF
X1AgfCBOQU5EX0NPTl9XUF9QIHwgTkFORF9DT05fUFJFX1AKPiAgCQkgICAgfCBjc19mbGFnLCBF
QlVfTkFORF9DT04pOwo+ICAKPiArCS8qCj4gKwkgKiBUaGlzIGRyaXZlciBhc3N1bWVzIHRoYXQg
dGhlIGRlZmF1bHQgRUNDIGVuZ2luZSBzaG91bGQgYmUgVFlQRV9TT0ZULgo+ICsJICogU2V0IC0+
ZW5naW5lX3R5cGUgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBOQU5EIGRldmljZXMgaW4gb3JkZXIg
dG8KPiArCSAqIHByb3ZpZGUgYSBkcml2ZXIgc3BlY2lmaWMgZGVmYXVsdCB2YWx1ZS4KPiArCSAq
Lwo+ICsJZGF0YS0+Y2hpcC5lY2MuZW5naW5lX3R5cGUgPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9T
T0ZUOwo+ICsKPiAgCS8qIFNjYW4gdG8gZmluZCBleGlzdGVuY2Ugb2YgdGhlIGRldmljZSAqLwo+
ICAJZXJyID0gbmFuZF9zY2FuKCZkYXRhLT5jaGlwLCAxKTsKPiAgCWlmIChlcnIpCgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
