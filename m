Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771BAC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 07:56:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48672204EA
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 07:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LagHOWvQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48672204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdqTdg/NJtO47JcrqUuUoqy/dgRD4Zmc7ZLGOInppsM=; b=LagHOWvQoyKInv
	zrS07EdOBro/1y4B/mt9vqyXxVjWkBepr12zxpIwBt0mNcaeU2URTEetQSXCvbFdOvJosuiFikgap
	9QF4gM3uoUPyUo+dHJ8RwT+oh52yHGPeTBseoBN6bDWBmAUkHxMnMQZwvMz9jaPDI0fcL3T5fkUwZ
	8MRylppqNnXC0BE74hzNk617jjqnw/AbRoeeHLe8W9mYnWWyxD1+B4UwoITicgGQLiBbTZ/NkR3qr
	vC+t4bdOkm5QhwRbGBPfUpr1FG4uKbytDRrQgobMkMf/15sQZbizAGUmCUPqdj8TkHAplqd3idwqY
	/gVzbYjvLdu84PZqAPoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjI44-0006tb-K0; Thu, 11 Jun 2020 07:55:56 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjI3u-0006jy-Cw; Thu, 11 Jun 2020 07:55:47 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2A8FEFF808;
 Thu, 11 Jun 2020 07:55:41 +0000 (UTC)
Date: Thu, 11 Jun 2020 09:55:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200611095540.250184d2@xps13>
In-Reply-To: <20200608160649.3717152-1-noltari@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_005546_575698_491A1497 
X-CRM114-Status: GOOD (  13.78  )
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
IHdyb3RlIG9uIE1vbiwgIDggSnVuIDIwMjAKMTg6MDY6NDkgKzAyMDA6Cgo+IEluc3RlYWQgb2Yg
dHJ5aW5nIHRvIHBhcnNlIENGRSB2ZXJzaW9uIHN0cmluZywgd2hpY2ggaXMgY3VzdG9taXplZCBi
eSBzb21lCj4gdmVuZG9ycywgbGV0J3MganVzdCBjaGVjayB0aGF0ICJDRkUxIiB3YXMgcGFzc2Vk
IG9uIGFyZ3VtZW50IDMuCj4gCj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJv
amFzIDxub2x0YXJpQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBHb3Jza2kgPGpv
bmFzLmdvcnNraUBnbWFpbC5jb20+Cj4gLS0tCj4gIHYyOiB1c2UgQ0ZFX0VQVFNFQUwgZGVmaW5p
dGlvbiBhbmQgYXZvaWQgdXNpbmcgYW4gYWRkaXRpb25hbCBmdW50aW9uLgo+IAo+ICBkcml2ZXJz
L210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMgfCAyOSArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jIGIvZHJp
dmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCj4gaW5kZXggNzhmOTBjNmMxOGZkLi40OTNh
NzViMmYyNjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCj4gQEAgLTIyLDYgKzIy
LDkgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9vZi5oPgo+ICAKPiArI2luY2x1ZGUgPGFzbS9ib290aW5mby5oPgo+ICsjaW5jbHVkZSA8
YXNtL2Z3L2NmZS9jZmVfYXBpLmg+CgpBcmUgeW91IHN1cmUgYm90aCBpbmNsdWRlcyBhcmUgbmVl
ZGVkPwoKSSBkb24ndCB0aGluayBpdCBpcyBhIGdvb2QgaGFiaXQgdG8gaW5jbHVkZSBhc20vIGhl
YWRlcnMsIGFyZSB5b3Ugc3VyZQp0aGVyZSBpcyBub3QgYW5vdGhlciBoZWFkZXIgZG9pbmcgaXQg
anVzdCBmaW5lPwoKPiArCj4gICNkZWZpbmUgQkNNOTYzWFhfQ0ZFX0JMT0NLX1NJWkUJCVNaXzY0
SwkvKiBhbHdheXMgYXQgbGVhc3QgNjRLaUIgKi8KPiAgCj4gICNkZWZpbmUgQkNNOTYzWFhfQ0ZF
X01BR0lDX09GRlNFVAkweDRlMAo+IEBAIC0zMiwzMCArMzUsNiBAQAo+ICAjZGVmaW5lIFNUUl9O
VUxMX1RFUk1JTkFURSh4KSBcCj4gIAlkbyB7IGNoYXIgKl9zdHIgPSAoeCk7IF9zdHJbc2l6ZW9m
KHgpIC0gMV0gPSAwOyB9IHdoaWxlICgwKQo+ICAKPiAtc3RhdGljIGludCBiY202M3h4X2RldGVj
dF9jZmUoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIpCj4gLXsKPiAtCWNoYXIgYnVmWzldOwo+IC0J
aW50IHJldDsKPiAtCXNpemVfdCByZXRsZW47Cj4gLQo+IC0JcmV0ID0gbXRkX3JlYWQobWFzdGVy
LCBCQ005NjNYWF9DRkVfVkVSU0lPTl9PRkZTRVQsIDUsICZyZXRsZW4sCj4gLQkJICAgICAgICh2
b2lkICopYnVmKTsKPiAtCWJ1ZltyZXRsZW5dID0gMDsKPiAtCj4gLQlpZiAocmV0KQo+IC0JCXJl
dHVybiByZXQ7Cj4gLQo+IC0JaWYgKHN0cm5jbXAoImNmZS12IiwgYnVmLCA1KSA9PSAwKQo+IC0J
CXJldHVybiAwOwo+IC0KPiAtCS8qIHZlcnkgb2xkIENGRSdzIGRvIG5vdCBoYXZlIHRoZSBjZmUt
diBzdHJpbmcsIHNvIGNoZWNrIGZvciBtYWdpYyAqLwo+IC0JcmV0ID0gbXRkX3JlYWQobWFzdGVy
LCBCQ005NjNYWF9DRkVfTUFHSUNfT0ZGU0VULCA4LCAmcmV0bGVuLAo+IC0JCSAgICAgICAodm9p
ZCAqKWJ1Zik7Cj4gLQlidWZbcmV0bGVuXSA9IDA7Cj4gLQo+IC0JcmV0dXJuIHN0cm5jbXAoIkNG
RTFDRkUxIiwgYnVmLCA4KTsKPiAtfQo+IC0KPiAgc3RhdGljIGludCBiY202M3h4X3JlYWRfbnZy
YW0oc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCj4gIAlzdHJ1Y3QgYmNtOTYzeHhfbnZyYW0gKm52
cmFtKQo+ICB7Cj4gQEAgLTEzOCw3ICsxMTcsNyBAQCBzdGF0aWMgaW50IGJjbTYzeHhfcGFyc2Vf
Y2ZlX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCj4gIAlzdHJ1Y3QgYmNtOTYz
eHhfbnZyYW0gKm52cmFtID0gTlVMTDsKPiAgCWludCByZXQ7Cj4gIAo+IC0JaWYgKGJjbTYzeHhf
ZGV0ZWN0X2NmZShtYXN0ZXIpKQo+ICsJaWYgKGZ3X2FyZzMgIT0gQ0ZFX0VQVFNFQUwpCj4gIAkJ
cmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICAJbnZyYW0gPSB2emFsbG9jKHNpemVvZigqbnZyYW0pKTsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
