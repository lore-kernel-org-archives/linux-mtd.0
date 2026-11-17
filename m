Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A68606A883
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HTlHLHPJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ToonxK7K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sTd+JOCtvv+PXu+0Qr7kAc0Dbqtw5AGjZU9au5TPCH8=; b=HTlHLHPJAWQ7lHTh9Td6UFMTli
	ApCyWQsdxlmcbFJpcGoZ2AnJtEn7+YSs45Ua2PsxTSWPMx9DOdv5zeDASC6cGt4tHrK0V46ABSS+F
	LNlarKnDTGYjeeUA59te5wpDooxHRMPEtMEgbs1jVJAsys01UKsWES1dO5XiLFnfZBQrrgJbe7TG5
	z8GMTDjhXHJpFqqEYq9ZZLVeaviBolLox4+gSMUMMzxDNr1PM+XAPv35HUuuoF7EK7dekHiTlZmsu
	+g4kPbbBY08AqSYAN8XfwuLN2rjXDonB2gGzHoAVKm4zJLpLDOylI5Ob28ZxTqbPaMqyaaZsSJkKm
	RuaCl9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK62-0000000677R-3QS4;
	Tue, 17 Nov 2026 14:23:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5v-000000066uf-1nVC
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03C52C79A97;
	Tue, 17 Nov 2026 14:23:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9413B5FD6A;
	Tue, 17 Nov 2026 14:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E9BE11BC0036;
	Tue, 17 Nov 2026 15:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lJElfTzwAuOZ5+pRGg7Cx4QSnvdl7mrqMyhfsezJNBU=;
	b=ToonxK7KN9snZt9NszwLPT7+JjcVmc9Brh0eQqmZOKZmxqQ1VpC2eUyJY2l9WvTLEUqtEj
	G2yJPcQHSt3fX+O1pTy65Ws8GHHezYQELRC4kD0eTY8oTnZjE7e98IbIk4WV7S+ogvuxpJ
	NqtH8jdyvhl1+noDhWU78VrGRd45FJRnM3S+jJbPSPyicnO5noM981XCHT+WL99IPOMilZ
	a7L7vjxDfANw13VYawn134NZKRCxH1WUqyR76Gj/zrVXiWshC9USg7XTcPNzKhaxO6rOFe
	pM3SfzSplFqAGGCiGWpV+62GZsFwP/eBsdwWc95H2HjLzfzvfAJKdf54hdvE6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
References: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
Subject: Re: [PATCH 0/2] mtd: spinand: add GD5F4GM7UExxG and XT26G04C
Message-Id: <179492540842.2259780.12341849740874264628.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062335_730483_F1476687 
X-CRM114-Status: UNSURE (   8.11  )
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

T24gTW9uLCAxNiBOb3YgMjAyNiAxNjoyODo0NSArMDEwMCwgQW5nZWxvIENvbXBhZ251Y2NpIHdy
b3RlOgo+IFRoaXMgc2VyaWVzIGFkZHMgdHdvIDRHYml0IDMuM1YgU1BJIE5BTkQgcGFydHM6Cj4g
Cj4gLSBHaWdhRGV2aWNlIEdENUY0R003VUV4eEcKPiAtIFhUWCBYVDI2RzA0Qwo+IAo+IEJvdGgg
aGF2ZSA0MDk2IGJ5dGUgcGFnZXMsIDI1NiBieXRlIE9PQiBhbmQgOC1iaXQgb24tZGllIEVDQy4g
VGhlCj4gR2lnYURldmljZSBwYXJ0IHJldXNlcyBleGlzdGluZyBjb2RlLiBUaGUgWFRYIHBhcnQg
bmVlZHMgYSBuZXcgRUNDCj4gc3RhdHVzIGZ1bmN0aW9uLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRv
IG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMl0gbXRkOiBzcGluYW5kOiBnaWdhZGV2aWNlOiBhZGQg
c3VwcG9ydCBmb3IgR0Q1RjRHTTdVRXh4RwogICAgICBjb21taXQ6IDNjOGY3ZTgzM2YwYzYzNzNi
ZWU5MGI4OTdjZTA2OTdlMmU2OTdkY2IKWzIvMl0gbXRkOiBzcGluYW5kOiB4dHg6IGFkZCBzdXBw
b3J0IGZvciBYVDI2RzA0QwogICAgICBjb21taXQ6IDJjNjIyMGZmNmU3Y2JiMjg3MTIwYTA0N2Ux
ZGE5NTA5ZDY2YzQ5MTUKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51
eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyBy
b2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
