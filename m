Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A4C606A331
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EU/yDAYU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FziOh9Vi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=itZJiTMGgGUbP0Y/scTRXtp+BuN2IMGg2dBbd8sziHw=; b=EU/yDAYUjxdbSMpEUgbE0H1vlN
	ou6g3+hkkVf7tBi1ylQyGi9ya4z1Acg1saQ+IdXHbihuGsOpZgTWWTkskqA3O6R7H27+zsSsai9Ye
	3aOW7c91YF8QwzkEd/Swm449IhDeI3GDUo50ARqYU/2a0yLDM72Y58pcJRJ39HqEYQ3ZamlPgAh8L
	sTal2mZwdx65+je2ODEbMf8PB82qKnXMNEjN2M0xmMFMnLElfxBFPpQQm5lyJXZANJx0ScXp6R6W/
	nyr4M6j9tcttKgQaN686utGUHORG5d3dfOW6QRGQoxuLhezlh9QnssZU2gLbwK3SjU4Jb/P33MHgg
	2cdQ501g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQA2-0000000FLqk-0acu;
	Fri, 20 Nov 2026 15:04:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ9u-0000000FLlr-1RXH
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:04:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C47671A174F
	for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 15:04:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90FC6601B9;
	Fri, 20 Nov 2026 15:04:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1E9B11BC030E;
	Fri, 20 Nov 2026 16:04:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795187048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xl3+acC/CbSvOdpQbSY8pE0NAi03laC83yGZ5kvrp8k=;
	b=FziOh9ViqtOVei957IbUouu2vi2aGYbaLY5nOvmqrsJhB5jVNWJ5K7JKzKtdAtLJSlAdO6
	W5s1hEETLfr9ovfR1oyQiu8I2NSAjen8DV07m01snljV3fCtgaC4Bdy5ZXCo/t8gKptY/g
	6o4+kO2am/sVqkN/gxOgdtDxmf096xKnV0R67GRYGCyjzhTGq7F+TpQquStT8elHLC6gSZ
	W61eJD2cnN8MCWLzeLHR/psrkI/rmzXf4Gh/Jcs6ncDE7yju1+H/vJqp+ZdgYEUKkddH+G
	ylgDiwvfrTLXwHxONodagk9aR4lFpEaxzhcYLTynFlCmS+Wz+WkVx2tj7fyotQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org
In-Reply-To: <20261108-submit-r852-shutdown-work-v1-v1-1-8e448ad7c54c@gmail.com>
References: <20261108-submit-r852-shutdown-work-v1-v1-1-8e448ad7c54c@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: r852: prevent card work from being
 requeued during shutdown
Message-Id: <179518704684.3404688.4251747340533260570.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:04:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070414_578764_5D16443D 
X-CRM114-Status: UNSURE (   8.57  )
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

T24gU3VuLCAwOCBOb3YgMjAyNiAxNDowNDoyMSAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gVGhlIGNhcmQgaW50ZXJydXB0IGNhbiBxdWV1ZSBjYXJkX2RldGVjdF93b3JrIGFmdGVyIHNo
dXRkb3duIGNhbmNlbHMgaXQKPiBidXQgYmVmb3JlIGludGVycnVwdHMgYXJlIGRpc2FibGVkLiBU
aGUgd29ya2VyIGNhbiB0aGVuIGFjY2VzcyB0aGUKPiBjb250cm9sbGVyIGFmdGVyIHBjaV9kaXNh
YmxlX2RldmljZSgpLCBhbmQgY2FuIGVuYWJsZSBjYXJkIGludGVycnVwdHMKPiBhZ2FpbiB3aGls
ZSBwcm9jZXNzaW5nIHRoZSBldmVudC4KPiAKPiBEaXNhYmxlIGFuZCBkcmFpbiB0aGUgZGVsYXll
ZCB3b3JrIGJlZm9yZSB0dXJuaW5nIG9mZiBpbnRlcnJ1cHRzIGFuZCB0aGUKPiBQQ0kgZGV2aWNl
LiBMYXRlciBxdWV1ZSBhdHRlbXB0cyBhcmUgcmVqZWN0ZWQgd2hpbGUgdGhlIElSUSBoYW5kbGVy
IGNhbgo+IHN0aWxsIGFja25vd2xlZGdlIGV2ZW50cyB1bnRpbCBpbnRlcnJ1cHQgdGVhcmRvd24g
Y29tcGxldGVzLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEv
MV0gbXRkOiByYXduYW5kOiByODUyOiBwcmV2ZW50IGNhcmQgd29yayBmcm9tIGJlaW5nIHJlcXVl
dWVkIGR1cmluZyBzaHV0ZG93bgogICAgICBjb21taXQ6IGVjMWU4NDRiOTQ4NjMwMmE0ODhhYmMw
M2VhOTE4ZGI2MDcwOTc2NmUKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9s
aW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBu
byByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
