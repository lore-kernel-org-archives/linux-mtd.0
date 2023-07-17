Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5DDEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YMAZlML16Akc8ZewYcd5dxrU+pGYxMePz2COmEpI3Gg=; b=Le83oO9XJ+UL2/p/pcGKWdC4iQ
	qVdCmhd6ChOk2aXV5rO7BFpiigQNQUxesqQKq0fTVMd9HDTAiDigPF9Al4Gpt7NrhSSKYxVuOWyHm
	xo5eFVc2Vy0BLV9AI/oIPKSmAZXRtmaVnE/gCkwYEMfL+gIak2S32CW6taUn/z7u49I3eM3lOi/Xq
	n08qadVMd3sZe9p5noW3SoojMMWIroRrmaS7JPofFNzeJNEZ9GXkE/BWiaAuu5OpXvW0ZkblP8+B6
	RDBe7GnPRXjpj3zvEPcfNUyx87b5A9SnoslxAMvdsFkjtujHgq5unW5pV3wbiVxR1uqrewMxcrj4y
	4wXzyYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzVE-005BZ1-2C;
	Wed, 19 Jul 2023 05:13:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzVC-005BXs-1P
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SGVCm/ZC+AegIgdNdd06YmlPunJQ37cv7u2eYoDyKEg=; b=ZhLHtpYLbqNGXcFgKtU1LQbSgJ
	ER5j/AIFWoTDPhNdJWoCKfVSBX9SVPQQpBcUV1aUE+0rdAsLPsYVTuBzYpFKO++/kcnxUr9U662KH
	F838jeUnHAyrToadUUFoLfaTjtkpLGel9VbcDyLpNXpNbSpdneWuBudLSqAQl94J5LhdlV8rNKkNF
	lWfi8K+Wy5JE71G0+bmXqVm25KKouizpv05RH8+oJ3H8gmuBkwEl2mdxpDI1YcQx9KDVgKwrNABZj
	ZMY1MzvGeb1viJ6D4HyznbDfZCcN0S9uwIdjYUny0jBaxMLl8WWPocMMbA05ToZsZK+4oDTDJFaY8
	/9yoWzug==;
Received: from lithops.sigma-star.at ([195.201.40.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLVFD-009NBM-04
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 20:55:01 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 15BB26342026;
	Mon, 17 Jul 2023 22:54:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id oo5kc-E4XfjD; Mon, 17 Jul 2023 22:54:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AB00D613AFCD;
	Mon, 17 Jul 2023 22:54:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id a2qxEfyqq3k2; Mon, 17 Jul 2023 22:54:18 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8B6EA6342026;
	Mon, 17 Jul 2023 22:54:18 +0200 (CEST)
Date: Mon, 17 Jul 2023 22:54:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Stephan Wurm <stephan.wurm@a-eberle.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Johannes Eigner <johannes.eigner@a-eberle.de>
Message-ID: <961736756.5775.1689627258484.JavaMail.zimbra@nod.at>
In-Reply-To: <ZLVWfrlEOWT1twpr@PC-LX-Wurm>
References: <ZLT2qEYjaWgSpRD6@PC-LX-Wurm> <736980270.3262.1689586950735.JavaMail.zimbra@nod.at> <ZLUXruUkYMrPK+GQ@PC-LX-Wurm> <260741266.3681.1689591789332.JavaMail.zimbra@nod.at> <ZLVWfrlEOWT1twpr@PC-LX-Wurm>
Subject: Re: ubiblock: null pointer dereference using scatterlist in
 work_queue
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubiblock: null pointer dereference using scatterlist in work_queue
Thread-Index: 3MOm7rPMjutbsmQ5JwaPKkQjaUaJKw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_215459_392855_A11ECB9C 
X-CRM114-Status: UNSURE (   1.83  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlN0ZXBoYW4gV3VybSIgPHN0
ZXBoYW4ud3VybUBhLWViZXJsZS5kZT4KPiBbICAgNTAuNTAyMzA5XSA1NW50aCBjYWxsIG9mIHVi
aV9lYV9yZWFkX2xlYl9zZwo+IFsgICA2NC45Mzk5MTddIHNnbFswMDAwMDAwMF0gPT4gMDAwMDAw
MDA6IHBhZ2VfbGluaz00MDI1NzY0MzIyLCBvZmZzZXQ9MCwKPiBsZW5ndGg9NTEyCgpIbW0sIGJs
a19ycV9tYXBfc2coKSByZXR1cm5zIG5vbi16ZXJvLCAgc2dfbmVudHMoKSBpcyBhbHNvIG5vbi16
ZXJvIGJ1dCB0aGUgdmVyeSBmaXJzdCBzZyBsaXN0IGVudHJ5IGlzCm5vdCB2aXJ0dWFsbHkgbWFw
cGVkLgoKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
