Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9F6C4451C
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP3GuYcsUYk2W5SPJLa639snQKwYlGc3/tq6Dorapxg=; b=B68EjyxY6XzoBK
	rT9LYnFTOlA2i3X4qZi5P/SF0IjZa2CRUAFelb4RGe4kNmccZJG2ywk/rpVIC8WBAqAaysnyK1bzd
	zKWOHfNxJUbSk8pKLin2elbAYyiMSynP1aiePUvLVQVyJpaGPU58kavb09N3GjHlcwf1LOJ15vxH9
	1y9splw0vFbdyg49EzWwExO+12XDx81JuqSQsvIICJvChi6X6a6AgcqS+lgf0YCUuAQ9RPBKn9SvY
	da3TiMFgf3qWxVBFxS6SeNKGPmmiO87rbIspCgt8b/PjzCwa2DUgFnlZ1yKcyQmeR8FgwZSaPn4ar
	9ChVbteffz8UNBOeJY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpp-00000002f9C-3sem;
	Fri, 17 Jul 2026 15:50:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpn-00000002f7v-1Gke
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:50:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C261D1A1068;
	Fri, 17 Jul 2026 15:50:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95EFB60361;
	Fri, 17 Jul 2026 15:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C7F811BD091E;
	Fri, 17 Jul 2026 17:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303441; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yM1Dq1yF6JGPzBfdKp4hdyjKi5Gvoep7YgcYaiFvz8I=;
	b=WJoRoRSpWbhi7HPstOipfa5Jq7Ds5RF1OKaDcxhqJyb9r+fPfUS4wlsrvK2bJ0zPGOKJC+
	b+Fm0092oB6vFKA3ISQd23GRPWVYgv54Yit1p7+X3FPbO47/OS3OoMlx1pPILpelJ/xVIn
	ZUFdaNJD1EMlP8Niu0VzmTIpBBTu4QWs/sjfSd8uxuZL2priS8z5eNbJc+SWYyrYL2UBjY
	bfP/asUtZp00TYoIQQMHAEhQsCsq4K3oGH+dXrx8lj6kGJMoJlMBa6/Mw0cwWeQzByfv6x
	c0Opx1SLt0YJwRWjKh0JSRtBZOWM1YwfhN90Huj5Ou7NvrZlhDTEh4SYVyv2ag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Raag Jadav <raag.jadav@intel.com>, Lucas De Marchi <demarchi@kernel.org>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
In-Reply-To: <20260705033107.276450-1-lgs201920130244@gmail.com>
References: <20260705033107.276450-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH] mtd: intel-dg: Fix runtime PM error path in probe
Message-Id: <178430343848.4129650.6403172381357365155.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:50:38 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085043_490651_C51FB5D4 
X-CRM114-Status: UNSURE (   5.70  )
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

T24gU3VuLCAwNSBKdWwgMjAyNiAxMTozMTowNyArMDgwMCwgR3VhbmdzaHVvIExpIHdyb3RlOgo+
IGludGVsX2RnX210ZF9wcm9iZSgpIGFsbG9jYXRlcyByZWdpb24gbmFtZXMgYmVmb3JlIGVuYWJs
aW5nIHJ1bnRpbWUgUE0KPiBhbmQgYmVmb3JlIGNhbGxpbmcgcG1fcnVudGltZV9yZXN1bWVfYW5k
X2dldCgpLgo+IAo+IElmIGthc3ByaW50ZigpIGZhaWxzIHdoaWxlIGJ1aWxkaW5nIGEgcmVnaW9u
IG5hbWUsIHRoZSBlcnJvciBwYXRoIGp1bXBzCj4gdG8gZXJyLCB3aGljaCBjYWxscyBwbV9ydW50
aW1lX3B1dCgpLiBBdCB0aGF0IHBvaW50IHRoZXJlIGhhcyBub3QgYmVlbiBhCj4gc3VjY2Vzc2Z1
bCBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgY2FsbCB0byBiYWxhbmNlLCBzbyB0aGUgcnVu
dGltZSBQTQo+IHVzYWdlIGNvdW50IGNhbiB1bmRlcmZsb3cuCj4gCj4gWy4uLl0KCkFwcGxpZWQg
dG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogaW50ZWwtZGc6IEZpeCBydW50aW1lIFBN
IGVycm9yIHBhdGggaW4gcHJvYmUKICAgICAgY29tbWl0OiBkZjZmNTgyZGYzMzc3YWYzMTZhNjBj
YThlZTBkNTkwYjJkMDM5MjRkCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQv
bGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQg
bm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
