Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C46C02185
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWs89SgKRuu4m2Sf/l87l3ixLOyYvQYag2XmZYENzFI=; b=uxKmptI3OZ1Daa
	X4UGG05B5qKoJmYAHzJ4uONOobrvguZ9fIfQgwwu/0dlnMqf2fCb1gDZn8ZprTJwFxMqxevgPn1cl
	B6914zIKXvB/2U4CMSmeYIWZ7Dwo8PWUkJ4ak0dyQlwnMJSuoTc8xcD1AUYpE683oKuFvsFxg5GJK
	cJhZmncNzJP3PNWs7S59al49gsMMduOxGq02t50K2L3MfoIbYCRsCaQYqbKmvlJYRb17i2pLCp8B6
	GJ0JYNXOnKlamOrjgpwc1GmvhnbkmO3rl45SQ0RW+8g8H8qY3ZbHm9tbeL6w8retsQhoP5VQtHT+l
	eC1HnaMVpJMR3k+PSm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7t8-0000000Cixm-3hbB;
	Wed, 15 Jan 2025 18:13:10 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7t5-0000000Civz-3ufp
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 18:13:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0D701BF203;
	Wed, 15 Jan 2025 18:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736964785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fLuSuJY26qBFrUcjMOhARxUG2675XtT2c5knLWONJU4=;
	b=Xr7UsB/Rmrp07azwkCb98rp0SdToiehaZg4op02AO51xiLblYH/0iW5/jhEXlQ6p1sdINr
	Hw3HJ3UHSY3CfvHnC4Vk2x77EkcTOO4Aa3gWv0/LOxYOUC9ZFnodi+BghqAqnIpJ5HW+zq
	uVtETJdRx2qMVlITk0+K7jfQNsEk12I2tnzen+rPZtp5MaNtrs9r/nVldagpTX9yOh67tJ
	gzIGDGwsElxZ4UhHtcIU7JVqrB/LFvBtBiqJYlL/Yor4oktvBxUq/ZrszZ34bT1yG9WMbn
	O4RMrkBHHOqB4c19Xt2qlUgkHh1/erZHSajDEoBoZ+iLuhEJAHtjmHsfAPMSKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?=27Uwe_Kleine-K=C3=B6nig=27?= <u.kleine-koenig@baylibre.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250109155233.59162-1-rgallaispou@gmail.com>
References: <20250109155233.59162-1-rgallaispou@gmail.com>
Subject: Re: [PATCH v2] mtd: st_spi_fsm: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Message-Id: <173696478471.430821.15297575874535215673.b4-ty@bootlin.com>
Date: Wed, 15 Jan 2025 19:13:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_101308_100447_4C8988ED 
X-CRM114-Status: UNSURE (   6.27  )
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

T24gVGh1LCAwOSBKYW4gMjAyNSAxNjo1MjozMyArMDEwMCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3
cm90ZToKPiBMZXR0aW5nIHRoZSBjb21waWxlciByZW1vdmUgdGhlc2UgZnVuY3Rpb25zIHdoZW4g
dGhlIGtlcm5lbCBpcyBidWlsdAo+IHdpdGhvdXQgQ09ORklHX1BNX1NMRUVQIHN1cHBvcnQgaXMg
c2ltcGxlciBhbmQgbGVzcyBlcnJvciBwcm9uZSB0aGFuIHRoZQo+IHVzZSBvZiAjaWZkZWYgYmFz
ZWQga2VybmVsIGNvbmZpZ3VyYXRpb24gZ3VhcmRzLgo+IAo+IAoKQXBwbGllZCB0byBtdGQvbmV4
dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBzdF9zcGlfZnNtOiBTd2l0Y2ggZnJvbSBDT05GSUdfUE1f
U0xFRVAgZ3VhcmRzIHRvIHBtX3NsZWVwX3B0cigpCiAgICAgIGNvbW1pdDogMjliOTQxNTg4OWQ0
MmU2YTMyZWFkODljZjg5N2Y2NTY5NmQzY2I0NwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFi
bGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92
aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlx
dcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
