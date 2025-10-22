Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FF8CCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8TBzdfxp/ezteXk7m+7ullziYrdocEXmFcJuIToDls=; b=z3NguabrcGV1SW
	1eNBPQUppAlJhFOZ+sqOdufGAidJXKsQTXBbkqFtnxYI4OKiOQgFL3IzSualWfDboi7HKcVvFrQk3
	sdz3/ivph4Zkagf1eFa7gE5qMUPcf89/LI/2vka/aVpGcK5PW7rpM18cI66WKUCtFJp8yB9L+Akym
	KoJqn4xdF06KpfItfVgdSbJIkUJbv2lRs11TSWy6CU1Mlp6KJAnmW3li0MKx6/vBobSFxrFcGXv0Y
	WCeiv9b6L8P/ZS8QibWu83PqFuIrzX0FAtnZNGVCnmy18c6nnz3VIhGZgzzlU1pKBeguUzpdF561u
	1ZQvv6HweFj/E1ZOZ4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVg9-00000002Nq3-191L;
	Wed, 22 Oct 2025 10:02:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVfw-00000002NnV-05iy
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 10:02:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4019F4E41270;
	Wed, 22 Oct 2025 10:02:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 122CB606DC;
	Wed, 22 Oct 2025 10:02:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA036102F2393;
	Wed, 22 Oct 2025 12:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hQxx/KluC/+d3m4FrK0wA2hEdaOutnyxgsFe7NpoS3U=;
	b=NpyqG8GPS3jm4yxonp42vl4Ry0tGC45F6XfYs1a5Ew8l7wYjqtSGnA9SXf384EEz3qA380
	Dm9YOFIPfX56DKFm+/i9/75CR0Imkea6nrNtrDoKmZQ9xjh65MIV+DWry3E5GXGLr8LI1m
	E8o4jF7POwrN+nG6AYnNwAN0HZSsYX0Kmp2QpUa2j6r5ABqlVILy0zbcK3g/dUDEsSXnK9
	I/jyrvuYDJwWowyK8EJfJp/6e1US5wQpvK3oUk9G/GY14yAhCldyxWExLqC2e8d/tHVvFS
	MiYz+1eqSfD+K73TOQmYWqUtr2ujw+rLgonZQTwWz5pmGxAwxAnsKbUZpYX2tw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and
 'power-domains'
Message-Id: <176112734652.141620.5938048164419652638.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 12:02:26 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030236_462629_239D53A1 
X-CRM114-Status: UNSURE (   5.55  )
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

T24gVGh1LCAwMiBPY3QgMjAyNSAxNjoyMzoxMSArMDIwMCwgV29sZnJhbSBTYW5nIHdyb3RlOgo+
IFBoeXNtYXAgc3VwcG9ydHMgbWluaW1hbCBQTSBzaW5jZSBjb21taXQgMGJjNDQ4YjQ5ZThhMDE3
ZSAoIm10ZDogbWFwczoKPiBwaHlzbWFwOiBBZGQgbWluaW1hbCBSdW50aW1lIFBNIHN1cHBvcnQi
KSwgc28gc3VwcG9ydCBpdCBhbHNvIHdoZW4gdXNlZAo+IGluIERUIGNvbmZpZ3VyYXRpb25zLgo+
IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBt
dGQ6IHBoeXNtYXA6IGFkZCAnY2xvY2tzJyBhbmQgJ3Bvd2VyLWRvbWFpbnMnCiAgICAgIGNvbW1p
dDogNGU3YTgzZWQ4MzEyMDg1OGY2NzYwMDc3MDYxOTdhYTU1OTRkNGRkOQoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
