Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304A606BCBC
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xeTR8gqG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ssBNuUQb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CMLi0c9wqVWRSHPj4/fdjP5ZSUh+whJCT4AtBdDgk68=; b=xeTR8gqG7Ieee+438BXbX8MHQS
	0KAO7jX1hP6ivXJtSJiOuZE7YrYSVdo10gobWQ3CyrtRloBtSSLZ68gZFNFlYSFFNrDq3hhBvBTEo
	o5hY7Lw7G0XA1/wK7efcEVgLGS+0WHlZLmNgqTlhd2eNh2B3ymhtZc4MmPhzO7JiVROM2+2qrOQlr
	QFa2GelziZYxWVl0cvTmvBr4SfVxMOnO2j6MoDZbdf3cCjgJxsTFUkyLZBNKbbyrAnsp5/N8HCJj/
	0+1HyW19ITTuJcGRCHr7iW06FvdDql5Sc+s+I1RoR3k4Cr5o1KHEePMSmdJ5zECgv6qHZWD0YI1nk
	eAD67lFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ8h-0000000FLK1-3Cof;
	Fri, 20 Nov 2026 15:02:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ8Z-0000000FLGG-1eic
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:02:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E07F11A174F;
	Fri, 20 Nov 2026 15:02:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6057601B9;
	Fri, 20 Nov 2026 15:02:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D5F711BC0284;
	Fri, 20 Nov 2026 16:02:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795186969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RjjrO4x33/X7qoxGWKBXsMF2h2L17f9YWm2FAzoV/0w=;
	b=ssBNuUQbwq+8FpwxhUsUTHSrrYka73VXPRpTygtfqS1ZSQzQtsQt62hmFZUL14zgBsO283
	lr5lgLztnkraf7fTmuJ3p/N6c6YYEsBvn2TGoH/imr2/EgqJnrmq2YGSvMpO9nVfCkCcIl
	IoeFMPcpKiC2mI1vy5nSW7jLE77LbyFSzxBbROEXbwbT+q3kLOg03K8JDkIyfIBPK90wnG
	v215Yx3iDwOlbc+7Be755B0ihfm675EuWfdEiS3udLQAPKH2qzSlpsjbETduT69oCjQ52E
	vkyCuSKcQwydIwfbZhgkg67OQ2NjOkqqQARbnnlUpQhuCXu/dk48+sgTxZ//TQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261118-submit-mtd-empty-io-v1-v2-1-b980927931ef@gmail.com>
References: <20261118-submit-mtd-empty-io-v1-v2-1-b980927931ef@gmail.com>
Subject: Re: [PATCH v2] mtd: core: skip empty read and write requests
Message-Id: <179518696810.3401781.11014509839002382803.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:02:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070251_590920_8281D7E8 
X-CRM114-Status: UNSURE (   8.93  )
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

T24gV2VkLCAxOCBOb3YgMjAyNiAxMDoxODozNiAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gV2hlbiBtdGRfcmVhZCgpIGFuZCBtdGRfd3JpdGUoKSBiZWNhbWUgd3JhcHBlcnMgYXJvdW5k
IHRoZSBPT0IgaGVscGVycywKPiB0aGV5IGxvc3QgdGhlaXIgemVyby1sZW5ndGggY2hlY2tzLiBB
biBlbXB0eSByZWFkIGF0IHRoZSBlbmQgb2YgYSByYXcKPiBOQU5EIGRldmljZSBjYW4gdGhlbiBj
b21wdXRlIGEgZGllIGluZGV4IG9uZSBwYXN0IHRoZSBsYXN0IGRpZSBhbmQgaGl0Cj4gdGhlIFdB
Uk5fT04oKSBpbiBuYW5kX3NlbGVjdF90YXJnZXQoKS4KPiAKPiBSZXR1cm4gc3VjY2VzcyBmcm9t
IHRoZSBjb21tb24gaGVscGVycyB3aXRob3V0IGNhbGxpbmcgdGhlIGRyaXZlciB3aGVuCj4gdGhl
IHJlcXVlc3QgaXMgdmFsaWQgYnV0IGhhcyBuZWl0aGVyIGRhdGEgbm9yIE9PQiBieXRlcyB0byB0
cmFuc2Zlci4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0g
bXRkOiBjb3JlOiBza2lwIGVtcHR5IHJlYWQgYW5kIHdyaXRlIHJlcXVlc3RzCiAgICAgIGNvbW1p
dDogM2RiNTQ5MjRlN2ZhNjY0ZGQ2MzAzZjNiZDBjYjFlZWNlYjFmNTEzZQoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
