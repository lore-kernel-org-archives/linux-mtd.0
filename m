Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BE7606A32C
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2026 00:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ISjpwKKE;
	dkim=fail reason="signature verification failed" header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=Ts8I+/ZS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=EMeJOWKo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qqD1vMgK+R0GkqDnO1ETBUmJRZf2AScG3grk7P156LM=; b=ISjpwKKELoTJYDXXOhYp0JgmM2
	OWTbFu7cBWMe4w5vRauBNWfcplPthzI6zETQWJSv98GPwJXOKvyq8eWskTqgjQZmuLr4vdhAk1px8
	qHEivwgbeYeDdjaHc4JWDO7nWMIqnQ3BBqA7Yo8EzNm3ANwlkYsgBnbSJ9iE/IIFjqDmMd+joL0KW
	aSe61EWGD8n8iIA9cq1Lb/WEvTL9tCytIgkaEmQtfmFsthiuHHAbDTTPoGY0igS037iIthlaawO5b
	SABW7U0BdlI2fS2rQqHJFEDAaE9gK7UpX7UCLGTb7A2r65r8CKIhQTZeSzXzruDr7wr3QNFwtIziw
	pJ3YHmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvPr-00000000aVP-1d0W;
	Sun, 22 Nov 2026 00:26:47 +0000
Received: from [78.108.101.136] (helo=mail.vitkazik.cz)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvPo-00000000aV0-2qSt
	for linux-mtd@lists.infradead.org;
	Sun, 22 Nov 2026 00:26:45 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Subject:To:From:Date; t=1795307196; bh=FdMdr0OPoLSwNkPJr5yD1+5
	uK3Sil+tJIjrmqRVSmVo=; b=Ts8I+/ZSlO6lfLVX0gBKNOTrDXwUEusdM7CQYroPAOKkGeL6fV
	aWDuOVT6LtGmhhczOv0qtV8BUb8dDgSNQFCw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Subject:To:From:Date; t=1795307196; bh=FdMdr0OPoLSwNkPJr5yD1+5
	uK3Sil+tJIjrmqRVSmVo=; b=EMeJOWKoqNGNL1NCGCsS1FKDeVOY7qjgpJjB1bMaAU0zeRbBug
	y2AsE8+3MiZJocMcjnkesX4nwkQyn+tUi8pQOoc98w236/ZnEKsszr+eP/CKhvAKQ2UdLzJeJAI
	8MjiPqh0b+fQlsceGbc9NrCF5CwsllgukXWcPy91YYkBgB1Jo4qGjTJGVcbiAYc1xecSWU1RCV+
	WdtUw3vgg/azOHn5KuD5UH685JVeFja88YTVQc0rEjdDek9LeB2iiJ+jKTUNg5bY4e05sxT39kW
	GPDdas72S4QWMM86Ac55ZLd0ZK+DqUJp05n4R5v/qmGAAGgANWqwHSevz5JNq6e57uw==;
Date: Sun, 22 Nov 2026 00:26:20 +0000
From: =?ISO-8859-1?Q?V=EDt_Kaz=EDk?= <vitkazik@vitkazik.cz>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
CC: tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, m.felsch@pengutronix.de,
 sshivamurthy@micron.com
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
In-Reply-To: <20261121234125.16093-1-vitkazik@vitkazik.cz>
References: <20261121234125.16093-1-vitkazik@vitkazik.cz>
Message-ID: <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_162644_730245_EF63EAB3 
X-CRM114-Status: UNSURE (   4.93  )
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

SGksCkkgZm91bmQgTWFyY28gRmVsc2NoJ3MgZWFybGllciBzdWJtaXNzaW9uIGZvciB0aGlzIGNo
aXAgKDIwMTkvMjAyMCkKb25seSBhZnRlciBzZW5kaW5nIHRoaXMgcGF0Y2gsIGFuZCBoYXZlIHJl
YWQgdGhhdCBkaXNjdXNzaW9uIG5vdy4gTXkgcGF0Y2ggd2FzIHdyaXR0ZW4gaW5kZXBlbmRlbnRs
eSBmcm9tIHRoZSBkYXRhc2hlZXQsIGFuZCBpdCBhbHJlYWR5IHVzZXMKNC1iaXQvNTEyLWJ5dGUg
RUNDIGFzIGFncmVlZCB0aGVyZS4KCk9uZSBkaWZmZXJlbmNlIGlzIHRoZSBmcmVlIE9PQiBhcmVh
LiBJIGV4cG9zZSBieXRlcyAyLTcgb2YgZWFjaApzZWN0aW9uLCBmb2xsb3dpbmcgVGFibGUgMTEs
IHdoaWxlIE1hcmNvJ3MgdmVyc2lvbgpleHBvc2VkIGJ5dGVzIDQtNyBzbyB0aGF0IHRoZSBmcmVl
IGFyZWEgaXMgYWx3YXlzIEVDQy1wcm90ZWN0ZWQuIEknbQpoYXBweSB0byBzd2l0Y2ggdG8gNC03
IGlmIHRoYXQgaXMgcHJlZmVycmVkLgoKTWFyY28sIGlmIHlvdSBzdGlsbCBwbGFuIHRvIHNlbmQg
YW4gdXBkYXRlZCB2ZXJzaW9uLCBwbGVhc2Ugc2F5IHNvIGFuZCBJIHdpbGwgaGFwcGlseSBzdGVw
IGFzaWRlLgoKVGhhbmtzLApWw610CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
