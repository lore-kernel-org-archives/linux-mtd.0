Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35425D73E87
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxtBRTiFZQYfqmMom1tY6PRr/trThb7bRlJrrCBMdzM=; b=wdPdTDK7joEzm7
	Q1cuoglSkS043yLH0AtMeWIS/6hz0+K4CxNY6aDxbKCfrntT/PQV+4QU78xp15lvUXw7BzaXavAvx
	a526Oiwl5eUGDoUk1TXbsN3euQ2uqXUmWYEwW07Rqi7Q0t1N4i0K10BeRQmWeyIEivwdGi5+fxe/h
	5iZ1bQYNaZsHYN9BqnhVwAu0Qk4DB4AkdplNaK8ErMOf17irly7mOwiLLlV8EyZBaHwwUw0AGO2lc
	oImo274+ppDFaDNQ+9ausO5iq5jmitfETt8GS1IFtd/RJRB/p+BUCbllUWUh8DElsnh0ZxblDY/Dy
	YWG8Xrwyyj559H54wfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXRP-00000000Xwl-3UKk;
	Thu, 29 Jan 2026 19:12:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXRN-00000000Xvl-3F1A
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:12:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 576CF4E42326;
	Thu, 29 Jan 2026 19:12:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2453160746;
	Thu, 29 Jan 2026 19:12:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBBE9119A880F;
	Thu, 29 Jan 2026 20:12:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769713947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G+qpvlG2xrJTTZN1oTAH5PVb1bJNZhMGlBHpdOodgpM=;
	b=nbqWVRaWs2v1U+/1dC5sgiAiZvRkOvIHFBdDbmLZ2sqq1yR9oQnld2/x+VwZ+XVCcN5WuH
	XhVGT1Ulrl8w0HDxGUBuSi+n95sZwvgvGRqksDL7Zdr8CtEUJIZK6yvllYYUCFiZ+ZD/+y
	zD6xHt0YHvtZuwWCO31rE5G1/ZDrGyioXV8h58lfbcrDj7Z2lQKQzo4qcwOpHd1q3wgVXx
	PXs7lqRHka7PW1lFQ884i9Ms71Wz+6hjlb75iqpl0AhQc/q2M8JsL+XogUY5r6Cu8fvq0Z
	zVHbGJ+mVmau2LHomnym4y4WAfht4rvIUg3WGdhe5ij3aPHeG+om8vThOILZ5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mason Yang <masonccyang@mxic.com.tw>, 
 Akhila YS <akhilayalmati@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260128-mxic-nand-v3-1-c61764e85f60@gmail.com>
References: <20260128-mxic-nand-v3-1-c61764e85f60@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mtd:
 mxic,multi-itfc-v009-nand-controller: convert to DT schema
Message-Id: <176971394479.256159.17492450215654905937.b4-ty@bootlin.com>
Date: Thu, 29 Jan 2026 20:12:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_111229_959782_7CF5677F 
X-CRM114-Status: UNSURE (   5.15  )
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

T24gV2VkLCAyOCBKYW4gMjAyNiAxNTozNjoxMiArMDAwMCwgQWtoaWxhIFlTIHdyb3RlOgo+IENv
bnZlcnQgTWFjcm9uaXggUmF3IE5BTkQgQ29udHJvbGxlciBEZXZpY2UgVHJlZSBiaW5kaW5nIHRv
IERUIFNjaGVtYS4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIGR0
LWJpbmRpbmdzOiBtdGQ6IG14aWMsbXVsdGktaXRmYy12MDA5LW5hbmQtY29udHJvbGxlcjogY29u
dmVydCB0byBEVCBzY2hlbWEKICAgICAgY29tbWl0OiBiY2Y4ZTIwNzYyNGQwNDRhMDYwYWM0YzZm
OTg2MWYzNGFkZTQxY2E0CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGlu
dXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8g
cm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
