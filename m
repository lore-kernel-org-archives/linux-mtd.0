Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6F4109C022
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INF3iQ4vvM6B1BQ+JtcT9JaA0ZM8uGvF1usFzddep9w=; b=WrC88w5OGuEYo/
	qQ3VEnzR1oEtvZWv7t80l6wP+ZcV/BIeqFwQqxSXK6RLEBdd6OnNpgNe4tcuoXJgj06Ekt5myt6Mo
	iS2ngS8iiFNTERKDAk0oOt5zs8Uxv3y/j8wC5ydQDYSd7xjv42FMsN52GUByEBx6ez6mYuKfmJ3BX
	Vqgc2xPXkZfpBU/NffdOlbmOFT0qwsFQu9Ee+56WVkMJe8n5zAOkE4eW1ZMKHZaF9K6qUrz0Ay5gJ
	S5svyL+QQp4OIYbo4wbB04Qw/on5ygW5ZK3qNHLBB/KM7otp4IdSTxfx4Q6mmFtP5/1DJXSqZJJYZ
	YCLttsTaVv3x/olPVqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEw-00000003bbG-45dC;
	Wed, 25 Mar 2026 14:29:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEs-00000003bWY-1yG4
	for linux-mtd@lists.infradead.org;
	Wed, 25 Mar 2026 14:29:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 21C86C580B2;
	Wed, 25 Mar 2026 14:30:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5974D601E2;
	Wed, 25 Mar 2026 14:29:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97A3C10451A66;
	Wed, 25 Mar 2026 15:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774448977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RMKdRLPo5ZxYLv8j+Hc3AaldOSYVznoKCZwnCSBgffY=;
	b=O8rxUz9yHrILd9J72HXd3e+lz1mCEoFipYqmVDuoN2a/sdBJ7dGPkvZsGC55guTTFN4FDA
	QEFalJInpzSfswBj2waEDlURaIh6JExc9PzuXdYhJ9+FBmL38uGSHug2VP2bvHArPmRElB
	sFuLQr8pX/F3z8xAzReGtX4oC12Qa4ZXnOMU1ehKrN2sSjKdbcyv6xvGzmzuPtXWfkO1oD
	jr8kQqbNZFWPquKqGkDeIz7xOwdnlwOzC9rp8uBUCvmEioW5YiUeki+ZaUZ61vYOzOEjUl
	JQWhdvD956/sEgc66QHWyC4qzjo9oqp513XO/HCmwwg4vyoTyob+PjTIXxta1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20260324221624.2424092-1-Frank.Li@nxp.com>
References: <20260324221624.2424092-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: refactor NAND bindings and
 add nand-controller-legacy.yaml
Message-Id: <177444897541.837464.3426048157066587709.b4-ty@bootlin.com>
Date: Wed, 25 Mar 2026 15:29:35 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072942_649054_7B20055F 
X-CRM114-Status: UNSURE (   8.46  )
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

T24gVHVlLCAyNCBNYXIgMjAyNiAxODoxNjoxOCAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6Cj4gVGhl
IG1vZGVybiBOQU5EIGNvbnRyb2xsZXIgYmluZGluZyByZXF1aXJlcyBOQU5EIGNoaXBzIHRvIGJl
IGRlc2NyaWJlZCBhcwo+IGNoaWxkIG5vZGVzIG9mIHRoZSBjb250cm9sbGVyLCBmb3IgZXhhbXBs
ZToKPiAKPiAgIG5hbmQtY29udHJvbGxlciB7Cj4gICAgICAgICAgIC4uLgo+ICAgICAgICAgICBu
YW5kQDAgewo+ICAgICAgICAgICAgICAgICAgIC8qIHJhdyBOQU5EIGNoaXAgcHJvcGVydGllcyAq
Lwo+ICAgICAgICAgICB9Owo+ICAgfTsKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQs
IHRoYW5rcyEKClsxLzNdIGR0LWJpbmRpbmdzOiBtdGQ6IHJlZmFjdG9yIE5BTkQgYmluZGluZ3Mg
YW5kIGFkZCBuYW5kLWNvbnRyb2xsZXItbGVnYWN5LnlhbWwKICAgICAgY29tbWl0OiAwYmE4ZGEy
ZjMxOGVmYzAwNmFlNWMwODBhNGFiZmJhYmI1ZDExMGUyClsyLzNdIGR0LWJpbmRpbmdzOiBtdGQ6
IGdwbWktbmFuZDogcmVmIHRvIG5hbmQtY29udHJvbGxlci1sZWdhY3kueWFtbAogICAgICBjb21t
aXQ6IDE3ZGU4YTY4YWM5ODA3YWRmNTUxZjdkMmQ5ODBlMjZkMTE5NmU0MWEKWzMvM10gZHQtYmlu
ZGluZ3M6IG10ZDogbXhjLW5hbmQ6IGFkZCBtaXNzaW5nIGNvbXBhdGlibGUgc3RyaW5nIGFuZCBy
ZWYgdG8gbmFuZC1jb250cm9sbGVyLWxlZ2FjeS55YW1sCiAgICAgIGNvbW1pdDogM2IyYTQyMmUy
M2NmMTk5OGI4NWNjYmNiOTBjYWJmZjAxZDE3NDIyYwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFp
bGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChw
cm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywK
TWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
