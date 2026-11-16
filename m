Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD63606A331
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nY/12VUa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yv5Q1jWL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/dJqw8yQnokhElfBPNL1Ta2XkJ7X+2YhYx7Id4e7MG0=; b=nY/12VUafeX+pOARQSnZ79h5Zd
	VirdMZ11sHATbUPcAQGxWxI3YkZ3z5jR+r4FM57Vf2bSY3DdIAbVq1aZotvhhsj2mEVKlWQ1ElIEz
	p0GOZO9WUnxBQeb0Js1HWpv17ukJyH9dGeJNOgonsHgIdwbAIpW0PFWmROL00is6WzC7cJj546j1g
	Pn85U07vetpQOJQgk2NiuZeSx/XUthy344Roq9ZjMi/JxC+z41cRGdU8oqUhwyp5n9Tfq+Y/J/f0n
	V6QV/PWbVo4aKf1n60fdTu8bqc9poC8FOgN+4DruMGIMp8hEiz8NCLMA5gy6pCdNLQJJ2FbTyC9yR
	JZgmRidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxWb-00000002nNg-3bV5;
	Mon, 16 Nov 2026 14:17:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxWZ-00000002nNE-4489
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 14:17:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01DE71A1691;
	Mon, 16 Nov 2026 14:17:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CABEB6023F;
	Mon, 16 Nov 2026 14:17:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B479611BC051A;
	Mon, 16 Nov 2026 15:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794838653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mJg1yhmHqjfF3BBk4j+KlWhE4NTAN/WGFBrIdWiGLU4=;
	b=Yv5Q1jWLNspxRQgqbun6e3gShYytB5OapAelfSg3UgSL5W7YpjGOeoPd5zXCx0EIO/M7yB
	DjaItp0ctTMZitka+dES0bImAFtGqVMSevwcHAQRLCYTT6xdoPqfSPzk8HvP9eVyzvQUHB
	3RCIzWhe2OFIxSFeklwAvTlKafVvU0wkfGKTI9hQjnkeZzH+AMi7q/q8lWI0FE3ESsz8H5
	jEwnFyfIEE9rxKxopHx4uiCAjL/sCPDrhLtJtv5EcQwRMU06p5XMf1c1tKvSDWeqX7beLA
	fRT/+9sVD3e+UTOWn75ObO+l4KvDwVQ0kA8i5z881oXqIy1/WcVJu+C1J5INpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Mikhail Zhilkin <csharper2005@gmail.com>
Subject: Re: [PATCH] mtd: spinand: confirm ready state on SkyHigh S35ML chips
In-Reply-To: <20261030203342.91172-1-sochnev.v.74@gmail.com> (Vitaliy
	Sochnev's message of "Fri, 30 Oct 2026 22:33:42 +0200")
References: <20261030203342.91172-1-sochnev.v.74@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 15:17:28 +0100
Message-ID: <87eccksvwn.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_061736_151750_9388A668 
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVml0YWxpeSwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKT24gMzAvMTAvMjAyNiBhdCAyMjoz
Mzo0MiArMDIsIFZpdGFsaXkgU29jaG5ldiA8c29jaG5ldi52Ljc0QGdtYWlsLmNvbT4gd3JvdGU6
Cgo+IE9uIGEgTm9raWEgWEctMDQwRy1NRCB3aXRoIGEgU2t5SGlnaCAyNTYgTWlCIFNQSS1OQU5E
LCBVQkkgcmVwb3J0cwo+IGZpeGFibGUgYml0LWZsaXBzIGR1cmluZyByb290ZnMgbW91bnQgd2l0
aG91dCB0aGlzIHdvcmthcm91bmQ6Cj4KPiAgIHViaTA6IGZpeGFibGUgYml0LWZsaXAgZGV0ZWN0
ZWQgYXQgUEVCIDE5NzkKPiAgIHViaTA6IHNjaGVkdWxlIFBFQiAxOTc5IGZvciBzY3J1YmJpbmcK
PiAgIHViaTA6IHNjcnViYmVkIFBFQiAxOTc5IChMRUIgNTo1MyksIGRhdGEgbW92ZWQgdG8gUEVC
IDY0NQo+Cj4gT3RoZXIgcmVib290cyBhbHNvIHJlcG9ydCBmaXhhYmxlIGJpdC1mbGlwcy4gQSB0
ZXN0ZXIgcmVwb3J0cyB0aGF0IGFmdGVyCj4gYXBwbHlpbmcgdGhlIHdvcmthcm91bmQsIHN5c3Vw
Z3JhZGUsIG11bHRpcGxlIHJlYm9vdHMgYW5kIGFuIGFjdGl2ZQo+IHdvcmtsb2FkIHByb2R1Y2Vk
IG5vIHN1Y2ggd2FybmluZ3MuIExvbmctdGVybSBvcGVyYXRpb24gaXMgdW52ZXJpZmllZC4KPgo+
IHNwaW5hbmRfd2FpdCgpIGFjY2VwdHMgYSBzaW5nbGUgbm9uLWJ1c3kgc3RhdHVzIHNhbXBsZS4g
T24gdGhlc2UgY2hpcHMsCj4gdGhlIHJlYWR5IGJpdCBjYW4gYnJpZWZseSBjbGVhciBiZWZvcmUg
dGhlIGRldmljZSBpcyBhY3R1YWxseSByZWFkeSwKPiBhbGxvd2luZyBhIHByZW1hdHVyZSBjYWNo
ZSByZWFkIG9yIGEgbmV3IHByb2dyYW0vZXJhc2UgY29tbWFuZC4gVGhlCj4gZmFsbGJhY2sgc3Rh
dHVzIHJlYWQgZm9yIGNvbnRyb2xsZXJzIHdpdGggcG9sbF9zdGF0dXMgb2ZmbG9hZCBkb2VzIG5v
dAo+IHByb3ZpZGUgYSBzZWNvbmQgcmVhZHkgY29uZmlybWF0aW9uIGluIHRoZSB1c3VhbCBjYXNl
Lgo+Cj4gTWFyayB0aGUgYWZmZWN0ZWQgU2t5SGlnaCBwYXJ0cyB3aXRoIGEgcXVpcmsgYW5kIHJl
cXVpcmUgYSBzZWNvbmQgcmVhZHkKPiBzdGF0dXMgc2FtcGxlIGFmdGVyIHNwaW5hbmRfd2FpdCgp
IGZvciB0aG9zZSBwYXJ0cy4gSWYgdGhlIGNoaXAgYmVjb21lcwo+IGJ1c3kgYWdhaW4sIHJlcGVh
dCB0aGUgd2FpdCB3aGlsZSB0aGUgb3V0ZXIgdGltZW91dCBoYXMgbm90IGVsYXBzZWQuCj4gRWFj
aCBpbm5lciB3YWl0IGhhcyBpdHMgb3duIHRpbWVvdXQsIHNvIHRoZSBxdWlyayBjYW4gd2FpdCB1
cCB0byByb3VnaGx5Cj4gdHdpY2UgYXMgbG9uZy4gTGVhdmUgb3RoZXIgU1BJLU5BTkQgcGFydHMg
dW5jaGFuZ2VkLgoKQ2FuIHlvdSBnaXZlIGFjdHVhbCBudW1iZXJzPyBDYW4geW91IGxvZyAod2l0
aG91dCB0cmFjaW5nKSBvbiBtdWx0aXBsZQphdHRlbXB0cyB0aGUgc3RhdGUgdGhlIGRldmljZSBp
cyByZXBvcnRpbmcsIGFzIHdlbGwgYXMgdGhlIHJlYWQKdGltZXN0YW1wcz8gQ291bGQgaW5jcmVh
c2luZyBSRVNFVF9JTklUSUFMX0RFTEFZX1VTIHNsaWdodGx5IGRvIHRoZQp0cmljaz8KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
