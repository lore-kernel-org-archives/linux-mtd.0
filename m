Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6B2CA9EDE
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HW1TY5ZAyDq847Ody+a6WoysWenVTcCYxG9EVvt5PxQ=; b=v9KLsGObBQLrK8
	AjD3OIFHVPKY2dhmE5A3Ig/861hKeqZq698pQlSlsUU1KW8g0bZ6UgUM224j7c99/xUTMRF58jxTd
	LypnCcu1KiyFqMOi1BSRgjg32mE7LFvsdUXjTZD1+zGBtRm92oGNMve9KosWvX3jr6UkE0hgmF9xS
	kL9XAtlA+Q1WddTOrM72CD+5T8+ahjzkmJxwEHlO4mR5eGF301zSDPwuN8hSxZ+odKQJJwXFap38e
	xRCGTX9UosS6oWubbtxVsTqsYXmy1oX8k4kzI7H/GsDykzdewCRPhldGfLNdbI/rqk9CWP2t1RWis
	PUxUf/67Foeqb4gXhBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKe1-0000000BDBi-2T3V;
	Mon, 12 Oct 2026 18:21:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKdz-0000000BDAQ-307d
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:21:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D30144E411FE;
	Mon, 12 Oct 2026 18:21:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A57FB601A6;
	Mon, 12 Oct 2026 18:21:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 436DD11D70CC1;
	Mon, 12 Oct 2026 20:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P/L02SlBz+A++KZb1a49p5CTI9HjuYhf4KaDbAR2TNI=;
	b=IzvzsRrqjtvS1DQ+6EEwc247S6/p0wmOZKTmkeiPelGv4sdhjuq5b70ZJZuHffxpR8auiK
	a1fdlGCgbmTzRYMRz1ewfZEK4R+tsDY+oneLNiULY8zamxPZxyvQmAhsB3JTkZAqPfu6C6
	WTlSVxDbnA/Ssh1unL13X/KlHvXIe3b0h9dKPPoXzInbXLtKv5v3jTzFPn9VQ1/hlmZ+Nx
	K/RYOuNpoadoI8PaLZPQp7RZLY+zisQI9oIND0CVTpOxQeMeLrG12Nt7cGjJeTASxrFEly
	BwS+qws5Z9wbgP4/tP+j17Rt79zWBMJ5mkTEf3sggVujUHqIhOYbpTOMgXUXzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260928200729.44594-1-rosenp@gmail.com>
References: <20260928200729.44594-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: allocate shared ctrl with
 devm_kzalloc
Message-Id: <179182925620.590599.4853901949776767576.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:20:56 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112103_900044_19089EF4 
X-CRM114-Status: UNSURE (   6.46  )
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

T24gTW9uLCAyOCBTZXAgMjAyNiAxMzowNzoyOSAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
QWxsb2NhdGUgdGhlIHNoYXJlZCBmc2xfaWZjX25hbmRfY3RybCBzdHJ1Y3R1cmUgYWdhaW5zdCB0
aGUgY29udHJvbGxlcgo+IGRldmljZSwgd2hpY2ggb3V0bGl2ZXMgYWxsIE5BTkQgY2hpbGQgZGV2
aWNlcywgc28gaXQgaXMgZnJlZWQKPiBhdXRvbWF0aWNhbGx5LiAgVGhpcyBkcm9wcyB0aGUgbWFu
dWFsIGtmcmVlKCkgYW5kIHRoZSBicm9rZW4gY2hpcAo+IGNvdW50ZXIgdGhhdCB3YXMgZGVjcmVt
ZW50ZWQgaW4gcmVtb3ZlKCkgYnV0IG5ldmVyIGluY3JlbWVudGVkCj4gYW55d2hlcmUsIGxlYWtp
bmcgdGhlIHN0cnVjdHVyZSBhbmQgbGVhdmluZyB0aGUgZnJlZWQgcG9pbnRlciBpbgo+IGN0cmwt
Pm5hbmQgb24gcmUtcHJvYmUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGZzbF9pZmM6IGFsbG9jYXRlIHNoYXJlZCBjdHJsIHdp
dGggZGV2bV9remFsbG9jCiAgICAgIGNvbW1pdDogMTA0ZjI3N2U4YTQ2OWY3MWFjM2M3NGEwZTll
YmI4YmY2NGMzZmEwNgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4
LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJv
Ym90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
