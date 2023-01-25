Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5EDC27C76
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAecbwskYYS+MFIHTcr4S8iE6bcq5QffqCkRFeBnBlo=; b=3UEekzhThYP/yZ
	poTwBC8yCDfi9hofn2JeVZMkVmjtWiXyhWPA/FVH8CZ9fTE7FkyqjqKW1n2KiOnE46LriVATuiZZJ
	RTw14SpB5tGE37o/ITdwlxkwgvVAyGBCweH4akCzaZanQyIgRk9M+GWvwU6xn8ktn3e8bdn1x87Fn
	RMwT2RQ3uzbw7EA0cFQer/wtxqXbcDqcIJ5PbpGXnrsc7B85SQMz6vPKVMRQ091ZYHt9HrJa/tY4y
	tIfMH5QGbtgI8kuuujGKkJ4NV7py7tXkQhjn6KXbder14TZf/kpWpcDBeu4IauDKHkyTz9qcI7mzB
	agMEuqJnwsurbwTVFW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgkc-007XSx-8N; Wed, 25 Jan 2023 14:27:46 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgkY-007XRw-Po
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 14:27:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1725C1BF211;
	Wed, 25 Jan 2023 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674656855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeWYzRRt2psZOn7QphbAzC9bFvndqffkIQglcnFthYc=;
	b=Iu/Rlw58H+PvBS9LLopEpJFKrutf6fKXGsfcWzBihUoswvZUVJhRVR0W4eit3+dDrZoBvg
	Dj8E0xC2Cj+oIeNjeEVD+9QngEDhX9zqvefvCwxOdiU4QxN9+DIglAQp8swMRN9K04zi7a
	WQONdifj0COYfgXfmVf/3bHqgcfO5dPRamqeLl6/R98hKFmsYkMtd6jggdTWSZbysQe+Ry
	SOfk4f0aickHVwVuhW19z7LvYKLXx1AvmX4sbXPw/SiHvJKl5Cvn9rnvx7Cq6y0c1OROeq
	nCdib1eNIlMjIb95Z4Vp9v9++CQtIZfXx7saRVgVekbweVNHv19f/R0XP84+Iw==
Date: Wed, 25 Jan 2023 15:27:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mario Kicherer <dev@kicherer.org>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, Dhruva
 Gole <d-gole@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add support for AllianceMemory
 AS5F34G04SND
Message-ID: <20230125152733.3b6bf0bd@xps-13>
In-Reply-To: <fae6950f62ebde63b3be0cde384fbde9@kicherer.org>
References: <20230117165441.1368447-1-dev@kicherer.org>
	<20230123113337.78f5e3db@xps-13>
	<fae6950f62ebde63b3be0cde384fbde9@kicherer.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062743_012709_105DEF17 
X-CRM114-Status: GOOD (  24.28  )
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

SGkgTWFyaW8sCgpkZXZAa2ljaGVyZXIub3JnIHdyb3RlIG9uIFdlZCwgMjUgSmFuIDIwMjMgMTM6
MTM6MTMgKzAxMDA6Cgo+IEhlbGxvIE1pcXVlbCwKPiAKPiBPbiAyMDIzLTAxLTIzIDExOjMzLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4+ICtzdGF0aWMgaW50IGFzNWYzNGcwNHNuZF9vb2JsYXlv
dXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgPj4gc2VjdGlvbiwKPiA+PiArCQkJCSAg
ICAgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+ID4+ICt7Cj4gPj4gKwlpZiAoc2Vj
dGlvbiA+IDMpCj4gPj4gKwkJcmV0dXJuIC1FUkFOR0U7Cj4gPj4gKwo+ID4+ICsJcmVnaW9uLT5v
ZmZzZXQgPSAweDQ4Owo+ID4+ICsJcmVnaW9uLT5sZW5ndGggPSAweDM4OyAgCj4gPiAKPiA+IFdo
eSB3b3VsZCB5b3UgaGF2ZSB0aHJlZSBzZWN0aW9ucyBpZiB5b3UgaGF2ZSBzdGF0aWMgb2Zmc2V0
cyBhbmQKPiA+IGxlbmd0aD8gVGhhdCBkb2VzIG5vdCBsb29rIGNvcnJlY3QuICAKPiAKPiBIbSwg
SSBkbyBub3QgcmVtZW1iZXIuIEkgZ3Vlc3MgdGhpcyBpcyBhIGxlZnRvdmVyIEkgZm9yZ290IHRv
IHJlbW92ZS4KPiAKPiA+PiArCS8qCj4gPj4gKwkgKiBJdCBpcyB1bmNsZWFyIGhvdyBtYW55IGJ5
dGVzIGFyZSB1c2VkIGZvciB0aGUgYmFkIGJsb2NrIG1hcmtlci4gPj4gV2UKPiA+PiArCSAqIHJl
c2VydmUgb25lIGJ5dGUgaGVyZS4gIAo+ID4gCj4gPiBTbyBmYXIgd2UgcmVzZXJ2ZWQgdHdvIGJ5
dGVzIGluIExpbnV4IHRvIG1pbWljIHRoZSByYXcgTkFORCBCQk0uICAKPiAKPiBPaywgY2hhbmdl
ZC4KPiAKPiA+PiArc3RhdGljIGludCBhbV9lY2NfZ2V0X3N0YXR1cyhzdHJ1Y3Qgc3BpbmFuZF9k
ZXZpY2UgKnNwaW5hbmQsIHU4ID4+IHN0YXR1cykKPiA+PiArewo+ID4+ICsJc3dpdGNoIChzdGF0
dXMgJiBBTV9TVEFUVVNfRUNDX0JJVE1BU0spIHsKPiA+PiArCWNhc2UgQU1fU1RBVFVTX0VDQ19O
T05FX0RFVEVDVEVEOgo+ID4+ICsJCXJldHVybiAwOwo+ID4+ICsKPiA+PiArCWNhc2UgQU1fU1RB
VFVTX0VDQ18xX0NPUlJFQ1RFRDoKPiA+PiArCQlyZXR1cm4gMTsKPiA+PiArCj4gPj4gKwljYXNl
IEFNX1NUQVRVU19FQ0NfTUFYX0NPUlJFQ1RFRDoKPiA+PiArCQlyZXR1cm4gODsKPiA+PiArCj4g
Pj4gKwljYXNlIEFNX1NUQVRVU19FQ0NfMV9ERVRFQ1RFRDogIAo+ID4gCj4gPiBXaGF0IGRvZXMg
dGhpcyBtZWFuICIxIGRldGVjdGVkIj8gIAo+IAo+IEFjY29yZGluZyB0byB0aGUgbWFudWFsLCB0
aGUgY2hpcCBjYW4gcmVwb3J0IHRoYXQgYSBiaXQgZXJyb3Igd2FzIGRldGVjdGVkCj4gYnV0IGNv
dWxkIG5vdCBiZSBjb3JyZWN0ZWQuCgpUaGF0IGRvZXMgbm90IG1ha2UgYSBsb3Qgb2Ygc2Vuc2Uu
IEVpdGhlciB5b3UgdXNlIGEgSGFtbWluZyBhbGdvcml0aG0sCnlvdSB3aWxsIGJlIGFibGUgdG8g
Y29ycmVjdCAxIGJpdCBlcnJvciBhbmQgdG8gZGV0ZWN0IDIgYml0IGVycm9ycywgb3IKeW91IHVz
ZSBhbm90aGVyIGFsZ29yaXRobSAoQkNILCB1c3VhbGx5KSB3aXRoIGEgc3RyZW5ndGggb2YgWCAo
WCA+IDEpCmFuZCB5b3UnbGwgYmUgYWJsZSB0byBjb3JyZWN0IHVwIHRvIFggZXJyb3JzIGFuZCBk
ZXRlY3QgWCsxIGVycm9ycy4KCkJ1dCBvbmx5IGJlaW5nIGFibGUgdG8gZGV0ZWN0IGEgc2luZ2xl
IGJpdCBmbGlwIHdpdGhvdXQgYmVpbmcgYWJsZSB0bwpjb3JyZWN0IGl0IGlzIHN0cmFuZ2UgKGV2
ZW4gdXNlbGVzcz8pLiBTbyBJIGRvbid0IHVuZGVyc3RhbmQgaG93IGl0CnNob3VsZCBiZSB1c2Vk
LgoKPiAKPiA+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX21hbnVmYWN0dXJlcl9vcHMg
Pj4gYWxsaWFuY2VtZW1vcnlfc3BpbmFuZF9tYW51Zl9vcHMgPSB7Cj4gPj4gKwkuaW5pdCA9IGFs
bGlhbmNlbWVtb3J5X3NwaW5hbmRfaW5pdCwgIAo+ID4gCj4gPiBJIGRvbid0IHRoaW5rIC5pbml0
IGlzIG1hbmRhdG9yeSwgc28gaWYgeW91IGRvIG5vdGhpbmcgaW4gaXQsIHlvdQo+ID4gY2FuIGp1
c3QgZHJvcCBpdC4gIAo+IAo+IERvbmUuCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IQo+IE1h
cmlvCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
