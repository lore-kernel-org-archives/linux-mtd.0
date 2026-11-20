Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1A0606A326
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UgxzGBAJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QTuKldGq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MhbsKO2XQIyVBN6CXPX1AxboHjG+R/wHayp370hdFgM=; b=UgxzGBAJO+/60X0hg+K1TNTg+d
	Arsd2I6a7ydPxE91hfmjqAywqi2EUy4JRKMlhFr6WNTglW2mBa9+pE3mjLw5EyxxV7XtQFHTTr77C
	B7SZRh3LuNPsjOzj7OAcWS47BEAroAMeE8EkQbRkgndHZ9X0HqX1m3YSZXj30892B5QAHPLm9AQbr
	1bmKR60YXsloRmAklhslJusf469E8V6Wy5Dcemw0Xfg2FORwBX13uLQIiKmfUw0deEr6N0byvLxIY
	VI2KAatDRWFdSA3ajaBc1KicWQcy2dYwEXLlr459vjeFbnoSjQaJJsNDL5F0GkFgfRqBI0T7iea07
	wKLBhuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQBo-0000000FMHE-3gom;
	Fri, 20 Nov 2026 15:06:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQBl-0000000FMGk-29FP
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:06:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 34BA6C6221F;
	Fri, 20 Nov 2026 15:06:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76EB7601B9;
	Fri, 20 Nov 2026 15:06:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07C4611BC02EB;
	Fri, 20 Nov 2026 16:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795187166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0D4DjLZFm1OPbY3hPmZXMk4q8RitgeV+4nF4Pu8y04g=;
	b=QTuKldGqnkISP7B678bwBJLk+9PaheqR1QT+9tcF5ON9WkUhDUlH9uYfaGPhPyqWSZCihg
	T9qhBYkBiazLHjEKeWwiS9xrcmZprpEeZSlSuxleVkkY015H0urWA6FUESUKeBc0qb7jcv
	WHoCc6LmqCUFMGl5lY2soWsVjOjbu2poXHJ2/ogHwcQhycweGgZYyecaqXo0fWpYhzilvn
	hBibGtCG6w5yBDSZ+WQSxO6h+cSwiMp52JxU3+e6OcTALo0vEcKwIapCs7t8GviCX/LPJq
	M7ppL46WB8faNR4taSxdaTvOxKuvl6N+FkA99zlL0Lp9wa2ka6LY1NGAWPa49A==
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
Message-Id: <179518716377.3408766.1616521798459198415.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:06:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070609_749408_79FB45CF 
X-CRM114-Status: GOOD (  11.09  )
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
cGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IHNldCByZXF1
ZXN0IHR5cGUgZXhwbGljaXRseSBpbiBzcGluYW5kX3tpcyxtYXJrfWJhZCgpIGZ1bmN0aW9ucwog
ICAgICBjb21taXQ6IDdhYjg0ZGM5YzNkOTFjN2NkNzJhYmI5NmVjNGUyNTNlNDQ1NjBmOTUKClBh
dGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUK
cGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkg
dGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
