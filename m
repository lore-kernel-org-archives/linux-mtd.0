Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F26D606A325
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ewdgYfPd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RD/HH5/s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JjXz2QkMoOE91/b9+Kzrtjnapl9HkF3vpPqH3mn4F68=; b=ewdgYfPdg33+TBXR9lOQCFsQzb
	UH82YyPF8VmPIlENfe1cw4P2Xa7kLSW+/WgIsxjks162ATWVdwyw7AxW9zTwP5FR4Ji0oVPU3b+7V
	dV+6cvkEoAB6tlOrnbTST37J0RHpV7xk+8A5PpHlHBwpySsUY0eiVpgU71aQlDQPn9sQbsqJjk7og
	dtwU8kalNwXA4107dl4nyxZzmE1lzuGpDPj8W3gRFP1+XwZIsa+0eg81Az9BTG20ZNB/uUmvxy/DA
	9BpKmxvRd80ly4wEy8Lf1TsOmpmMAhQVE7UcD1EiKODyEuyzegYI2VwbClCM9wptfy0fSVpnwBvec
	FYXitE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OS-0000000BrWl-3V8x;
	Thu, 19 Nov 2026 12:37:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OP-0000000BrRF-0zY8
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EDCB1C4CBF1;
	Thu, 19 Nov 2026 12:37:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B347960237;
	Thu, 19 Nov 2026 12:37:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A79B11BC0775;
	Thu, 19 Nov 2026 13:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kqCXGYamJRKiHQlhg/8k0daaNHVNYy7+R0aPc9YaCxY=;
	b=RD/HH5/sduVkUDo0o1rfU8oviKShOK56+EKIBM0lFkdcfchX7OgZRKYweMwx2g0D9QUsru
	STlTJhP88prM6SMfm4NjlxY779l+ABCqzIqWwf4lujw4PsNofAw2OlSb42x7V7ZujsopfX
	pgC4OhZtzLxhQCaFdcDTp7uwZ5VO2q4tjDctpECpPoUlhaaE6VKzGbvdDU95qr9B5+2Kk0
	Q5kxp2KzTKAtPf+zY+6YasNOeD+QePhSGG4MOz8CO/c890FPXgqfn2Uz5XvoUyFMQw6EuA
	VzhffCNeTi/aKxqqjb0jWjBN5Xr76jdFgLYwbjVoaiTYPuyATMDi3kzbpS1IAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261119-spinand-set-req-type-in-bbm-functions-v2-1-4dc4f995dfad@gmail.com>
References: <20261119-spinand-set-req-type-in-bbm-functions-v2-1-4dc4f995dfad@gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
Message-Id: <179509184936.2889394.15959850517165099833.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043734_472668_5CA9468A 
X-CRM114-Status: GOOD (  11.99  )
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

T24gVGh1LCAxOSBOb3YgMjAyNiAwODo1Nzo0MiArMDEwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
Q29tbWl0IDcwMTk4MWNhYjAxNiAoIm10ZDogbmFuZDogQWRkIGEgTkFORCBwYWdlIEkvTyByZXF1
ZXN0IHR5cGUiKQo+IGFkZGVkIGEgJ3R5cGUnIG1lbWJlciB0byB0aGUgJ25hbmRfcGFnZV9pb19y
ZXEnIHN0cnVjdHVyZSBhbmQgdXBkYXRlZAo+IHRoZSByZXF1ZXN0IGl0ZXJhdG9ycyB0byB1dGls
aXplIHRoYXQsIGJ1dCB0aGUgc3BpbmFuZF97aXMsbWFya31iYWQoKQo+IGZ1bmN0aW9ucyB3ZXJl
IG5vdCB1cGRhdGVkIGJ5IHRoZSBjb21taXQuIEhvd2V2ZXIgaW4gYm90aCBvZiB0aGVzZQo+IGZ1
bmN0aW9ucyB0aGUgbmV3IG1lbWJlciBpcyBpbXBsaWNpdGx5IGluaXRpdGFsaXplZCB0byB6ZXJv
IHdoaWNoCj4gY29ycmVzcG9uZHMgdG8gTkFORF9QQUdFX1JFQUQuIFRoaXMgaXMgY29ycmVjdCBm
b3IgdGhlIHNwaW5hbmRfaXNiYWQoKQo+IGZ1bmN0aW9uIHNpbmNlIHRoYXQgdXNlcyBhIHJlYWQg
cmVxdWVzdCB0byBnZXQgdGhlIGJhZCBibG9jayBtYXJrZXIKPiBieXRlcywgYnV0IHRoZSBzcGlu
YW5kX21hcmtiYWQoKSBmdW5jdGlvbiBkb2VzIGEgd3JpdGUgcmVxdWVzdCBzbyBpdAo+IHNob3Vs
ZCBzZXQgdGhlIHJlcXVlc3QgdHlwZSB0byBOQU5EX1BBR0VfV1JJVEUuCj4gCj4gWy4uLl0KCkFw
cGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IHNldCByZXF1
ZXN0IHR5cGUgZXhwbGljaXRseSBpbiBzcGluYW5kX3tpcyxtYXJrfWJhZCgpIGZ1bmN0aW9ucwog
ICAgICBjb21taXQ6IGViMGVlN2EzMGYzZDMzYzQ5YjhmNjBiNzA3ZGQyN2NiMDQ2Y2RlYmYKClBh
dGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUK
cGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkg
dGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
