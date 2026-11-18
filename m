Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A9606A335
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=af5ppIfy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=26nx9rUx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aTYeAbwEp7pLyTIrpAS6VZz03yX2y2XXd1Xp70SXkyk=; b=af5ppIfyYWZ1dwE2aAU4wphPuc
	EXspsAheNOdUwJlFWcSpBnvBALI739z1QKKNONoVBo6Tnst9OB0JKQwUhwg2XXAPpTdglKCCcc0gM
	+W5w+ZGkPgCH1gM2mkcejs9vJbLwAeKycA3LlghnCKAeo7exz/75autU4phWj3FUOUNwCDAfEDqzJ
	0SXrKoAqgYLee/njWpWt32MaApqZtMwHHyWRZhOXELsuPPL3WEMtr78kpQ6xeHpkUe0W8L7AFuJiv
	R9lfc/86vEoc+LG8XkGKK+q3lBqPxMSczQNsQG4Ghth88kVIxrCIYo8dn25EfU13PFPRWmZkXAbPP
	8JiwlNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd8S-00000008bfx-2Vyw;
	Wed, 18 Nov 2026 10:43:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd8P-00000008bfb-3KbQ
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 10:43:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C88901A16CA;
	Wed, 18 Nov 2026 10:43:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96F505FE9B;
	Wed, 18 Nov 2026 10:43:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 925C311BC1151;
	Wed, 18 Nov 2026 11:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794998603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eF/hHeUma+QeQ6xbs3R+FZONvsSTm0QVHzw9pn5uvQw=;
	b=26nx9rUx2LQCLUilaAtaApd65Ga2TYSQykwfxHXpjXSCMUMYhiQ9uhVLWhb34hEA1Opxg2
	WLB2EndQZK7jjl7YD2/cxqpKTuoxCMJOc7EsNDQ2V991v6EDlGM1RYrRKfxZCQg7oReOh/
	wz1NDbL0oIYHnblJhDiZOEHWj73kyLiz8QMOQWoC9WdkEV+5Muk80u4t17SY0IWXIqCDm+
	X/sG4OGmC8ANHW1Rf0BWO16wP52RCPy+QW76nvHD8JVyQig8m9YUCr5eGWcSJsqkD4Mr4S
	pXl46hpFQOEGYNBINX9BXBcvjHnZ3aSPIoxuTAEty7rleyyvkE3PACIcZte3IQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: core: skip empty read and write requests
In-Reply-To: <20261104-submit-mtd-empty-io-v1-v1-1-3f6bcf474e2a@gmail.com>
	(James Hilliard's message of "Wed, 04 Nov 2026 22:03:38 -0700")
References: <20261104-submit-mtd-empty-io-v1-v1-1-3f6bcf474e2a@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 11:43:19 +0100
Message-ID: <87y0aqifnc.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_024325_970289_2E34C6BE 
X-CRM114-Status: GOOD (  11.20  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDQvMTEvMjAyNiBhdCAyMjowMzozOCAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gQ29udmVydGluZyBtdGRfcmVhZCgpIGFuZCBtdGRf
d3JpdGUoKSB0byB3cmFwcGVycyBhcm91bmQgdGhlIE9PQiBoZWxwZXJzCj4gcmVtb3ZlZCB0aGVp
ciB6ZXJvLWxlbmd0aCBjaGVja3MuIE5laXRoZXIgbXRkX3JlYWRfb29iKCkgbm9yCj4gbXRkX3dy
aXRlX29vYigpIHN0b3BzIGFuIGVtcHR5IHJlcXVlc3QgZnJvbSByZWFjaGluZyB0aGUgZHJpdmVy
Lgo+CgpZZXMKCj4gRm9yIGV4YW1wbGUsIHRoZSByYXcgTkFORCByZWFkIHBhdGhzIHNlbGVjdCBh
IHRhcmdldCBhbmQgY2FuIHJlYWQgYSBwYWdlCj4gb3IgaXRzIE9PQiBhcmVhIGJlZm9yZSBjaGVj
a2luZyB0aGUgcmVtYWluaW5nIGxlbmd0aC4gQW4gZW1wdHkgcmVxdWVzdAo+IGF0IHRoZSBlbmQg
b2YgdGhlIGRldmljZSBjYW4gdGhlcmVmb3JlIHNlbGVjdCBhIHRhcmdldCBwYXN0IHRoZSBsYXN0
Cj4gYXZhaWxhYmxlIG9uZS4KCk5vLCB0aGVyZSBpcyBhIGd1YXJkIGFnYWluc3QgdGhhdC4KCkFu
IGVtcHR5IHJlcXVlc3QgYXQgdGhlIGVuZCBvZiB0aGUgZGV2aWNlIGNhbiB0aGVyZWZvcmUgY29t
cHV0ZSBhIGRpZQppbmRleCBwYXN0IHRoZSBsYXN0IGF2YWlsYWJsZSBvbmUgYW5kIGhpdCB0aGUg
V0FSTl9PTigpIGluCm5hbmRfc2VsZWN0X3RhcmdldCgpLgoKPiBSZXR1cm4gc3VjY2VzcyBmcm9t
IHRoZSBjb21tb24gaGVscGVycyB3aGVuIGJvdGggbGVuZ3RocyBhcmUgemVybywKCk9rCgo+IGFm
dGVyIG10ZF9jaGVja19vb2Jfb3BzKCkgaGFzIG5vcm1hbGl6ZWQgbGVuZ3RocyBmb3IgYWJzZW50
IGJ1ZmZlcnMuCgpUaGlzIGlzIG9wYXF1ZSB0byBtZSwganVzdCBkcm9wLgoKPiBLZWVwIHRoZSBl
eGlzdGluZyByYW5nZSwgd3JpdGUtcHJvdGVjdGlvbiBhbmQgb3BlcmF0aW9uLXN1cHBvcnQgY2hl
Y2tzLAo+IGFuZCBjbGVhciB0aGUgcGVyLXJlcXVlc3QgcmVhZCBzdGF0aXN0aWNzIGJlZm9yZSBy
ZXR1cm5pbmcuIEJvdGggcmV0dXJuCj4gbGVuZ3RocyBoYXZlIGFscmVhZHkgYmVlbiBpbml0aWFs
aXplZCB0byB6ZXJvLgo+Cj4gRml4ZXM6IDI0MzFjNGY1YjQ2YyAoIm10ZDogSW1wbGVtZW50IG10
ZF97cmVhZCx3cml0ZX0oKSBhcyB3cmFwcGVycyBhcm91bmQgbXRkX3tyZWFkLHdyaXRlfV9vb2Io
KSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yL3Nhc2hpa28tb3V0Ym94LTE5ODU0NEBrZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
