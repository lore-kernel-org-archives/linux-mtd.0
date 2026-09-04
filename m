Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206ECC79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxV3fTjVVEMgPou0Eym0xbK5RDAtIc4tYhlK5s1cY8g=; b=Oqs28A4FCVDOrf
	vyzD06ummDuLsWo1RgqaAQ6bW76JWwUswuhxCvnCIJjc4EKgBjlUQXQdNpTyIdZGI8TQo6hYlV3Mx
	CieE2sapzcsSJgyyiZ2mi+ZgT4tdBpg35p7Nor4PoKPd9litjpPCbQ9ty1Lu5a30hXLWnQnNnw/cm
	X8CUYbA61JSf2zN5E+E7OfAtsaH24aaa/aEzMuWQqAgPjARQayZmfGRSo/996KO2hFZgyZYHAcO+o
	Am+oz3/9/1fAf69HVylXMwbAUzoWjWlOF7aiLGLZU0qEGaqiJqr45XYt7mR1f7YlDyJ61GzFmiFLe
	V40Q4+H9aQ25ndoXDiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLf-00000002yrN-46dQ;
	Fri, 04 Sep 2026 18:09:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLd-00000002ymV-0cG1
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B2B54E41523;
	Fri,  4 Sep 2026 18:09:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 621ED6057F;
	Fri,  4 Sep 2026 18:09:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EB4611C78158;
	Fri,  4 Sep 2026 20:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D9RqcYnyChf468lUF/a5gePeEeWBEWrbptLhqFANr1Q=;
	b=VyyJ9r0SeH/ug3ze6iHzLG9MXvzzoblTMV+SFgm8y7a0XCkQf7BSbfi2Bg1pOOCnaf9gkH
	PykFvgbUPnsuKwIkZbPF93ci6smkB7hm7nMZfSu2w+pgNftIA4A1IaV/4nhVYYqDGz6pdy
	LuOuIwgbKk+tmmr/F3DkN5w5YVJ7ft1UEL/2OvHWQnlWtS4TCbnM9YRD1o54+fBemKCLBV
	mXP00nh1IDmDJQJriVjZgUa92w+Lbonj7he9rZXybYfIjM5tEI94r03CIhKYOSNEUN8SnZ
	mghIRCGAtCaaC0RaK0rf1OXnblzh44ty6W0qL0jboi3UYSBKRWIDyhCgGaG68A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260822230334.214070-1-rosenp@gmail.com>
References: <20260822230334.214070-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: nand: omap2: Fix kernel-doc parameter warning
Message-Id: <178854534625.1533016.14834218188777626868.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110909_325309_0B4130F2 
X-CRM114-Status: UNSURE (   6.47  )
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

T24gU2F0LCAyMiBBdWcgMjAyNiAxNjowMzozNCAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
a2VybmVsLWRvYyBpbnRlcnByZXRzIGlubGluZSBjb21tZW50cyBpbiB0aGUgb21hcF9jb21wYXJl
X2VjYygpCj4gcGFyYW1ldGVyIGxpc3QgYXMgcGFydCBvZiB0aGUgcHJvdG90eXBlLCBjYXVzaW5n
IGl0IHRvIG1pc3MKPiBlY2NfZGF0YTIgYW5kIHJlcG9ydCBpdHMgZG9jdW1lbnRhdGlvbiBhcyBl
eGNlc3MuCj4gCj4gUmVtb3ZlIHRoZSBpbmxpbmUgY29tbWVudHM7IHRoZSBwYXJhbWV0ZXIgZGVz
Y3JpcHRpb25zIGFyZSBhbHJlYWR5Cj4gcHJvdmlkZWQgYnkgdGhlIGtlcm5lbC1kb2MgdGFncy4K
PiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbmFu
ZDogb21hcDI6IEZpeCBrZXJuZWwtZG9jIHBhcmFtZXRlciB3YXJuaW5nCiAgICAgIGNvbW1pdDog
YzQ2OTM5MWRiMTU4MzliMmQxYjEyOTRlYjRhNWU1YzM2YWI1YWM3YQoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
