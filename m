Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EC0CDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9kEiTCvM46w0Nyprpsx/YFc4NUSSraZQ0Su2/+GYWQ=; b=ewAeH7TOmis0ob
	d7whRHm0WX2CgVeyEfEtPzs1lQnOMzXdrtCPR8ab2H4L2CeEPNIozubuEEOeISxWGVCU1UKB+rMio
	qPomvpg8uzSyJbBoZevr4BlNQl74O11TYFM6mgW/ejlpz/vLfa6lEVskTz9jOe5fWpmF6I1k09ckJ
	ZZnjAdaccMCgQwIVFI2sKGEkNDcTczzUkSYu6QOZE3xlJw18/8AsZJnRABVZmF7bgEQ919zEbO/69
	R8iBEzPBqnIDPbFprtl43zAioVhwDHr+e/w4YTuZyu4/XaGCJ9qAbH1+9ilIHF02PIgLm8MWWU0rI
	ArzXpUbFGWgH/I2DhNgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsenp-00Bazu-1z;
	Tue, 17 Oct 2023 07:47:45 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsenm-00Bayh-1s
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 07:47:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4000EE0013;
	Tue, 17 Oct 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697528857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KM4KLRt+5IjihJQXo+jsfeiMylcvEg8wsmECyvz1s2w=;
	b=Be89U5XdfZrxV3tdfaRI6U03c0zVST+3R5wj9a+lldE7BTkUeeO2fPdT+64gpFJIXowRHD
	T9BbPAZEmCc7PcTZWu4XfjiLMRQgFWAgLoiKpEHiUyg55Ua0yEizvxV2VUQIO7DKUYGNaW
	QvaP7uxzbn+pdBQgkdTfPuMHCmnft29BIyll7fAScoBGGpPdCMnH4aviENb7iuH0pMK5xy
	jIkZI/5PnHiroxmOhR6NXVNhsOOHwHLezZeJ1UXLUTM3Yl8FI9AvP/Qgf9FTn0Bzfdqp5Q
	izijN3S57/VAqr7sBA883cQQBImifKC7wtkN8aNOtm/yN/fPZ1lD0aUwEs/EdQ==
Date: Tue, 17 Oct 2023 09:47:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@mail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add destructive operation
Message-ID: <20231017094733.14181153@xps-13>
In-Reply-To: <trinity-cbcf4faa-c0bd-4cac-a435-2ada79887cda-1697523547686@3c-app-mailcom-lxa03>
References: <trinity-d4b16b4a-e223-4daf-8a3e-4aaa7fc6c9cb-1697071235519@3c-app-mailcom-lxa05>
	<20231012090638.1e093fe6@xps-13>
	<trinity-902f8ae6-26e3-484b-ba2d-00946a63333a-1697132171458@3c-app-mailcom-lxa13>
	<20231013104809.15821b9f@xps-13>
	<trinity-cbcf4faa-c0bd-4cac-a435-2ada79887cda-1697523547686@3c-app-mailcom-lxa03>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_004742_909222_13FB1752 
X-CRM114-Status: GOOD (  17.31  )
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

SGkgRGF2aWQsCgpkcmVnYW5AbWFpbC5jb20gd3JvdGUgb24gVHVlLCAxNyBPY3QgMjAyMyAwODox
OTowNyArMDIwMDoKCj4gSGkgTWlxdcOobCwKPiAKPiAuLi4KPiAKPiA+ID4gPiBQbGVhc2UgdXNl
IEJvcmlzJyBrZXJuZWwub3JnIGUtbWFpbCBmb3IgdGhlIGF1dGhvcnNoaXAgYW5kIFNvQiAgICAK
PiA+ID4gICAKPiAKPiAuLi4KPiAKPiA+IAo+ID4gSXQncyBpbiAubWFpbG1hcDogYmJyZXppbGxv
bkBrZXJuZWwub3JnCj4gPiAgIAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgUmVnYW4g
PGRyZWdhbkBtYWlsLmNvbT4gICAgCj4gPiA+IAo+ID4gPiBEbyBJIHN0aWxsIGtlZXAgdGhpcyBT
T0Igb3Igc2hvdWxkIEkgY2hhbmdlIGl0IHRvIHNvbWV0aGluZyBlbHNlPyAgCj4gPiAKPiA+IFlv
dSBuZWVkIGJvdGggU29COiBoaXMgdGhlbiB5b3Vycy4KPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlx
dcOobAo+ID4gICAKPiAKPiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgaW5mb3JtYXRpb24h
Cj4gCj4gSSBiZWxpZXZlIEkgaGF2ZSB0aGUgZ2l0IHNlbmRtYWlsIGlzc3VlcyByZXNvbHZlZCwg
YW5kIEkgbWF5IGJlIHNlbmRpbmcKPiB0aGUgbmV4dCBwYXRjaCBzZXJpZXMgdmlhIGEgQnJvYWRj
b20gZW1haWwuIEluIHRoaXMgY2FzZSBzaG91bGQgSSBzZW5kCj4gdGhlIHNlcmllcyBhcyB2MyBl
dmVuIHRob3VnaCBpdCBtYXkgbm90IGxpbmsgdG8gbXkgcHJldmlvdXMgbWVzc2FnZXM/Cj4gKEFs
dGhvdWdoIGhvcGVmdWxseSB0aGUgbWVzc2FnZXMgd2lsbCBzdGF5IHRvZ2V0aGVyIGFzIGEgZ3Jv
dXAuKQoKWWVzLCBwbGVhc2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
