Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08128C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 09:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAC860F25
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 09:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDAC860F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAs2SppBlMP1DO9If2c3Tb3WMirMOWrk4AphpKZ/fY4=; b=V6Ju5KpET2N4kQ
	uiTG7nmFVx4s4R9MIQhaDZfv6Hi72paEoM8gXUnPRUAjpdBbGESKvSDnCRL47qUmeRM7k8Ha9xhlk
	vhsjGH/otvY336qH7cXAxTRuMcjHKJKrDPf5mRtlL701LdWQ20RLI0BMDztYV4BEEPLOQDENjgXFy
	feI2a3a3wpD6TJOGEzA6kiycIb5o6U4grIPb+KeaGabh5H1nyCPxSfl5YHemH/TNQI5fxLUBeiARU
	o3lUvB38T4Azm1S8MLWn/KjKbjymtVRturCJsmvkatLF1rq+deea+JgCybF93XuSYohJeq+GfKWOz
	Qvt8+6sQ8wInlSxQ6mUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbJez-006KvO-Co; Fri, 15 Oct 2021 09:37:53 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbJev-006Ksr-6V
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 09:37:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 01C5D20007;
 Fri, 15 Oct 2021 09:37:42 +0000 (UTC)
Date: Fri, 15 Oct 2021 11:37:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "xiangsheng.hou" <xiangsheng.hou@mediatek.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark
 Brown <broonie@kernel.org>, "Boris Brezillon" <bbrezillon@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <jaimeliao@mxic.com.tw>,
 <juliensu@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 06/10] mtd: nand: mxic-ecc: Add Macronix external
 ECC engine support
Message-ID: <20211015113741.30712544@xps13>
In-Reply-To: <872348abea7317c6b3d2ed53c8139e0927bb991f.camel@mediatek.com>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-7-miquel.raynal@bootlin.com>
 <872348abea7317c6b3d2ed53c8139e0927bb991f.camel@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_023749_411924_6C6FD353 
X-CRM114-Status: GOOD (  14.71  )
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

SGkgeGlhbmdzaGVuZy5ob3UsCgp4aWFuZ3NoZW5nLmhvdUBtZWRpYXRlay5jb20gd3JvdGUgb24g
V2VkLCAxMyBPY3QgMjAyMSAxNzoxNTo0OSArMDgwMDoKCj4gSGksCj4gCj4gT24gRnJpLCAyMDIx
LTEwLTA4IGF0IDE4OjIyICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gCj4gPiArc3Rh
dGljIGludCBteGljX2VjY19jb3VudF9iaXRlcnJzKHN0cnVjdCBteGljX2VjY19lbmdpbmUgKmVu
ZywKPiA+IHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ID4gK3sKPiA+ICsJc3RydWN0IGRldmljZSAq
ZGV2ID0gZW5nLT5kZXY7Cj4gPiArCXVuc2lnbmVkIGludCBtYXhfYmYgPSAwOwo+ID4gKwlpbnQg
c3RlcDsKPiA+ICsKPiA+ICsJZm9yIChzdGVwID0gMDsgc3RlcCA8IGVuZy0+c3RlcHM7IHN0ZXAr
Kykgewo+ID4gKwkJdTggc3RhdCA9IGVuZy0+c3RhdHVzW3N0ZXBdOwo+ID4gKwo+ID4gKwkJaWYg
KHN0YXQgPT0gTk9fRVJSKSB7Cj4gPiArCQkJZGV2X2RiZyhkZXYsICJFQ0Mgc3RlcCAlZDogbm8g
ZXJyb3JcbiIsIHN0ZXApOwo+ID4gKwkJfSBlbHNlIGlmIChzdGF0ID09IEVSQVNFRF9DSFVOSykg
ewo+ID4gKwkJCWRldl9kYmcoZGV2LCAiRUNDIHN0ZXAgJWQ6IGVyYXNlZFxuIiwgc3RlcCk7Cj4g
PiArCQl9IGVsc2UgaWYgKHN0YXQgPT0gVU5DT1JSX0VSUiB8fCBzdGF0ID4gTUFYX0NPUlJfRVJS
KSB7Cj4gPiArCQkJZGV2X2RiZyhkZXYsICJFQ0Mgc3RlcCAlZDogdW5jb3JyZWN0YWJsZVxuIiwK
PiA+IHN0ZXApOwo+ID4gKwkJCW10ZC0+ZWNjX3N0YXRzLmZhaWxlZCsrOwo+ID4gKwkJfSBlbHNl
IHsKPiA+ICsJCQlkZXZfZGJnKGRldiwgIkVDQyBzdGVwICVkOiAlZCBiaXRzCj4gPiBjb3JyZWN0
ZWRcbiIsCj4gPiArCQkJCXN0ZXAsIHN0YXQpOwo+ID4gKwkJCW1heF9iZiA9IG1heF90KHVuc2ln
bmVkIGludCwgbWF4X2JmLCBzdGF0KTsKPiA+ICsJCQltdGQtPmVjY19zdGF0cy5jb3JyZWN0ZWQg
Kz0gc3RhdDsKPiA+ICsJCX0KPiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gbWF4X2JmOwo+ID4g
K30gIAo+IAo+IEluIHNwaW5hbmRfbXRkX3JlYWQoKSBmdW5jdGlvbiwgcmVseSBvbiB0aGUgcmV0
dXJuIHZhbHVlIC1FQkFETVNHIHRvCj4gY2hlY2sgd2hldGhlciBlY2MgZmFpbGVkLiBUaGVyZWZv
cmUsIG1heWJlIHRoZXJlIGFsc28gbmVlZCByZXR1cm4gdGhpcwo+IHZhbHVlIGluIG14aWNfZWNj
X2NvdW50X2JpdGVycnMoKSBmdW5jdGlvbiB3aGVuIHVuY29ycmVjdGFibGUgZWNjCj4gZXJyb3I/
CgpUcnVlLCBJJ2xsIGZpeCB0aGlzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
