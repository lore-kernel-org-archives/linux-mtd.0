Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EDEF30921
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpCzrdmVyRmiIyYo+WFBIjNKDZ/EsGw2HhkwSxJYO40=; b=t+2aSw4sYS/Y/f
	2LMhIi3gv3qZVx6h50wS1paoVGdolfPVBRe5IOVGPZ7Wn8k3OUk1Z4VeM7Cg1Milyl0J4yMK/YEYt
	PyIKbTlxxxDxgqnbVW9ChVU0n97cVA3LwqEXsmQ4I0+v0jTEwfkocAFyS2qXYA9JWBNTFvNBRzku1
	dZY7arq6T3ghJ7f7Ivy2eal91mPirTZlI6IqYA4HJQAX3bRIzfBZaQWJbp7OcnlBKFj1/ISgtGmzP
	H7gdoKZ0AVS0pz7hpTKaeyZIVtxgt6YPf0gWSFzkJl7qEK2eBQZgyNkTBvQlt7RDU0I5MAvT229JV
	lfTr1aZ3Q3oPpAosYeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4yB-00000001NPo-0ld9;
	Thu, 05 Mar 2026 09:26:11 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4y7-00000001NOH-06FH
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 09:26:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71D73C40415;
	Thu,  5 Mar 2026 09:26:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D42755FDEB;
	Thu,  5 Mar 2026 09:26:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 905521036984E;
	Thu,  5 Mar 2026 10:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772702763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xdQrU4qXjTQ+7Me9O0jc4BQBHlE/G3e5V9tAzTNavKA=;
	b=XEQqk9leLVrIMuzk8bu7Hj6g5wiJ3yEC0RKVMO8iNt9vdNP9G705szS3WVJblHVezb+wqQ
	knRXsgJUpwXDcxt5LoA/+JHO+6D9EEohgAlgfqNL9KkER5FiXq1ZLhrNj5NNw3uTPWnmTs
	t60qOH/4vi76epX0K3q2ieHpmKKQnm1JXDW7+Nk1Nes2tXOJQMB+QeKKFU0TJRnNtVt9Ei
	Cvvb/na82PeG0J8h89D24oR8fTwfpCYmlAEjjUgLcopF/2InzieX8bq104U9VCdgtIGAME
	8//EWQik54BRtDpQ9YeDG8AbFsTMmwqlYzONPvxoMQAEzZY6vxFj1oyLCtavfA==
Message-ID: <2d65c928-8b4e-4224-93db-a1430945d719@bootlin.com>
Date: Thu, 5 Mar 2026 10:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-2-richard.genoud@bootlin.com>
 <5967652.DvuYhMxLoT@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <5967652.DvuYhMxLoT@jernej-laptop>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_012607_197098_85CD4AB6 
X-CRM114-Status: GOOD (  18.67  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMjEvMDIvMjAyNiDDoCAxMDoxMywgSmVybmVqIMWga3JhYmVjIGEgw6ljcml0wqA6Cj4gRG5l
IHBldGVrLCAyMC4gZmVicnVhciAyMDI2IG9iIDE3OjEwOjA2IFNyZWRuamVldnJvcHNraSBzdGFu
ZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPj4gVGhlIGF2YWlsYWJs
ZSBsZW5ndGggaXMgcmVhbGx5IFVTRVJfREFUQV9MRU4gLSAyIGluc3RlYWQgb2YganVzdCAyICh0
aGUKPj4gdXNlciBkYXRhIGxlbmd0aCBtaW51cyB0aGUgQkJNIGxlbmd0aCkKPj4gVGhhdCBkb2Vz
bid0IGNoYW5nZSBhbnl0aGluZyBub3csIGJ1dCBpZiBVU0VSX0RBVEFfTEVOIGNoYW5nZXMsIGl0
IHdpbGwuCj4gCj4gcy9VU0VSX0RBVEFfTEVOL1VTRVJfREFUQV9TWi8KPiAKPj4KPj4gU2lnbmVk
LW9mZi1ieTogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vub3VkQGJvb3RsaW4uY29tPgo+IAo+
IElmIHRoaXMgaXMgcmVhbGx5IGEgZml4IGFzIHN1YmplY3Qgc3VnZ2VzdCwgdGhlbiBGaXhlcyB0
YWcgaXMgaW4gb3JkZXIuIEhvd2V2ZXIsCj4gdGhpcyBsb29rcyBtb3JlIGxpa2UgY29kZSByZWZh
Y3RvciBhcyBlbmQgcmVzdWx0IGlzIHRoZSBzYW1lLiBTbyBtYXliZQo+IHJld29yZCBzdWJqZWN0
PwpZZXMsIGl0J3MgbW9yZSBhIGNvZGUgY2xhcmlmaWNhdGlvbiwgSSdsbCByZXdvcmQgdGhhdC4K
ClRoYW5rcyEKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEplcm5lago+IAo+PiAtLS0KPj4gICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgfCA0ICsrLS0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3Vu
eGlfbmFuZC5jCj4+IGluZGV4IDlkY2RjOTM3MzRjYi4uYzQyMDkwOWI5NDRiIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+IEBAIC0xNzYxLDEyICsxNzYxLDEyIEBAIHN0YXRp
YyBpbnQgc3VueGlfbmFuZF9vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50
IHNlY3Rpb24sCj4+ICAgCj4+ICAgCS8qCj4+ICAgCSAqIFRoZSBmaXJzdCAyIGJ5dGVzIGFyZSB1
c2VkIGZvciBCQiBtYXJrZXJzLCBoZW5jZSB3ZQo+PiAtCSAqIG9ubHkgaGF2ZSAyIGJ5dGVzIGF2
YWlsYWJsZSBpbiB0aGUgZmlyc3QgdXNlciBkYXRhCj4+ICsJICogb25seSBoYXZlIFVTRVJfREFU
QV9TWiAtIDIgYnl0ZXMgYXZhaWxhYmxlIGluIHRoZSBmaXJzdCB1c2VyIGRhdGEKPj4gICAJICog
c2VjdGlvbi4KPj4gICAJICovCj4+ICAgCWlmICghc2VjdGlvbiAmJiBlY2MtPmVuZ2luZV90eXBl
ID09IE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0hPU1QpIHsKPj4gICAJCW9vYnJlZ2lvbi0+b2Zm
c2V0ID0gMjsKPj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSAyOwo+PiArCQlvb2JyZWdpb24tPmxl
bmd0aCA9IFVTRVJfREFUQV9TWiAtIDI7Cj4+ICAgCj4+ICAgCQlyZXR1cm4gMDsKPj4gICAJfQo+
Pgo+IAo+IAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
