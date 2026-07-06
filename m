Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8948C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBDo3YH36TpgFl403P4VcdcYkwm8/dOto3rbqRYrO30=; b=sWsha3Ec/+ufFB
	JZmMJWDL83oEkX6hZuAwGyPUcsurv+0OIzPDPyTu63XjDgeZzpi1D2hH3xpIcOoXj+ead745TzM7l
	wBMwMnWrHJZ29vGPkzkBrNgYuw8hsaGnIhnGpcp3d8ETzVE7nx4/6zAkYDbPJVDgKXutIbPWNx0I4
	5SRy/wyqYpM+MPMnuSI9QEl9brV8E3KXLls91hiU2bj+XJb6/1U83w2bQRmEKsMMrOEK15V1487Ib
	hCGq8XS5/lvgIWIZFA54fLG3D9UZJc8aXUwyFEeUHpGHI+go72LadSzwxq4hHwcoNpyRCP+bhcvnX
	7pVNNgkqX2+q5aAB6Mig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckf-0000000Bbnf-16Ps;
	Mon, 06 Jul 2026 06:24:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckb-0000000Bblw-0ohT
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7C572C8EC60;
	Mon,  6 Jul 2026 06:24:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D9D5601A2;
	Mon,  6 Jul 2026 06:24:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4E0B11BB98B6;
	Mon,  6 Jul 2026 08:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VcgM/r5fxNKDcnrMZFp/nZNu9mcp69iHtqNVfscn3Wg=;
	b=V4VgfrQOGwi51S0UUgFbyN9qYUPIRjKTHyh+wvk1JBONVLpMFNn1u728wPT0YVDvpzVpt+
	vX+wtmMLaUZTmYgvkDmw33UkMmQyr0pWcCiBS5g92iuFMInwpWrKbA0QitY5BdFzzooFgZ
	PNkNvryiwIftCArYw17d5IKyrA01oetdS6bDpwhYttI+evG+OIIyTydugyYUxFZO171PG1
	SJf5XYHyv34CTnQe0lYoElRVLjDvFnwuM9rXdiuB+00URJ0lgmkb+e1OvGG/TKbWznw5PH
	aBkVCYO53VJXK2RaD8fKoSSNw2Uq/FG0LebZITDoBP8yw2QEodp4Z9cZgzO2rQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260601125438.3481722-1-mwalle@kernel.org>
References: <20260601125438.3481722-1-mwalle@kernel.org>
Subject: Re: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
Message-Id: <178331904816.868671.4599503585231715805.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232417_428581_8878C537 
X-CRM114-Status: GOOD (  11.13  )
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

T24gTW9uLCAwMSBKdW4gMjAyNiAxNDo1Mjo0MiArMDIwMCwgTWljaGFlbCBXYWxsZSB3cm90ZToK
PiBUcnkgdG8gc2ltcGxpZnkgdGhlIGZsYXNoIGluaXRpYWxpemF0aW9uIGFuZCBnZXQgcmlkIG9m
IHRoZSBsZWdhY3kKPiBoYW5kbGluZy4gQXMgZGVmYXVsdCwgYWxsIHRoZSBmbGFncyBvZiB0aGUg
aW4ta2VybmVsIGRhdGFiYXNlIGFyZQo+IHRha2VuIGFuZCBhbWVuZGVkIHdpdGggdGhlIFNGRFAg
ZGF0YS4KPiAKPiBUaGlzIG1pZ2h0IGhhdmUgdGhlIGNvbnNlcXVlbmNlIHRoYXQgYWxsIHRoZSBm
bGFzaGVzIG5vdyBnZXQgYQo+IFJEU0ZQRCBvcGNvZGUgd2hpY2ggbWlnaHQgYmUgYW4gdW5rbm93
biBvcGNvZGUuIEJ1dCB0aGF0IHdhcyBhbHJlYWR5Cj4gdGhlIGNhc2UgZm9yIGFueSBmbGFzaGVz
IHdoaWNoIHdlcmUgdW5rbm93biB0byB0aGUgbGludXgga2VybmVsLiBTbwo+IGZhciwgdGhlcmUg
d2FzIG5vdCBhIHNpbmdsZSBjb21wbGFpbnQuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL2Zp
eGVzLCB0aGFua3MhCgpbMS8zXSBtdGQ6IHNwaS1ub3I6IHNwYW5zaW9uOiBzMjVmbDI1NnMwOiBy
ZW1vdmUgU0tJUF9TRkRQIGZsYWcKICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMi8zXSBtdGQ6IHNw
aS1ub3I6IGRvbid0IGNsZWFyIHRoZSBTTk9SX0ZfNEJfT1BDT0RFUyBmbGFnIG9uIGZhaWx1cmUK
ICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMy8zXSBtdGQ6IHNwaS1ub3I6IHJld29yayBmbGFzaCBw
YXJhbWV0ZXIgaW5pdGlhbGl6YXRpb24KICAgICAgKG5vIGNvbW1pdCBpbmZvKQoKUGF0Y2hlKHMp
IHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9m
IHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4K
CktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
