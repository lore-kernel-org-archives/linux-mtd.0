Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4E0CCD1BF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1Difh9r905dR1lezfb8mpdf8qa9wQCD7pXg3VPnOyc=; b=0unyXelvXByiSG
	RmrAQhHSWRfvGcPMotsGx74/mQBxJ5DNTeFKsEoD/tTR5fSpC+9PT2YCu/xKcp6vYZjcG6/iKRivR
	80miZXBbV1ojsJtbNcvQLIkAeofMczBoZv3q+wAXCBHm6GtYVGZpaPR9woyJzV4P3xnvo12hQnwtT
	B/cMGzFm7OsEmjlwXI6gjupnKwopS++Mr/7uBtAWnn1KxFbx3+tE15Ywp/OKPRsAnoBsNgzLT2NHA
	+PkGhpB5cKoqmjj240dWQ1iVD1ClQPRWsnVrwXGXPLJOHZaR91E8nPKTQIL6HXRFDEcdix6TPqWNO
	cIuEPM5UYFo4uEPsup7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6j-0000000GGIY-081b;
	Tue, 28 Oct 2025 15:59:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6d-0000000GGCr-2mjc;
	Tue, 28 Oct 2025 15:59:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A4A15C0BEA2;
	Tue, 28 Oct 2025 15:59:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7BC0606AB;
	Tue, 28 Oct 2025 15:59:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F035117A9A2D;
	Tue, 28 Oct 2025 16:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761667169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sRwSaMd6UTVG+EXoPh3Z8r1dIb+gecAn5V193KEwsVs=;
	b=HrmDt3SE5MmeHDTAqfZrtU1OFQxz5le9h51hbFOyA77E8pT2lM5ABQcXcmBrXzBGWWsZjr
	qz294AoULNlkROm1CBXEygfYPbfQKZhcuVml+XA3ir6CR4/iY26/JF8ZiF+7gB3t5PpLLV
	/moxL2+JjjVGIacBpJd3Tk5WdT/MA6Mtvz8PD3V7oO6IRdieXPL8wwpzCA2ZDpFSfm5dCI
	8obFEJlTjENM0EpoeG1hzGJkOLBV3pZe6TBTw3rTKRGgk3UaLDliRpb8RiMefaidoSFOL2
	IvMBv5ba7tuP5+o5bf7laBrxbrBp4udCeU7gpwZ1fDxbmjw2yE71F3O2NNfwxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, vz@mleia.com, 
 piotr.wojtaszczyk@timesys.com, Haotian Zhang <vulab@iscas.ac.cn>
Cc: dmitry.torokhov@gmail.com, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251028094747.1089-1-vulab@iscas.ac.cn>
References: <20251028094747.1089-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on
 probe error and remove
Message-Id: <176166716607.365556.10097701376798389137.b4-ty@bootlin.com>
Date: Tue, 28 Oct 2025 16:59:26 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_085931_875521_96873429 
X-CRM114-Status: UNSURE (   8.43  )
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

T24gVHVlLCAyOCBPY3QgMjAyNSAxNzo0Nzo0NyArMDgwMCwgSGFvdGlhbiBaaGFuZyB3cm90ZToK
PiBUaGUgZHJpdmVyIGNhbGxzIGdwaW9kX2dldF9vcHRpb25hbCgpIGluIHRoZSBwcm9iZSBmdW5j
dGlvbiBidXQKPiBuZXZlciBjYWxscyBncGlvZF9wdXQoKSBpbiB0aGUgcmVtb3ZlIGZ1bmN0aW9u
IG9yIGluIHRoZSBwcm9iZQo+IGVycm9yIHBhdGguIFRoaXMgbGVhZHMgdG8gYSBHUElPIGRlc2Ny
aXB0b3IgcmVzb3VyY2UgbGVhay4KPiBUaGUgbHBjMzJ4eF9tbGMuYyBkcml2ZXIgaW4gdGhlIHNh
bWUgZGlyZWN0b3J5IGhhbmRsZXMgdGhpcwo+IGNvcnJlY3RseSBieSBjYWxsaW5nIGdwaW9kX3B1
dCgpIG9uIGJvdGggcGF0aHMuCj4gCj4gQWRkIGdwaW9kX3B1dCgpIGluIHRoZSByZW1vdmUgZnVu
Y3Rpb24gYW5kIGluIHRoZSBwcm9iZSBlcnJvciBwYXRoCj4gdG8gZml4IHRoZSByZXNvdXJjZSBs
ZWFrLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRk
OiByYXduYW5kOiBscGMzMnh4X3NsYzogZml4IEdQSU8gZGVzY3JpcHRvciBsZWFrIG9uIHByb2Jl
IGVycm9yIGFuZCByZW1vdmUKICAgICAgY29tbWl0OiAzYWUyM2Y3N2I2YTBjZDUzYjU1N2FjNjlj
OTgzMTJmN2JlMjJmMDgxCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGlu
dXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8g
cm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
