Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09727CA5FCE
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1JfdG+HIZqMG86bLNY8YDRzxVYCwjnQ75kUqZfbXYU=; b=C05uj0XiZx4ZGx
	aUh1i5OxHqvbeSrXIwITW/S8K7Nsr4ldvuzwdnWD5F5W9/sjMS3iiEgnlxoYkyuY88HkvJekfnRE3
	1Uttk1o9/87nqBqcxz2/Bj3JxysAsUDxCyTKBV1lZFHX9n0oZYsRqdtF5gW1qQaXbSe8W6fYfbqhT
	Ko/pXpLP0PWKZaw83df5EFsieeEeTKSRhiQBf264tTM9mb43PWJ6fZr7fDh96L6bYWj6l2Iz/S3AD
	e8RrvyJ0lonRx0RZbbUayhqilfLUvbkCLPiMajaYRr0AwclgwhE+6rgL27okGAM2CxltLIBk4X9SR
	u4Xrzyb2z6J9rCiX5RXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdzU-0000000FsOo-29rY;
	Mon, 05 Oct 2026 08:24:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdzT-0000000FsOe-1wCm
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 08:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2A126022B;
	Mon,  5 Oct 2026 08:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18B81F00898;
	Mon,  5 Oct 2026 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791188646;
	bh=mo8jDsq2x/sPYYjNNC4oneZ7ADjFoHWG7Rk3AGCOwAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nw3TIRcwrnU05+v7gBFQdKalXqjWShEYCDwx2F5Np5ZiTDq189C5FuX2ak5KYtZY+
	 43HJbDZZeNja8rWVYiIHKZPDIGFHU2Lc3ZzF1qLiq1SxmbuQQRLYZ94a5D9gMrlM3g
	 SeQCTixqzXBBUs17erUY2EETiVsU1+XXwxXN+ALbPjEAgh1cPfJiyRpzGCrCHGQsk5
	 C41UiM3s/HiYmAjfCo7i8dJNSM8uPCFMyeMi5JuMM8FQ77JKEdOAGM2Nig6HKzW+uL
	 PQZcENA8D4jd+9GD2cul1Hoe2uBIrFZs+Kl2T/TIw0Nsa/jyUxTFgrm/5XcUFL7a0y
	 b4xaS6GEPjcBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] spi: cadence-xspi: Add irq-less support
To: "Pratyush Yadav" <pratyush@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Paul
 Cercueil" <paul.cercueil@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark
 Brown" <broonie@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Tanmay Jagdale" <tanmay@marvell.com>, "Tony Luck" <tony.luck@intel.com>, "Kees
 Cook" <kees@kernel.org>, linux-spi@vger.kernel.org, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261005081141.33688-4-paul.cercueil@bootlin.com>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
 <20261005081141.33688-4-paul.cercueil@bootlin.com>
Date: Mon, 05 Oct 2026 08:24:05 +0000
Message-Id: <20261005082405.D18B81F00898@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogY2FkZW5jZS14
c3BpOiB1bmhhbmRsZWQgaW50ZXJydXB0IHN0b3JtIGluIHBvbGxpbmcgbW9kZQotIFtIaWdoXSBz
cGk6IGNhZGVuY2UteHNwaTogU0RNQSBXMUMgdHJpZ2dlciBiaXQgbm90IGNsZWFyZWQgaW4gcG9s
bGluZyBtb2RlCi0tCgpjb21taXQgODUwMDIxMzYxMTRhZDQ1MDU1ZDZhYzk3MmRiY2JkZjhjOGUz
ZDZiMgpBdXRob3I6IFRhbm1heSBKYWdkYWxlIDx0YW5tYXlAbWFydmVsbC5jb20+CgpzcGk6IGNh
ZGVuY2UteHNwaTogQWRkIGlycS1sZXNzIHN1cHBvcnQKClRoaXMgY29tbWl0IG1ha2VzIHRoZSBp
bnRlcnJ1cHQgbGluZSBvcHRpb25hbC4gSWYgYW4gaW50ZXJydXB0IGlzIG5vdApwcm92aWRlZCwg
dGhlIGRyaXZlciByZXNvcnRzIHRvIHBvbGxpbmcgcmVnaXN0ZXJzLiBJdCBtb2RpZmllcwpjZG5z
X3hzcGlfc2VuZF9zdGlnX2NvbW1hbmQoKSBhbmQgcHJvYmUgZnVuY3Rpb25zIHRvIGhhbmRsZSBl
bnZpcm9ubWVudHMKd2l0aG91dCBhIGRlZGljYXRlZCBJUlEuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NwaS9zcGktY2FkZW5jZS14c3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14c3Bp
LmMKPiBpbmRleCAzOWM4NjhhNWIxNzFjLi43Y2Y1MmJjYjA1ZGY2IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvc3BpL3NwaS1jYWRlbmNlLXhzcGkuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1jYWRl
bmNlLXhzcGkuYwo+IEBAIC0zNjUsNiArMzY1LDMwIEBAIHN0YXRpYyBpbnQgY2Ruc194c3BpX3dh
aXRfZm9yX2NvbnRyb2xsZXJfaWRsZShzdHJ1Y3QgY2Ruc194c3BpX2RldiAqY2Ruc194c3BpKQpb
IC4uLiBdCj4gK3N0YXRpYyBib29sIGNkbnNfeHNwaV9pc19zZG1hX3JlYWR5KHN0cnVjdCBjZG5z
X3hzcGlfZGV2ICpjZG5zX3hzcGksIGJvb2wgc2xlZXApCj4gK3sKPiArCXUzMiBjdHJsX3N0YXQ7
Cj4gKwo+ICsJcmV0dXJuICFyZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dAo+ICsJCShjZG5zX3hz
cGktPmlvYmFzZSArIENETlNfWFNQSV9JTlRSX1NUQVRVU19SRUcsCj4gKwkJY3RybF9zdGF0LAo+
ICsJCShjdHJsX3N0YXQgJiBDRE5TX1hTUElfU0RNQV9UUklHR0VSKSwKPiArCQlzbGVlcCA/IE1S
VkxfWFNQSV9QT0xMX0RFTEFZX1VTIDogMCwKPiArCQlzbGVlcCA/IE1SVkxfWFNQSV9QT0xMX1RJ
TUVPVVRfVVMgOiAwKTsKPiArfQoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgbGVhdmUgdGhl
IFcxQyAoV3JpdGUtMS10by1DbGVhcikgdHJpZ2dlciBiaXQgc2V0PwoKSXQgYXBwZWFycyBDRE5T
X1hTUElfSU5UUl9TVEFUVVNfUkVHIGlzIGEgbGF0Y2hpbmcgVzFDIHJlZ2lzdGVyIChhcyBzZWVu
IGluCmNkbnNfeHNwaV9pcnFfaGFuZGxlcigpIHdoaWNoIHJlYWRzIGFuZCB3cml0ZXMgYmFjayB0
byBjbGVhciBsYXRjaGVkIGV2ZW50cykuCgpJbiBwb2xsaW5nIG1vZGUgKHdoZW4gaXJxIDwgMCks
IHRoaXMgZnVuY3Rpb24gb25seSByZWFkcyB0aGUgcmVnaXN0ZXIuIEZvcgpiYXNlIENhZGVuY2Ug
aGFyZHdhcmUsIGNkbnNfeHNwaV9zZXRfaW50ZXJydXB0cygpIGRvZXNuJ3QgY2xlYXIgdGhpcyBl
aXRoZXIuCgpDb3VsZCB0aGlzIGNhdXNlIHRoZSBDRE5TX1hTUElfU0RNQV9UUklHR0VSIGJpdCB0
byByZW1haW4gcGVybWFuZW50bHkgc2V0CmFmdGVyIHRoZSBmaXJzdCBTRE1BIHRyYW5zZmVyLCBs
ZWFkaW5nIHN1YnNlcXVlbnQgdHJhbnNmZXJzIHRvIGZhbHNlbHkgc2VlIGEKcmVhZHkgc3RhdGUg
YW5kIHBvdGVudGlhbGx5IGFjY2VzcyBtZW1vcnkgcHJlbWF0dXJlbHk/CgpbIC4uLiBdCj4gQEAg
LTU2MiwxNiArNTg2LDI1IEBAIHN0YXRpYyBpbnQgY2Ruc194c3BpX3NlbmRfc3RpZ19jb21tYW5k
KHN0cnVjdCBjZG5zX3hzcGlfZGV2ICpjZG5zX3hzcGksCj4gIAo+ICAJCWNkbnNfeHNwaV90cmln
Z2VyX2NvbW1hbmQoY2Ruc194c3BpLCBjbWRfcmVncyk7Cj4gIAo+IC0JCXdhaXRfZm9yX2NvbXBs
ZXRpb24oJmNkbnNfeHNwaS0+c2RtYV9jb21wbGV0ZSk7Cj4gLQkJaWYgKGNkbnNfeHNwaS0+c2Rt
YV9lcnJvcikgewo+IC0JCQljZG5zX3hzcGktPnNldF9pbnRlcnJ1cHRzX2hhbmRsZXIoY2Ruc194
c3BpLCBmYWxzZSk7Cj4gKwkJaWYgKGNkbnNfeHNwaS0+aXJxID49IDApIHsKPiArCQkJd2FpdF9m
b3JfY29tcGxldGlvbigmY2Ruc194c3BpLT5zZG1hX2NvbXBsZXRlKTsKPiArCQkJaWYgKGNkbnNf
eHNwaS0+c2RtYV9lcnJvcikgewo+ICsJCQkJY2Ruc194c3BpLT5zZXRfaW50ZXJydXB0c19oYW5k
bGVyKGNkbnNfeHNwaSwgZmFsc2UpOwo+ICsJCQkJcmV0dXJuIC1FSU87Cj4gKwkJCX0KPiArCQl9
IGVsc2UgaWYgKCFjZG5zX3hzcGlfaXNfc2RtYV9yZWFkeShjZG5zX3hzcGksIHRydWUpKSB7Cj4g
IAkJCXJldHVybiAtRUlPOwo+ICAJCX0KPiArCj4gIAkJY2Ruc194c3BpLT5zZG1hX2hhbmRsZXIo
Y2Ruc194c3BpKTsKPiAgCX0KPiAgCj4gLQl3YWl0X2Zvcl9jb21wbGV0aW9uKCZjZG5zX3hzcGkt
PmNtZF9jb21wbGV0ZSk7Cj4gLQljZG5zX3hzcGktPnNldF9pbnRlcnJ1cHRzX2hhbmRsZXIoY2Ru
c194c3BpLCBmYWxzZSk7Cj4gKwlpZiAoY2Ruc194c3BpLT5pcnEgPj0gMCkgewo+ICsJCXdhaXRf
Zm9yX2NvbXBsZXRpb24oJmNkbnNfeHNwaS0+Y21kX2NvbXBsZXRlKTsKPiArCQljZG5zX3hzcGkt
PnNldF9pbnRlcnJ1cHRzX2hhbmRsZXIoY2Ruc194c3BpLCBmYWxzZSk7Cj4gKwl9IGVsc2UgaWYg
KCFjZG5zX3hzcGlfaXNfc3RpZ19yZWFkeShjZG5zX3hzcGksIHRydWUpKSB7Cj4gKwkJcmV0dXJu
IC1FSU87Cj4gKwl9CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBsZWF2ZSBoYXJkd2FyZSBp
bnRlcnJ1cHRzIHBlcm1hbmVudGx5IHVubWFza2VkIGluIHBvbGxpbmcgbW9kZT8KCkF0IHRoZSBz
dGFydCBvZiBjZG5zX3hzcGlfc2VuZF9zdGlnX2NvbW1hbmQoKSwgaW50ZXJydXB0cyBhcmUgdW5t
YXNrZWQKdW5jb25kaXRpb25hbGx5OgoKICAgIGNkbnNfeHNwaS0+c2V0X2ludGVycnVwdHNfaGFu
ZGxlcihjZG5zX3hzcGksIHRydWUpOwoKSG93ZXZlciwgd2hlbiBpcnEgPCAwLCB0aGUgY29ycmVz
cG9uZGluZyB0ZWFyZG93biBjYWxsOgoKICAgIGNkbnNfeHNwaS0+c2V0X2ludGVycnVwdHNfaGFu
ZGxlcihjZG5zX3hzcGksIGZhbHNlKTsKCmlzIHNraXBwZWQgYmVjYXVzZSBpdCBpcyBndWFyZGVk
IGJ5IGlmIChjZG5zX3hzcGktPmlycSA+PSAwKS4gCgpJZiB0aGUgcGh5c2ljYWwgSVJRIGxpbmUg
aXMgY29ubmVjdGVkIG9yIHNoYXJlZCwgY291bGQgdGhpcyBjYXVzZSB0aGUKY29udHJvbGxlciB0
byBhc3NlcnQgaXQgaW5kZWZpbml0ZWx5LCB0cmlnZ2VyaW5nIGFuIHVuaGFuZGxlZCBpbnRlcnJ1
cHQgc3Rvcm0KdGhhdCBmb3JjZXMgdGhlIGtlcm5lbCB0byBkaXNhYmxlIHRoZSBJUlEgbGluZT8K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjEwMDUwODExNDEuMzM2ODgtMS1wYXVsLmNlcmN1ZWlsQGJvb3RsaW4uY29tP3BhcnQ9MwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
