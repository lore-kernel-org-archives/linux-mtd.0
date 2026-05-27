Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39D4CD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiaQVoqLPPWOa/9U3EyY/xRrEDLUzW5rtJ0qOeL9vGo=; b=vzw7O/hedtLs/v
	wKWJtZipQxpx5fejuiNOi1xur2OOVgzouHiz4cteHKD1l8xo67vlpAhdnG5CMS3GOttVJTMgMRFRy
	SbQRNzIwvPzU3RyVgcGkeJ4+jy8jbGIToBZgB1I1z2sfG5LBUkc1AYQQUYwsIPuwEBIZz2mbY8ek/
	NCBlK29X0vxeqtAGM03taDeUWDKqBDvMloU4pBbi2I7x9QtI4h6zrl4kERNdbBBQK50Vp2BWjAFWP
	ZHQFB6KE0RT3LBQu8z0uTHL1qlwqucr5SWYsh2tip+YcxDl7ueM4FK4m9fQtvt8agETePhJH7CSrz
	+BHWqpDPRt57GpKI6QbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSANn-00000003cEK-0q2b;
	Wed, 27 May 2026 09:16:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSANk-00000003cCo-1rIC
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:16:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D6F521A36E8;
	Wed, 27 May 2026 09:16:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95A1A601A1;
	Wed, 27 May 2026 09:16:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF8881088845E;
	Wed, 27 May 2026 11:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779873413; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gbn/nFgYid2pRPRUITNby6kEWLPLlxWxT6O88TTx8uQ=;
	b=X1xg/v4VQymNeoWcaav2gzyPmkoQS1DAa216hqlepja+vQ8tlZoYbwNRTCEQTxFW9d6v3c
	sKs7+2hFFvaWQmKqyiUtcmKsMRpMfO8nC/jlaL1V/8KtKdQeRqjvIPGzc/3K9Gdxoq2NYc
	ymGVzmuOBFTG4IdlwS+dWZdnLCwNjPswJ5bAty64910YHwWYMguuF44SfusYKKOyy8avA+
	pDzAQ1z3RXy3w+6BSLiE+LE0OSR+gMpTCl8W9CCntro/oyZxXxH0+O9JEZ+udBI/bhr97x
	TPpRYNl3B2OZXAeV+dlAzVD5r+dpK+LXmNjpjCjoTmf1W69pRp/edDScGxCl2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Kees Cook <kees@kernel.org>, 
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260522173234.799331-2-u.kleine-koenig@baylibre.com>
References: <20260522173234.799331-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] mtd: Consistently define pci_device_ids
Message-Id: <177987341166.3989888.2051944671004869424.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:16:51 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_021656_619084_FDC55146 
X-CRM114-Status: UNSURE (   6.44  )
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

T24gRnJpLCAyMiBNYXkgMjAyNiAxOTozMjozNCArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRo
ZSBDYXBhYmxlIEh1Yikgd3JvdGU6Cj4gSW5pdGlhbGl6aW5nIGEgcGNpX2RldmljZV9pZCB1c2lu
ZyBwbGFpbiBsaXN0IGV4cHJlc3Npb25zIGlzIGhhcmQgdG8KPiB1bmRlcnN0YW5kIGZvciBhIGh1
bWFuIHdobyBpc24ndCBpbnRvIHRoZSBMaW51eCBQQ0kgc3Vic3lzdGVtLiBTbyBmb3IKPiBlYWNo
IGluaXRpYWxpemVyIHVzZSBvbmUgb2YgdGhlIFBDSV9ERVZJQ0UgbWFjcm9zIGZvciAudmVuZG9y
LCAuZGV2aWNlLAo+IC5zdWJ2ZW5kb3IgYW5kIC5zdWJkZXZpY2UgYW5kIG5hbWVkIGluaXRpYWxp
emVycyBmb3IgdGhlIHJlbWFpbmluZwo+IGFzc2lnbm1lbnRzLiBUaGlzIG1ha2VzIGl0IGVhc2ll
ciB0byBwYXJzZSBhbmQgYWxzbyBtb3JlIHJvYnVzdCBhZ2FpbnN0Cj4gY2hhZ25lcyB0byB0aGUg
c3RydWN0IGRlZmluaXRpb24uCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5r
cyEKClsxLzFdIG10ZDogQ29uc2lzdGVudGx5IGRlZmluZSBwY2lfZGV2aWNlX2lkcwogICAgICBj
b21taXQ6IGFkMWJjZDM0NjliZGIyYzVkNzVjOGMyOWYxOTQ0YjNhYzBmMTJmOTIKClBhdGNoZShz
KSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBv
ZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbiku
CgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
