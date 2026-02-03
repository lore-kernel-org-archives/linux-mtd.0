Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DECCE87842
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1x0iW6jTxmDWmmrWJYFHTS1NEM5acAnp4Fqz6sM50Nw=; b=bZrAtSmyw66bL4
	smX5CLi5TscGbloec9fcXdxhKMfAMrOwUo9siqVKrVxCeP2fqL0F8gb+bhdfEU/89SWhLp/hdA/KE
	CzlE9dokX+Knd+5hUcxyUoLvOmB1DEyvDMvZClbvtrGh16jq4YmtiWf/8HOv4mvafk5aeLz9of/Bw
	EZ+RGc+RpU0Ij6ivvY7Y7YLrYQ9a+xDOXcDPvyQrBOsW81uYmolO/WLsC+lmy6OWjGRoMaN1N+u2g
	NVhXOurlsly09JPm4bHXAcXkkozZbh+HbLUgzNR7WvH5Zof7ok6GsY31o1UpE4iDIqL+STD/xoAtR
	o1ZeCFNcsEE79nXgLk9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ3d-00000006teT-11Pm;
	Tue, 03 Feb 2026 16:15:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ3Z-00000006tdn-1zIC
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 16:15:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D8C614E42369;
	Tue,  3 Feb 2026 16:15:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A29B560728;
	Tue,  3 Feb 2026 16:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 307C0119A8888;
	Tue,  3 Feb 2026 17:15:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770135309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m/+OTKkzM8qqSZ4LnKIGGDtESh50ZRkUFfHOdLUb1kg=;
	b=RHcW5yq/dfOH3mChtsQZaXyyYKAGdcL8aiaL5AXODKqN1uBa7eyqHmCr5393mdHSQhMTPo
	EPRuoMe9C6cbt2VBOTRHn3qdKhYmPsHH+cCiXGpPMI1+mi4eIBKTPA3kAx3uAQupVIPB6q
	Kp04b06YNuZhcu1PzUrTMRTDoMbYHUg9Eh23dpSx+DO2xgGeRrVJB4hkQwko8tMEVIq4Q2
	6UONk8OFiCQdpqNn4s/KSntOCqZomDX5GqIecmAlFmVExSuyykDC5DFjrsLEseWqDTW5Me
	omsjFQ3jr4t5E92f+T7p2H2imAgXuPqF06QG4qrsLe/nJfdcMvWLY+a8magT3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Khairul Anuar Romli <khairul.anuar.romli@altera.com>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20260131172611.28807-1-dinguyen@kernel.org>
References: <20260131172611.28807-1-dinguyen@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent
 property
Message-Id: <177013530538.557987.17955083991724868603.b4-ty@bootlin.com>
Date: Tue, 03 Feb 2026 17:15:05 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_081514_025463_F263D4E1 
X-CRM114-Status: UNSURE (   6.91  )
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

T24gU2F0LCAzMSBKYW4gMjAyNiAxMToyNjoxMSAtMDYwMCwgRGluaCBOZ3V5ZW4gd3JvdGU6Cj4g
VGhlIENhZGVuY2UgSFAgTkFORCBGbGFzaCBDb250cm9sbGVyIG9uIHN1cHBvcnRzIERNQSB0cmFu
c2FjdGlvbnMgdGhyb3VnaAo+IGEgY29oZXJlbnQgaW50ZXJjb25uZWN0LiBJbiBwcmV2aW91cyBn
ZW5lcmF0aW9ucyBTb0MgKFN0cmF0aXgxMCBhbmQgQWdpbGV4KQo+IHRoZSBpbnRlcmNvbm5lY3Qg
d2FzIG5vbi1jb2hlcmVudCwgaGVuY2UgdGhlcmUgaXMgbm8gbmVlZCBmb3IgZG1hLWNvaGVyZW50
Cj4gcHJvcGVydHkgdG8gYmUgcHJlc2VuY2UuIEluIEFnaWxleCA1LCB0aGUgYXJjaGl0ZWN0dXJl
IGhhcyBjaGFuZ2VkLiBJdAo+IGludHJvZHVjZWQgYSBjb2hlcmVudCBpbnRlcmNvbm5lY3QgdGhh
dCBzdXBwb3J0cyBjYWNoZS1jb2hlcmVudCBETUEuCj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8g
bXRkL25leHQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBtdGQ6IGNkbnMsaHAtbmZjOiBB
ZGQgZG1hLWNvaGVyZW50IHByb3BlcnR5CiAgICAgIGNvbW1pdDogODc1MzgyNzU5Mjk4NjUwYzk2
MTkyYmYyYzEyZTJkMWU0NTc1ZGU5MgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24g
bXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0
aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
