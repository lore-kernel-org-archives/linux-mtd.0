Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC08606A339
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ndtCKI3x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eUp7At55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zgm1p0DcjvlPh8BG20TyCLyow4YbA7DJ0Acxpfbi8i4=; b=ndtCKI3x2GKrOr7A7NKuSfh/S+
	w2iCybY/NgyHFhRnjIgj4QXaCeEioEJBcLzthp12elAOBcIwu33zBx4w3CgxN0De+muX3TlOirp0U
	/7aa7TBY6tsMh5rNRYf5e/k6HX4C8aHIGeApTQMZSuuRP+fJYC99fwhwtWFXOR8alccq1gPljCvh4
	HbfDvyooXUZl/fsWeMYnZ1O3h4NQGyYgUsZt3uHMPoC0nasbHGJSds4vm4TZlOtu8if+GYB3WlECh
	UZjzxdcnnCDYTS4halDO7/mjIE/tBYYzD71Z6HYT2vKbJROstqT5TJvoEVf4dsF0un4bfAXTOLyQ8
	VIAPz1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNX-00000005yF6-1BRb;
	Tue, 17 Nov 2026 13:37:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNT-00000005y9V-064e
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 765511A1673;
	Tue, 17 Nov 2026 13:37:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C5C25FCEB;
	Tue, 17 Nov 2026 13:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5BE511BC0026;
	Tue, 17 Nov 2026 14:37:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cPGmi27Zhf0EqpT00wsKOUcEfOF7pmIb+ldnxTsUvbU=;
	b=eUp7At55We6tMyJQcOlN6ZWFfyAQ34bq2yDDF8WrqV/HVq8d/z1rzhO6C3Ql2QKpXloBq+
	zJ8lq3GijXRnvIAHGrMQGMg9fxmK8G85O4a8n88G95AzA+n/triFzRU8DtasbASwaTkxTx
	ls2tyLKXZiDDZmtopfjOQIXtf45JNTm5t6ShuIEH5zP4nmnyi5s7FHSt0sbBXRG9BIkQ67
	EwuJEJG3xd6VAxXqV1Hg4zjfy2ahPzs8Y/lRMVbt8lqlHU44msOCVOY3tnToityOUcLr8V
	8t6g3O2Tg/3FPc8JM/USOY0p+Ni5pKwIK+LoJWk6rRub4g/gBPnt0trfUdTLxw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sung Byeongchan <tjdqudcks0424@naver.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261107093546.619214-1-tjdqudcks0424@naver.com>
References: <20261107093546.619214-1-tjdqudcks0424@naver.com>
Subject: Re: [PATCH] mtd: rfd_ftl: quiesce requests before freeing mappings
Message-Id: <179492265523.2237190.1850246796436743508.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053739_254832_22C25CF3 
X-CRM114-Status: UNSURE (   8.30  )
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

T24gU2F0LCAwNyBOb3YgMjAyNiAxODozNTo0NiArMDkwMCwgU3VuZyBCeWVvbmdjaGFuIHdyb3Rl
Ogo+IHJmZF9mdGxfcmVtb3ZlX2RldigpIGZyZWVzIHRoZSBzZWN0b3IgbWFwLCBoZWFkZXIgY2Fj
aGUgYW5kIGJsb2NrIGFycmF5Cj4gYmVmb3JlIGRlbF9tdGRfYmxrdHJhbnNfZGV2KCkgc3RvcHMg
bmV3IHJlcXVlc3RzIGFuZCBkcmFpbnMgdGhlIGJsay1tcQo+IHF1ZXVlLiBBIGJsb2NrIHJlYWQg
YWRtaXR0ZWQgYmVmb3JlIHRoYXQgbGF0ZSBiYXJyaWVyIGNhbiBjb25zZXF1ZW50bHkgdXNlCj4g
dGhlIGZyZWVkIHNlY3RvciBtYXAgaW4gcmZkX2Z0bF9yZWFkc2VjdCgpLgo+IAo+IFRoZSBpc3N1
ZSByZXByb2R1Y2VkIGFzIHRoZSBzYW1lIHJmZF9mdGxfcmVhZHNlY3QoKSBPb3BzIGluIHRocmVl
IG9mIHRocmVlCj4gZnJlc2ggS0FTQU4gYm9vdHMgdXNpbmcgdGhlIHByb2R1Y3Rpb24gTVREIEJM
S1BHIGFkZC9kZWxldGUgYW5kIFJGRCBibG9jawo+IHJlYWQgcGF0aHMuIE5vcm1hbCwgY2xvc2Ut
YmVmb3JlLWRlbGV0ZSBhbmQgd3JvbmctcGFydGl0aW9uIGNvbnRyb2xzIHdlcmUKPiBjbGVhbiBp
biBuaW5lIG9mIG5pbmUgYm9vdHMuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRo
YW5rcyEKClsxLzFdIG10ZDogcmZkX2Z0bDogcXVpZXNjZSByZXF1ZXN0cyBiZWZvcmUgZnJlZWlu
ZyBtYXBwaW5ncwogICAgICBjb21taXQ6IGE0NGQwYTE2YmIwZTI1OTQyMzZiMzkzMDdiOWI4YzM1
MTMyOThlZTIKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQg
YW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBj
b21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
