Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E92DC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAEvQkeCnlInqatO7aRx5zyRNORZI5SbBFTkxLcVHxg=; b=2GrF49O9X2Q70p
	WpRgNAhQetrfgMaisCeUezzzYJbxqk8zj4Jn7FylZ+zFIZXMIK7z18qY0AmQ0hynqdIW/tZzsYxIr
	yS995TEp96sizToC2NCrHs0H8J4aYbATf45ZZCgfxXbxtB4HKp5Pu5FPRWJq+/e/PoQNbTROzZC9Q
	QotrKpLwlbC912USmaRb+utkNOWdiO91oFs4gzvVeCtoCsIWVi5MVrCzBpyLbtfzMQFVJeeWh/8Un
	Hmlqxl9QJ8Fqhuz/I1NKnwEf2roypGDhEC2FxlNaQhRO1/kTvwbVNmsC4CtDDhcB6us0OrnAOF1Qv
	NdYP4QQB9zT6uElGryvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmGk-00HaHX-Q4; Thu, 17 Nov 2022 21:17:59 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFV-00HZEh-Cd
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A0A08E0002;
	Thu, 17 Nov 2022 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57laQ6RQtTEEaJIkWtYSXesS9NcbjA5Al5Dwd1wsl4Y=;
	b=N2er7jMG5kSv2YSrN4QjNanWmMcHOV6K2sY6igXJ4CDVeJsmmS9MElFxYJO65w82wOtRve
	Wi3KB+q1hvg15jDwHpf+gPITxUz8gGNbm/R9Y7BUuWzKoqn7jmcTv5NdqqPHJNAev4JmJH
	bupLrZy3GGW/TlH0cUS5KHxKXzOMcUlDvkiys+MdzPA/2ieLeO3isXC2muQPkJFTCz0hm0
	z+SQS2Kj4Gq/lB6IGJuFx2QDBGaIcHP0y8i2oja4BbTS+z6BZcSvZ9wAU4bq4cCSGaAwex
	R+zOOB5DNc9gJx0CBZB7QYNNCOSwGyaMwK1fEjU3Srq/RhU4r6lmKFFgbOJ5vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH mtd/next] dt-bindings: mtd: partitions: allow SafeLoader dynamic subpartitions
Date: Thu, 17 Nov 2022 22:16:38 +0100
Message-Id: <20221117211638.1273721-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108093102.8360-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9b533a6e41df8315422575764a7f9a72bda2d995'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131641_613406_216FDB2A 
X-CRM114-Status: UNSURE (   6.61  )
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

T24gVHVlLCAyMDIyLTExLTA4IGF0IDA5OjMxOjAyIFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFRQLUxpbmsgU2FmZUxvYWRlciBwYXJ0aXRpb25pbmcgbWVhbnMgZmxhc2ggY29u
dGFpbnMgbXVsdGlwbGUgcGFydGl0aW9ucwo+IGRlZmluZWQgaW4gdGhlIG9uLWZsYXNoIHRhYmxl
LiBTb21lIG9mIHRob3NlIHBhcnRpdGlvbnMgbWF5IGhhdmUgYQo+IHNwZWNpYWwgbWVhbmluZyBh
bmQgbWF5IHJlcXVpcmUgZGVzY3JpYmluZyBhZGRpdGlvbmFsbHkuIEFsbG93IHRoYXQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKQXBwbGllZCB0byBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10
ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
