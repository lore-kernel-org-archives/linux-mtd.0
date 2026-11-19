Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28326606A33C
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m7o0Tw1k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wtu62sc0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ucz1L4VE+L4FuxJKmWnOgMlNyY3MyhNi66JJVWYjRzk=; b=m7o0Tw1k2n/bxIQWtdD4JTEt/M
	R2Fr8eP4JtOwYZXCNUuZYM61C3U8G5qbHTmNUvX3K5fjpyQgjWGxUejYKDvu9OUGyxx5bGzxi82iv
	FfYBXhXbLIMJiRBLGfkGtGwLtLxQ0Cg7XtKpBsfsznmPnp8bMQ76NyzbBg6UBvA3yBRYpfNCU6sOO
	/OQcU+Yl73+OxA/8c1b4JjEQdTvrRVUH7gVjKpBPmHkekDofwIH/E5aDV6LtGDMO4UJDz+E+rXR79
	6Vy42kHA9Qnt7vE2c1gZLqStzv9/gRUQAcPv6BZkQHeRKgPDzCXNfjv5o+zkgcsTRTxuR3fxFHB9y
	VFtya3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OR-0000000BrUJ-3Gjx;
	Thu, 19 Nov 2026 12:37:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OJ-0000000BrOD-2gAP
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 318F51A170E;
	Thu, 19 Nov 2026 12:37:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0092B60237;
	Thu, 19 Nov 2026 12:37:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18C9011BC0662;
	Thu, 19 Nov 2026 13:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091845; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=15IIei0njm9MoQKpU7xMCVk5NsqTxGVQwXUyW6FDeqk=;
	b=Wtu62sc0o8m5YCt1oQ3tC9kLS1FsjYLEEGPrqX2n6jAOyA2noH6MDPfi6wspWwRwis3X59
	zv9y/Vm944bpcz6mKlH8Inqxo1sUTMks4HaQ07iE6lro/VtP5tIXSLeixpSM6XwZKLLFyH
	zKj756fyr0tw3q4dFyvWcg3ke0dlFD75Epwk5U+lg3fjv3QJqKJMibfjAS5Dyo13EZ/bff
	CA+msTMDfC9HMAdVz50dkmTiNb3vQ1P8fGEa8hAfTq1pCNnMAERwinElhY0fV3+tYe+977
	tWqLu4rV+FVwL5O+Jre9PUHQAVRD2VLD6/u9T59GEmJzgJivimz976guBSzJCA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lin Quanji <linquanji@heyangtek.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 Aleksei Sviridkin <f@lex.la>
In-Reply-To: <20261118172348.164296-1-linquanji@heyangtek.com>
References: <20261118172348.164296-1-linquanji@heyangtek.com>
Subject: Re: [PATCH] mtd: spinand: heyangtek: add support for HYF4GQ4UAACBE
Message-Id: <179509184300.2889394.11039347214758427682.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043729_970748_FDDE67F6 
X-CRM114-Status: UNSURE (   9.79  )
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

T24gV2VkLCAxOCBOb3YgMjAyNiAxNzoyMzo0OCArMDgwMCwgTGluIFF1YW5qaSB3cm90ZToKPiBB
ZGQgdGhlIDQgR2JpdCBtZW1iZXIgb2YgdGhlIEhlWWFuZ1RlayBTUEktTkFORCBmYW1pbHkuICBU
aGUgZGllIGhhcwo+IDQwOTYtYnl0ZSBwYWdlcyBhbmQgYSAyNTYtYnl0ZSBzcGFyZSBhcmVhLCBh
bmQgdXNlcyBlaWdodCA1MTItYnl0ZSBFQ0MKPiBzdGVwcyB3aXRoIDE0LWJpdCBjb3JyZWN0aW9u
LCBpLmUuIDI0IGJ5dGVzIG9mIG9uLWRpZSBwYXJpdHkgcGVyIHN0ZXAKPiBhbmQgMTkyIGJ5dGVz
IGluIHRvdGFsLgo+IAo+IFRoZSBzcGFyZSBhcmVhIGlzIHRoZXJlZm9yZSBsYWlkIG91dCBpbiBl
aWdodCAzMi1ieXRlIGdyb3Vwcywgb25lIHBlcgo+IEVDQyBzdGVwOiBieXRlcyAwLi43IGFyZSBl
eHBvc2VkIGFzIGZyZWUgYW5kIGJ5dGVzIDguLjMxIGhvbGQgdGhlCj4gcGFyaXR5LiAgVGhpcyBp
cyBub3QgdGhlICJmaXJzdCBoYWxmIGZyZWUsIHNlY29uZCBoYWxmIHBhcml0eSIgbGF5b3V0Cj4g
dXNlZCBieSB0aGUgR2lnYURldmljZSAyNTYtYnl0ZS1PT0IgcGFydHMsIHdoaWNoIGNhcnJ5IDgt
Yml0IEVDQyBhbmQKPiBjb25zZXF1ZW50bHkgb25seSBuZWVkIDEyOCBieXRlcyBvZiBwYXJpdHku
Cj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNw
aW5hbmQ6IGhleWFuZ3RlazogYWRkIHN1cHBvcnQgZm9yIEhZRjRHUTRVQUFDQkUKICAgICAgY29t
bWl0OiA3Yzg2MzMzNTkxZWQ3NWMzNmM2ZjQ1NDQ0MDRlODExMWY3MGEzNmJhCgpQYXRjaGUocykg
c2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2Yg
dGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoK
S2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
