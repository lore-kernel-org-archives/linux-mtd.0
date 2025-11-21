Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1443BCFC279
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Nov 2025 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVeZXTYkg06Qw0ChMA9Cq0TK3u5pHEzGwZqmsgZSCGw=; b=QTubFP2QSvmR6k
	ChEmcnJIY4oPuOLQXgxRi2J74BbUlvwtM+bEU+zLhDULuBq/2usltavD/iR9Y7LiV0S71pDorjvQW
	e715fhth7uEhTH2GNSQztYUA6SUQ78HWbRQXPitocQ7JHYhfdUGgIKhnH052mnsTsn0I4Rhydca9v
	nMkGj98BSFs+nB/W+RT94PXUUuREbfxnLzFiaDy5SG6J0ZS4qLJ2IS42wfpe+MorYywO35U2cR9Hq
	w58HVot2a+QK/icBv3cvH2g79RPlNYU4rXnm3JhAVka3+rnSWRtZCY058Zw+9+pfZuF7yIWA3Mboz
	SYsADW0dRMJSuv4dNP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRvf-00000008VEI-3IUG;
	Fri, 21 Nov 2025 14:16:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRvc-00000008VDJ-0v1l
	for linux-mtd@lists.infradead.org;
	Fri, 21 Nov 2025 14:16:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 980EBC1019F;
	Fri, 21 Nov 2025 14:15:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC77A60719;
	Fri, 21 Nov 2025 14:15:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0284103721B2;
	Fri, 21 Nov 2025 15:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763734555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XGIzUaLaZRVrSbPfHE//yeEGilVOdLZVqcPFbYg9Y+4=;
	b=Jpa475cjmBN/rq5RJWqpN3qlEofCtV5t4+twhUjga30DLpkwBlxrqi2Y86TAfN3e8h5jeM
	ts6fF10DTZvoLIJJyQk1Y63s1KfDIQV376h46WE2yVD/AQFIDZ9KMWNVFVOHXXTMy5VyPa
	fsVUZ4J2E9uFpG55jUYNS8E23WsWWRfNuZXq3U0Ezm4HOqzIl7cDOUqZW5Io5TEfw/sHAC
	v3pOmxEZF4PfU6ffqdv4fXUOhWHhsva+XYxGMz08HDM3kEI415zyleuTInogCy52CgGAn3
	x/T4pFyU6+gtJ8Br+f/AHSn7Vpnjf1yuSbf4SDw0Sda4xXf4TgU/5zpUlfHBBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Russell King <linux@armlinux.org.uk>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: nand: atmel: Defer probe if SRAM is missing
In-Reply-To: <20251120-at91-probe-v2-1-8c8592f02e8e@kernel.org> (Rob Herring's
	message of "Thu, 20 Nov 2025 15:37:50 -0600")
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
	<20251120-at91-probe-v2-1-8c8592f02e8e@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 21 Nov 2025 15:15:51 +0100
Message-ID: <87pl9bzd2g.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_061600_406674_5BB4AE81 
X-CRM114-Status: UNSURE (   9.27  )
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

SGVsbG8gUm9iLAoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFu
ZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xs
ZXIuYwo+IGluZGV4IDgzYmE0ZWJkMDJkNC4uZTYwOTk4ZWI3NTRiIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiBAQCAtMjMwNiw3ICsyMzA2
LDcgQEAgYXRtZWxfaHNtY19uYW5kX2NvbnRyb2xsZXJfaW5pdChzdHJ1Y3QgYXRtZWxfaHNtY19u
YW5kX2NvbnRyb2xsZXIgKm5jKQo+ICAJCQkJCSAiYXRtZWwsbmZjLXNyYW0iLCAwKTsKPiAgCWlm
ICghbmMtPnNyYW0ucG9vbCkgewo+ICAJCWRldl9lcnIobmMtPmJhc2UuZGV2LCAiTWlzc2luZyBT
UkFNXG4iKTsKPiAtCQlyZXR1cm4gLUVOT01FTTsKPiArCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsK
CkkgYW0gdG90YWxseSBmaW5lIHdpdGggdGhlIGlkZWEgb2YgcHJvYmUgZGVmZXJyYWwsIGhvd2V2
ZXIgSSB0aGluayB0aGUKcG9saWN5IGlzIHRvIGF2b2lkIG1ha2luZyBub2lzZSB3aGVuIHRoaXMg
aGFwcGVucy4gVGhlIGRldl9lcnIoKSBjYWxsIGlzCm5vIGxvbmdlciByZWxldmFudCB0aGVyZS4g
WW91IGNhbiBlaXRoZXIgbG93ZXIgaXQgdG8gZGV2X2RiZygpIG1hbnVhbGx5Cm9yLCBhdCB5b3Vy
IGNvbnZlbmllbmNlLCByZXR1cm4gd2l0aDoKCiAgIHJldHVybiBkZXZfZXJyX3Byb2JlKG5jLT5i
YXNlLmRldiwgIk1pc3NpbmcgU1JBTVxuIiwgLUVQUk9CRV9ERUZFUik7CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
