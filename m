Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C3C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 May 2022 12:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFKr/P/okUp4jTg57U1Jl/hEFJF8zRNGIquPPKjD7Eg=; b=KaQagTc0rfUzYs
	pG/+FNL3wFHPvJbYVAeBxMAqipT6Qb1p41h6s16GU3nDmgbK7rrM+QdKs0IlhHOWz5NCdlYv4ZfYs
	3lf8wg1fchc3m7JJsct/+34hGbS258mdMwxxsXgqSrTJgBPCx1wBsXZnbMYqY7cK1fxydPa5Ay/4C
	cHc5l0Z79vbLatBllf1i2H5rA1tez4DbrmoStdAuVHjZK4CUy8wFYpt7bOcV5EAp95YER8K8Hdozy
	Ng0+7DGjDCSE9Mj0NwIiuLXFjnJ5KihrKo5770Zd5W/VIbRfmQwXRUnCQk+75OyMYXdDPbphrq5Cm
	5+k2m2aq08EaCz4+opgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1Ua-00CG4p-5V; Fri, 20 May 2022 12:12:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1UW-00CG3K-3M
 for linux-mtd@lists.infradead.org; Fri, 20 May 2022 12:12:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 43FA41C0006;
 Fri, 20 May 2022 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653048738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hgs2sF9iE7uYWTY0qOXcrdPIEeqIgpmmRoDLCr0HrII=;
 b=fM4ubfwDLn8YakInehSTLh8SgNcCh3GTSU2VC5Z+IJmAGVxb2WxhPbzmG4p55SyFEq9mn9
 qvvnHkq4do9NBQq6IxAIomYWAyx/44HYGwm4vowUxfyAZZmX2Wzdia1KhBytmPFxV/oHdF
 KbH7KVppjVy+l/L1ZdV+j3SCn3ihFN98R6ZgNcUUgacXOZgiP4BHd6n1YYVIoc/fzy+Ld1
 jhvvm78TwaGAni68eG7KwSMN6hbJnIk6dI44pKWYoh4Z2WHrGerB3KaCW48nhJsjVFalHs
 xSyufRYQVkSkfSRgpqr2uFQX50he+d2o92fSbgy67weTi1MZP2GJHsrimBFBRw==
Date: Fri, 20 May 2022 14:12:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for 5.19
Message-ID: <20220520141216.38bcadb9@xps-13>
In-Reply-To: <20220516071518.orf7n7k4fhtpcj3x@ti.com>
References: <20220516071518.orf7n7k4fhtpcj3x@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_051224_666443_55375114 
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBNb24sIDE2IE1heSAyMDIyIDEy
OjQ1OjE4ICswNTMwOgoKPiBIaSwKPiAKPiBUaGlzIGlzIHRoZSBTUEkgTk9SIFBSIGZvciA1LjE5
Lgo+IAo+IFJlZ2FyZHMsCj4gUHJhdHl1c2ggWWFkYXYKPiBUZXhhcyBJbnN0cnVtZW50cyBJbmMu
Cj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBiMmQyMjlkNGRkYjE3ZGI1
NDEwOThiODM1MjRkOTAxMjU3ZTkzODQ1Ogo+IAo+ICAgTGludXggNS4xOC1yYzMgKDIwMjItMDQt
MTcgMTM6NTc6MzEgLTA3MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6Cj4gCj4gICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbXRkL2xpbnV4LmdpdCB0YWdzL3NwaS1ub3IvZm9yLTUuMTkKPiAKPiBmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gYzQ3NDUyMTk0NjQxYjVkMjdjMjBlNTU3Yzg0YTQ2Yzg1ZmQ3Y2Uz
NzoKPiAKPiAgIG10ZDogc3BpLW5vcjogZGVidWdmczogZml4IGZvcm1hdCBzcGVjaWZpZXIgKDIw
MjItMDUtMTIgMTc6NTY6NDQgKzA1MzApCgpQdWxsZWQsIHRoYW5rcyEKCk1pcXXDqGwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
