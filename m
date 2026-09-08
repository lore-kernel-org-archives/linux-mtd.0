Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476C4C79FAA
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMaMX/TtahX82cTEeLgDwwXh0St/10B7DFVYpbSXAjc=; b=CJAnZqeQzXNsiH
	XWY6bC+c9pJcPdVIvCFpF2NWyK+FVYrLKwAXG1f1dg12Yrti0sPeph4D6uw7LH5fYX7cv2Lm23Hsp
	zGWc87KFIH2r09MHbVksTAHSjc578WKt7oNtf6jwDDAD2Fd0+rN9FC6/4EgI11f63GWVb89oiALhM
	eCt52bPzjQjSdVBxxosFzUMfR/AJPg8wfCex1GapLyzrQUBROvhz86/Ckd9GgWFA869v4EWjbr1Q5
	sp7HymjgDCzqHDePwK405FigsdvvDBLA/LNxYcu4h4//9cVu+RI2D0L4ihq46jZ1Rs64EneFKxqYc
	N+XljEBg1i2mBLL2Tfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y7C-00000009YQP-0LS7;
	Tue, 08 Sep 2026 15:52:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y79-00000009YPc-37oz
	for linux-mtd@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DAhVo+VnvuwPf8P1BI0svmi6m7U7fXWrZ8gzfloqoPY=; b=fWd3bzPkK8UT/wWc79cb7DLAij
	8P8s0gLdkf/m5x9B0V8fcc0BHMC3S3lQIlTXs01+v2yt8eKfnblrGKhlmYPbGkg78HAoFLmU1q6+e
	TwB6LZS7knk/l+hjRRoFZ7djqfJFS8s+IKDb/ppetdLzZReqxhaPLTd2sBK08w1UOScBa4kRUs6d8
	9H4nx1BSBhtBoh0Z33eVYp7zslV9Wg/aWpWrmYKdMCY65AO0/dc82Xk3aFig143Kd5n/Fuj3+GKt1
	aehBQrH9GUduu/OQk3PWHRjkC6KFHILrCit4muwanstACHdLk9ONGdSHNglB+yeudiBJ/gcW5vtcd
	0aqGjXMw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3y76-000000002vl-3X0e
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 15:52:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2501D4E4159A;
	Tue,  8 Sep 2026 15:51:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D37BE6031F;
	Tue,  8 Sep 2026 15:51:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2476D11C7AF49;
	Tue,  8 Sep 2026 17:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788882711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DAhVo+VnvuwPf8P1BI0svmi6m7U7fXWrZ8gzfloqoPY=;
	b=C2nxzAJ/2j1JQy7Wp+D4kWMW3N7lqM5p8+HWmkRrLjB8pT4MGOshpbTVcWIHpNilkCUC8U
	Iso2bROUUjnekiNbw0hO8//tj/RMQ307uz8DdvsbCs4Mzh9bIGXDEX2AFPezDyWozHpGQW
	wmhlHFJ1WoxG/o0tLsAqUqJ40DGKiYqLgVHW5U0zAIlRSDyrJFpdPfI5SoPuOU3iC9vkfW
	2V4GhxIvoYPQR9Q4TdeOx1gRFst/gW5FkfXTFghGir3fwetU1Su2gg8rpNDEFrDGPHN6DM
	s3Sz2VwYMFMVRa29P+ymcXOSyJ64NJgAPXDeX8xIwEgsb4OZwcqPKJmjRCIdYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
	(James Hilliard's message of "Fri, 04 Sep 2026 15:22:12 -0600")
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
	<20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 17:51:46 +0200
Message-ID: <87ik4fu4fh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_165201_017345_F8D970B7 
X-CRM114-Status: GOOD (  17.56  )
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

SGkgSmFtZXMsCgpPbiAwNC8wOS8yMDI2IGF0IDE1OjIyOjEyIC0wNiwgSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgY29udHJvbGxlciByYW5k
b21pemVyIGNvdmVycyB0aGUgYmFkIGJsb2NrIG1hcmtlciBhbG9uZyB3aXRoIHRoZQo+IHJlc3Qg
b2YgdGhlIE9PQiBkYXRhLiBUaGUgZHJpdmVyIGN1cnJlbnRseSBjb21wZW5zYXRlcyB0aGUgbWFy
a2VyIGJ5dGVzCj4gYmVmb3JlIHdyaXRlcyBhbmQgYWZ0ZXIgcmVhZHMgc28gdGhhdCB0aGV5IHJl
bWFpbiBwbGFpbiBvbiBmbGFzaC4KPgo+IEFsbHdpbm5lciBOQU5EIGZpcm13YXJlIGluc3RlYWQg
c3RvcmVzIHRoZSBtYXJrZXIgdGhyb3VnaCB0aGUKPiByYW5kb21pemVyLiBNZWRpYSB1c2luZyB0
aGF0IGZvcm1hdCBhcHBlYXJzIHRvIGNvbnRhaW4gYmFkIGJsb2NrcyB1bmxlc3MKPiB0aGUgcmFu
ZG9taXplciBpcyBlbmFibGVkIHdoaWxlIHJlYWRpbmcgdGhlIG1hcmtlci4KPgo+IEhvbm9yIHRo
ZSBhbGx3aW5uZXIscmFuZG9taXplZC1vb2IgcHJvcGVydHkgYnkgbWFya2luZyB0aGUgTkFORCBh
cwo+IHJlcXVpcmluZyBzY3JhbWJsaW5nIGR1cmluZyBub3JtYWwgaGFyZHdhcmUtRUNDIHRyYW5z
ZmVycyBhbmQgbGVhdmluZwo+IHRoZSBtYXJrZXIgaW4gdGhlIHJhbmRvbWl6ZXIgZGF0YSBzdHJl
YW0uIEtlZXAgdGhlIGV4aXN0aW5nIHBsYWluIG1hcmtlcgo+IGJlaGF2aW9yIHdoZW4gdGhlIHBy
b3BlcnR5IGlzIGFic2VudC4gUmVqZWN0IHRoZSBwcm9wZXJ0eSB3aXRoIHNvZnR3YXJlCj4gb3Ig
ZGlzYWJsZWQgRUNDIGJlY2F1c2UgdGhvc2UgcGF0aHMgZG8gbm90IG9wZXJhdGUgdGhlIGNvbnRy
b2xsZXIKPiByYW5kb21pemVyLgo+Cj4gTVREX09QU19SQVcgYmVoYXZpb3IgcmVtYWlucyB1bmNo
YW5nZWQ6IHJhdyBhY2Nlc3NlcyBieXBhc3MgYm90aCBFQ0MgYW5kCj4gcmFuZG9taXphdGlvbiBh
bmQgZXhwb3NlIHRoZSBwaHlzaWNhbCByZXByZXNlbnRhdGlvbi4gVGhlIHJhdy1OQU5ECj4gY29y
ZSdzIGJhZC1ibG9jayBhbmQgZmxhc2gtQkJUIHBhdGhzIHVzZSBkZWNvZGVkIGFjY2Vzc2VzIGFu
ZCB0aGVyZWZvcmUKPiBjb250aW51ZSB0aHJvdWdoIHRoZSBoYXJkd2FyZS1FQ0MvcmFuZG9taXpl
ciBwYXRoLgo+Cj4gVGhpcyBjaGFuZ2VzIG1hcmtlciBoYW5kbGluZyBvbiBhbGwgc3VwcG9ydGVk
IGNvbnRyb2xsZXJzOyB0aGUgSDYvSDYxNgo+IHByb3RlY3RlZCB1c2VyLWRhdGEgcGxhY2VtZW50
IGlzIGhhbmRsZWQgc2VwYXJhdGVseS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJk
IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKSSBiZWxpZXZlIGl0IGlzIHN0aWxsIG5vdCBj
b21wbGV0ZWx5IHdvcmtpbmcuIElmIHlvdSBsb29rIGF0IHRoZSBlcnJvcgpwYXRoIGluIHRoZSBy
ZWFkIGZ1bmN0aW9ucywgaW4gY2FzZSB3ZSBmYWNlIGEgZmFjdG9yeSBiYWQgYmxvY2ssIHRoZXJl
CndpbGwgYmUgbm8gZGF0YSwgd2Ugd2lsbCBmYWNlIHRoZSAicGFnZSBpcyBtYXliZSBlbXB0eSIg
Y2FzZSB3aGVyZSB3ZQpzdGlsbCBhZGRyZXNzIGNvbHVtbnMgbGlrZSBiZWZvcmUuIFNpbmNlIGRh
dGEgaXMgcmFuZG9taXplZCB3aXRoIHRoZXNlCmFjY2Vzc2VzLCBJIGJlbGlldmUgd2Ugd291bGQg
cmV0dXJuIGVycm9ycyB3aGljaCB3aWxsIG5vdCBiZSBpbnRlcnByZXRlZApjb3JyZWN0bHkgYnkg
dGhlIGNvcmUuIFRoZSBkaXNjb3Zlcnkgb2YgdGhlIGZhY3RvcnkgYmFkIGJsb2NrIG1hcmtlcnMg
aXMKdGh1cyBicm9rZW4gZHVyaW5nIEJCVCBzY2FuLiBCdXQgYSBCQlQgcmVhZCBpcyBhbHNvIGJy
b2tlbiwgYmVjYXVzZSBldmVuCmlmIGVycm9ycyBhcmUgaWdub3JlZCwgd2UgcGVyZm9ybSBwYXR0
ZXJuIG1hdGNoaW5nIG9uIGRhdGEgd2hpY2ggaXMsIGlmCm15IHVuZGVyc3RhbmRpbmcgb2YgeW91
ciBpbXBsZW1lbnRhdGlvbiBpcyBjb3JyZWN0LCBub3QgZGUtcmFuZG9taXplZCBpbgp0aGlzIGNh
c2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
