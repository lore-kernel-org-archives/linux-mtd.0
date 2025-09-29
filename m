Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAB9CAC5B5
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HK+lWOi/qGw0adtADEFjCCnAuwjWCCxyZNEu/SaihO4=; b=JF9BSUEk0VcjmY
	WCBPxKkPv5elTtlKUtUZ1iVYo3aTsRZiR8NRVSBR0yxiEQ2NYWqJCszLRgE2KPJFntu6dMUzGK7LM
	ablmLstl1bhMIQUE8Qt1a6KhTa3bsIVnfyOiI6Z2t7/aXFn9QOYEjnDOEK6mdNXBBeMncRPNVxOhK
	noIbEjAv7y/i6iJ1eGO9TnksCe/z/2RgjwBAVWFaO0g2oP/BbuYkA1rkbzk1oMk+MJjD8CM19xzaN
	KbuibcYXHTr4Wb3zDyDiIgCeDqXgNmItp2tEk5T9yd3dBTdm2o4E+63M3W+0Ndk32hhuppSDqfxCn
	qQ4Nlm06ufpEkWSjxWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GCT-00000002qnK-0BMJ;
	Mon, 29 Sep 2025 15:54:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GCO-00000002qkU-3HQS
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 15:54:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E3A3C02449;
	Mon, 29 Sep 2025 15:53:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CC2A606AE;
	Mon, 29 Sep 2025 15:53:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15091102F198F;
	Mon, 29 Sep 2025 17:53:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161236; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i/6Hyq8dUOSWl9oLKZN2M9OHkzWrotGY1p3Ytmb8Mo0=;
	b=a1Pcb2YbJ4azTRrfqDiwaf+1qWjyyT0OzRME8dE2Xp0sBB0euxaCPvc3aMSIlgOiykQkAE
	iquDV6X6YMaKoSToNUIhLo8KlT3+2G2I/1vmSOhbHmr3q9DuHDRP9FfgZvN+Ng2I/JfL9C
	oAnKrspJhK3c7xuHUWynbeLe86SD6iC9J3YuGG9uKJMWN5daFuVq0rZcGlwc/6fRwZwoVx
	laKJFn/c4jHmoUqypZgHdJdEWh5ABeRIqRTTeup/1TSdm+QxjV8WSBcw10OxwN0Vvl6I56
	F+2+JNiVZYS1ARpFGuM2ZJujaYtW+V4ylH/+cYSH4B9HzCHxBb/0CzgmgX9wnQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
In-Reply-To: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH RESEND v5 0/3] mtd: spinand: fix continuous reading
 mode support
Message-Id: <175916122241.49940.15564492037102571849.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 17:53:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085401_001891_91EC6504 
X-CRM114-Status: UNSURE (   7.55  )
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

T24gVGh1LCAxOCBTZXAgMjAyNSAwMDo1Mzo1OCArMDMwMCwgTWlraGFpbCBLc2hldmV0c2tpeSB3
cm90ZToKPiBDb250aW51b3VzIHJlYWRpbmcgbW9kZSBpcyBicm9rZW4gZm9yIHNvbWUgc3BpIGNv
bnRyb2xsZXJzLiBUaGVyZSBhcmUgdHdvCj4gcG9zc2libGUgYnVnIHNjZW5hcmlvczoKPiAKPiAx
KSAiY29udGludW91cyBtb2RlIiBmbGFzaCBhbmQgc3BpIGNvbnRyb2xsZXIgd2l0aG91dCBkaXJt
YXAgc3VwcG9ydCwKPiAgICBidXQgd2l0aCByZXN0cmljdGlvbiBvbiB0cmFuc2ZlciBsZW5ndGgg
aW4gYWRqdXN0X29wX3NpemUoKQo+IAo+IDIpICJjb250aW51b3VzIG1vZGUiIGZsYXNoIGFuZCBz
cGkgY29udHJvbGxlciB3aXRoIGRpcm1hcCBzdXBwb3J0IGZvciBhCj4gICAgc2luZ2xlIGZsYXNo
IHBhZ2UKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzNdIG10
ZDogc3BpbmFuZDogZml4IGRpcmVjdCBtYXBwaW5nIGNyZWF0aW9uIHNpemVzCiAgICAgIGNvbW1p
dDogZTRhMGNmOWYxZDkwZTY4ODhlNTM3M2RhMzMxNGY3NjEwMjRmNmM5NwpbMi8zXSBtdGQ6IHNw
aW5hbmQ6IHRyeSBhIHJlZ3VsYXIgZGlybWFwIGlmIGNyZWF0aW5nIGEgZGlybWFwIGZvciBjb250
aW51b3VzIHJlYWRpbmcgZmFpbHMKICAgICAgY29tbWl0OiAwMDRmOGVhMGQ5OTE3Mzk4YWFiZmY3
Mzg4YjNiZjYyYTg0YTQwODhiClszLzNdIG10ZDogc3BpbmFuZDogcmVwZWF0IHJlYWRpbmcgaW4g
cmVndWxhciBtb2RlIGlmIGNvbnRpbnVvdXMgcmVhZGluZyBmYWlscwogICAgICBjb21taXQ6IDAx
MGRjN2YyZGQ2YTAwNzhhZGUzZjg4ZjYyN2VkNWZiZjQ1Y2ViOTQKClBhdGNoZShzKSBzaG91bGQg
YmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4
dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJl
Z2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
