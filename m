Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035E6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 16:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BAD60EE2
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77BAD60EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOS+WZ8pVaS/OiHcKATWITQo9ez84EquEAMqMUSBR1k=; b=1RfERiXCjUzM77
	FGcTLkB4ZvViTWx/5zWdhX5RevNtug3aOTGshl1+PhFtTy+gNcjn/518y2oEFVTmB680YbI5Ydof8
	4Oo6APpFg7oUuVDS3R4olPqpTrDXtdMoZCvsfcjcpIwLmuuytZWygBsdU/y7yEDY7EMRfsrkTaZYU
	vZ0JuuZxdndiMbcrxfMeRcll/O1HTY+XtmCagqlFDuz6+KQ+cm94t6dE5hx3S8Fwzii38PDHLWALd
	I+gA5uCOdxk2GhnTa1y7Oj0Roa3NJbOFsDLDHx0ar7UKbN96hI+VDd+LaHwJE9rmtgVv7L91eqO+c
	vAGHT4eEkxiIB0e0/uFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUtXt-003NAR-GH; Mon, 27 Sep 2021 16:32:01 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUtXp-003N8z-AT
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 16:31:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7BB0F10000E;
 Mon, 27 Sep 2021 16:31:51 +0000 (UTC)
Date: Mon, 27 Sep 2021 18:31:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jan Hoffmann <jan@3e8.eu>
Cc: Daniel Kestrel <kestrelseventyfour@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210927183150.4be87140@xps13>
In-Reply-To: <14eb0cb7-b0af-87bf-b9a5-3e35eeb43f54@3e8.eu>
References: <20210808072643.GA5084@ubuntu>
 <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu>
 <20210917190154.76203a9a@xps13>
 <e9dd0653-139f-749b-c088-e756ee2d2132@3e8.eu>
 <20210917213246.319e60cb@xps13>
 <14eb0cb7-b0af-87bf-b9a5-3e35eeb43f54@3e8.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_093157_666551_7A85FF54 
X-CRM114-Status: GOOD (  32.23  )
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

SGkgSmFuLAoKU29ycnkgZm9yIHRoZSBkZWxheSwgSSBoYWQgdG8gcmV0aGluayBhYm91dCB0aGUg
cHJvYmxlbSBmaXJzdC4KCmphbkAzZTguZXUgd3JvdGUgb24gU2F0LCAxOCBTZXAgMjAyMSAyMzoy
Njo0OCArMDIwMDoKCj4gSGkgTWlxdcOobCwKPiAKPiA+IFllcyB0aGlzIHdhcyBteSB1bmRlcnN0
YW5kaW5nLCB0aGF0IG9ubHkgc29mdHdhcmUgRUNDIGVuZ2luZSB3YXMKPiA+IHN1cHBvcnRlZC4g
VGhlIG1haW5saW5lIGRyaXZlciBzaG93cyBhYnNvbHV0ZWx5IG5vIHNpZ25zIG9mIGhhcmR3YXJl
Cj4gPiBFQ0MgZW5naW5lIHN1cHBvcnQuCj4gPiAKPiA+IFBlcmhhcHMgaG93ZXZlciB5b3UgbWVh
biB0aGF0IG9uLWRpZSBFQ0MgZW5naW5lIGFyZSBub3Qgc3VwcG9ydGVkCj4gPiBhbnltb3JlIGJl
Y2F1c2Ugb2YgdGhlIGVuZ2luZV90eXBlIGJlaW5nIHNldCBpbiBhdHRhY2hfY2hpcCgpPyAgCj4g
Cj4gWWVzLCB0aGlzIGlzIGV4YWN0bHkgdGhlIGlzc3VlLgo+IAo+ID4gSWYgeWVzIHRoZW4gaW5k
ZWVkIHRoZXJlIGlzIHNvbWV0aGluZyB0byBkbywgcGVyaGFwcyBjaGVja2luZyBpZiBhbgo+ID4g
ZW5naW5lIGhhcyBiZWVuIGFscmVhZHkgc2V0IGlzIGVub3VnaD8gWW91IGNhbiB0cnkgc29tZXRo
aW5nIGxpa2U6Cj4gPiAKPiA+IGlmIChlbmdpbmVfdHlwZSA9PSB1bmtub3duKQo+ID4gCWVuZ2lu
ZV90eXBlID0gc29mdDsgIAo+IAo+IENoZWNraW5nIGZvciBOQU5EX0VDQ19FTkdJTkVfVFlQRV9J
TlZBTElEIGRvZXNuJ3Qgd29yaywgYXMgdGhlIGVuZ2luZQo+IHR5cGUgaXMgYWxyZWFkeSBzZXQg
dG8gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVCBieSByYXduYW5kX2R0X2luaXQuCj4gVGhl
IGNvZGUgdGhlcmUgc2VlbXMgdG8gZXhwZWN0IHRoYXQgY2hpcC0+ZWNjLmVuZ2luZV90eXBlIGNv
bnRhaW5zIHRoZQo+IGRlZmF1bHQgdmFsdWUsIHdoaWNoIGlzIG5vIGxvbmdlciB0aGUgY2FzZSBh
ZnRlciBjb21taXQgNTI1OTE0YjViZDgKPiAoIm10ZDogcmF3bmFuZDogeHdheTogTW92ZSB0aGUg
RUNDIGluaXRpYWxpemF0aW9uIHRvIC0+YXR0YWNoX2NoaXAoKSIpLgoKVGhpcyBpcyBpbmRlZWQg
YW4gaXNzdWUgYW5kIHNob3VsZCBiZSBmaXhlZC4gSG93ZXZlciB0aGUgc29sdXRpb24gaXMgSQp0
aGluayBhbHJlYWR5IGF2YWlsYWJsZSBpbiB0aGUgcmF3IE5BTkQgY29yZSAoYnV0IEkgaGFkIHRv
IGRpZyBpbnRvIHRoZQpjb2RlIGFnYWluIHRvIHJlbWVtYmVyIGhvdyBJIHdhbnRlZCB0byBoYW5k
bGUgdGhpcykuCgo+IFRoZSBmb2xsb3dpbmcgaW4gYXR0YWNoX2NoaXAgd29ya3M6Cj4gCj4gaWYg
KGNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9PSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NUKQo+
IAljaGlwLT5lY2MuZW5naW5lX3R5cGUgPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUOwoKSWYg
eW91IGxvb2sgYXQgdGhlIHJhd25hbmRfZHRfaW5pdCgpIGZ1bmN0aW9uIFsxXSB0aGUgbG9naWMg
aXM6CgpJcyB0aGUgdXNlciBjb25maWd1cmF0aW9uIChEVCkgdmFsaWQgPyBpZiB5ZXMgdGFrZSBp
dC4KSXMgdGhlIE5BTkQgY29udHJvbGxlciBkcml2ZXIgc2V0dGluZyBhIGRlZmF1bHQgbW9kZT8g
aWYgeWVzIHRha2UgaXQuCk90aGVyd2lzZSB0YWtlIHRoZSByYXcgTkFORCBzdWJzeXN0ZW0gZGVm
YXVsdDogT05fSE9TVC4KClRoaXMgbG9naWMgaGFwcGVucyB2ZXJ5IHNvb24gaW4gdGhlIGluaXQg
cHJvY2VzcyBzbyB0aGUgZGVmYXVsdCBtb2RlCmZvciB0aGUgZHJpdmVyIHNob3VsZCBiZSBwcm92
aWRlZCBiZWZvcmUgdGhlIG5hbmRfc2NhbigpIGNhbGwuCgpTbyB3aGF0IEkgcHJvcG9zZSBpczoK
LSBpbiB0aGUgZHJpdmVyIHByb2JlOiBzZXQgdGhlIGRlZmF1bHQgdG8gc29mdHdhcmUgRUNDCi0g
aW4gdGhlIGF0dGFjaCgpIGhvb2s6IGRyb3AgdGhlIGxpbmUgc2V0dGluZyB0aGUgZW5naW5lX3R5
cGUgdG8gU09GVC4KClBsZWFzZSBjaGVjayB0aGUgYmVsb3cgZGlmZiBhbmQgdGVsbCBtZSBpZiBp
dCB3b3JrcyBmb3IgeW91LiBJJ2xsIHRoZW4KcHJvcG9zZSBhIHdpZGVyIHNlcmllcyBmaXhpbmcg
dGhlIG90aGVyIGRyaXZlcnMgYXMgd2VsbC4KCj4gSG93ZXZlciwgdGhpcyB3aWxsIGFsc28gc2ls
ZW50bHkgdXNlIHRoZSBzb2Z0d2FyZSBFQ0MgZW5naW5lIGlmIGFueW9uZQo+IGFjdHVhbGx5IGNv
bmZpZ3VyZXMgdGhlIG9uLWhvc3QgaGFyZHdhcmUgRUNDIGVuZ2luZSBpbiB0aGUgZGV2aWNlIHRy
ZWUKPiAod2hpY2ggaXMgb2YgY291cnNlIHVuc3VwcG9ydGVkIGZvciB4d2F5KS4KPiAKPiBUaGFu
a3MsCj4gSmFuCgoKWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9z
b3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMjTDUzMjgKClRoYW5rcywKTWlx
dcOobAoKLS0tCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jCmluZGV4IDI2NzUxOTc2ZTUwMi4uZDll
MTY3ZGJiNzE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYwor
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYwpAQCAtMTQ4LDkgKzE0OCw4IEBA
IHN0YXRpYyB2b2lkIHh3YXlfd3JpdGVfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0
IHVfY2hhciAqYnVmLCBpbnQgbGVuKQogCiBzdGF0aWMgaW50IHh3YXlfYXR0YWNoX2NoaXAoc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCkKIHsKLSAgICAgICBjaGlwLT5lY2MuZW5naW5lX3R5cGUgPSBO
QU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUOwotCi0gICAgICAgaWYgKGNoaXAtPmVjYy5hbGdvID09
IE5BTkRfRUNDX0FMR09fVU5LTk9XTikKKyAgICAgICBpZiAoY2hpcC0+ZWNjLmVuZ2luZV90eXBl
ID09IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQgJiYKKyAgICAgICAgICAgY2hpcC0+ZWNjLmFs
Z28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKQogICAgICAgICAgICAgICAgY2hpcC0+ZWNjLmFs
Z28gPSBOQU5EX0VDQ19BTEdPX0hBTU1JTkc7CiAKICAgICAgICByZXR1cm4gMDsKQEAgLTIxOSw2
ICsyMTgsMTQgQEAgc3RhdGljIGludCB4d2F5X25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKICAgICAgICAgICAgICAgICAgICB8IE5BTkRfQ09OX1NFX1AgfCBOQU5EX0NP
Tl9XUF9QIHwgTkFORF9DT05fUFJFX1AKICAgICAgICAgICAgICAgICAgICB8IGNzX2ZsYWcsIEVC
VV9OQU5EX0NPTik7CiAKKyAgICAgICAvKgorICAgICAgICAqIFRoaXMgY29udHJvbGxlciBoYXMg
bm8gaGFyZHdhcmUgRUNDIGVuZ2luZSBhbmQgdGhlIGRyaXZlciBhc3N1bWVzCisgICAgICAgICog
dGhhdCB0aGUgZGVmYXVsdCBFQ0MgZW5naW5lIHNob3VsZCBiZSBUWVBFX1NPRlQuIFNldCAtPmVu
Z2luZV90eXBlCisgICAgICAgICogYmVmb3JlIHRoZSBOQU5EIHJlZ2lzdHJhdGlvbiBpbiBvcmRl
ciB0byBwcm92aWRlIGEgZGVmYXVsdCB2YWx1ZS4KKyAgICAgICAgKi8KKyAgICAgICBkYXRhLT5j
aGlwLmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7CisKKwogICAg
ICAgIC8qIFNjYW4gdG8gZmluZCBleGlzdGVuY2Ugb2YgdGhlIGRldmljZSAqLwogICAgICAgIGVy
ciA9IG5hbmRfc2NhbigmZGF0YS0+Y2hpcCwgMSk7CiAgICAgICAgaWYgKGVycikKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
