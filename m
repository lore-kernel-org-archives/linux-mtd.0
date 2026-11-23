Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34236606A32D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g15dawSj;
	dkim=fail reason="signature verification failed" header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=yXBNMm0K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=n65J2f0U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bEi7LEGhRXnDkJvXGVQSDZYClHseK7aTQYSTi1oOC3w=; b=g15dawSjvFA6DQGg4qVQbhprL5
	gyomeAgjwe58M8EZWLTj3hXNucSOHrk5gkGJJLtqWDcZN9C+b8aX+0HZ0apFSaQks4xDk2nM96lbm
	07Da1TxmZEpHA15OLTx7w33DmDydBlW4yR8hp2LBJSPmqcOAR+QzMDgRDl6x0J4ZEx5ATgq/w7UgN
	e6zjZgTby32fFbfZGi5QQvEqRgVo8FidGQAWn+feiQvx9+S6iqobkXEv4sHMMsfqn90iZRkDzfDIg
	Gy/WtVI/MkYpuBfcxQf6LK4rv1qYppMcS5aLGS7ZBbyLZk/3rMiEmPcJ1jMPATjI0wbMo870Yv8SK
	eeAQYnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTHO-00000003OAR-1YOQ;
	Mon, 23 Nov 2026 12:36:18 +0000
Received: from [78.108.101.136] (helo=mail.vitkazik.cz)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTHJ-00000003O4w-2A1I
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 12:36:15 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Subject:To:From:Date; t=1795437352; bh=iFeOy59wvn0iVjKwkBcZpCT
	AjC6Y+h4cQKqhS4RDEvE=; b=yXBNMm0KmfWX0mqhH3vCktGCc3++onzIMvK9//JtX1xzXyhY9i
	3mkqK3nZEwnCFBqYXbbFzn+qmpBDWdKMVdDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Subject:To:From:Date; t=1795437352; bh=iFeOy59wvn0iVjKwkBcZpCT
	AjC6Y+h4cQKqhS4RDEvE=; b=n65J2f0UsQqP3BFhMoaOGBA21lTBa8a3GzIzBdPB+jHSIuISpG
	wdATvoh8QHaIrAUm3ourvP0BWt2plQt1L4kW3s4wdyIJEGy0yVmWxtD+HuDDgLbeLAUd1ZJikAa
	iM+zkzcQnf/tvvkM4Mh5U1LdN7STJv952p25D9ww2vKJCc3V1lnGpZrc1m2mfpyQXPzgpdmCOBo
	cULxnbtGSBMJPSdUwPKOrW7n4+oV8tAZwI14YhM9kBfoTQj58sbPMvkFpKwA25mfbgU+COb8cRG
	NxIgY838wMhpNcotd54v+R6tZ2wB1omU9TR58Yl0FFDHAa2YxY3acTM2PS1jkuN530w==;
Date: Mon, 23 Nov 2026 12:35:50 +0000
From: =?ISO-8859-1?Q?V=EDt_Kaz=EDk?= <vitkazik@vitkazik.cz>
To: Marco Felsch <m.felsch@pengutronix.de>
CC: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sshivamurthy@micron.com
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
In-Reply-To: <34hku3cwz5tgpz4l7jtcsupictopwpwv6dmbkyhwvi2husszfo@5pufgrbxligl>
References: <20261121234125.16093-1-vitkazik@vitkazik.cz> <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz> <34hku3cwz5tgpz4l7jtcsupictopwpwv6dmbkyhwvi2husszfo@5pufgrbxligl>
Message-ID: <EAE15106-66A8-4457-A71E-12D68E06F506@vitkazik.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_043613_602805_EF111EE2 
X-CRM114-Status: UNSURE (   4.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
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

SGkgTWFyY28sCgo+PiBIaSwKPj4gSSBmb3VuZCBNYXJjbyBGZWxzY2gncyBlYXJsaWVyIHN1Ym1p
c3Npb24gZm9yIHRoaXMgY2hpcCAoMjAxOS8yMDIwKQo+Cj5VaGggdGhhdCdzIGFuIG9sZCBzZXJp
ZXMgXl4gQ2FuIHlvdSBzZW5kIG1lIGEgbGluayBzbyBJIGNhbiBjaGVjayBpdAo+cXVpY2tseSBw
bGVhc2U/CgpTdXJlLCBoZXJlIGlzIHRoZSBsYXN0IG1lc3NhZ2Ugb2YgdGhlIHRocmVhZApodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMDAxMTcwNzE4MTAuMmt1aXdyNnJobG9mcDZ0aEBw
ZW5ndXRyb25peC5kZS8KClJlZ2FyZHMsClbDrXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
