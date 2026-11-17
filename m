Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630F260A2612
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tQ76zyHK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J7U40aS7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aEvIoL++KSvfYTd3neM1fqyT78/1/IZyzGT0UJtJp9o=; b=tQ76zyHKGjRGIYnqepLmtK1CWM
	h5uY7KYDlrU+GTvZYEsKNNz9RZW60SmJb5vGxoDyHfc8ucc6AoCQRifuozQ/60V+qph7BUxpLVFsS
	hyPXojcvuQz4Cey0jPmz3cNQc7kh5FPvgbjgwXBbgii+0Dcyt1E6b6Q/1AWn3Q6v63efXNnbwpjfx
	bmHkdb2ECUt6oq+8WBSL0whW+24tje6ZxClZIZDQL566vdyB7Mv1qFMWVAcuCUHoDAsir78JTxWgh
	JhXWNqYP+rhiiyE2Jia2yS0JmMcCnOzkQQBfrwURnKQW+lUuyI3eWRCrh1zZZjMF0FnvNxLgAYk98
	5AKd8trA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5k-000000066h2-0N7s;
	Tue, 17 Nov 2026 14:23:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5h-000000066c7-1UQU
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E1C861A1691;
	Tue, 17 Nov 2026 14:23:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B745E5FD6A;
	Tue, 17 Nov 2026 14:23:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2B7E11BC0039;
	Tue, 17 Nov 2026 15:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LmdnAdyFc/KExKjlXTQQG9vPex2c1X+M3F6FG9ILMsw=;
	b=J7U40aS7WBu6kKVkRezLn47fJrpUXyPOBQu4dgs67vHMxgOWv2kMJQsSg+jyzCbDYCIF7G
	vSr0R7ZvDK3Xs7tChTwjYj9wcRCe06qR2GNDb9pOQCafzX5NWZaQjFlYKYyxaNFvcejqkP
	GjYjm7sR2sYhwHCnGH1kCUvyNfNzVENHYVB1qlucYC+IkOjmal+TP8UI/jCK+adO0wCEc5
	seOiDX0jrFv5H6kBd0fw6VXx8FEl8RxqDIwFuELjywmMcKAC+VxcnsEC6MDT5cVFp7QIWF
	6tYMD+CaLBBlJelZfI8Hi29pDa5dx2cI9EiJqPyVRcu7pMlvIVqx2PaHp5nJSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261103100602.1310416-1-vulab@iscas.ac.cn>
References: <20261103100602.1310416-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: atmel: Release the HSMC clock on legacy
 init failure
Message-Id: <179492539687.2259780.15450665265756565603.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062321_615530_9EF1C99E 
X-CRM114-Status: UNSURE (   7.70  )
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

T24gVHVlLCAwMyBOb3YgMjAyNiAxMDowNjowMiArMDAwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IFdoZW4gYXRtZWxfaHNtY19uYW5kX2NvbnRyb2xsZXJfbGVnYWN5X2luaXQoKSBmYWlscyBhZnRl
ciBhY3F1aXJpbmcgdGhlCj4gTkZDIGNsb2NrIHdpdGggb2ZfY2xrX2dldCgpLCB0aGUgZXJyb3Ig
cGF0aHMgcmV0dXJuIHdpdGhvdXQgZHJvcHBpbmcgdGhlCj4gY2xvY2sgcmVmZXJlbmNlLiAgRm9y
IGZhaWx1cmVzIGFmdGVyIGNsa19wcmVwYXJlX2VuYWJsZSgpLCB0aGUgY2xvY2sgaXMKPiBhbHNv
IGxlZnQgZW5hYmxlZC4gIFRoZSBjYWxsZXIgcmV0dXJucyB0aGUgZXJyb3Igd2l0aG91dCBydW5u
aW5nIHRoZQo+IGNvbnRyb2xsZXIgcmVtb3ZhbCBwYXRoLCBzbyB0aGUgcmVmZXJlbmNlIGFuZCB0
aGUgZW5hYmxlIGNvdW50IGFyZSBib3RoCj4gbGVha2VkLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRv
IG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBhdG1lbDogUmVsZWFzZSB0
aGUgSFNNQyBjbG9jayBvbiBsZWdhY3kgaW5pdCBmYWlsdXJlCiAgICAgIGNvbW1pdDogODVkYzFi
MWUzYmY1ZDI5OWZjMzUzMWRmYTllZTg0NzNiY2ZjMDc1ZQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
