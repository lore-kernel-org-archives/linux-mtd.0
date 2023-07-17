Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB061EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 02:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmiMnT9xC5vi7+IvOS3WZ2An/laq79BxEChO9MYW1u8=; b=PaAP0AROlMs5CJ
	mJ/07mi3qET2iY0S0k6dYfiXiFnQ9SzmoEFnrPBI2x73clU5SArJkiUpAZBEDdXCg9CGqxSYf0d8o
	Guisn5qrEdG+unQCx1ib/zPCPYdfZUZA34f67DpCYXcW6bY3qe10iAeyLuwdCGh6atP0UObpmG9on
	/2EIutyLWYhUCwL42LSrm42dcQ0bM3Tf3+1mi8/Qt4mulTT8g3LsT+SZ1RVN8BhPzO7bxawEHFbdg
	F3PEQ58PE3G7W/bM5Bj/GqK82TI6p3qgOsOLjrhrxGAB9YHATXQA37Uey1j8Iv/qLfKyUFwbED9G1
	N6UJF7frgpWbWFeP3maQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDzs-000qxj-1c;
	Mon, 17 Jul 2023 02:30:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDzo-000quQ-1m;
	Mon, 17 Jul 2023 02:29:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A8AC60EFA;
	Mon, 17 Jul 2023 02:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32654C433C7;
	Mon, 17 Jul 2023 02:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689560995;
	bh=vQfWhzyuBlfoSu508dz56FcHCgwCbysSlODWEQ0m13E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhunmGJtSkFMI7dMlBAxTIMqoL3RkLGZ2VorPQGpHjXFai9Nv76srQxtwk/9GJVMP
	 S13lOx8rRhOnmYtZunV3eUo5jj0gOd4G36Zo1vTdV5z/BSAFGZ+PNokT0BH4Ll5qNK
	 jJno1AuTZyme8qgkfru+FEbvhw/QeuyjacKeo+XyXbMEoCieJRBkL3DP1K6+f2DR2Z
	 RK/TwnmSBeePWrhuKl4hXiewn8AZDA/HUuCSx34vcenzGPrkPjXejg8QCSxRf/GT3L
	 StBl/CG8Vdv0Vv1YJjfNPU61y9UrA+PeIl2mkfyvlesUp4aLlpbvWQk24Lu6SZ18kW
	 aUr9LJXW32lPA==
Date: Mon, 17 Jul 2023 07:59:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] mtd: rawnand: qcom: Fix wrong indentation
Message-ID: <20230717022942.GE5996@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716144612.32132-6-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_192956_687914_F7539807 
X-CRM114-Status: GOOD (  16.20  )
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MDlQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBUaGUgbWFpbiAiZm9yIiBsb29wIGluIHFjb21fcmVhZF9zdGF0dXNfZXhlYygpIGRv
ZXMgZ3VhcmQgdGhlIGZvbGxvd2luZwo+IHRvIGlmJ3Mgd2hpY2ggYXJlIGJhZGx5IGluZGVudGVk
LiBGaXggdGhlIGluZGVudGF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpBY2tlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIDxtYW5pQGtlcm5lbC5vcmc+CgotIE1hbmkKCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gaW5kZXggNTU0Y2NhMzgwMWRhLi4zYWRjNDBlZjVjZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jCj4gQEAgLTI3MjIsMTIgKzI3MjIsMTIgQEAgc3RhdGljIGludCBxY29tX3Jl
YWRfc3RhdHVzX2V4ZWMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCWZvciAoaSA9IDA7IGkg
PCBudW1fY3c7IGkrKykgewo+ICAJCWZsYXNoX3N0YXR1cyA9IGxlMzJfdG9fY3B1KG5hbmRjLT5y
ZWdfcmVhZF9idWZbaV0pOwo+ICAKPiAtCWlmIChmbGFzaF9zdGF0dXMgJiBGU19NUFVfRVJSKQo+
IC0JCWhvc3QtPnN0YXR1cyAmPSB+TkFORF9TVEFUVVNfV1A7Cj4gKwkJaWYgKGZsYXNoX3N0YXR1
cyAmIEZTX01QVV9FUlIpCj4gKwkJCWhvc3QtPnN0YXR1cyAmPSB+TkFORF9TVEFUVVNfV1A7Cj4g
IAo+IC0JaWYgKGZsYXNoX3N0YXR1cyAmIEZTX09QX0VSUiB8fAo+IC0JIChpID09IChudW1fY3cg
LSAxKSAmJiAoZmxhc2hfc3RhdHVzICYgRlNfREVWSUNFX1NUU19FUlIpKSkKPiAtCQlob3N0LT5z
dGF0dXMgfD0gTkFORF9TVEFUVVNfRkFJTDsKPiArCQlpZiAoZmxhc2hfc3RhdHVzICYgRlNfT1Bf
RVJSIHx8Cj4gKwkJICAgIChpID09IChudW1fY3cgLSAxKSAmJiAoZmxhc2hfc3RhdHVzICYgRlNf
REVWSUNFX1NUU19FUlIpKSkKPiArCQkJaG9zdC0+c3RhdHVzIHw9IE5BTkRfU1RBVFVTX0ZBSUw7
Cj4gIAl9Cj4gIAo+ICAJZmxhc2hfc3RhdHVzID0gaG9zdC0+c3RhdHVzOwo+IC0tIAo+IDIuMzQu
MQo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXg
rq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
