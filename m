Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57406606A33B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wetq9vLs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lbRXD/AN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8p3GvH6wykpawpA33yhEF4/iQ8a6v+lG2i2iT6QTFQY=; b=Wetq9vLsDCjRv8h8VSerOcOb65
	WHn4jioKZs5d8UeiQXiw+9cEydfkuHpjkQpF3RLZoJ7Vu+mEPfLTv2zcNzk7053M3Z1mR0PIGgrkL
	nFmHpSVRcaZVQ8aX2+BEMGSdfS/itzOmBz5yIrJANwH0+3MojKiljcTvqN6mXoE2XPzZAQ2EdVg+j
	V2fGmoCVfFjcy4XvXNZ4XaBwi/ID/8xkBlwRhYig5yM6oTPIT9UpGYYLlwJr+kkCpO5ajR6QlHlRy
	kHVCgTj1O2b47TCThO1w0U5XwO1doU7wvxSj2BoEchaubuwF6Ai0i8VsDIcZmEPZXMKCcq9fXtCzL
	SOlJJiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OS-0000000BrVU-2RxB;
	Thu, 19 Nov 2026 12:37:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1ON-0000000BrQV-2Gfl
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 19F521A1710
	for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 12:37:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB0BB60237;
	Thu, 19 Nov 2026 12:37:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26DE011BC0757;
	Thu, 19 Nov 2026 13:37:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n9LRXQiucnKvZTfU+jubxPCclkTh+n2ObBQM18+bSMA=;
	b=lbRXD/ANAZr9SdzPsnaE4N4vy/thaPq1M/IRoMPwJ7hKI7Y/lNLJzoxvOCDKjHdS+fB/nw
	nxs+hcT3+0pk2KJduu2fST73f9NK4auZotj7Oa6sPYJWryH5yqHsQJs5cgZhPUagS1lF/i
	SqVcDhMBRgb9x7zXiVOmvg6ZTM7Pau8HDXqjfotwR704AYJnmBHzYSfbrCArjaYdVc5FUn
	RcXZaaoFEBaPo24JqDmwGzQyVDy7JJ6uOYMoU7CTNdx7E+PSFld6ZcY3PVEOFDF+w2/Nx7
	L5u/XSFgZKhtrSkwsfywzGLbYlA9HAF13Y2mK4SG+SPlyyAEhI0Ih13/CrTcpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-submit-rawnand-timing-recovery-v1-v2-1-d14d4b79e543@gmail.com>
References: <20261118-submit-rawnand-timing-recovery-v1-v2-1-d14d4b79e543@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: propagate mode-0 fallback failures
Message-Id: <179509184807.2889394.1359685294062461416.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043733_096797_0038D436 
X-CRM114-Status: UNSURE (   8.56  )
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

T24gV2VkLCAxOCBOb3YgMjAyNiAxMDo1MjoyNSAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gV2hlbiBHRVRfRkVBVFVSRVMgcmVwb3J0cyBhIGRpZmZlcmVudCB0aW1pbmcgbW9kZSB0aGFu
IHJlcXVlc3RlZCwKPiBuYW5kX3NldHVwX2ludGVyZmFjZSgpIHRyaWVzIHRvIHJlc3RvcmUgbW9k
ZSAwIGJ5IHJlY29uZmlndXJpbmcgdGhlCj4gY29udHJvbGxlciBhbmQgaXNzdWluZyBhIE5BTkQg
UkVTRVQuIEl0IGlnbm9yZXMgYm90aCByZXR1cm4gdmFsdWVzIGFuZAo+IHJldHVybnMgc3VjY2Vz
cyBldmVuIGlmIHRoZSBmYWxsYmFjayBmYWlscy4KPiAKPiBSZXR1cm4gdGhlIGZhbGxiYWNrIGVy
cm9yIGluIHRoYXQgY2FzZS4gSWYgR0VUX0ZFQVRVUkVTIGl0c2VsZiBmYWlsZWQsCj4ga2VlcCBp
dHMgZXJyb3IuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8x
XSBtdGQ6IHJhd25hbmQ6IHByb3BhZ2F0ZSBtb2RlLTAgZmFsbGJhY2sgZmFpbHVyZXMKICAgICAg
Y29tbWl0OiAyMWNlZTA2MWM1OTZkMDAzZjFhNWViYzM3NzExZjBkY2M4NzI5ZmI3CgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
