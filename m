Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E55CD68F8
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Oct 2023 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ni4BmHoXbUS2Pv25NeVnNc0crvh4OlAxkZrWVjI5UrU=; b=wNsAuri0YtWaep
	xEQ4rErAO+15zpILsioGPg26950FZD6llbGSq8NOeQl9tyHMN6+gPh77d+kIsPCM3rbI5zkm3zHte
	GPR4U/ACXJ4+Njqr+MzweAxZ5hiVq3NL2TntTojYpIXybcupr8JYr4zkvM0TI5VK82zcu5Jijm7zD
	NuCwXR7EWYaufHttpkZgAa5EIJ2QPAjEn+pe9MYFf5Gdq/fxLVGYDz9M/g1uV690Xbe7GSvvZEbZh
	/69zRopllbfZbXFKCP1oXk34QzhoGsEuAQxh1nr5PDCpBp3bHomyC3gysXPjgH+vV33W39JspSrPL
	dIhuAFmljLLc+krv5dlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7X6-00CkqK-0L;
	Tue, 10 Oct 2023 07:52:00 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7X2-00CkjH-0E
	for linux-mtd@lists.infradead.org;
	Tue, 10 Oct 2023 07:51:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57D9140005;
	Tue, 10 Oct 2023 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696924310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=USilIgMsNbS10KLiGwlOraTVUj4wmhatBdmP9jLwLMs=;
	b=IIq1jLbM9v33XJ7hiIW5p49ICAYlbIBytS/d+ZsUS5VsFUIxntw6CG5TMngugXLaJtwmUI
	FkZHDbvG5AqCe/IQkIZNHB8lrBfRSTXlfwStzuw/z5WgLaBfFarZPm/jP3oi3MbfGUANK3
	Wyn19JZ4XNUT+Z8hAQUO2+phVU5CdS9r8TZN5S5WOmFyMC88a/76PDanL2WxBrxbNmdGv1
	9L9bdd05xXy2fqapBdMNFolw05QizTP5vkFbXvYTS3emzTm3Ysuh3+NlyVgHjqK7DHbxUh
	n2zID1RS6dA1/4FrvG37Cs4UmOZjh7zR8hidTIduVH4oBTB/AFCjyH26zU1AfQ==
Date: Tue, 10 Oct 2023 09:51:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@mail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH 1/3] mtd: rawnand: Add destructive operation
Message-ID: <20231010095144.520c9b2c@xps-13>
In-Reply-To: <trinity-003579bf-615b-47b8-b1a9-f0d37f650f45-1696905960546@3c-app-mailcom-lxa01>
References: <trinity-003579bf-615b-47b8-b1a9-f0d37f650f45-1696905960546@3c-app-mailcom-lxa01>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_005156_394648_753DDD7E 
X-CRM114-Status: GOOD (  21.86  )
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

SGkgRGF2aWQsCgpkcmVnYW5AbWFpbC5jb20gd3JvdGUgb24gVHVlLCAxMCBPY3QgMjAyMyAwNDo0
NjowMCArMDIwMDoKCkZvciB0aGUgbmV4dCBpdGVyYXRpb24sIHdvdWxkIHlvdSBtaW5kIHNlbmRp
bmcgdGhlIHNlcmllcyB3aXRoCmdpdC1zZW5kLWVtYWlsIG9yIGF0IGxlYXN0IGhhbmRsZSB0aGUg
ZmFjdCB0aGF0IHBhdGNoIDIgYW5kIDMgc2hvdWxkIGJlCmFuIGFuc3dlciBvZiBwYXRjaCAxIHNv
IHRoYXQgdGhlIHRocmVlIG1haWxzIGFyZSBrZXB0IHRvZ2V0aGVyPwoKPiBFcmFzZSBhbmQgcHJv
Z3JhbSBvcGVyYXRpb25zIG5lZWQgdGhlIHdyaXRlIHByb3RlY3QgKHdwKSBwaW4gdG8gYmUKPiBk
ZS1hc3NlcnRlZCB0byB0YWtlIGVmZmVjdC4gQWRkIHRoZSBjb25jZXB0IG9mIGRlc3RydWN0aXZl
Cj4gb3BlcmF0aW9uIGFuZCBwYXNzIHRoZSBpbmZvcm1hdGlvbiB0byBleGVjX29wKCkgc28gY29u
dHJvbGxlcnMga25vdwo+IHdoZW4gdGhleSBzaG91bGQgZGUtYXNzZXJ0IHRoaXMgcGluIHdpdGhv
dXQgaGF2aW5nIHRvIGRlY29kZQo+IHRoZSBjb21tYW5kIG9wY29kZS4gQmFzZWQgb24gY2hhbmdl
cyBwcm9wb3NlZCBieSBCb3JpcyBCcmV6aWxsb24uCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2Ji
cmV6aWxsb24vbGludXgvY29tbWl0L2U2MTJlMWYyYzY5YTMzYWM1ZjJjOTFkMTM2NjlmMGYxNzJk
NTg3MTcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQG1haWwuY29tPgoK
R2l2ZW4gdGhhdCB0aGVyZSBhcmUgYWxtb3N0IG5vIGNoYW5nZXMgaW4gdGhpcyBwYXRjaCB0aGUg
YXV0aG9yIGFuZApmaXJzdCBTb0Igc2hvdWxkIHJlbWFpbiBCb3JpcyBhbmQgeW91IHNob3VsZCBh
ZGQgeW91ciBTb0IgYWZ0ZXIuCgo+IAo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2Jhc2UuYyB8IDYgKysrKy0tCj4gIGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgIHwg
OSArKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2Uu
YyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gaW5kZXggZDRiNTUxNTVhZWFl
Li40N2NjMmMzNTE1M2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9i
YXNlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IEBAIC0xNDk0
LDcgKzE0OTQsOCBAQCBzdGF0aWMgaW50IG5hbmRfZXhlY19wcm9nX3BhZ2Vfb3Aoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IHBhZ2UsCj4gIAkJCSAgICBOQU5EX0NPTU1PTl9U
SU1JTkdfTlMoY29uZiwgdFdCX21heCkpLAo+ICAJCU5BTkRfT1BfV0FJVF9SRFkoTkFORF9DT01N
T05fVElNSU5HX01TKGNvbmYsIHRQUk9HX21heCksIDApLAo+ICAJfTsKPiAtCXN0cnVjdCBuYW5k
X29wZXJhdGlvbiBvcCA9IE5BTkRfT1BFUkFUSU9OKGNoaXAtPmN1cl9jcywgaW5zdHJzKTsKPiAr
CXN0cnVjdCBuYW5kX29wZXJhdGlvbiBvcCA9IE5BTkRfREVTVFJVQ1RJVkVfT1BFUkFUSU9OKGNo
aXAtPmN1cl9jcywKPiArCQkJCQkJCSAgICAgIGluc3Rycyk7Cj4gIAlpbnQgbmFkZHJzID0gbmFu
ZF9maWxsX2NvbHVtbl9jeWNsZXMoY2hpcCwgYWRkcnMsIG9mZnNldF9pbl9wYWdlKTsKPiAKPiAg
CWlmIChuYWRkcnMgPCAwKQo+IEBAIC0xOTE3LDcgKzE5MTgsOCBAQCBpbnQgbmFuZF9lcmFzZV9v
cChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgZXJhc2VibG9jaykKPiAgCQkJ
TkFORF9PUF9XQUlUX1JEWShOQU5EX0NPTU1PTl9USU1JTkdfTVMoY29uZiwgdEJFUlNfbWF4KSwK
PiAgCQkJCQkgMCksCj4gIAkJfTsKPiAtCQlzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gb3AgPSBOQU5E
X09QRVJBVElPTihjaGlwLT5jdXJfY3MsIGluc3Rycyk7Cj4gKwkJc3RydWN0IG5hbmRfb3BlcmF0
aW9uIG9wID0gTkFORF9ERVNUUlVDVElWRV9PUEVSQVRJT04oY2hpcC0+Y3VyX2NzLAo+ICsJCQkJ
CQkJCSAgICAgIGluc3Rycyk7Cj4gCj4gIAkJaWYgKGNoaXAtPm9wdGlvbnMgJiBOQU5EX1JPV19B
RERSXzMpCj4gIAkJCWluc3Ryc1sxXS5jdHguYWRkci5uYWRkcnMrKzsKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5o
Cj4gaW5kZXggOTBhMTQxYmEyYTVhLi4zMWFjZWRhODYxNmMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5o
Cj4gQEAgLTEwMDgsNiArMTAwOCw3IEBAIHN0cnVjdCBuYW5kX29wX3BhcnNlciB7Cj4gICAqLwo+
ICBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gewo+ICAJdW5zaWduZWQgaW50IGNzOwo+ICsJYm9vbCBk
ZWFzc2VydF93cDsKPiAgCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0cnM7Cj4gIAl1
bnNpZ25lZCBpbnQgbmluc3RyczsKPiAgfTsKPiBAQCAtMTAxOSw2ICsxMDIwLDE0IEBAIHN0cnVj
dCBuYW5kX29wZXJhdGlvbiB7Cj4gIAkJLm5pbnN0cnMgPSBBUlJBWV9TSVpFKF9pbnN0cnMpLAkJ
CVwKPiAgCX0KPiAKPiArI2RlZmluZSBOQU5EX0RFU1RSVUNUSVZFX09QRVJBVElPTihfY3MsIF9p
bnN0cnMpCQlcCj4gKwl7CQkJCQkJCVwKPiArCQkuY3MgPSBfY3MsCQkJCQlcCj4gKwkJLmRlYXNz
ZXJ0X3dwID0gdHJ1ZSwJCQkJXAo+ICsJCS5pbnN0cnMgPSBfaW5zdHJzLAkJCQlcCj4gKwkJLm5p
bnN0cnMgPSBBUlJBWV9TSVpFKF9pbnN0cnMpLAkJCVwKPiArCX0KPiArCj4gIGludCBuYW5kX29w
X3BhcnNlcl9leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAkJCSAgIGNvbnN0IHN0
cnVjdCBuYW5kX29wX3BhcnNlciAqcGFyc2VyLAo+ICAJCQkgICBjb25zdCBzdHJ1Y3QgbmFuZF9v
cGVyYXRpb24gKm9wLCBib29sIGNoZWNrX29ubHkpOwo+IC0tCj4gMi4zNy4zCj4gCj4gCgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
