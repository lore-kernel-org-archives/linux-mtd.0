Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C84C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 08:55:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0201A20738
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 08:55:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k9YFy8aW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0201A20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUrTJtPAcyF815Z2ZEe5vJwXP9e4UuwgxEQfSLX6K4c=; b=k9YFy8aWE2r0L2
	i/yMd/huev4qrr2/V05ix1quGgvtdtDxqvpIR2ZZoZxh8JYgBjRFJxNbzKko7GFZ5+lurfz9GNUBg
	3EalY7fvy0rM/3rvOqPcw9gNGcBvQIOfCdfyk+jHQs1eaUkaT40pCSHCcQU5jpGFZEPAYLj/WdTOQ
	0EM1pq4HcxQsD+uzeYI2xdXaN5XNLKrzaWm7X5CxGsm/C8a6dsv6EexWsh5Lthrj0n+oqxSzsdDoO
	0RFIHvIuDUckExetddv+Ct75UAHJPeGw8dTP3sJu2lOGsza1RyHQSiAnmEMQlf0gfHfhEzJIbYTCH
	4pPc/t6C3Tcvwq9HYXVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkktM-0007J2-Fy; Mon, 15 Jun 2020 08:54:56 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkkt8-00075i-0f; Mon, 15 Jun 2020 08:54:43 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DAB662000B;
 Mon, 15 Jun 2020 08:54:35 +0000 (UTC)
Date: Mon, 15 Jun 2020 10:54:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v3] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200615105433.56fb5310@xps13>
In-Reply-To: <20200612073549.1658336-1-noltari@gmail.com>
References: <20200608160649.3717152-1-noltari@gmail.com>
 <20200612073549.1658336-1-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_015442_202897_D18B1548 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: f.fainelli@gmail.com, vigneshr@ti.com, richard@nod.at,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
 bcm-kernel-feedback-list@broadcom.com, jonas.gorski@gmail.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIEZyaSwgMTIgSnVuIDIwMjAKMDk6MzU6NDkgKzAyMDA6Cgo+IEluc3RlYWQgb2Yg
dHJ5aW5nIHRvIHBhcnNlIENGRSB2ZXJzaW9uIHN0cmluZywgd2hpY2ggaXMgY3VzdG9taXplZCBi
eSBzb21lCj4gdmVuZG9ycywgbGV0J3MganVzdCBjaGVjayB0aGF0ICJDRkUxIiB3YXMgcGFzc2Vk
IG9uIGFyZ3VtZW50IDMuCj4gCj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJv
amFzIDxub2x0YXJpQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBHb3Jza2kgPGpv
bmFzLmdvcnNraUBnbWFpbC5jb20+Cj4gLS0tCj4gIHYzOiBrZWVwIENPTVBJTEVfVEVTVCBjb21w
YXRpYmlsaXR5IGJ5IGFkZGluZyBhIG5ldyBmdW5jdGlvbiB0aGF0IG9ubHkgY2hlY2tzCj4gICAg
ICBmd19hcmczIHdoZW4gQ09ORklHX01JUFMgaXMgZGVmaW5lZC4KPiAgdjI6IHVzZSBDRkVfRVBU
U0VBTCBkZWZpbml0aW9uIGFuZCBhdm9pZCB1c2luZyBhbiBhZGRpdGlvbmFsIGZ1bmN0aW9uLgo+
IAo+ICBkcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMgfCAzNCArKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAy
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202
M3h4cGFydC5jIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCj4gaW5kZXggNzhm
OTBjNmMxOGZkLi5jNTE0YzA0Nzg5YWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vy
cy9iY202M3h4cGFydC5jCj4gKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5j
Cj4gQEAgLTIyLDYgKzIyLDExIEBACj4gICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0aW9ucy5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAgCj4gKyNpZmRlZiBDT05GSUdfTUlQUwo+ICsj
aW5jbHVkZSA8YXNtL2Jvb3RpbmZvLmg+Cj4gKyNpbmNsdWRlIDxhc20vZncvY2ZlL2NmZV9hcGku
aD4KPiArI2VuZGlmIC8qIENPTkZJR19NSVBTICovCj4gKwo+ICAjZGVmaW5lIEJDTTk2M1hYX0NG
RV9CTE9DS19TSVpFCQlTWl82NEsJLyogYWx3YXlzIGF0IGxlYXN0IDY0S2lCICovCj4gIAo+ICAj
ZGVmaW5lIEJDTTk2M1hYX0NGRV9NQUdJQ19PRkZTRVQJMHg0ZTAKPiBAQCAtMzIsMjggKzM3LDEz
IEBACj4gICNkZWZpbmUgU1RSX05VTExfVEVSTUlOQVRFKHgpIFwKPiAgCWRvIHsgY2hhciAqX3N0
ciA9ICh4KTsgX3N0cltzaXplb2YoeCkgLSAxXSA9IDA7IH0gd2hpbGUgKDApCj4gIAo+IC1zdGF0
aWMgaW50IGJjbTYzeHhfZGV0ZWN0X2NmZShzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlcikKPiArc3Rh
dGljIGlubGluZSBpbnQgYmNtNjN4eF9kZXRlY3RfY2ZlKHZvaWQpCj4gIHsKPiAtCWNoYXIgYnVm
WzldOwo+IC0JaW50IHJldDsKPiAtCXNpemVfdCByZXRsZW47Cj4gLQo+IC0JcmV0ID0gbXRkX3Jl
YWQobWFzdGVyLCBCQ005NjNYWF9DRkVfVkVSU0lPTl9PRkZTRVQsIDUsICZyZXRsZW4sCj4gLQkJ
ICAgICAgICh2b2lkICopYnVmKTsKPiAtCWJ1ZltyZXRsZW5dID0gMDsKPiAtCj4gLQlpZiAocmV0
KQo+IC0JCXJldHVybiByZXQ7Cj4gLQo+IC0JaWYgKHN0cm5jbXAoImNmZS12IiwgYnVmLCA1KSA9
PSAwKQo+IC0JCXJldHVybiAwOwo+IC0KPiAtCS8qIHZlcnkgb2xkIENGRSdzIGRvIG5vdCBoYXZl
IHRoZSBjZmUtdiBzdHJpbmcsIHNvIGNoZWNrIGZvciBtYWdpYyAqLwo+IC0JcmV0ID0gbXRkX3Jl
YWQobWFzdGVyLCBCQ005NjNYWF9DRkVfTUFHSUNfT0ZGU0VULCA4LCAmcmV0bGVuLAo+IC0JCSAg
ICAgICAodm9pZCAqKWJ1Zik7Cj4gLQlidWZbcmV0bGVuXSA9IDA7Cj4gLQo+IC0JcmV0dXJuIHN0
cm5jbXAoIkNGRTFDRkUxIiwgYnVmLCA4KTsKPiArI2lmZGVmIENPTkZJR19NSVBTCj4gKwlyZXR1
cm4gKGZ3X2FyZzMgPT0gQ0ZFX0VQVFNFQUwpOwo+ICsjZWxzZQo+ICsJcmV0dXJuIDA7Cj4gKyNl
bmRpZiAvKiBDT05GSUdfTUlQUyAqLwoKV2hhdCBhYm91dDoKCglyZXQgPSAwOwoKI2lmZGVmIENP
TkZJR19NSVBTCglyZXQgPSAoZndfYXJnMyA9PSBDRkVfRVBUU0VBTCkKI2VuZGlmCgoJcmV0dXJu
IHJldDsKClRoaXMgaXMgZm9yIHNob3J0ZW5pbmcgdGhlIGNvbmRpdGlvbmFsIHBhcnQuCgo+ICB9
Cj4gIAo+ICBzdGF0aWMgaW50IGJjbTYzeHhfcmVhZF9udnJhbShzdHJ1Y3QgbXRkX2luZm8gKm1h
c3RlciwKPiBAQCAtMTM4LDcgKzEyOCw3IEBAIHN0YXRpYyBpbnQgYmNtNjN4eF9wYXJzZV9jZmVf
cGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwKPiAgCXN0cnVjdCBiY205NjN4eF9u
dnJhbSAqbnZyYW0gPSBOVUxMOwo+ICAJaW50IHJldDsKPiAgCj4gLQlpZiAoYmNtNjN4eF9kZXRl
Y3RfY2ZlKG1hc3RlcikpCj4gKwlpZiAoIWJjbTYzeHhfZGV0ZWN0X2NmZSgpKQo+ICAJCXJldHVy
biAtRUlOVkFMOwo+ICAKPiAgCW52cmFtID0gdnphbGxvYyhzaXplb2YoKm52cmFtKSk7CgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
