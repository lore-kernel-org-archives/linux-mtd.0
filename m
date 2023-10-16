Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3143CDB482
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzHzU/vuRJiaMqnec7dlRhtFPoVw1LZueUvyPwCTaVo=; b=Aagtd1npPbPXbm
	lPaYnZR9kRclDY7mNMVWOWGEBzG1KMAYgBEykOYwvqQtSexvSr1kuhF1VkLPrv+xqAaUn1+Iq323a
	vbhXS/fasTMqEFTlQyMu/5trqjJzdDxw+xsvptV0h+deM2ucY50/ivlPUUZDVtIVsze+TpKzyJZJX
	dJgjOhrVz9gmU32oSBBOkLiG+Za/NFylWLEeBGLJ0jiYxk/6uM1JHIzN5gdSxg+OsgLdBv7GveloF
	+7U5keua2/aMAcyIt+XtMYg0SxR6x0DWutzLhOTsjepYxeBjS3dymk/JtF2GtMDCl5fpE2itAg4Se
	e+ooxq7E4QGB1OVZq3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtQ-008zqX-2j;
	Mon, 16 Oct 2023 09:28:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtO-008zo3-1a
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Oct 2023 09:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GFVGG5jaMY/KzkmzX89K7tGA0hpHaaLK1Z/PWL6KAVg=; b=SnWy6mHF1a3f1c8WKA/288wcv8
	LLjaqr1j6cho5hJ7idiv3RQPwBFy88F/i8/4HKlYK9QThA1bmeaBeWWCya4ws1NN+u3L23GG5Eern
	lQp97DTcfHcd/1JEHQJ0lZp8DnZKjlYCfJH1XjfomT0Lm3COQ0sGF5Rj2v9J/jEqoLM3izow1zmiX
	IkhuYk2CUJBMj7KKf2jFbtUafoTnJhsRGJEZQAyETiUSctMIo73FcRd4R32NTwIycDQftCqABSqhp
	o6RfNW45DOwpzO8V9Wt9QvAkXloR+lVkhGsjxTP/hg1rNZJvw2RrP3shIpfiHNlEMveYdLfp+MpI9
	ot6IHP6g==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtC-005rWS-0j
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:28:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39315FF809;
	Mon, 16 Oct 2023 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFVGG5jaMY/KzkmzX89K7tGA0hpHaaLK1Z/PWL6KAVg=;
	b=A4gQeIvVqlKLrENk7g2X6VamStdiD1pObaL+Bz6VPR8PTFQpbAdrm3HcDu44VBvkjGZt2d
	4fZyl97OsRkW2yJ2cRjyljImN3PearPssnvzvn5WMPJQYsMLw6GTZlBXwMnQ1Qhkd5FG33
	qYpyRXQ/MW1WRii1beHtI/H0HfuZkf/KWgiX88l8j8+QkoRxX7bnx1SUHBQe3XpwMVRgXy
	2ISKcG7/ChMZag7+vUlndlR0UAmBFywoCndC9JqYsbzAc/aKIFdx8tWOZM2qsTHOb+2YYS
	MrYkQAv7HluWozw6/oL4a2GRzDj5VGVOnS38aqQ+g+12QbMW/+R8avzlNLzkUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 13/20] mtd: maps: physmap-core: Convert to platform remove callback returning void
Date: Mon, 16 Oct 2023 11:27:43 +0200
Message-Id: <20231016092743.288511-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008200143.196369-14-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b1dbe19b358ca9c36f370137ea6d15e6ae6cfd9e'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_102756_146089_04D84876 
X-CRM114-Status: GOOD (  11.05  )
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

T24gU3VuLCAyMDIzLTEwLTA4IGF0IDIwOjAxOjM2IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZv
cm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBkcml2ZXIgYXV0aG9y
cyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5Cj4g
cmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGln
bm9yZWQgKGFwYXJ0Cj4gZnJvbSBlbWl0dGluZyBhIHdhcm5pbmcpIGFuZCB0aGlzIHR5cGljYWxs
eSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLgo+IAo+IFRvIGltcHJvdmUgaGVyZSB0aGVyZSBp
cyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4KPiB2b2lkLiBJbiB0
aGUgZmlyc3Qgc3RlcCBvZiB0aGlzIHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8K
PiAucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBh
ZnRlciBhbGwgZHJpdmVycwo+IGFyZSBjb252ZXJ0ZWQsIC5yZW1vdmVfbmV3KCkgd2lsbCBiZSBy
ZW5hbWVkIHRvIC5yZW1vdmUoKS4KPiAKPiBUcml2aWFsbHkgY29udmVydCB0aGlzIGRyaXZlciBm
cm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2FsbGJhY2sgdG8gdGhl
IHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBt
dGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
