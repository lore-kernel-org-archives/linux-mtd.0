Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF198606A334
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X2BrBmXR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tvnr+SFq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fvHoFPF72n75c4CGJrI89bmOtrxgoo5KK4A8Fu10y4U=; b=X2BrBmXRjFT26y8NnYPWDDud9e
	lb/Vm9pErX3zCo2ac1JvkKQlYer7ME3W6qCyVMVPPdv5NS7LqpoJE7Fse9HIBdZiKj1Nf4q5lSrn2
	sfXUjheoX7aOo6JxLCqkaUXCffCHhd8YMd3sIvi/sMaY9GsiRD/CBiMEcQ6f6N4aZzMnoW53rmqp/
	kLbVdM1cecqsrGAljC77D4tIPiyY3YkAOyRDkzdKJORDk4Ctf086MHLCjXDag5uVkex5sHhr/7U+4
	C9QKk36QOpQgcNdGE8MmLz90FKnmyPBkm+kB8f52eWxKF93LxdviibvnU40otAUqyb3eBxvxfJYh9
	U9qU6JJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNX-00000005yF0-0nDH;
	Tue, 17 Nov 2026 13:37:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNT-00000005y9H-05Eh
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D2C21A162D;
	Tue, 17 Nov 2026 13:37:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18F5F5FC81;
	Tue, 17 Nov 2026 13:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D972411BC0036;
	Tue, 17 Nov 2026 14:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g7MlRucj6hzoIqlqipb4GtdWwD9O/OEsZ9EcZBH/LpA=;
	b=tvnr+SFqz0ANaFeOIu2h7eLOvHj0EZWnuxud/WDxtHQ4Zpt3cbqbm0d0jztVWnscm1UMlA
	6El1kdJKO4OWPwf29oO6VWr6RwMA0BDppRnjq6DbpEiRDD0POTTkPdWuMbNuGEMMkTms69
	F9PrzKH+Mku9uLcsm/+nrLcGJsOjmCtSWpkbVNpOnNcwo7OKLGRfgQdKcbfQvJPgkBF864
	Qdm5JjcTNXrCchaBQvHMRdc/d90o1TykSneuOr/g2msMi3m2zedQxbpJe5ih6BWsoLzVaY
	bcdGbL1lqC8Tl5C4w8G0TZW19BOawLDSFtFLDcfwEBBcHbJsCABk8n5Y70RNPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Richard Weinberger <richard@nod.at>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Han Xu <han.xu@nxp.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rosen Penev <rosenp@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Wentao Liang <vulab@iscas.ac.cn>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Chen Ni <nichen@iscas.ac.cn>, 
 Runyu Xiao <runyu.xiao@seu.edu.cn>, Hemanth Selam <hemanth.selam@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Triet Hoang <triet.hoang.dev@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
Message-Id: <179492264476.2237190.6242832755498248346.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053739_230833_EBD7D54E 
X-CRM114-Status: UNSURE (   7.90  )
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

T24gTW9uLCAwMiBOb3YgMjAyNiAxMzoxMzo0MSAtMDUwMCwgRnJhbmsuTGlAb3NzLm54cC5jb20g
d3JvdGU6Cj4gUmVwbGFjZSBvcGVuLWNvZGVkIGFzc2lnbm1lbnRzIHRvIGNhbGxiYWNrIGFuZCBj
YWxsYmFja19wYXJhbSBmaWVsZHMKPiBvZiBzdHJ1Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3Ig
d2l0aCBjYWxscyB0byB0aGUKPiBkbWFlbmdpbmVfZGVzY19zZXRfY2FsbGJhY2soKSBoZWxwZXIg
YWNyb3NzIHNvdW5kIGRyaXZlcnMuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQu
IFByZXBhcmUgdG8gbWFrZSBzdHJ1Y3QKPiBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciBwcml2YXRl
IHRvIHRoZSBETUEgZW5naW5lLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IHVzZSBkbWFlbmdpbmVfZGVzY19zZXRfY2FsbGJhY2soKQogICAgICBj
b21taXQ6IGRjZmFiZjVmMzkzOWUwMmQzNDQ4OTBmZTQ4NzlkODQ4OGI5Mzg5MGMKClBhdGNoZShz
KSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBv
ZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbiku
CgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
