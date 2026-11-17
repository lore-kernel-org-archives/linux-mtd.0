Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222E9606A882
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P/y4lF/Y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SvBi++mX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=52MUkZNgzCJtOJUseFYOgJzB7YgfwMUgpceX9jbyrdI=; b=P/y4lF/YIIv4ygfq4/4GkTUoUc
	ENJoWvbDr/4lnxnHKMFx6+c/W9XGruSn4CZvZaZNmbFyhbW3tj3cYb7tvYQ9+cAYR3Zh8jN10BG6B
	HoeLLGiJv7ybvGROT+au7qqjv72viU86YUA1BiNtJ5y6hVRigSmD8BHeruEqn1goYEH33tX/d+PC3
	W1eEEy7YYab+MU5qqc3ThRP110mJ1/PpH+rlJvfShib2/9IvUPTjaH4W2YG/sv1AOK8/gKva+0+pF
	fjDLx0V4CjzxXob+tRg0OPD/F/xXhgSBZY2ZVv3i+czjrp2k/a2yqalxmT/OhSCIMqwQu7uwkPBZ2
	siptNDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5g-000000066co-3W2n;
	Tue, 17 Nov 2026 14:23:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5d-000000066a5-3nV7
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B09C1A1691
	for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 14:23:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A2D15FD6A;
	Tue, 17 Nov 2026 14:23:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F57E11BC0039;
	Tue, 17 Nov 2026 15:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LuOwRO1LqZUb1EtFSIvMS114v6L0kisi/Eq+ywdpFfU=;
	b=SvBi++mX0W+qtXvY00DztPlEGaA6qFGdlfT2lGA0PnWg9kkqX8ApU50+AngF46u0GIwec5
	9lfxc5t06SPgfw7HdVZZp4wICPy4/Pu4tCs4M2p8D+qVJAHV7jsJou057H9QINRMh5+wE6
	j1x1vHgk9Gn+nRX+h2HHVfdJwkmkAT3mj6Rl/ZB0s3/RWNBDpQoF4U+yPUMXgmZKAuH5h6
	p4iCVc/jsagc0JxvE89FZySXVmvuxkW4Nqls4gZ7cPQ9x5+VvR7kUw9zbWJgMSP0jiqYXd
	7XH4uiLccjiO+nmmsHFrEpdnWgQreUij+xPntKjDydVMSXb1hQNCkjpAwFGaRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tal Zussman <tz2294@columbia.edu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
References: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
Subject: Re: [PATCH v2 0/2] mtd: rawnand: nandsim: stop pre-populating the
 cache file's page cache
Message-Id: <179492539419.2259780.11974509644960716429.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062318_113972_ACC85C3F 
X-CRM114-Status: UNSURE (   9.09  )
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

T24gRnJpLCAxNiBPY3QgMjAyNiAxNDozMToxOCAtMDQwMCwgVGFsIFp1c3NtYW4gd3JvdGU6Cj4g
bmFuZHNpbSBydW5zIGl0cyBjYWNoZSBmaWxlIEkvTyB1bmRlciBQRl9NRU1BTExPQyBhbmQgcHJl
LXBvcHVsYXRlcyB0aGUKPiBwYWdlIGNhY2hlIGJlZm9yZSBlYWNoIGFjY2VzcywgYm90aCB0byBr
ZWVwIHJlY2xhaW0gZnJvbSBjb21pbmcgYmFjawo+IGludG8gdGhlIE1URCBkdXJpbmcga2VybmVs
X3JlYWQoKSBhbmQga2VybmVsX3dyaXRlKCkuIFVzZQo+IG1lbWFsbG9jX25vaW9fc2F2ZSgpIGZv
ciB0aGF0IGluc3RlYWQgYW5kIHJlbW92ZSB0aGUgcHJlLXBvcHVsYXRpb24uIFRoZQo+IHByZS1w
b3B1bGF0aW9uIGlzIHRoZSBkcml2ZXIncyBvbmx5IHN0cnVjdCBwYWdlIHVzYWdlIGFuZCBvbmUg
b2YgdGhlCj4gbGFzdCB1c2VycyBvZiBmaW5kX2dldF9wYWdlKCkgYW5kIGZpbmRfb3JfY3JlYXRl
X3BhZ2UoKS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzJd
IG10ZDogcmF3bmFuZDogbmFuZHNpbTogdXNlIGEgTk9JTyBzY29wZSBmb3IgY2FjaGUgZmlsZSBJ
L08KICAgICAgY29tbWl0OiAzODVhNTRiZjc4ZmE1YWM4ZDZiYjAyODY0YWZhNDA5NzIzOGVhMjA4
ClsyLzJdIG10ZDogcmF3bmFuZDogbmFuZHNpbTogc3RvcCBwcmUtcG9wdWxhdGluZyB0aGUgY2Fj
aGUgZmlsZSdzIHBhZ2UgY2FjaGUKICAgICAgY29tbWl0OiBmNGM3YmRhZmZmNTFiNWUwZDZhYTdl
MzUyNWQwNWI4MzA1ZDQ2OTZiCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQv
bGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQg
bm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
