Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9C5C25B48
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBhESXzh4knhKKVOAiv88fOA2YtAUrNOYW9eQCKPM2I=; b=4SvcDvaWoWLWyH
	ijNsUnZDBhpeBnGQBkfmhpGmfCVGF/amf0O/mzgmjPhGVZ5Tr3z2tu+0Kb/erwkA6hD2c8rf5nosw
	xqUHVe31N2KXNgpqCW27QjYDoRzxrrIqlPTW9rReh7JPI13BznpxC546gfZ7k3JWETl8DYdn8oYRQ
	wAL6s6VH2Eqbs2iWRGQrwf/KaB9+hCPuAp2FzG5z2hsXFeyp0omRUDZrElqjQyBz8zOV9ePBVMfX2
	UgaOcSR4ydlBy1E4LUE2lwrybAnCuDuct6JrN1cnykLs9cTBYt8GzvN6VcLIGsPoVmzq6RhKklPYJ
	FT6JcYPipgGXkUMHlxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQsS-00GqZU-2e;
	Fri, 27 Oct 2023 17:44:08 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQsP-00GqZA-2j
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 17:44:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 466D240003;
	Fri, 27 Oct 2023 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698428641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzSoWah2f/yxxqWuzCrwKWRU7HTwwqNC+4WUvYEdULc=;
	b=UZ9KZxLDQfBwoE08HU+LcEBxlS3jQ1FBfbo+T1R5xI9XudtFNSREKsZwrzRWiv7J/gG8pC
	H7UmB2V2n1ODlkxzdR0xgG0QArSA1pViLxmX5McOK7PH82DVscT3qBARBhZe0b5hxlttRy
	8XO8D6hOLrZeruSL92HGvjNk7xLxrxKi9ZkovyFseyV1ynRIOSIx0b/BOOJHjzyamNfJCv
	OJ+QJjNVYKEJc0MLwnC9MbnI1phdpbAaQtSIVF6p+5Z5JQf+yfhCEdez9/suFXrz+Fts0+
	SOyIp/5NS/qJpUlsUAjwyfD72DQlLxl3t/55yNjFIv2Yc0K3d56vLvGvvcGMwA==
Date: Fri, 27 Oct 2023 19:43:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: haibo.chen@nxp.com
Cc: richard@nod.at, vigneshr@ti.com, olivier.maignial@hotmail.fr,
 linux-imx@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: winbond: Add support for W25N02KW
Message-ID: <20231027194358.432a744a@xps-13>
In-Reply-To: <20231020113202.2782891-1-haibo.chen@nxp.com>
References: <20231020113202.2782891-1-haibo.chen@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_104406_023083_6179B351 
X-CRM114-Status: GOOD (  11.48  )
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

SGVsbG8sCgpoYWliby5jaGVuQG54cC5jb20gd3JvdGUgb24gRnJpLCAyMCBPY3QgMjAyMyAxOToz
MjowMiArMDgwMDoKCj4gRnJvbTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPgo+IAo+
IEFkZCB0aGUgbmVjZXNzYXJ5IGluZm8gdG8gc3VwcG9ydCBXMjVOMDJLVy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL25hbmQvc3BpL3dpbmJvbmQuYyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2lu
Ym9uZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCj4gaW5kZXggZjUwN2UzNzU5
MzAxLi41Yzc1OTY1NmM0ZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2lu
Ym9uZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCj4gQEAgLTE2OSw2
ICsxNjksMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX2luZm8gd2luYm9uZF9zcGlu
YW5kX3RhYmxlW10gPSB7Cj4gIAkJCQkJICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCj4g
IAkJICAgICAwLAo+ICAJCSAgICAgU1BJTkFORF9FQ0NJTkZPKCZ3MjVuMDJrdl9vb2JsYXlvdXQs
IHcyNW4wMmt2X2VjY19nZXRfc3RhdHVzKSksCj4gKwlTUElOQU5EX0lORk8oIlcyNU4wMktXIiwK
PiArCQkgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwg
MHhiYSwgMHgyMiksCj4gKwkJICAgICBOQU5EX01FTU9SRygxLCAyMDQ4LCAxMjgsIDY0LCAyMDQ4
LCA0MCwgMSwgMSwgMSksCj4gKwkJICAgICBOQU5EX0VDQ1JFUSg4LCA1MTIpLAo+ICsJCSAgICAg
U1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ICsJCQkJCSAg
ICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKPiArCQkJCQkgICAgICAmdXBkYXRlX2NhY2hlX3Zh
cmlhbnRzKSwKPiArCQkgICAgIDAsCj4gKwkJICAgICBTUElOQU5EX0VDQ0lORk8oJncyNW4wMmt2
X29vYmxheW91dCwgdzI1bjAya3ZfZWNjX2dldF9zdGF0dXMpKSwKPiAgfTsKPiAgCj4gIHN0YXRp
YyBpbnQgd2luYm9uZF9zcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
KQoKVGhlIHBhdGNoIGRpZCBub3QgYXBwbHkgY29ycmVjdGx5IG9uIG15IHRyZWUuIFBsZWFzZSB3
YWl0IGZvciAtcmMxLApyZWJhc2UgYW5kIHJlLXN1Ym1pdC4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
