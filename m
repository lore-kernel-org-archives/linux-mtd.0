Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF7BC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pV70OM5kdb96wVf/U5IIk5RiGN0NI4FbqqNCH9sss5o=; b=yqkGDwB6DftvT4
	+4CfCGINMWUZGoIdqnOtSJKKgFBf72jRauJH9KFNXTx5GPB6ktbW+mhGxpDpsMZwsbfVNqlH8k0/Q
	5NKdkBiOISedznmvVbvOJJD7KVB0GSGBw/hzpr4m8IXjfA8OxgsyNELVaFuRLi9KqrzILJJUD4ZVS
	Fwpwcv5412UVE5wKlHDiKODwQ5e3sWuIV/OBg+KAGXDkZJbk0oL29F22PWPbMQxkkPgYqvcnWN96A
	kRUD3ID0ipLJEAhNTfrhluE1Hzjnn+kCMaqg6Hq4WmWMlFNdgA04XRYrw0rBCBCOnBhsVu7vhvKQ3
	gmyzY3tIspCBJv+EG5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSh6u-004Ut6-1q;
	Wed, 24 Jan 2024 17:32:24 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSh6n-004Upf-1Z;
	Wed, 24 Jan 2024 17:32:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B943E1BF207;
	Wed, 24 Jan 2024 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706117532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNQYUSii9IjmdDn/Eb+hTpvR6w3u80ExSZv/+b1sAR0=;
	b=nmJQe8B2zb5cM/dskpVL/QljwU7tZ7EygdQYNJY5H+r6ur3QxzLR63BdYwrVGVBAAVz8oE
	f4dDfPhiZjkkSClGTfGwZ0hmYQdv0Kti0MciANI+m95RAwbnYuSvSmkdJdu5gO35Jtfwaw
	+vEoi1MuBYArur6IIgtKv1KMLdBcDN7helz+kEfosN7n5SvVxDzogQ6GMbPvB4jaHw2aai
	qGYALCoCVhbp91Py7SzTrj1m2dx42VJZkUDdC4KyUVJU17OONEjIhbgdMkjmSGCqOhLyr8
	zy2/DvI4Q55fFqygmXd6kauIiykFiMA1B8P8Zfvu9zBkqdEECPQ243YCargCdA==
Date: Wed, 24 Jan 2024 18:32:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, anand.gore@broadcom.com,
 kursad.oney@broadcom.com, florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v3 06/10] mtd: rawnand: brcmnand: Add support for
 getting ecc setting from strap
Message-ID: <20240124183207.5898cbfd@xps-13>
In-Reply-To: <20240124030458.98408-7-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-7-dregan@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_093217_841238_5103112E 
X-CRM114-Status: GOOD (  16.17  )
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

SGkgRGF2aWQsCgo+IEBAIC0yNjIyLDE5ICsyNjY3LDQzIEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRf
c2V0dXBfZGV2KHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KQo+ICAJCW5hbmRkZXZfZ2V0X21l
bW9yZygmY2hpcC0+YmFzZSk7Cj4gIAlzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCA9
IGhvc3QtPmN0cmw7Cj4gIAlzdHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9zdC0+aHdjZmc7
Cj4gLQljaGFyIG1zZ1sxMjhdOwo+ICsJc3RydWN0IGRldmljZV9ub2RlICpucCA9IG5hbmRfZ2V0
X2ZsYXNoX25vZGUoY2hpcCk7Cj4gIAl1MzIgb2ZmcywgdG1wLCBvb2Jfc2VjdG9yOwo+IC0JaW50
IHJldDsKPiArCWludCByZXQsIHNlY3Rvcl9zaXplXzFrID0gMDsKPiArCWJvb2wgdXNlX3N0cmFw
ID0gZmFsc2U7Cj4gKwljaGFyIG1zZ1sxMjhdOwo+ICAKPiAgCW1lbXNldChjZmcsIDAsIHNpemVv
ZigqY2ZnKSk7Cj4gKwl1c2Vfc3RyYXAgPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJicmNt
LG5hbmQtZWNjLXVzZS1zdHJhcCIpOwo+ICAKPiAtCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5hbmRfZ2V0X2ZsYXNoX25vZGUoY2hpcCksCj4gLQkJCQkgICAiYnJjbSxuYW5kLW9vYi1zZWN0
b3Itc2l6ZSIsCj4gKwkvKgo+ICsJICogU2V0IEVDQyBzaXplIGFuZCBzdHJlbmd0aCBiYXNlZCBv
biBodyBjb25maWd1cmF0aW9uIGZyb20gc3RyYXAKPiArCSAqIGlmIGRldmljZSB0cmVlIGRvZXMg
bm90IHNwZWNpZnkgdGhlbSBhbmQgdXNlIHN0cmFwIHByb3BlcnR5IGlzIHNldAo+ICsJICogSWYg
ZWNjIHN0cmVuZ3RoIGlzIHNldCBpbiBkdHMsIGRvbid0IHVzZSBzdHJhcCBzZXR0aW5nLgo+ICsJ
ICovCgpZb3Ugd291bGQgaGF2ZSB0byB1c2UgdGhlIHN0cmFwIHNldHRpbmdzIG9ubHkgaWYgdGhl
IHByb3BlcnR5IGlzIHNldC4KSWYgbm90IHByb3BlcnR5IGlzIHNldCwgdGhlIGRlZmF1bHQgZnJv
bSB0aGUgY29yZSBzaG91bGQgYXBwbHkgSSBndWVzcy4KCj4gKwlpZiAoY2hpcC0+ZWNjLnN0cmVu
Z3RoKQo+ICsJCXVzZV9zdHJhcCA9IDA7Cj4gKwo+ICsJaWYgKHVzZV9zdHJhcCkgewo+ICsJCWNo
aXAtPmVjYy5zdHJlbmd0aCA9IGJyY21uYW5kX2dldF9lY2Nfc3RyZW5ndGgoaG9zdCk7Cj4gKwkJ
c2VjdG9yX3NpemVfMWsgPSBicmNtbmFuZF9nZXRfc2VjdG9yX3NpemVfMWsoaG9zdCk7Cj4gKwkJ
aWYgKGNoaXAtPmVjYy5zaXplID09IDApIHsKPiArCQkJaWYgKHNlY3Rvcl9zaXplXzFrIDwgMCkK
PiArCQkJCWNoaXAtPmVjYy5zaXplID0gNTEyOwo+ICsJCQllbHNlCj4gKwkJCQljaGlwLT5lY2Mu
c2l6ZSA9IDUxMiA8PCBzZWN0b3Jfc2l6ZV8xazsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJcmV0ID0g
b2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJicmNtLG5hbmQtb29iLXNlY3Rvci1zaXplIiwKPiAg
CQkJCSAgICZvb2Jfc2VjdG9yKTsKPiAgCWlmIChyZXQpIHsKPiAtCQkvKiBVc2UgZGV0ZWN0ZWQg
c2l6ZSAqLwo+IC0JCWNmZy0+c3BhcmVfYXJlYV9zaXplID0gbXRkLT5vb2JzaXplIC8KPiAtCQkJ
CQkobXRkLT53cml0ZXNpemUgPj4gRkNfU0hJRlQpOwo+ICsJCWlmICh1c2Vfc3RyYXApCj4gKwkJ
CWNmZy0+c3BhcmVfYXJlYV9zaXplID0gYnJjbW5hbmRfZ2V0X3NwYXJlX3NpemUoaG9zdCk7Cj4g
KwkJZWxzZQo+ICsJCQkvKiBVc2UgZGV0ZWN0ZWQgc2l6ZSAqLwo+ICsJCQljZmctPnNwYXJlX2Fy
ZWFfc2l6ZSA9IG10ZC0+b29ic2l6ZSAvCj4gKwkJCQkJCShtdGQtPndyaXRlc2l6ZSA+PiBGQ19T
SElGVCk7Cj4gIAl9IGVsc2Ugewo+ICAJCWNmZy0+c3BhcmVfYXJlYV9zaXplID0gb29iX3NlY3Rv
cjsKPiAgCX0KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
