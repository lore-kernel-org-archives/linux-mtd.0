Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77819C9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9BQLLU9+qGHb4ucpBFciT/ATAUdPvIaCxnCfKXbGis=; b=E3vaF+a5uaX0NE
	KlpnCrcrtLEfQ+a4K89dEjiADrkGviOkzkTTmETVm5E8Nu15hli5a4JROo3usO6zo9wllppm8iHCX
	PfdJ3UGWZOR0BGRbjQKgoThAOHCm6CiRHczgcsb+mB11L43Wn0u1S6kkQQmuIIihb7SLKSELUjnQt
	aEO7fmoq7L23gje0u6BTKXK58ma2dvdm7OW6PtOCHvgyAkPsho4lUH3GsD71OG+1Xhbf9zmGbWTWa
	xhr8sISupX3q8jsJZOhKDq2YaR4z21eNiT5ETVG0rfDmQHplCZSAp2o1Di7MJZXVhl14WxZbr/au/
	ZnmPYUyUR2RUa5ScHVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6v8-0000000DZyp-0QRo;
	Fri, 25 Sep 2026 14:29:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6v4-0000000DZrk-2a9D
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:29:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 144E3C653F9;
	Fri, 25 Sep 2026 14:29:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2682D6073B;
	Fri, 25 Sep 2026 14:28:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7472102F08C8;
	Fri, 25 Sep 2026 16:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M7tarLas7ZMtRvHTrqM/VoWT03+EigFjx6K5ugriU1U=;
	b=nfFMo+zD9Myj169hq1OhA5AeFRbqr0xDeYGbePu9VH8iVKfuSz4K2e4NR2t3m+kqnLikke
	2G1AOve8HXcGCPgr9GBReVYAnk3gLyrZ8+ynyPWE+r2HXlzOVn5SAhaWAcsTV8mcFVQ1JH
	Pixpy0oVdBs0a95tOa3tfibra3eGuS7mlG2lKvV0eyRaVwkPLZfr81V2K4Qrg50Oo5NVIm
	vWK0yg9OSFWeMNJadVcvyxkSnEyLDxKGUdNRERrkUg4J5c9Q7YB5ztY1NEtIR/MGVga7TW
	1Pq/7H6ef7QjzLVfuEyOxFLaJGiFDkchH7/EJK05CD7KQthvdHjkUHI7d2SxeA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, 
 "Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, 
 Richard Weinberger <richard@nod.at>
In-Reply-To: <20260917145329.380628-1-rw@kernel.org>
References: <20260917145329.380628-1-rw@kernel.org>
Subject: Re: [PATCH] mtd: Call get_wunit() on the master partition
Message-Id: <179034653329.1166139.18340436218142958229.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:53 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072858_859078_D5C82012 
X-CRM114-Status: UNSURE (   5.35  )
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

T24gVGh1LCAxNyBTZXAgMjAyNiAxNjo1MzoyOSArMDIwMCwgUmljaGFyZCBXZWluYmVyZ2VyIChz
aWdtYSBzdGFyIGdtYmgpIHdyb3RlOgo+IFRoZSBjb2RlIGNoZWNrcyB3aGV0aGVyIG1hc3RlciBo
YXMgZ2V0X3d1bml0KCkgYnV0IHN0aWxsIGNhbGxzCj4gaXQgb24gdGhlIGNoaWxkLiBGaXggdGhp
cy4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogQ2FsbCBn
ZXRfd3VuaXQoKSBvbiB0aGUgbWFzdGVyIHBhcnRpdGlvbgogICAgICBjb21taXQ6IDkwNGYxODQz
MGU4Y2NlODI5Y2I5MTMwZWFiN2E5MzAyMGUzM2ZjODkKClBhdGNoZShzKSBzaG91bGQgYmUgYXZh
aWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAo
cHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMs
Ck1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
