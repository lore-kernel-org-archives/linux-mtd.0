Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BE6CAC5B9
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjnQMkaP5N0C/0KrhFfNklHijiaaC3+aJRt6+daXGeE=; b=YTyscbO8AI5kG1
	yLWuyRr5nBIxY1YR10Z8NFe2l0mDcWzdNvZOkmW4nenJJ1yhxgm3cvCuoL1nKS2iTJqlNzZ5xanWs
	6LNgo6a2Izi5PGDVmL4TP63zwvnAd37OeLh/rXJn46a8b53gM4RpUjYRxwVvxYM9yBh5X/Uif9pqd
	Wce7lonSDnzDh+FP3RmzuV1KAp4wQPjFxKALtrQyZO0rTtqJjV2XoRUAUdC2FGKBFK/LhKmf1msQF
	WydnGw9kZdBE/LxFOVyyMg+XnBzo0mgVCHdYDRori9BExzVR6YmLO54TmxrSeD1w0lHXCGasLbF+d
	fQdDjUYnJ7LZegJo5awA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GEK-00000002rTL-1aSQ;
	Mon, 29 Sep 2025 15:56:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GEH-00000002rRB-0dmx
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 15:55:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AFCD44E40D3E
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2025 15:55:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87324606AE;
	Mon, 29 Sep 2025 15:55:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A909102F198F;
	Mon, 29 Sep 2025 17:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vo4QfhD98L8b58KoDVJk9jRcoE5N2oLtCd0bb1BghPw=;
	b=Aoiv0H7a+tE1fllLiatpWiOhyfR6Nih+buSSLBvfymK3Xc3I4nHglWrZtS31S1P9IJp7B3
	vp3h4a4hLoWk2L48j43Uveev5k9baoVPXKe8dAEF8v4XzvBo+MxZapnEjmSZ6qprAs6+iC
	tdKeKCAK4K4c6Yn0RWUHb9xSQg/EIbYugqFhcyijKHy8ZlU4AfCboOokVuOUvi9go/i0kX
	H1NCzfTd/fBJYwQmpU6L7GxdTBWk5aN6iTSJ4xkqRUkYU4SlLBZVhReVEepQ+317t1b5Ak
	GYOwEuDeV7YuEAuisCSqrmsKzwfLUWWNP+qo0rB46rFXeKGbzFI2uKOlxgSe4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
In-Reply-To: <20250922110727.1423318-1-karanja99erick@gmail.com>
References: <20250922110727.1423318-1-karanja99erick@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix error handling path in
 atmel_nand_controller_add_nands
Message-Id: <175916134713.50416.13477111980143091827.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 17:55:47 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085557_324059_1A4106F0 
X-CRM114-Status: UNSURE (   7.16  )
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

T24gTW9uLCAyMiBTZXAgMjAyNSAxNDowNzoyNyArMDMwMCwgRXJpY2sgS2FyYW5qYSB3cm90ZToK
PiBJbiBjYXNlIG9mIGEganVtcCB0byB0aGUgIGVyciBsYWJlbCBkdWUgdG8gYXRtZWxfbmFuZF9j
cmVhdGUoKSBvcgo+IGF0bWVsX25hbmRfY29udHJvbGxlcl9hZGRfbmFuZCgpIGZhaWx1cmUsIHRo
ZSByZWZlcmVuY2UgdG8gbmFuZF9ucAo+IG5lZWQgdG8gYmUgcmVsZWFzZWQKPiAKPiBVc2UgZm9y
X2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQoKSB0byBmaXggdGhlIGlzc3VlLgo+IAo+IEZpeGVz
OiBmODhmYzEyMmNjMzQgKCJtdGQ6IG5hbmQ6IENsZWFudXAvcmV3b3JrIHRoZSBhdG1lbF9uYW5k
IGRyaXZlciIpCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8x
XSBtdGQ6IHJhd25hbmQ6IGF0bWVsOiBGaXggZXJyb3IgaGFuZGxpbmcgcGF0aCBpbiBhdG1lbF9u
YW5kX2NvbnRyb2xsZXJfYWRkX25hbmRzCiAgICAgIGNvbW1pdDogOGVkNDcyOGViOWYxMGI1N2Mz
ZWIwMmUwZjY5MzNhODlmZmNiOGE5MQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24g
bXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0
aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
