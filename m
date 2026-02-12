Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5987EB4900
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxEiq10xv/kDgKcS41K0uZhC6atMJG3uyoq/GodtHfI=; b=XUS/NsJts+g/ac
	MIoaG9/Yn7sHegK3QFnpnL+dPGOd2AqNxDfmNbNzj3wIANC8QA7BwxJLVWnUp7VB2FnUAwgqEInV0
	OXF7VxBHGRftxRrwt3MzSRpAGa+G709OOw4OKQkDThPKni7lC09z0Lh2ZNfu2h/Pd2NkQTXA1Qj9I
	aJASHVZKgUuKEu0GqUj8sPTvnCIxbh9x8p7XToiHDWoZVpunuzxBaE/5G3XRAu8ksQEIWRpSf1Bke
	fDxeS2yZ9nKv2XyfkLHbDSYD9I7q314u/u3yWwnZUmMi2bTSJ/Fv7F1fxg1xR0nc9I6ZrvOjfyynF
	RK4ZhGi622hRAkkk8pWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUMa-00000001xgB-3aEw;
	Thu, 12 Feb 2026 10:56:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUMW-00000001xfj-1CQP
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 10:55:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3C7574E40CB9;
	Thu, 12 Feb 2026 10:55:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E2EB606CA;
	Thu, 12 Feb 2026 10:55:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E989119718DE;
	Thu, 12 Feb 2026 11:55:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770893751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E2SMN+BIfw5yU3tNiYXzFDMuLU0QrZTEoxC8Qr6cOtk=;
	b=ze2iH1Q7JcOz3PC+1edI9DyH7FNgeY2O/SqrulLsEv+NNy0oxvIX3GGxJTSk7qaSMfkM+Q
	ft82KE/dEwzOAoPrZdPoXJ+7x4NmsygE/QB9YV16Lsthl2Yj/o8C/5c5zMDW1HPgLSCvSP
	+qHMc7x2dw8FCchLABwuDBVsyWChf70KJQ82NbXynGKAPrgvr0EEXh6x9NsBbhOUYdDEjx
	bgZ+Sjdib7mQ0xCZ7PWQMFuSiwbzXmzQv/VfwLyhkOoZ/ChlRb3TiPhn7fHfIQQy8/aXYt
	7zsb4fjmm1EbdBm7he/Ybaw31NriUvag3ZVV8Q0iDJ9QgoxjR/8Q84xjbNLobA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Mikhail Kshevetskiy
 <mikhail.kshevetskiy@iopsys.eu>,  Pablo Martin-Gomez
 <pmartin-gomez@freebox.fr>,  Tianling Shen <cnsztl@gmail.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v5 3/3] mtd: spi-nand: macronix: Enable randomizer support
In-Reply-To: <20260211100553.907585-4-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 11 Feb 2026 18:05:53 +0800")
References: <20260211100553.907585-1-linchengming884@gmail.com>
	<20260211100553.907585-4-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Feb 2026 11:55:43 +0100
Message-ID: <87ldgyxmc0.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_025556_485907_400E0C82 
X-CRM114-Status: GOOD (  18.97  )
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

T24gMTEvMDIvMjAyNiBhdCAxODowNTo1MyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21p
bmc4ODRAZ21haWwuY29tPiB3cm90ZToKCj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWlu
Z2xpbkBteGljLmNvbS50dz4KPgo+IEltcGxlbWVudCB0aGUgJ3NldF9yYW5kb21pemVyJyBjYWxs
YmFjayBmb3IgTWFjcm9uaXggU1BJIE5BTkQgY2hpcHMuCj4gVGhlIHJhbmRvbWl6ZXIgaXMgZW5h
YmxlZCBieSBzZXR0aW5nIGJpdCAxIG9mIHRoZSBDb25maWd1cmF0aW9uIFJlZ2lzdGVyCj4gKGFk
ZHJlc3MgMHgxMCkuCj4KPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIGZvbGxvd2lu
ZyBjaGlwczoKPiAgIC0gTVgzNUxGeEcyNEFEIHNlcmllcwo+ICAgLSBNWDM1VUZ4RzI0QUQgc2Vy
aWVzCj4KPiBXaGVuIHRoZSByYW5kb21pemVyIGlzIGVuYWJsZWQsIGRhdGEgaXMgc2NyYW1ibGVk
IGludGVybmFsbHkgZHVyaW5nCj4gcHJvZ3JhbSBvcGVyYXRpb25zIGFuZCBhdXRvbWF0aWNhbGx5
IGRlc2NyYW1ibGVkIGR1cmluZyByZWFkIG9wZXJhdGlvbnMuCj4gVGhpcyBoZWxwcyByZWR1Y2Ug
Yml0IGVycm9ycyBjYXVzZWQgYnkgcHJvZ3JhbSBkaXN0dXJiYW5jZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jCj4gaW5kZXggZWRmNjNiOTk5NmNmLi4z
YTlhYjE0NjQyNmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXgu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMKPiBAQCAtMTQsNiArMTQs
OCBAQAo+ICAjZGVmaW5lIE1BQ1JPTklYX0VDQ1NSX0JGX0xBU1RfUEFHRShlY2NzcikgRklFTERf
R0VUKEdFTk1BU0soMywgMCksIGVjY3NyKQo+ICAjZGVmaW5lIE1BQ1JPTklYX0VDQ1NSX0JGX0FD
Q1VNVUxBVEVEX1BBR0VTKGVjY3NyKSBGSUVMRF9HRVQoR0VOTUFTSyg3LCA0KSwgZWNjc3IpCj4g
ICNkZWZpbmUgTUFDUk9OSVhfQ0ZHX0NPTlRfUkVBRCAgICAgICAgIEJJVCgyKQo+ICsjZGVmaW5l
IE1BQ1JPTklYX0NGR19SQU5ET01JWkVSX0VOICAgICBCSVQoMSkKPiArI2RlZmluZSBNQUNST05J
WF9GRUFUVVJFX0FERFJfUkFORE9NSVpFUiAweDEwCj4gICNkZWZpbmUgTUFDUk9OSVhfRkVBVFVS
RV9BRERSX1JFQURfUkVUUlkgMHg3MAo+ICAjZGVmaW5lIE1BQ1JPTklYX05VTV9SRUFEX1JFVFJZ
X01PREVTIDUKPiAgCj4gQEAgLTE0Niw3ICsxNDgsNyBAQCBzdGF0aWMgaW50IG1hY3Jvbml4X3Nl
dF9jb250X3JlYWQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLCBib29sIGVuYWJsZSkK
PiAgICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvdGhlcndp
c2UuCj4gICAqLwo+ICBzdGF0aWMgaW50IG1hY3Jvbml4X3NldF9yZWFkX3JldHJ5KHN0cnVjdCBz
cGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAtCQkJCQkgICAgIHVuc2lnbmVkIGludCByZXRyeV9t
b2RlKQo+ICsJCQkJICAgdW5zaWduZWQgaW50IHJldHJ5X21vZGUpCgpUaGlzIGlzIHVucmVsYXRl
ZCwgaXQgc2hvdWxkIGJlIGluIGFuIG90aGVyIGNvbW1pdC4KCj4gIHsKPiAgCXN0cnVjdCBzcGlf
bWVtX29wIG9wID0gU1BJTkFORF9TRVRfRkVBVFVSRV8xU18xU18xU19PUChNQUNST05JWF9GRUFU
VVJFX0FERFJfUkVBRF9SRVRSWSwKPiAgCQkJCQkJCSAgICAgICBzcGluYW5kLT5zY3JhdGNoYnVm
KTsKPiBAQCAtMTU1LDYgKzE1NywxOCBAQCBzdGF0aWMgaW50IG1hY3Jvbml4X3NldF9yZWFkX3Jl
dHJ5KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCXJldHVybiBzcGlfbWVtX2V4
ZWNfb3Aoc3BpbmFuZC0+c3BpbWVtLCAmb3ApOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IG1hY3Jv
bml4X3NldF9yYW5kb21pemVyKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgYm9vbCBl
bmFibGUpCj4gK3sKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gc3BpbmFuZF93cml0ZV9yZWdf
b3Aoc3BpbmFuZCwgTUFDUk9OSVhfRkVBVFVSRV9BRERSX1JBTkRPTUlaRVIsCj4gKwkJCQkgICBl
bmFibGUgPyBNQUNST05JWF9DRkdfUkFORE9NSVpFUl9FTiA6Cj4gMCk7CgpZb3UgY2FuIGRpcmVj
dGx5IHJldHVybi4gU2FtZSBpbiB0aGUgY29yZSBCVFcuCgpPdGhlcndpc2Ugd2l0aCB0aGlzIGFu
ZCB0aGUgYmluZGluZyBkb2N1bWVudCBmaXhlZCwgbG9va3Mgb2suCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
