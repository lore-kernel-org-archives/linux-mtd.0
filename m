Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A788C71157
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oq6qJfM9/JgdkvwfaeIx3o1ShaMpppEYCxprqMrjLeM=; b=OWsNBvnFiebRfp
	VWe/gVf1e3gDviI3NtxBoPDvgHqB9/x1htIOPD5CAArCDqQZd8p7i479wDYg+FGn4KJdr118JX0ZN
	lrbsrYx42ZC1QDgeg9Fy3r0yKqe3Rqoffcx0OZJPLdRrY2scl9mHBpIuYeJpd6TJsnJFQFKAbdhG4
	FnLRPkP7xjzfJsUTIJJ2htCHTMIK3ApBVnFOz8gLQK6ewheUOW3yojL31ntwu9j0ZXvVxgqSj83mC
	Y0B3gawtxcRJIns3ClKbAQqcfopvQic18aDIbcohgwMP2QvNMs9bGqNgeW1YlW0fv/W9OitsMkCOC
	N2kgXx8ujVZjvAhj93pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRowl-00000009Y7O-05z6;
	Wed, 18 Jun 2025 09:19:07 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouy-00000009WYw-0jnb
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 09:17:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 053624442B;
	Wed, 18 Jun 2025 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750238230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F98ijLO5pi6FUZlWFyCBwYzUs/rP2o8QKYXzxteZsmA=;
	b=IwwJeJbrTSaW/iHFSqrVITopalqsqiuFHsmPr8fWveZMQRUKIYp0Y6JsIyzINaTKWIMUkE
	QpQxavje7LE+TvlSs2psHa2HlNcTmDNz4Uwk7gzJn438AExYlRJX5gizS6bnJTL4bZz6d9
	e6aJUMdvjnp+HvnbDNznUgVqrIQ1BQUCQYCmFR/7EqRYW2DaJvSPW0zAIl90OQOX58Qn5V
	NF1CSjnJP9+OBMudRR8z+ITAW+RCHz7OlDzNwQlRDWALU+kzeQ74ze9KM0UjoP87MiIZHY
	BCbq1jrQYtdTGA6IPxSO3b/FVUJGK/tGtzFnThzjNnl16k3IypHJPrGvwfQq+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250602140946.941159-1-Frank.Li@nxp.com>
References: <20250602140946.941159-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert nxp-spifi.txt to yaml
 format
Message-Id: <175023822777.1656646.5704716073431650841.b4-ty@bootlin.com>
Date: Wed, 18 Jun 2025 11:17:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_021716_534229_B11DB4FF 
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

T24gTW9uLCAwMiBKdW4gMjAyNSAxMDowOTo0NSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6Cj4gQ29u
dmVydCBueHAtc3BpZmkudHh0IHRvIHlhbWwgZm9ybWF0Lgo+IAo+IEFkZGl0aW9uYWwgY2hhbmdl
czoKPiAtIHJlZiAvc2NoZW1hcy9zcGkvc3BpLWNvbnRyb2xsZXIueWFtbC4KPiAtIHJlbW92ZSBs
YWJlbCBpbiBleGFtcGxlLgo+IC0gY2hhbmdlIG5vZGUgbmFtZSB0byBzcGkgaW4gZXhhbXBsZS4K
PiAtIHJlbW92ZSBjaGlsZCBub2RlIGluIGV4YW1wbGUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8g
bXRkL25leHQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBtdGQ6IGNvbnZlcnQgbnhwLXNw
aWZpLnR4dCB0byB5YW1sIGZvcm1hdAogICAgICBjb21taXQ6IDI3YjA0NWViM2UzMGNlOWE0MzZi
OGVlNWJjYjQ4NjlmN2UzNTIyYTYKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10
ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhh
dCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
