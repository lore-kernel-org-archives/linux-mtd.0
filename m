Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E1A606A829
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sN2Swux3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mPhrbuKg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yI+sY5/mQ26rzFg+xBEeYtHt+ZYl8dDnzb71Dud0+38=; b=sN2Swux3lL8yRvU559YvZc5jF7
	ChNuDFb0ckVsni85ugSRr4/ECEp2IVcLuhPrCFegsu5C+dKqJyK4Q7khfUb1ykZiFG5lD3YpnVDea
	9HpgKH2tMCGdrvkpxXmaLggjTusxwemJRwQus2zZopn9NfNgISS9KUpTM6AJZTpMbaQOGCmhNRtfH
	eHEqBonx9cStC7fChPJ8tSsJr2RNBDJZN7KJbXzDldarRb3cZxogZPH91YKCT/FzmpOprsxvm0U4g
	nr36YpPrdbp4cN4fG7BdxarI6AJtMN3GcIqbNrczbLCCwM/sMAqV12dczVymTBPmcHvZ1o/6IiA2/
	HkA786hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ9k-0000000FLh8-1giq;
	Fri, 20 Nov 2026 15:04:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ9g-0000000FLf8-2yZg
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:04:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41F214E41681;
	Fri, 20 Nov 2026 15:03:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1719B601B9;
	Fri, 20 Nov 2026 15:03:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 996E211BC02D2;
	Fri, 20 Nov 2026 16:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795187032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nOuVgZq6Hoapw7L/D5ylHIq8Pkp+9ypRHxYDY/1QJPg=;
	b=mPhrbuKgkGFfVq1M+FbaSdJNag8+QMHghjsqZt1xBr+JSbTyJbmRizNcemC1hdW7PrwiFo
	WP/wojGAB/Zf+e+mFgQB+urYvFAnZlVlICelhyWemfGFuu2yZV0N7X3cQgjOs2hQLLgOlW
	iHBdI/vYsUVY2YNmMw5ULtLnu2+lt4KYDv/eQvSAg1pqV/QE/9vEvMM8m4Qhjar3ubDuvo
	y+fEYGsrkXhDaTEnooWdnXvYipsXmQoLZpKcDO8/4fxenAEFjI7ZxUzctGmOqST0TUQ+6s
	GaT7fMt6QPaxwSAzSoFTvyxU/a3nQ/FaNmuJIx6v6jE7/2niftHYZcKITa/u2g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Artem Bityutskiy <dedekind1@gmail.com>, 
 Manuel Lauss <manuel.lauss@googlemail.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Fourier <fourier.thomas@gmail.com>, stable@vger.kernel.org
In-Reply-To: <20261108-submit-au1550nd-resource-claim-v1-v1-1-8f4c694fdd39@gmail.com>
References: <20261108-submit-au1550nd-resource-claim-v1-v1-1-8f4c694fdd39@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: au1550nd: fix the memory reservation
 check
Message-Id: <179518703043.3404688.7884533552313535041.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:03:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070400_889721_ABD71481 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCAwOCBOb3YgMjAyNiAxMzo1NToxMSAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gcmVxdWVzdF9tZW1fcmVnaW9uKCkgcmV0dXJucyBhIG5vbi1OVUxMIHBvaW50ZXIgb24gc3Vj
Y2Vzcy4gVGhlIGludmVydGVkCj4gY2hlY2sgcmVqZWN0cyBhIHN1Y2Nlc3NmdWwgcmVzZXJ2YXRp
b24gd2l0aG91dCByZWxlYXNpbmcgaXQsIGFuZCBwcm9jZWVkcwo+IHRvIG1hcCB0aGUgTkFORCBy
ZWdpc3RlcnMgd2hlbiB0aGUgcmVzZXJ2YXRpb24gYWN0dWFsbHkgZmFpbGVkLgo+IAo+IFJlamVj
dCBhIE5VTEwgcmVzdWx0IHNvIHByb2JlIHByb2NlZWRzIG9ubHkgYWZ0ZXIgY2xhaW1pbmcgdGhl
IHJlc291cmNlLgo+IAo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoK
WzEvMV0gbXRkOiByYXduYW5kOiBhdTE1NTBuZDogZml4IHRoZSBtZW1vcnkgcmVzZXJ2YXRpb24g
Y2hlY2sKICAgICAgY29tbWl0OiBiYTM4OTM0NzM0OTFkOTgxMGYxZGFlOGRkZWYzOGQ5ZDQ4N2Q2
MzBmCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3
aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxh
aW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
