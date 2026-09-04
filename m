Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BFAC624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2zdobGNeSK5SsbfyV5V2m9KQC6d4BirV0UfErINO+8=; b=pL0UWrJJfOSQaB
	IeXImV5a51vHrkJHNR4AYuTTZcfYs/Z5dWaO9FfrSqCwscAdAqXwHugNbkV3Otq3Rut7VEylXiADG
	oLAC3JDpCwpq/MkdyJ4NCQIkCxI0M4CjSYd0GYf8nWglK9cAiWdX0LSmSZVSEB1r/QDhr9FHcyRin
	lSaaBiKM5hCaNA7q4HpI5uC0PsB7lkoX5Pxc2vI8ee5rriveM0WNhceQakugo50RFLNlzHEzDqjSS
	pTX7/W+efIqkJTpgwQufWNMx2rsuGm/bHE9trR7AJe+/lKPkjqLEbSx9AEg0DYIghklCQ0HmVbzSC
	wNwWNGCpJw/00tLd98KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XrV-00000002tnl-2Bzw;
	Fri, 04 Sep 2026 17:38:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XrS-00000002tmY-47an
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A3024E41519;
	Fri,  4 Sep 2026 17:37:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F2916057F;
	Fri,  4 Sep 2026 17:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EA8C11C79AE2;
	Fri,  4 Sep 2026 19:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sRwuyM3KB9pVS5pi5uzPWsr88LNSKO5QvEKxVsYBojg=;
	b=D5YsaLZHrmgAQIQVkaWNAmZ8KqgfCx3R/Hrv6r+1uDta3TlZ2gT+7g6NxLSZUzKo4rI20H
	UOFEypirf42od5JaOvHb6qOljsp4Z016iZlbun6EsIwDoN96CeM8CTIm2DSjCcdcXUhs03
	xpnw7VEj9skynJiN1EOdRuxdP09850MC6LxAJqLPZVgSGK7Nav6wshOG9npEROrdo+ETB/
	cHiFo0wmjcFbP49qjsQfqqUQf6mtXqGN5Zl16D5T+qTVFVaYZvH+q2Hx6B03B6nTy8W6vF
	g+2gUhy/ixxdu8CwuyGCbqasVc5qMT4RpLZXBz4F9/rUKsfUGogGI4t2XYHJ6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Peter Pan <peterpandong@micron.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, han.xu@oss.nxp.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Xu <han.xu@nxp.com>, stable@vger.kernel.org
In-Reply-To: <20260813-spinand_qe-v2-1-376193ac7b1a@nxp.com>
References: <20260813-spinand_qe-v2-1-376193ac7b1a@nxp.com>
Subject: Re: [PATCH v2] mtd: spinand: Enable QE on all dies
Message-Id: <178854347108.1467647.2799589444007410894.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:37:51 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103759_174738_494579F6 
X-CRM114-Status: UNSURE (   6.99  )
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

T24gVGh1LCAxMyBBdWcgMjAyNiAwODowNzoyNCAtMDUwMCwgaGFuLnh1QG9zcy5ueHAuY29tIHdy
b3RlOgo+IFRoZSBRVUFEIEVOQUJMRSAoUUUpIGJpdCBpcyBzdG9yZWQgaW4gYSBwZXItZGllIGNv
bmZpZ3VyYXRpb24KPiByZWdpc3RlciBvbiBzb21lIFNQSS1OQU5EIGRldmljZXMuIFdoZW4gYSBk
ZXZpY2UgY29udGFpbnMgbXVsdGlwbGUKPiBkaWVzLCB1cGRhdGluZyB0aGUgUUUgYml0IG9ubHkg
b24gdGhlIGN1cnJlbnRseSBzZWxlY3RlZCBkaWUgY2FuCj4gbGVhdmUgdGhlIHJlbWFpbmluZyBk
aWVzIG9wZXJhdGluZyBpbiBub24tcXVhZCBtb2RlLgo+IAo+IEl0ZXJhdGUgb3ZlciBhbGwgdGFy
Z2V0cyBhbmQgdXBkYXRlIHRoZSBRRSBzZXR0aW5nIG9uIGVhY2ggZGllCj4gZHVyaW5nIGluaXRp
YWxpemF0aW9uIHRvIGVuc3VyZSBjb25zaXN0ZW50IHF1YWQgSS9PIG9wZXJhdGlvbgo+IGFjcm9z
cyB0aGUgZW50aXJlIGRldmljZS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRo
YW5rcyEKClsxLzFdIG10ZDogc3BpbmFuZDogRW5hYmxlIFFFIG9uIGFsbCBkaWVzCiAgICAgIGNv
bW1pdDogNjNkNmNhY2UyYzRhN2YzNmMxY2I0NGYxYmI1ZTBmM2VmMTllNWM3ZgoKUGF0Y2hlKHMp
IHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9m
IHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4K
CktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
