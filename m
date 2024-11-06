Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8E2D59F70
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V0I1Ad/BbhanmZGBDW1BF2NKUw3O+MTTOKaXXqiUILQ=; b=StkXiFz9WNw2hybi1WeQRX8ecv
	3J3Elc45Y2sTv66ZKQH1nH7bkpBvLZ1xkFqcB1gRMpsZK2DcaqjPzA0DhwcWvx0DNsaGAs/RZCdxD
	ighNex060UUcpryVRVQWJ400M9s1/ehRUIa7NKdOripQjF3YP/X4TGsuw9e4R6P5RQ5eC9L4DXAd9
	cmsBgasDCjPAQoCgxN0cz6D86UeyepZ2SUBOQoK/ZEnCyeR16XrQuV2a2icJkE9vn+7wsczGMWtSy
	cvD0dBYiPTHoOq8eWoTWKR61AR60bap6wJ4RyvTRQYKa8x8pauV+zKCen++CoZpt7lCAQ/1YVc2+U
	G6C4PTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mWA-00000004fjY-02Rv;
	Wed, 06 Nov 2024 20:20:42 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mW7-00000004ffq-0K6I
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 20:20:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 59F822A87E1;
	Wed,  6 Nov 2024 21:20:27 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id GNFDiWrzpbrz; Wed,  6 Nov 2024 21:20:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A517D2A87EA;
	Wed,  6 Nov 2024 21:20:26 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yypw0MyCMY85; Wed,  6 Nov 2024 21:20:26 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 858542A87E1;
	Wed,  6 Nov 2024 21:20:26 +0100 (CET)
Date: Wed, 6 Nov 2024 21:20:26 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard X Andersson <rickard.andersson@axis.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <2095423248.201132.1730924426363.JavaMail.zimbra@nod.at>
In-Reply-To: <20241011125904.2915983-2-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com> <20241011125904.2915983-2-rickard.andersson@axis.com>
Subject: Re: [PATCH v3 02/10] ubi: Expose mean erase counter for fastmap in
 sysfs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Expose mean erase counter for fastmap in sysfs
Thread-Index: SexSTV0uWOQPBuTPvkpIpWOu5AYRkA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_122039_278120_60F3F6AD 
X-CRM114-Status: GOOD (  11.93  )
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

Umlja2FyZCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJSaWNrYXJk
IFggQW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4gQW46ICJyaWNoYXJk
IiA8cmljaGFyZEBub2QuYXQ+LCAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LAo+ICJyaWNr
YXJkMzE0IGFuZGVyc3NvbiIgPHJpY2thcmQzMTQuYW5kZXJzc29uQGdtYWlsLmNvbT4KPiBDQzog
IlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4sICJrZXJu
ZWwiIDxrZXJuZWxAYXhpcy5jb20+Cj4gR2VzZW5kZXQ6IEZyZWl0YWcsIDExLiBPa3RvYmVyIDIw
MjQgMTQ6NTg6NTYKPiBCZXRyZWZmOiBbUEFUQ0ggdjMgMDIvMTBdIHViaTogRXhwb3NlIG1lYW4g
ZXJhc2UgY291bnRlciBmb3IgZmFzdG1hcCBpbiBzeXNmcwoKPiBTaW5jZSB0aGUgZmFzdG1hcCBh
cmVhIGhhcyBpdHMgb3duIHdlYXIgbGV2ZWxsaW5nIGl0IGlzIHZhbHVhYmxlIHRvCj4gcHJvdmlk
ZSBhIG1lYW4gdmFsdWUgZm9yIHRoYXQgYXJlYS4gVGhpcyB2YWx1ZSBjYW4gYmUgdXNlZCBpbiBv
cmRlcgo+IHRvIGVzdGltYXRlIGxpZmUgZXhwZWN0YW5jeSBvZiB0aGUgZmxhc2guCj4gCj4gUmV2
aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgo+
IC0tLQo+IGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgMTEgKysrKysrKysrKysKPiAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91
YmkvYnVpbGQuYyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gaW5kZXggMjMxY2EyODhmMzk3
Li4xYzUzMWQ2MjNhNjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiAr
KysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IEBAIC0xMzMsNiArMTMzLDEwIEBAIHN0YXRp
YyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWF4X2VjID0KPiAJX19BVFRSKG1heF9lYywg
U19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsKPiBzdGF0aWMgc3RydWN0IGRldmlj
ZV9hdHRyaWJ1dGUgZGV2X21lYW5fZWMgPQo+IAlfX0FUVFIobWVhbl9lYywgU19JUlVHTywgZGV2
X2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsKPiArI2lmZGVmIENPTkZJR19NVERfVUJJX0ZBU1RNQVAK
PiArc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9tZWFuX2VjX2Zhc3RtYXAgPQo+
ICsJX19BVFRSKG1lYW5fZWNfZmFzdG1hcCwgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBO
VUxMKTsKPiArI2VuZGlmCgpEbyB5b3UgcmVhbGx5IG5lZWQgZGlzdGluY3Qgc3lzZnMgYXR0cmli
dXRlcyBmb3IgdGhlIGZhc3RtYXAgYW5kIHRoZQpub24tZmFzdG1hcCBjYXNlPyBVc2Vyc3BhY2Ug
ZG9lcyBub3QgY2FyZSB3aGV0aGVyIGZhc3RtYXAgaXMgdXNlZCBvcgpub3QsIGFsbCB1c2Vyc3Bh
Y2UgaXMgaW50ZXJlc3RlZCBpbiBpcyB0aGUgbWVhbiBlcmFzZSBjb3VudGVyIHZhbHVlLgoKSU1I
TywgdGhlIG1lYW5fZWMgYXR0cmlidXRlIHNob3VsZCBjb21iaW5lIHRoZSBtZWFuIEVDIHZhbHVl
cyBmcm9tCnRoZSBmYXN0bWFwIGFuZCB0aGUgZGF0YSBhcmVhLgoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
