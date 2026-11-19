Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3905606A326
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3/O46ldl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vZDKaLoz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q9RmnVlRgXtQHQdVYczCdfjUq2AkpExBZnY2WpWgvAY=; b=3/O46ldlewPmhA6H6VjLQptdeh
	HNyvF5BTATyTYOT3cNM4IimdzorFlrPeD/8QbYZ11IXrzKIVF9AGPOND8OpUM1I0abm0vN3Ja/I4e
	IBLF2TUud5zLxUgjDDYdNejtm3lBKjz/YhuAFXbVGeCnKNgnI/kkqGiaZ/erzcM/niimgYcVXuh/S
	5oX9KsQVvke76noqmlsy8WCW6aA+6CA/4aQuszVeDPcQeHszWv0m9clirgVf2CHJV3fGhdwUGeSyC
	PijH6uRMNjYfOF36FujtH2KHKbYBJS4TT0izuuoQtKR80QPj7zO16wgMmh70IBTzEqyGJjjpeUy1m
	5ATz8uqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OA-0000000BrKP-0lPP;
	Thu, 19 Nov 2026 12:37:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1O7-0000000BrJJ-2ha9
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0660AC4CBEF;
	Thu, 19 Nov 2026 12:37:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E34D60237;
	Thu, 19 Nov 2026 12:37:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF9E111BC0757;
	Thu, 19 Nov 2026 13:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h0MsyfDw3DMzxkx/kpuO4HPbu+iTf60RKyuc5OLnDM0=;
	b=vZDKaLozsIDrOVGeuSFQdOw9BhdWa+6GBYgGhJKlZIP/1+6naqFap2tFR7lpZ6GelhHIIx
	MUEWLPxddXcQTFwxN8NtEiZLGLzuq9FLe+HMaHVxftVl25qz2DSmDKFZku8SpHX+UIjcaW
	BAKqCBmw8azffD20HANmSWITU+kLlRISIzLQDuEZ5CAxtLNuetLSz5gmEmvwXascLrVyYr
	frgdw/EL9ZyrzV6nNqViQmk/+2/jwDe4Z8/0XuTGzqM//11tcDl+ba8WR8kRtgB3+sxqQX
	5Rhdy1bF+GKyzb+yQGAWbYhN4gf8xbGULavSLKyPzFxYiuT9eMl6DBiabiAerg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Huang Shijie <b32955@freescale.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-submit-rawnand-read-retry-oob-v1-v1-1-2a6a91b39e43@gmail.com>
References: <20261103-submit-rawnand-read-retry-oob-v1-v1-1-2a6a91b39e43@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: copy OOB only after completing read
 retries
Message-Id: <179509182919.2889394.9027822038627951164.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043715_830750_8AFA459A 
X-CRM114-Status: UNSURE (   9.13  )
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

T24gVHVlLCAwMyBOb3YgMjAyNiAyMzowOTo0NSAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gbmFuZF9kb19yZWFkX29wcygpIGNvcGllcyBPT0IgdG8gdGhlIGNhbGxlciBhbmQgYWR2YW5j
ZXMgdGhlIG91dHB1dCBjdXJzb3IKPiBiZWZvcmUgZGVjaWRpbmcgd2hldGhlciBhbiBFQ0MgZmFp
bHVyZSByZXF1aXJlcyBhbm90aGVyIHJlYWQgYXR0ZW1wdC4KPiBUaGUgcmV0cnkgcmVzdG9yZXMg
RUNDIHN0YXRpc3RpY3MgYnV0IGRvZXMgbm90IHJlc3RvcmUgdGhlIE9PQiBjdXJzb3Igb3IKPiBy
ZW1haW5pbmcgbGVuZ3RoLgo+IAo+IEZvciBhIGNvbWJpbmVkIGRhdGEvT09CIHJlYWQsIGEgc3Vj
Y2Vzc2Z1bCByZXRyeSBjYW4gdGhlcmVmb3JlIGxlYXZlIE9PQgo+IGZyb20gdGhlIGZhaWxlZCBh
dHRlbXB0IGluIHRoZSBmaXJzdCBvdXRwdXQgc2xvdCBhbmQgcHV0IHRoZSByZXRyaWVkCj4gcGFn
ZSdzIE9PQiBpbiB0aGUgbmV4dCBwYWdlJ3Mgc2xvdC4gQSBsYXRlciB0cmFuc3BvcnQgZXJyb3Ig
YWxzbyBsZWF2ZXMKPiBvb2JyZXRsZW4gYWNjb3VudGluZyBmb3IgYXR0ZW1wdHMgcmF0aGVyIHRo
YW4gY29tcGxldGVkIHBhZ2VzLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhh
bmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBjb3B5IE9PQiBvbmx5IGFmdGVyIGNvbXBsZXRpbmcg
cmVhZCByZXRyaWVzCiAgICAgIGNvbW1pdDogYjAyNDg5Y2VhOGNlNjA5ZWE5MjAyNDZiNTMzZGYw
MzgzYWEwNTA5MgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4Lmdp
dCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90
IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
