Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9888606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C8HW8OSG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zCMDYcSe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UAThMTc9ROW/kLdJwDY8LPnevokHDd5nEAMgIPJh3WQ=; b=C8HW8OSGPfeAspx0R908vM39yB
	6QmwAuxWfENK0OYlOxdn6yv5jDaBC21hLCWDXvwd1Vh0RUqLlod/4ogORogfhK8kH+ifkr9CP+1Cx
	0CF6uTrs2Jco8b23FrJQzFpv6tRSqWKG78dOC7wCidr3HKRteIMlsVmZjSx8zV08HWyGZ9GalMcAk
	vazVnL/Fy+imHe8krjydCHdJeaPz5WPWbtxkC0iQSvBOfOUHR1vLmM34OqOn05gJbPOdZOoAN6WT6
	NNhCR73PDN20299MYvYGJAeDlcQN1MGa7qCokSzpPitzmLTt1AdYkd2SWz5qoI6mtOg/bE89/7ErX
	Gw0ZRrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIVv-0000000GhO7-1JpC;
	Fri, 23 Oct 2026 16:53:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIVs-0000000GhNh-3tO5
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 16:53:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 840291A12F8;
	Fri, 23 Oct 2026 16:53:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A55560398;
	Fri, 23 Oct 2026 16:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3F55103284BB;
	Fri, 23 Oct 2026 18:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792774380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jN2QNq0T5WJzayXfax1gvkNlk7TneUe5jrzmJ6caWXI=;
	b=zCMDYcSekxlHr6JnM2P7RBAL5hZWnwNCHMDEQ1pmPg7+f4TMzvhOWiheLzGDixlBGgKgpm
	MXOEeGdaDiDs2EM6bhEpSPHIPTs078XfETivhB+WSojz9eLbW8HwFEVGV92fQhAujZdSSe
	J3v0AsvRw7xWyZQJiKr8K5uOIpwVeYSP5AkOhHXceNpuCJGiIkoNeGhzbU+X1zBa6ykCDW
	3C0wL7cQMy0jB0SBrpveIwqtIvF4xOqutwh807yPx0DcMsOOTagPjY7tSwZn5gbiBWZ7KN
	rHLrNBBk7k6qhPynC6482gGSOeKAu6j1cZby+dltmVgzLll/HjOWgp20bYHkig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 7.4
In-Reply-To: <DMAEJT5TG2JT.2GAOS6W1U9V4T@kernel.org> (Michael Walle's message
	of "Wed, 21 Oct 2026 11:18:03 +0200")
References: <DMAEJT5TG2JT.2GAOS6W1U9V4T@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 23 Oct 2026 18:52:58 +0200
Message-ID: <875wysnytx.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_095305_109810_CCFD307F 
X-CRM114-Status: UNSURE (   6.80  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjEvMTAvMjAyNiBhdCAxMToxODowMyArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGNl
ZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzU6Cj4KPiAgIExpbnV4IDcuMy1y
YzEgKDIwMjYtMDgtMzAgMTM6MzQ6NDAgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBH
aXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQKPiAgIHRhZ3Mvc3BpLW5vci9mb3ItNy40CgpQdWxs
ZWQgaW4gbXRkL25leHQuCgpJIGRvbid0IGtub3cgd2h5LCBidXQgdGhlIG1lc3NhZ2UgYXR0YWNo
ZWQgdG8gdGhlIHRhZyB3YXMgbm90CnByZXNlcnZlZC4gV2hlbiBJIG1lcmdlZCBuYW5kL2Zvci03
LjQgSSBhY3R1YWxseSBoYWQgdGhlIG1lc3NhZ2UKYXNzb2NpYXRlZCB0byBpdCBiZSBwYXJ0IG9m
IHRoZSBtZXJnZSBjb21taXQgbG9nLCBidXQgZm9yIHRoZSBzcGktbm9yCm1lcmdlIEkgaGFkIHRv
IGNvcHkgaXQgbWFudWFsbHkuCgpOZXZlcnRoZWxlc3MsIHRoYW5rcyEKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
