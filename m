Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823C0C2A062
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/cO4DePerT2L5VZb5WPJLcC61DbxsyVL4D9WJmC3IA=; b=eORQIsA307nudI
	DM2PG/rLc/8lNDz1LVKN1flkv3bDNil1A23h1Ts6DGIvIGAk0ZtJc8127RnZ86aAduc0IRc7CG443
	Jt1kYQM84LEhzEae/dxDQP909upbBtWdTalG5AebcptNLtzXnogi9F8FmeZGi6/lEf2TGzanOU9i3
	119nEPjR0h9QEQ7V6U0bXLUczRKuCGtNNgwCzCz0YKi7QLNuyD8hvy0LVHvEGqjAYvorueT/XojUI
	IiT9UJHQ7e8FsBBjtkoUCXgCDxDmLHgrXoAL9XzfF0CjMj2saGdR3+HQWbrCJm5Zra7Lwe1nDnAqw
	OZTWbNz0jjcNnBp/ceow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfHx-0000000Ava4-2g0b;
	Mon, 05 Jan 2026 07:46:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfHp-0000000AvZZ-2Ktk
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jan 2026 07:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D691D437DE;
	Mon,  5 Jan 2026 07:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24ABC116D0;
	Mon,  5 Jan 2026 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767599155;
	bh=k6Tt5yTwHGvGjAYNj5vnutG3De0UqSFPh6CVE9bICIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tgd70OPnYQqVw0gUaYhdLwpZd5uyr3gmOOwrOOISPEe1PV+NfPyxEgvyKroSXQFyS
	 RPLee18ZDQreq/UEC8Vzaon3yiJSreHoRw+zRJdWkWWZQP/Eq9UoICMFdwF5ewenMt
	 6f8f1FBgqBx9nZnYCqaaOO6xXsQj1b/ckDCRe6yMQSEmvjZmNj1rIqhoVrVW+oAkv3
	 q/knFwQZk8DXriN2bIqDVH0rS/m/Ofc9M+BXWuoHKFclPvp/aL2hY+Sq4iBYGjO/S7
	 GXAOZZjEyPHFr1x+oLCf9qdvAn47y6gwh+RgAeKt/YjyoAT9CfCc7jyWWOk/Dwl9r6
	 CQHuY5T/Qyg0Q==
Date: Mon, 5 Jan 2026 13:15:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Stefan Agner <stefan@agner.ch>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF
 child loop
Message-ID: <yy6nfsezapap7o2pnbydczoh6376crzr33oibkuwonygxnhsky@ongy4c6cy67m>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_234557_621194_D31A038C 
X-CRM114-Status: GOOD (  16.78  )
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

T24gRnJpLCBKYW4gMDIsIDIwMjYgYXQgMDE6NDk6MzFQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBVc2Ugc2NvcGVkIGZvci1lYWNoIGxvb3Agd2hlbiBpdGVyYXRpbmcgb3Zl
ciBkZXZpY2Ugbm9kZXMgdG8gbWFrZSBjb2RlIGEKPiBiaXQgc2ltcGxlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFs
Y29tbS5jb20+CgpSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5l
bC5vcmc+CgotIE1hbmkKCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
YyB8IDggKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggNGRkNmYxYTRl
Nzk3Li5iN2U3OWI3NjY1NGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAg
LTIyMDYsMTYgKzIyMDYsMTQgQEAgc3RhdGljIGludCBxY29tX25hbmRfaG9zdF9pbml0X2FuZF9y
ZWdpc3RlcihzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjLAo+ICBzdGF0aWMgaW50
IHFjb21fcHJvYmVfbmFuZF9kZXZpY2VzKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFu
ZGMpCj4gIHsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IG5hbmRjLT5kZXY7Cj4gLQlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmRuID0gZGV2LT5vZl9ub2RlLCAqY2hpbGQ7Cj4gKwlzdHJ1Y3QgZGV2aWNl
X25vZGUgKmRuID0gZGV2LT5vZl9ub2RlOwo+ICAJc3RydWN0IHFjb21fbmFuZF9ob3N0ICpob3N0
Owo+ICAJaW50IHJldCA9IC1FTk9ERVY7Cj4gIAo+IC0JZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxk
X29mX25vZGUoZG4sIGNoaWxkKSB7Cj4gKwlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9k
ZV9zY29wZWQoZG4sIGNoaWxkKSB7Cj4gIAkJaG9zdCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVv
ZigqaG9zdCksIEdGUF9LRVJORUwpOwo+IC0JCWlmICghaG9zdCkgewo+IC0JCQlvZl9ub2RlX3B1
dChjaGlsZCk7Cj4gKwkJaWYgKCFob3N0KQo+ICAJCQlyZXR1cm4gLUVOT01FTTsKPiAtCQl9Cj4g
IAo+ICAJCXJldCA9IHFjb21fbmFuZF9ob3N0X2luaXRfYW5kX3JlZ2lzdGVyKG5hbmRjLCBob3N0
LCBjaGlsZCk7Cj4gIAkJaWYgKHJldCkgewo+IC0tIAo+IDIuNTEuMAo+IAoKLS0gCuCuruCuo+Cu
v+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
