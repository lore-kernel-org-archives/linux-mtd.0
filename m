Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EC4C47422
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHLE/fOtr2tTNYz1spBw/UjVrLMHTljz7PCPmpkSODI=; b=E6GL7zMssEd7Qw
	c7sKoXCQkjLSXa2uJhLIo6e7i58phG5zczkAjApsK8KxrjoBB5LOxlmzToN2tc64KNFeawNGNqKWV
	O7okze+qDm40EFZ9W+5ZjFUqvfsMLgzPGEYvKJaoe49mxya3AtpFj6G5tai0t6XxVv3gZ1cxuPfLZ
	7Rm0YypeT/NSO+3cHKcK4haPHcFMRppDdkqedudCaIfGEBOjdu3aqBxUTXiOH8igfoiL1wtBByh09
	7zCfEh4sIRgBcJxWjTI0uBxo+9TCmDeeK8/9UlC9z7rTCoEQ0QSzcqOVZ4rArhWXpv4EJKb+HZdJg
	BqFpAXvtpE5UX6glFM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPFp-0000000CIz3-2rd0;
	Mon, 29 Jan 2024 10:52:41 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPFl-0000000CIx9-2URE;
	Mon, 29 Jan 2024 10:52:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BEC5FF80E;
	Mon, 29 Jan 2024 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706525552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcUfvlOtpKiNCvjO4iOwB2dkcftJ97AES2z0e0scJ5E=;
	b=SmC7qxAOwt2XyvIWfGHgHiy8Zal6fObDL6o3CJOloIjXc+WFcTjobse8iS6p0pqdb0Qkdi
	n627jGKbyy6lOvVWKit34x8AwBW/DDVxIzHjaR1DRptmUA2C6MFsgWls/PWu0xOFRhwUJt
	XppK0UKNBZXPcajtSA/JQf225G4a5r7SAFHXGqI3naZ+68K8kHS4jNLCsk7Fbu141pdWoy
	U6OfGZIk8ddkVrkvZ611sMYtd88t0CW44TXdXZTU345eWCohAihjKlaQxlC8Um0L1kTjT2
	p/ktSi7HM0goZs+zY5M7MBacWN0O0olnk430R953ky1EFKvOkvHBFCsLylcbMA==
Date: Mon, 29 Jan 2024 11:52:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Joel Peshkin
 <joel.peshkin@broadcom.com>, Tomer Yacoby <tomer.yacoby@broadcom.com>, Dan
 Beygelman <dan.beygelman@broadcom.com>, William Zhang
 <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, Kursad
 Oney <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
Message-ID: <20240129115228.06dc2292@xps-13>
In-Reply-To: <CAA_RMS5gX88v_Qt1csgSL_ffMNsqo2G8B164EB_Hg=hXd620eg@mail.gmail.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-11-dregan@broadcom.com>
	<20240124184027.712b1e47@xps-13>
	<CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
	<20240126071913.699c3795@xps-13>
	<CAA_RMS5gX88v_Qt1csgSL_ffMNsqo2G8B164EB_Hg=hXd620eg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_025237_945705_E44302D6 
X-CRM114-Status: GOOD (  40.04  )
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

SGkgRGF2aWQsCgpkcmVnYW5AYnJvYWRjb20uY29tIHdyb3RlIG9uIEZyaSwgMjYgSmFuIDIwMjQg
MTE6NTc6MzkgLTA4MDA6Cgo+IEhpIE1pcXXDqGwsCj4gCj4gT24gVGh1LCBKYW4gMjUsIDIwMjQg
YXQgMTA6MTnigK9QTSBNaXF1ZWwgUmF5bmFsCj4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
IHdyb3RlOgo+ID4KPiA+IEhpIERhdmlkLAo+ID4KPiA+IGRyZWdhbkBicm9hZGNvbS5jb20gd3Jv
dGUgb24gVGh1LCAyNSBKYW4gMjAyNCAxMTo0Nzo0NiAtMDgwMDoKPiA+ICAKPiA+ID4gSGkgTWlx
dcOobCwKPiA+ID4KPiA+ID4gT24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgOTo0MOKAr0FNIE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOiAgCj4gPiA+ID4KPiA+
ID4gPiBIaSBEYXZpZCwKPiA+ID4gPgo+ID4gPiA+IGRyZWdhbkBicm9hZGNvbS5jb20gd3JvdGUg
b24gVHVlLCAyMyBKYW4gMjAyNCAxOTowNDo1OCAtMDgwMDoKPiA+ID4gPiAgCj4gPiA+ID4gPiBB
bGxvdyBzZXR0aW5ncyBmb3Igb24tZGllIGVjYyBzdWNoIHRoYXQgaWYgb24tZGllIEVDQyBpcyBz
ZWxlY3RlZAo+ID4gPiA+ID4gZG9uJ3QgZXJyb3Igb3V0IGJ1dCByZXF1aXJlIEVDQyBzdHJhcCBz
ZXR0aW5nIG9mIHplcm8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBS
ZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBXaWxsaWFt
IFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+
ID4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiBDaGFuZ2VzIGlu
IHYyOgo+ID4gPiA+ID4gLSBBZGRlZCB0byBwYXRjaCBzZXJpZXMKPiA+ID4gPiA+IC0tLQo+ID4g
PiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAxNCArKysr
KysrKysrLS0tLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYwo+ID4gPiA+ID4gaW5kZXggYTRlMzExYjY3OThjLi40MjUyNmYzMjUw
YzkgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jCj4gPiA+ID4gPiBAQCAtMjcyNyw5ICsyNzI3LDExIEBAIHN0YXRpYyBpbnQgYnJj
bW5hbmRfc2V0dXBfZGV2KHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KQo+ID4gPiA+ID4gICAg
ICAgY2ZnLT5ibGtfYWRyX2J5dGVzID0gZ2V0X2Jsa19hZHJfYnl0ZXMobXRkLT5zaXplLCBtdGQt
PndyaXRlc2l6ZSk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgaWYgKGNoaXAtPmVjYy5lbmdp
bmVfdHlwZSAhPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NUKSB7Cj4gPiA+ID4gPiAtICAg
ICAgICAgICAgIGRldl9lcnIoY3RybC0+ZGV2LCAib25seSBIVyBFQ0Mgc3VwcG9ydGVkOyBzZWxl
Y3RlZDogJWRcbiIsCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgY2hpcC0+ZWNjLmVu
Z2luZV90eXBlKTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+
ID4gPiArICAgICAgICAgICAgIGlmIChjaGlwLT5lY2Muc3RyZW5ndGgpIHsKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGN0cmwtPmRldiwgIkVSUk9SISEhIEhXIEVDQyBt
dXN0IGJlIHNldCB0byB6ZXJvIGZvciBub24taGFyZHdhcmUgRUNDOyBzZWxlY3RlZDogJWRcbiIs
Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGlwLT5lY2Muc3RyZW5n
dGgpOyAgCj4gPiA+ID4KPiA+ID4gPiBDYW4geW91IHVzZSBhIG1vcmUgZm9ybWFsIHN0cmluZz8g
QWxzbyBjbGFyaWZ5IGl0IGJlY2F1c2UgSSBkb24ndAo+ID4gPiA+IHJlYWxseSB1bmRlcnN0YW5k
IHdoYXQgaXQgbGVhZHMgdG8uICAKPiA+ID4KPiA+ID4gSG93IGFib3V0Ogo+ID4gPgo+ID4gPiBk
ZXZfZXJyKGN0cmwtPmRldiwgIkhXIEVDQyBzZXQgdG8gJWQsIG11c3QgYmUgemVybyBmb3Igb24t
ZGllIEVDQ1xuIiwgIAo+ID4KPiA+IEFjdHVhbGx5IEkgYW0gd29uZGVyaW5nIGhvdyBsZWdpdGlt
YXRlIHRoaXMgaXMuIEp1c3QgZG9uJ3QgZW5hYmxlIHRoZQo+ID4gb24gaG9zdCBFQ0MgZW5naW5l
IGlmIGl0J3Mgbm90IGluIHVzZS4gTm8gbmVlZCB0byBjaGVjayB0aGUgY29yZSdzCj4gPiBjaG9p
Y2UuICAKPiAKPiBPdXIgY2hpcCBFQ0MgZW5naW5lIHdpbGwgZWl0aGVyIGJlIG9uIGlmIGl0J3Mg
bmVlZGVkIG9yIG9mZiBpZiBpdCdzIG5vdC4KPiBFaXRoZXIgSSBjYW4gZG8gdGhhdCBpbiBvbmUg
cGxhY2Ugb3IgcHV0IGNoZWNrcyBpbiBiZWZvcmUgZWFjaAo+IHJlYWQvd3JpdGUgdG8gdHVybiBv
bi9vZmYgdGhlIEVDQyBlbmdpbmUsIHdoaWNoIHNlZW1zIGEgbG90IG1vcmUKPiB3b3JrIGFuZCBj
aGFuZ2VzIGFuZCBwb3NzaWJsZSBpc3N1ZXMvcHJvYmxlbXMuCj4gVHVybmluZyBpdCBvbi9vZmYg
YXMgbmVlZGVkIGhhcyBub3QgYmVlbiBleHBsaWNpdGx5IHRlc3RlZCBhbmQKPiBjb3VsZCBjYXVz
ZSB1bmZvcmVzZWVuIGNvbnNlcXVlbmNlcy4gVGhpcwo+IGlzIGEgbWluaW1hbCBjaGFuZ2Ugd2hp
Y2ggc2hvdWxkIGhhdmUgbWluaW1hbCBpbXBhY3QuCj4gCj4gPiAgCj4gPiA+ICAKPiA+ID4gPiAg
Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4g
PiArICAgICAgICAgICAgIH0KPiA+ID4gPiA+ICAgICAgIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAg
ICAgICBpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKSB7Cj4gPiA+
ID4gPiBAQCAtMjc5Nyw3ICsyNzk5LDExIEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfc2V0dXBfZGV2
KHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KQo+ID4gPiA+ID4gICAgICAgaWYgKHJldCkKPiA+
ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAg
ICBicmNtbmFuZF9zZXRfZWNjX2VuYWJsZWQoaG9zdCwgMSk7Cj4gPiA+ID4gPiArICAgICBpZiAo
Y2hpcC0+ZWNjLmVuZ2luZV90eXBlID09IE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0RJRSkgewo+
ID4gPiA+ID4gKyAgICAgICAgICAgICBkZXZfZGJnKGN0cmwtPmRldiwgIkRpc2FibGUgSFcgRUND
IGZvciBvbi1kaWUgRUNDXG4iKTsgIAo+ID4gPiA+Cj4gPiA+ID4gTm90IG5lZWRlZC4gIAo+ID4g
Pgo+ID4gPiBXaWxsIHJlbW92ZS4KPiA+ID4gIAo+ID4gPiA+ICAKPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgYnJjbW5hbmRfc2V0X2VjY19lbmFibGVkKGhvc3QsIDApOwo+ID4gPiA+ID4gKyAgICAg
fSBlbHNlCj4gPiA+ID4gPiArICAgICAgICAgICAgIGJyY21uYW5kX3NldF9lY2NfZW5hYmxlZCho
b3N0LCAxKTsgIAo+ID4gPiA+Cj4gPiA+ID4gU3R5bGUgaXMgd3JvbmcsIGJ1dCBvdGhlcndpc2Ug
SSB0aGluayBFQ0Mgc2hvdWxkIGJlIGtlcHQgZGlzYWJsZWQgd2hpbGUKPiA+ID4gPiBub3QgaW4g
YWN0aXZlIHVzZSwgc28gSSBhbSBhIGJpdCBzdXJwcmlzZWQgYnkgdGhpcyBsaW5lLiAgCj4gPiA+
Cj4gPiA+IFRoaXMgaXMgYSBkb3VibGUgY2hlY2sgdG8gdHVybiBvbi9vZmYgb3VyIGhhcmR3YXJl
IEVDQy4gIAo+ID4KPiA+IEkgZXhwZWN0IHRoZSBlbmdpbmUgdG8gYmUgYWx3YXlzIGRpc2FibGVk
LiBFbmFibGUgaXQgb25seSB3aGVuIHlvdQo+ID4gbmVlZCAobWF5IHJlcXVpcmUgYW4gYWRkaXRp
b25hbCBwYXRjaCBiZWZvcmUgdGhpcyBvbmUpLiAgCj4gCj4gV2UgYXJlIGFscmVhZHkgdHVybmlu
ZyBvbiB0aGUgRUNDIGVuYWJsZSBhdCB0aGlzIHBvaW50LAo+IHRoaXMgaXMganVzdCBhZGRpbmcg
dGhlIG9wdGlvbiB0byB0dXJuIGl0IG9mZiBpZiB0aGUgTkFORCBjaGlwCj4gaXRzZWxmIHdpbGwg
YmUgZG9pbmcgdGhlIEVDQyBpbnN0ZWFkIG9mIG91ciBjb250cm9sbGVyLgoKU29ycnkgaWYgSSBo
YXZlIG5vdCBiZWVuIGNsZWFyLgoKVGhpcyBzZXF1ZW5jZToKLSBpbml0Ci0gZW5hYmxlIGh3IEVD
QyBlbmdpbmUKSXMgYnJva2VuLgoKSXQgKmNhbm5vdCogd29yayBhcyBhbnkgb3BlcmF0aW9uIGdv
aW5nIHRocm91Z2ggZXhlY19vcCBub3cgbWF5CnBlcmZvcm0gcGFnZSByZWFkcyB3aGljaCBzaG91
bGQgYmUgdW5tb2RpZmllZCBieSB0aGUgRUNDIGVuZ2luZS4gWW91CmRyaXZlciAqbXVzdCogZm9s
bG93IHRoZSBmb2xsb3dpbmcgc2VxdWVuY2U6CgotIGluaXQgYW5kIGRpc2FibGUgKG9yIGtlZXAg
ZGlzYWJsZWQpIHRoZSBodyBFQ0MgZW5naW5lCi0gd2hlbiB5b3UgcGVyZm9ybSBhIHBhZ2Ugb3Bl
cmF0aW9uIHdpdGggY29ycmVjdGlvbiB5b3UgbmVlZCB0bwoJLSBlbmFibGUgdGhlIGVuZ2luZQoJ
LSBwZXJmb3JtIHRoZSBvcGVyYXRpb24KCS0gZGlzYWJsZSB0aGUgZW5naW5lCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
