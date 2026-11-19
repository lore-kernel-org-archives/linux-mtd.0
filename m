Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D39606A335
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o/SVioCY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=G/UfFKVi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N08N54voYQDCyzqddzfhp64/Byu6+hR075ORj27/HeQ=; b=o/SVioCYVoQK/WT5PTzF39SpiT
	14M2Irci7r/G5zRhrbKWeAboT0VKhjZej3TIf1OacodReOujqj40WQXnBD+r0MmkiR4jMZtSHOIeg
	lHxCqg/kXluYC/2GRxIxe5VryxSJCCVaPC1CNjSGRFnOGCiLQvHSe3r7TDg7hpqPfJEnBE09H6+qt
	+vLZi9KxCpAF32rCsHnkKLz+lNJbeTi4RVlYApTyCJphS3zQP4I0MM8a6w8jWHa+JFEmwAs9py13X
	j3wloYkpX3GG/woBl6mZwkYwVSk2CuNVtcwh/WjPpCVvGqREVuysRNpOKNG7H/avaAGsSL9JoU0MW
	VA+XVxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OW-0000000BrXu-0ioO;
	Thu, 19 Nov 2026 12:37:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OR-0000000BrRZ-0CVV
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CCEC4E41667
	for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 12:37:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C17560237;
	Thu, 19 Nov 2026 12:37:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08EC011BC05F4;
	Thu, 19 Nov 2026 13:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PxwBCxacHoYLPSc7fd8YHXq1TexJePfZYiAdbugkj4g=;
	b=G/UfFKViB2rK492W2eHR9G7tStdBG6h3B+KtXktZjpis/AVce/0PMcbxPAxQpSgXBB74Qc
	NIU18loFLDCq2UODCN+HPrT01JyZtN9T9y//eoWhD6n0/ZU3F6sUfe6+yV6iIf4iWR2xxn
	jf5x1zyQVDrfTG/8Xxi2JLtsNSUsXlaI13pRloYRjVRWTAXsLEs+OtownJS8FaghAHbLoH
	bw69FUe/efosxTc0DSXo87R98OuGXAJrPmw0u6bFHmn6ReZzvsjNnk2H6tvsQf5Bo9VpPN
	Y5AYEE3597t7/xxoyH+ontFDWzqXxAj8DpFLrn+jHMaNcn1P45T0qDixzi8AYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261119-spinand-cleanup-ecc-engine-v1-1-60d007d2ddd8@gmail.com>
References: <20261119-spinand-cleanup-ecc-engine-v1-1-60d007d2ddd8@gmail.com>
Subject: Re: [PATCH] mtd: spinand: cleanup ECC engine when
 spinand_randomizer_init() fails
Message-Id: <179509185092.2889394.6227945736733720640.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043735_230890_18A8BF7F 
X-CRM114-Status: UNSURE (   8.20  )
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

T24gVGh1LCAxOSBOb3YgMjAyNiAwOToxNDo0NiArMDEwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
V2hlbiB0aGUgc3BpbmFuZF9yYW5kb21pemVyX2luaXQoKSBmYWlscywgdGhlIGNvZGUganVtcHMg
dG8gdGhlCj4gJ2Vycl9jbGVhbnVwX25hbmRkZXYnIGxhYmVsIGFuZCB0aGUgY29kZSBsZWF2ZXMg
dGhlIEVDQyBlbmdpbmUKPiBpbml0aWFsaXplZC4KPiAKPiBDaGFuZ2UgdGhlIHJlc3BlY3RpdmUg
Z290byBzdGF0ZW1lbnQgdG8gdXNlIHRoZSBjb3JyZWN0IGxhYmVsIHdoaWNoCj4gZW5zdXJlcyB0
aGF0IHRoZSBFQ0MgZW5naW5lIGdldHMgY2xlYW5lZCB1cCBjb3JyZWN0bHkuCj4gCj4gWy4uLl0K
CkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IGNsZWFu
dXAgRUNDIGVuZ2luZSB3aGVuIHNwaW5hbmRfcmFuZG9taXplcl9pbml0KCkgZmFpbHMKICAgICAg
Y29tbWl0OiA4YWY0OWQ0MzQzM2MzMDVlMGZhNzczZWE3MDVlZWI3ZDA4YjZjZWI2CgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
