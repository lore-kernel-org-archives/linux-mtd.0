Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EB5C3DA6E
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 00:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksQXsQF4e8YvhftG68LnPeo4//D6iS7oQ+iIrl0ewto=; b=p6Ytd6Z4J8T+MA
	CsRVLuMQp6emrRukCmiZjTib3irEsKpkSbd9DvQqXwlmW7Vr99CRzWtVTPDaWPq8duHf58jqyyLOI
	RNLgRo8gBSotLJ8gIa2msV9vekHhice7HSWdx9PCE9AF1wfuaAg0XvI5Y92s9LRnRwq4J+ERe/xf2
	sOrtYRxC9j6TqnPptKoBP8Z/HKxEg3OxVSw9Lo1R7LSPGZQc6JhqYVP6ik2qHdafy8UdNnqBH648c
	x4TtVOox4MADzciDEhKLP7ASY6kvod1zhoVGfpEHBUoY05AL5ouXTy/wWXabosKnnHmoxrKzaN+tR
	DTtnWGvykatPbAGU/IdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLBKi-00CSeI-0M;
	Thu, 04 Jan 2024 00:11:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLBKe-00CSdX-2B;
	Thu, 04 Jan 2024 00:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22B5561254;
	Thu,  4 Jan 2024 00:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF11C433C7;
	Thu,  4 Jan 2024 00:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704327091;
	bh=FVnLkp+lC5YchY+7IQkFupGJ+/28QBnreRLrXMvUCGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDFo2wP2hEspYa03CA3X/8uOdaAOdrf3YXkarUJI5EkAbli/jbYewN9g7mYV5HmmH
	 agPuqbvxyGaRACwz3PAJyb8HhPJPWithaBwOkXWBRG/AJjRemEpOILM4g1Agcl+HKm
	 j9EpEndi8OQdzYBCvN1ABsPjPCv7NQpn6mG3FFrSChRWeIZD4YXyhWl7ilgzHBcn2g
	 qxq2t6g8DzWr4Jri4i2MitG5Tt0UTasXzBxJJNmSC4G5Ei1a+iy/dxy4LP0JpULg3B
	 UVooQDIAs0fo5ME9VELYQhXZXeaNF0MtvXU4ZC1Xi9pcRIIJKgUlKvois9PN/sTsjN
	 LO391lTDWryYw==
Received: (nullmailer pid 2095445 invoked by uid 1000);
	Thu, 04 Jan 2024 00:11:29 -0000
Date: Wed, 3 Jan 2024 17:11:29 -0700
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, u-boot@lists.denx.de, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/6] dt-bindings: nvmem: layouts: add U-Boot
 environment variables layout
Message-ID: <20240104001129.GA2045237-robh@kernel.org>
References: <20231221173421.13737-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221173421.13737-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_161132_755931_1637D9B4 
X-CRM114-Status: GOOD (  12.07  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMDY6MzQ6MTZQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBV
LUJvb3QgZW52IGRhdGEgaXMgYSB3YXkgb2Ygc3RvcmluZyBmaXJtd2FyZSB2YXJpYWJsZXMuIEl0
J3MgYSBmb3JtYXQKPiB0aGF0IGNhbiBiZSB1c2VkIG9mIHRvcCBvZiB2YXJpb3VzIHN0b3JhZ2Ug
ZGV2aWNlcy4gSXRzIGJpbmRpbmcgc2hvdWxkCj4gYmUgYW4gTlZNRU0gbGF5b3V0IGluc3RlYWQg
b2YgYSBzdGFuZGFsb25lIGRldmljZS4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgbGF5b3V0IGJpbmRp
bmcgd2hpY2ggYWxsb3dzIHVzaW5nIGl0IG9uIHRvcCBvZiBNVEQgTlZNRU0KPiBkZXZpY2UgYXMg
d2VsbCBhcyBhbnkgb3RoZXIuIEF0IHRoZSBzYW1lIHRpbWUgaXQgZGVwcmVjYXRlcyB0aGUgb2xk
Cj4gY29tYmluZWQgYmluZGluZy4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgaXNzdWUuIEZyb20g
YSBEVCBwZXJzcGVjdGl2ZSwgdGhlcmUgaXNuJ3QuIEEgCnBhcnRpdGlvbiBpcyBub3QgYSBkZXZp
Y2UsIGJ1dCBpcyBkZXNjcmliaW5nIHRoZSBsYXlvdXQgb2Ygc3RvcmFnZSAKYWxyZWFkeS4KClJv
YgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
