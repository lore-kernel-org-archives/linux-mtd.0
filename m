Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4C6606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WxQNYKVo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=txd1mXl2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pVgWGjBvKviMMOFGPJCr04Z7ZmousVzybFWe9zVRKnA=; b=WxQNYKVo2woCLX9VJMfmp8d9fG
	HyKUDY9R1pNdGEi+JDlj0JJ0/3XYKZI5ZBYfpCU+0JJf4wtmWRhZ9X3KZXQtUgfa1tfsfMlFCX4zx
	aGFYhaSO5rUw9qdm00hXhibAVfVCf1GrTw0+qq52oznbIa2jobx4/VlqLBilAQIDZfBvO6w20kRRB
	tUERwSgymeGN6Of+sg5yUkibAAkckEyhpUs6Ll5XPm0NokwUoOJ+Kkgb/8ZIofIw6z9MXPqbu4sYM
	kNlWvKLhZbDkUItQPaohOZj2eQ7uyZUdwZ4RnjgkFsvbffJygCRIYXGnWXMQLAAxgJQFejHb9M287
	PMB7MXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJXY-000000060uV-0Zm0;
	Tue, 17 Nov 2026 13:48:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJXV-000000060tv-3Eqc
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:48:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CC861C79A97
	for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 13:48:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 684395FC81;
	Tue, 17 Nov 2026 13:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 889F411BC0024;
	Tue, 17 Nov 2026 14:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794923274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JHzd7FDNt8WtSOuWmynC0XMqvr4CymS+F+6NtTORZ9k=;
	b=txd1mXl29q0DSQHCsv4VcHJw1IjRcnR0UBNeKAXxNazCP6nb2AD3fEgXtc1fzYcmKwJbT2
	x3xK+PnFVk6lOpVPTRqfcm7+htAGM0dlafVLdEaHxDv9ugIeFEA53Hh2a3VLDWlCQSHh7/
	xayJRWWs0hkcY/oByvlfDuZkllhqV6FQppf0sI+CDKBz0GgE021I0gObIMuSsUDmQNNzW3
	PB5UIG55FRJ6bsO3Jn4g6UQ+CcI4oh5vraYiqte3ezjgLW5S4X20vnRBvI85HkTwTCGVs+
	sMD4RjAPL6el+iYjnHphFf91NvH03FsocfImXZZLqbzXnsZJHGM6XRk2IfmD6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder@fris.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20261014-spinand-cont-read-supported-v3-1-e9b8b34d303d@kontron.de>
References: <20261014-spinand-cont-read-supported-v3-1-e9b8b34d303d@kontron.de>
Subject: Re: [PATCH v3] mtd: spinand: Do not re-enable continuous reads
 vetoed during variant selection
Message-Id: <179492327226.2243972.5665532039519324438.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:47:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_054801_978845_E27C6C80 
X-CRM114-Status: UNSURE (   9.80  )
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

T24gV2VkLCAxNCBPY3QgMjAyNiAwODo0NToyNiArMDIwMCwgRnJpZWRlciBTY2hyZW1wZiB3cm90
ZToKPiBzcGluYW5kX21hdGNoX2FuZF9pbml0KCkgdHJpZXMgdG8gZGlzYWJsZSBjb250aW51b3Vz
IHJlYWRzIGJ5IGNsZWFyaW5nCj4gY29udF9yZWFkX3Bvc3NpYmxlIHdoZW4gdGhlIGZhc3Rlc3Qg
Y29udGludW91cyByZWFkIHZhcmlhbnQgaXMgc2xvd2VyCj4gdGhhbiB0aGUgZmFzdGVzdCByZWFk
IGZyb20gY2FjaGUgdmFyaWFudCwgb3Igd2hlbiBubyBTU0RSL09EVFIgY29udGludW91cwo+IHJl
YWQgdmFyaWFudCBpcyBzdXBwb3J0ZWQgYnkgdGhlIGNvbnRyb2xsZXIuIEhvd2V2ZXIsIGF0IHRo
YXQgcG9pbnQKPiBjb250X3JlYWRfcG9zc2libGUgaGFzIG5vdCBiZWVuIHNldCB5ZXQsIGFuZCBz
cGluYW5kX2NvbnRfcmVhZF9pbml0KCksCj4gd2hpY2ggcnVucyBsYXRlciBkdXJpbmcgc3BpbmFu
ZF9pbml0KCksIHVuY29uZGl0aW9uYWxseSBzZXRzIGl0IHRvIHRydWUKPiBmb3IgYW55IGNoaXAg
aW1wbGVtZW50aW5nIC0+c2V0X2NvbnRfcmVhZCgpLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10
ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBzcGluYW5kOiBEbyBub3QgcmUtZW5hYmxlIGNv
bnRpbnVvdXMgcmVhZHMgdmV0b2VkIGR1cmluZyB2YXJpYW50IHNlbGVjdGlvbgogICAgICBjb21t
aXQ6IDgyYjNmODNmNjE4ZDMwMDJmNGJjODQ3ZmM3MDgwNTE5NjUwYTMyNTAKClBhdGNoZShzKSBz
aG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0
aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpL
aW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
