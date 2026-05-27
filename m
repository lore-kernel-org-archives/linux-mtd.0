Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9334BCD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FoEG9MFtgKjmrpUguNvme0viRe1NDefndMIgBuoe+I=; b=j4fauuqkWYDaD2
	NOPZfV3P5ItkE8+oCZpSbauZky7w3MNbUF4Xpl9jwvSR6VUEC8AuvyIXxphlsposyoIzOy708uSrR
	NfgUylsy2l0WGtCkwjyXkEJ0oBxccO3JLC/0aywGq+s9Yn4yiBmyvTU83ngcgMutuJies506bOaXc
	6nCq3j8aRdYoEeFCk+Ftsbk24UaO6FXcp0hZcebqcrWuYM4pQdA5zYcpOQ6Mx7+r1aXZW0AdacG/B
	4d92LFGjuu04cIjHbWW+3igqOwL1jwhRlMRKpPcaPY4Jgo3ZpGIaBe/hXQTv2GEaBSbbzek0QkoCY
	lpEYV6NCWtCQf7jjIerg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAHv-00000003bcZ-0wys;
	Wed, 27 May 2026 09:10:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAHp-00000003baj-0e99
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:10:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD1311A36E1;
	Wed, 27 May 2026 09:10:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98DCA601A1;
	Wed, 27 May 2026 09:10:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACF1B1088845E;
	Wed, 27 May 2026 11:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779873046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pGl2916JTVjLHrmDmkxr4i2x/78he1PST7i+Hzc+Ksw=;
	b=bpnTdk7nCnrQZk9Ix2sZqS95AT62zvsr6ey8NPDp0aNLK/UOGdxMRxcwCuW0S8bCm5Pntv
	Sdaw4hU62GtrfGdVA5oslq1pr9ml+OB+TXJqj9QiF5eOQuGyRMXp00Kqb/n+MUrtu8E0sU
	e1gsk9MfcTg5yrEoixmNXV+MQuq4eqlrrWgLEcFndQWzRYgTzaDb2OqCEL6ULzPovS6Kr3
	go1ZMTht83zW3flin0XInHSbj++BttxhQ9hixn74hKtcj3qR2bikFVAoyf4WJecCLzDZBd
	TMBf0mRwdhnBjyF76EqXp3bdzVq82Q+wA4zlRX5a7c6RvJv+ft3wzE3WynoVTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Andrea Scian <andrea.scian@dave.eu>, stable@vger.kernel.org
In-Reply-To: <20260522091739.2789664-1-miquel.raynal@bootlin.com>
References: <20260522091739.2789664-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: Pause continuous reads at block
 boundaries
Message-Id: <177987304402.3986809.14594892371333987990.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:10:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_021049_324824_7DA53501 
X-CRM114-Status: UNSURE (   4.98  )
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

T24gRnJpLCAyMiBNYXkgMjAyNiAxMToxNzozOSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBTb21lIGNoaXBzIGRvIG5vdCBzdXBwb3J0IHNlcXVlbnRpYWwgY2FjaGVkIHJlYWRzIHBhc3Qg
YmxvY2sKPiBib3VuZGFyaWVzLCBsaWtlIFdpbmJvbmQuIEluIHByYWN0aWNlIHdoZW4gdXNpbmcg
VUJJLCB0aGlzIHNob3VsZCB2ZXJ5Cj4gcmFyZWx5IGhhcHBlbiwgYnV0IGxldCdzIG1ha2Ugc3Vy
ZSBpdCBuZXZlciBoYXBwZW5zLgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEK
ClsxLzFdIG10ZDogcmF3bmFuZDogUGF1c2UgY29udGludW91cyByZWFkcyBhdCBibG9jayBib3Vu
ZGFyaWVzCiAgICAgIGNvbW1pdDogOGU0NTMxNjY3ZDcxOGUyZTliMTkzOTI4Y2Y5YjI0OTdmYTBk
MDFlZgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
