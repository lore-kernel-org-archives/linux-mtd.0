Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3498606A334
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=enSlasol;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0DFU1hhi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/2i/RxZzlJpi2heKeQdMN/GME/3AoZtJwfEOJcT+NPw=; b=enSlasol/wG1sAWnk/zbtoG+gV
	UIQ/i3oZHbS99bJ3edAm7aUdiCdG9GVGeAKA2sSAZsnh0SkdE2SndDJcTrC1usNobbA4iImQlFJZO
	o55E2USyBdBDWzhK5erJUbCR8SEQUbmEyvKoONGQPm2+Y9EGubf4zZsctE4lUzpKUOEBCAOCGO3QM
	EsPzrfQ2a9ePDAxlG6zAiKdxgDCn909Iw2LD98NiySWauogKyblTI+uUGGQ0s7S3cbuf+mVm3kXn2
	5eU4M60jPAwwnU/6AbQQnduT/19s7qsGaN5we4q6TWoHxT1nGZ1V7BsCnLC3XFgz7t4TEO4b4d9nA
	jvE7FKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJN1-00000005xs4-2zAm;
	Tue, 17 Nov 2026 13:37:11 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJMz-00000005xqk-2HqX
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 32856C79A97;
	Tue, 17 Nov 2026 13:37:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5EA65FC81;
	Tue, 17 Nov 2026 13:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B2CE11BC0039;
	Tue, 17 Nov 2026 14:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ve5M4ksClWU3GARUesdbnE3PEcR+DvGa1Lrs6QUEMsg=;
	b=0DFU1hhiXtsJvot91h2UPxiZDkJzFV8N6DHLzT1NYp4PnIq6XUFen7UR6N5fltOvX7YGM+
	3bwgfGHk3Rhfm7tIU3cS1qrE+WJZrYQtkMJ877peJXAujEj8sk1pWWtYapB+OjsAxgFuaB
	bKbpMqEl+aIUYsPNQKiK+dHdTEUyD6R6mIHwyJeV5cszbjwmGraLqPBH4GuCi+xZqXVkc2
	0D1DDGQjToXtrdiV1lKjumHu2ZbHOX8i6DCPt3ICmOCSiu9XlafJ/iXRzWjhhAWwPe26ME
	ozz5uD5Y5UuFJB7XdWrYyC2R0BQvdGuMPjShT3I2V+cprKP+R7YjEdWFsMUBSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joern Engel <joern@lazybastard.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tal Zussman <tz2294@columbia.edu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
References: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
Subject: Re: [PATCH v2 0/4] mtd: block2mtd: convert to folios
Message-Id: <179492262030.2237190.3278481994830648119.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053709_824763_F1C126D6 
X-CRM114-Status: GOOD (  10.85  )
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

T24gRnJpLCAxNiBPY3QgMjAyNiAxNToxMTowNiAtMDQwMCwgVGFsIFp1c3NtYW4gd3JvdGU6Cj4g
YmxvY2sybXRkIHN0aWxsIGdvZXMgdGhyb3VnaCB0aGUgcGFnZSB3cmFwcGVycyBhcm91bmQgdGhl
IGZvbGlvIHBhZ2UKPiBjYWNoZSBBUEksIGVhY2ggb2Ygd2hpY2ggaGlkZXMgYSBjb21wb3VuZF9o
ZWFkKCkgY2FsbC4gQ29udmVydCB0aGUgcmVhZCwKPiB3cml0ZSBhbmQgZXJhc2UgcGF0aHMgdG8g
dXNlIGZvbGlvcyBkaXJlY3RseS4gVGhpcyByZW1vdmVzIGEKPiBjb21wb3VuZF9oZWFkKCkgY2Fs
bCBwZXIgcGFnZSBpbiB0aGUgcmVhZCBwYXRoIGFuZCBmb3VyIHBlciBwYWdlIGluIHRoZQo+IHdy
aXRlIGFuZCBlcmFzZSBwYXRocywgYW5kIGxlYXZlcyB0aGUgZHJpdmVyIHdpdGggbm8gc3RydWN0
IHBhZ2UgdXNhZ2UuCj4gCj4gVGhlIGZpcnN0IHBhdGNoIGZpeGVzIGEgcHJlLWV4aXN0aW5nIHJh
Y2UgaW4gdGhlIHdyaXRlIGFuZCBlcmFzZSBwYXRocywKPiB3aGljaCBjb3VsZCBtb2RpZnkgYSBw
YWdlIHRoYXQgaW52YWxpZGF0ZV9iZGV2KCkgaGFkIGFscmVhZHkgZHJvcHBlZAo+IGZyb20gdGhl
IHBhZ2UgY2FjaGUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsx
LzRdIG10ZDogYmxvY2sybXRkOiByZXRyeSBpZiB0aGUgcGFnZSB3YXMgZHJvcHBlZCBmcm9tIHRo
ZSBwYWdlIGNhY2hlCiAgICAgIGNvbW1pdDogNDlmYjE5YjE1Nzg0MjVjMWZhMzVmMzA1ZjVhZGI0
ZjhhNWQzNTA2MwpbMi80XSBtdGQ6IGJsb2NrMm10ZDogY29udmVydCBibG9jazJtdGRfcmVhZCgp
IHRvIGZvbGlvcwogICAgICBjb21taXQ6IGFiNjAyNDkwMjI1NTAzZDY4ZDVkMjUxZTVjZmNjNzQ2
NzNlYTM4MmUKWzMvNF0gbXRkOiBibG9jazJtdGQ6IGNvbnZlcnQgX2Jsb2NrMm10ZF93cml0ZSgp
IHRvIGZvbGlvcwogICAgICBjb21taXQ6IDZhYjU3YTZiNzhkZmNiZmY4Y2I1ZjQ4MWQwYThhMDQ3
ODVmNTczMjYKWzQvNF0gbXRkOiBibG9jazJtdGQ6IGNvbnZlcnQgX2Jsb2NrMm10ZF9lcmFzZSgp
IHRvIGZvbGlvcwogICAgICBjb21taXQ6IDc4NGVjODlmM2I2YTI4Zjc4ZTY2NjAyZjlkMDhkNGJh
N2RkNTc0ZjkKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQg
YW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBj
b21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
