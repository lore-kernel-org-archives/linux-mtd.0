Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C244CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 10:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yx1vsVRqoNBvvEUFyMYzVYyKN9nnniwkXrYJvC1kdbY=; b=3u1u2VhPqL0NLr
	DdYqSdvxBuuqLlzSJqzkZkWw39uEKWIzxp7ixqYsPK5Kb9W2dIDMubz+bKQ8CCAbXmWiMCMG1CSVe
	1RMwMIjUVEGQPVBMzcxBr5joAWQwHvbTf4kTQ4ZQJYyhsqvA+Q2nE58eCMeyHPCX4Wluss95K8qFm
	RY+CbGBrPwH9Y5QYI28TGmvBAn38L1IbB1ZiAZIMzPTLIUDT9A73Y55sq5KqX21eNf5OpDgFq8jch
	z9zPX61dJI96iV/lrj9XHmFrGaNwAXMx1YC482Yqg0ZBOcTx+y+uWP/9wL1K+z+D6dqpQO6nP1YWZ
	lGDbpMEAA2wj5KFmQXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwtC-0000000FvBQ-3Fuv;
	Mon, 17 Nov 2025 10:55:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwt9-0000000Fv88-1y9a
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 10:55:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E829C4E41739;
	Mon, 17 Nov 2025 10:55:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD0B9606B9;
	Mon, 17 Nov 2025 10:55:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CF0410371C4A;
	Mon, 17 Nov 2025 11:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763376913; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w5+ve4CNuywB5sTa6FXL1UV8aCyTK9ScOcFkr/ogwAc=;
	b=m7Hl+P1eltCnx7a4AEyGnGrUFA4hsZFVrx5TLg/QNTCC4mHoFM470B1tacZpz8ifMaVjhh
	/to0Y3/GM1tPTU6V1gcDvDfdemP6a+hlWMtpF1Owc9SlzR6elqHFH23geAbhPH7dnQMZyk
	WDPPYBoprcwtHAIbsyOupHIcx0N0Wb/3rQdz5H9ft/wXvXEuN8jtYKvdhkSElX6LFqHX6J
	HDtD+HDzT3cvAWiJyTOyPBnh5pHyE2HpEoCaSeFQXfL4LVzN+WwcgnjObjpwuwH47rUFfp
	mMIQaFG8kuDviIx2j0bNE12UE+wYvFI/XBZHZDDOkbTKmeUbKQw/ZiXAkYmWkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, 
 George Moussalem <george.moussalem@outlook.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <799b34e6b45f1029890f80d587a90a4915aced9e.1763342973.git.daniel@makrotopia.org>
References: <799b34e6b45f1029890f80d587a90a4915aced9e.1763342973.git.daniel@makrotopia.org>
Subject: Re: [PATCH] mtd: spinand: esmt: add support for F50L1G41LC
Message-Id: <176337690784.1740915.18439748130692295118.b4-ty@bootlin.com>
Date: Mon, 17 Nov 2025 11:55:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_025515_712930_8C5B281A 
X-CRM114-Status: UNSURE (   8.32  )
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

T24gTW9uLCAxNyBOb3YgMjAyNSAwMjo1NDoxOSArMDAwMCwgRGFuaWVsIEdvbGxlIHdyb3RlOgo+
IFRoaXMgYWRkcyBzdXBwb3J0IGZvciBFU01UIEY1MEwxRzQxTEMsIHdoaWNoIGFwcGVhcnMgdG8g
YmUgYW4gdXBkYXRlZAo+IHZlcnNpb24gb2YgdGhlIGFscmVhZHkgc3VwcG9ydGVkIEY1MEwxRzQx
TEIuCj4gQWRkIGVzbXRfOGMgU1BJX05BTkQgbWFudWZhY3R1cmVyIHRvIGFjY291bnQgZm9yIHRo
ZSBuZXdseSB1c2VkIHZlbmRvcgo+IElEIHdpdGggc3VwcG9ydCBmb3IgdGhlIEVTTVQgRjUwTDFH
NDFMQyBjaGlwLgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10
ZDogc3BpbmFuZDogZXNtdDogYWRkIHN1cHBvcnQgZm9yIEY1MEwxRzQxTEMKICAgICAgY29tbWl0
OiBiOTg5OTRjYjliYzI0ZjVjNzU3NWM4NjY1MGY5NmMzODQ1NzZmZGZhCgpQYXRjaGUocykgc2hv
dWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhl
IG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2lu
ZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
