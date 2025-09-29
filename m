Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E22CAC5B5
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0d+BXArJjnLqTIkRZMIyoVMj96p0w3Tdmmra/WoeYRo=; b=zn6ExeNNi4RUJN
	eR5fTBMC641P1GZTfBi2KGpmEdL+g0klvT8n2dl3mbsifH1I2lutvQW7oSYyDi3ElpghHK2JtIBJ2
	YqFWli3emcQ83wZ2B1YPUMUDszcaaziFCGsm2VrIaxG6QALc0hEtQXc1RZF+by2UUhCNSklC1POW/
	8zsdiWRC2vi982pcfw9v3Xx/qwASYOumf1W7s5ILmicGKbG/KRGLLBVuJfpPbkkHt/ZeWH0z7CYSo
	1ZfT4+Iyzp2CbVrSJpNWgIDOEOzmB8TyDlouafje0OdH5IUp+0zOj2l4VeDtUWAI4lk4fAzSi0VHe
	VDhjShZm888UVZ33rh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GDB-00000002r9g-1gar;
	Mon, 29 Sep 2025 15:54:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GD7-00000002r6J-21ud
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 15:54:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0928B4E40D3E;
	Mon, 29 Sep 2025 15:54:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D433E606AE;
	Mon, 29 Sep 2025 15:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6510A102F198F;
	Mon, 29 Sep 2025 17:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161281; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Spm8yVAgaGCfSlHJQfFy0r1pg/IkNIzB0XaZz5q975c=;
	b=reO91RoAuHVRsuxfoZLuZHViU4cHSpuhOFU2QzBxRmNetmG7MT2SboCpjN6Hn2aF+VsOtp
	g749P5UOkCxiSjK9QIrdj2PUpr57XQSfkcYi/7Tvc1FD3ttCe+VeNtfFJ8PffIVJYD8Tia
	bMfj0q81TYd6nYpV8PPhSvw6TuS9anIrXNFXXg62XFesyiuGls5ewFO6RdcIyehjNmfeQS
	o78PcMBGyM2giYp29pEhdSXqnVgeq/5LZFvMU9eBnootXBGHYPzj/LnQ6kQv16chjLEcRK
	N0tnxmfWSCGxxl82sH0qmoKqRY6ONwVt+W/o4KP+JouHYmXL5lvG6VjBAhllIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, Markus Stockhausen <markus.stockhausen@gmx.de>
In-Reply-To: <20250919075201.4177901-1-markus.stockhausen@gmx.de>
References: <20250919075201.4177901-1-markus.stockhausen@gmx.de>
Subject: Re: [PATCH v3 0/2] Realtek ECC engine
Message-Id: <175916127540.50127.8496050695970083925.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 17:54:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085445_690354_467866B7 
X-CRM114-Status: UNSURE (   5.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOSBTZXAgMjAyNSAwMzo1MTo1OSAtMDQwMCwgTWFya3VzIFN0b2NraGF1c2VuIHdy
b3RlOgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEVDQyBlbmdpbmUgb24gUmVh
bHRlayBSVEw5M3h4IHN3aXRjaCBTb0NzLgo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5r
cyEKClsxLzJdIGR0LWJpbmRpbmdzOiBtdGQ6IEFkZCByZWFsdGVrLHJ0bDkzMDEtZWNjCiAgICAg
IGNvbW1pdDogMTJiZmNiODRkYzA4NTJjOTdiYWZmOWFjMWMwMjkyYTlkYjkwYzM2NwpbMi8yXSBt
dGQ6IG5hbmQ6IHJlYWx0ZWstZWNjOiBBZGQgUmVhbHRlayBleHRlcm5hbCBFQ0MgZW5naW5lIHN1
cHBvcnQKICAgICAgY29tbWl0OiAzMTQ4ZDBlNWIxYzU3MzNkNjllYzUxYjcwYzgyODBlNDY0ODg3
NTBhCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3
aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxh
aW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
