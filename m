Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21447C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfcjYiMWe0NLkMfMp8hOfWy7oe2fO/uokF9faWm7WZc=; b=d5kleZPW0Uhnba
	22UBa9ftu4M7PXp10nTOtk0BI/ZZSnsKBADGZDs0fNkLQCx8x3LtQXd51VWuc4GBZhwkCwk8vrPqe
	WfnrmI9TPKTlTdNg2aAPGHJBD2W+eL8ZhBVpbd3iDc1OPlb4yHlcIM/mBSnjsff9mQ+LTSL8OfAyQ
	rmPW+DBBQp1mLG2q17HQ2CyORAUFhrXSg1yHCnYfU2U+dlfCj6ZhG+L+pF6QBWtO/w8PPG5k8yVjO
	mcvaY7+zuBTDGB/FsUtBA3tvLqEke2oiRU59SNaXIDUiArtXF0y7xTB2gDegcaOaMjo4RnXtGaT6+
	RtXNrD8l1nthYc7Z4sqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZfF-00000006Uqq-3NZD;
	Tue, 18 Mar 2025 16:19:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZdb-00000006UP9-1SU0
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 16:17:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70FE044187;
	Tue, 18 Mar 2025 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742314674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N/1xnpzP9TTHmFe2YZGsO7xT/RMdtt3eNYKIyqdlcpo=;
	b=QV7EQI0xNy8e+ecLyLElhdGhXXLQujhp8sAu+E5WR+M10/9YvVdC6JaLEYL3ERXRYM4Yvv
	rO8AiSjRjuPnXZV3kIn99P/14zipcdYaIwB+wyv93MejCsVUJKgNbRD4vhu8Ai3OS06hfe
	e9XQ2v4YgoVgaNuo+wlAk7HQdD3fAnn0JEVpCFMqgWEpEgUbFEK8VhWLowoP02xmJjWBNI
	vqE+ik37us9t3zAFxw8Zeo44usvWGkRKJMPkJvsN7yHYDIoOXolnPch/YCwzSdF3ubkRhO
	eTr3YDxWtPIjgeE2SH9nftz0tmbWm6t1aakpir68Xffb4zEoKne6Y90DxXAkqw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250307220515.3282954-1-Frank.Li@nxp.com>
References: <20250307220515.3282954-1-Frank.Li@nxp.com>
Subject: Re: [PATCH] dt-bindings: mtd: gpmi-nand: Add compatible string for
 i.MX8 chips
Message-Id: <174231467335.979959.13152834934879467871.b4-ty@bootlin.com>
Date: Tue, 18 Mar 2025 17:17:53 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffieffhfefvedvgffhledugeeugeekudffgfefgfeftdehgfduveejfffffeeugfenucffohhmrghinhepmhigjegurdhsohdpmhigkehqgihprdhsohenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheph
 hgrnhdrgihusehngihprdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_091755_515927_74D09B7B 
X-CRM114-Status: UNSURE (   6.21  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCAwNyBNYXIgMjAyNSAxNzowNToxNSAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6Cj4gQWRk
IGNvbXBhdGlibGUgc3RyaW5nICJmc2wsaW14OG1wLWdwbWktbmFuZCIgYW5kICJmc2wsaW14OG1x
LWdwbWktbmFuZCIsCj4gd2hpY2ggYmFjayBjb21wYXRpYmxlIHdpdGggaS5NWDdELiBTbyBzZXQg
dGhlc2UgZmFsbCBiYWNrIHRvCj4gImZzbCxpbXg3ZC1ncG1pLW5hbmQiLgo+IAo+IEFkZCBjb21w
YXRpYmxlIHN0cmluZyAiZnNsLGlteDhxbS1ncG1pLW5hbmQiIGFuZCAiZnNsLGlteDhkeGwtZ3Bt
aS1uYW5kIiwKPiB3aGljaCBiYWNrIGNvbXBhdGlibGUgd2l0aCBpLk1YOFFYUC4gU28gc2V0IHRo
ZXNlIGZhbGwgYmFjayB0bwo+ICJmc2wsaW14OHF4cC1ncG1pLW5hbmQiLgo+IAo+IFsuLi5dCgpB
cHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gZHQtYmluZGluZ3M6IG10ZDogZ3Bt
aS1uYW5kOiBBZGQgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGkuTVg4IGNoaXBzCiAgICAgIGNvbW1p
dDogYjBlNjNhMDg0N2VlMmQwMWFjMzRhNDVlYWZiMTEyMjI3MjYyODIwZgoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
