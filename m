Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF11CC761A6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5f2bz0f4Vz19mZ7nfb/i6/nLeLLHIJtD/83/gjaF34g=; b=IXezFK+2rnFDeJXwB/KT/H5tIu
	fB4NypJxTjdJAzdT1h5lsfBnaM1p1bNqeUioSrNBN+3Gpc4ZKGNDuT9f/MuF0mFdNWTf16a0b2wId
	uV7KkFjyPE04ejk2wCcM6Lp6ZT5SqcQPKmFkomQBxmVT8xMu2ZrOol5PTYCjTh3uynOnK6Fq+rzRB
	Y6JAT2X/GVVFi8uD5W6uln8im2dZcG+GDEqeDtB1DvcP4UXEFqbRMVYl8fhU7FrW1rcGZfiOx0Nuq
	WeM+UBQEOysVAhVsvuZEBBdl6/Wop/3ZJ2kGOAfFEu7Z7u4P6DsDH0AtJUxo23rTQyRy+uSOHBubV
	ANYsGJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJZD-00FKOx-0k;
	Mon, 03 Apr 2023 12:45:47 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJZA-00FKNj-0t
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 12:45:45 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C0CEC11EF;
	Mon,  3 Apr 2023 14:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1680525942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXqDszMZ+SLbaBvX6vkjljjzHJKV81E4AMBJVag1T+A=;
	b=jTRCXU+FfRRRPOtZ5tCHPsid1KRy87r8zyPkU/wXntp/h76JLPyU2fsHRmbJ8yIlvLAFqH
	ovu0KABGY9K9nG6DX4IPVlH5SbyrjSxwwzoScqC2AnMVyqwlbwiD41G70CwXKaOzBxA1to
	+X2B8cAbYqcKzK7KNMsI2ifFI5nyMHphnnRfOGiA8Y4DR2ZEIH+IKAQ0q77oXwBv8Y1JYO
	u9u/ow53LuAJdH6vNJHLaaexhpgMpSxGfd6xLiyKka9hgJCcseAKOgzHjn27+Tjh7IWLR9
	fnaQJ5GdtuBF5USazqTBZYeht0utV77fWGzk3tzssb/jWJ7oa+08rO34SdQiQg==
MIME-Version: 1.0
Date: Mon, 03 Apr 2023 14:45:42 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 Takahiro.Kuwano@infineon.com, bacem.daassi@infineon.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] mtd: spi-nor: core: Update name and description
 of spansion_set_4byte_addr_mode
In-Reply-To: <20230331074606.3559258-4-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
 <20230331074606.3559258-4-tudor.ambarus@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <eeb2490a71eac1ae4e55b80856f75ec6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_054544_467148_AE1D31CC 
X-CRM114-Status: GOOD (  13.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMy0wMy0zMSAwOTo0NSwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+IFJlbmFtZSBtZXRo
b2QgdG8gc3BpX25vcl9zZXRfNGJ5dGVfYWRkcl9tb2RlX2Jyd3IgYW5kIGV4dGVuZCBpdHMKPiBk
ZXNjcmlwdGlvbi4gVGhpcyBtZXRob2QgaXMgZGVzY3JpYmVkIGluIEpFU0QyMTYgQkZQVFtTRkRQ
X0RXT1JEKDE2KV0sCj4gQklUKDI4KSBhbmQgQklUKDIwKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBU
dWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jIHwgMTMgKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gaW5kZXgg
MDdiZTgxYWZkYzMzLi5lOGY2MTQxYzBlZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3Bp
LW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC01NjQs
MTUgKzU2NCwyMCBAQCBpbnQKPiBzcGlfbm9yX3NldF80Ynl0ZV9hZGRyX21vZGVfd3Jlbl9lbjRi
X2V4NGIoc3RydWN0IHNwaV9ub3IgKm5vciwgYm9vbAo+IGVuYWJsZSkKPiAgfQo+IAo+ICAvKioK
PiAtICogc3BhbnNpb25fc2V0XzRieXRlX2FkZHJfbW9kZSgpIC0gU2V0IDQtYnl0ZSBhZGRyZXNz
IG1vZGUgZm9yIAo+IFNwYW5zaW9uCj4gLSAqIGZsYXNoZXMuCj4gKyAqIHNwaV9ub3Jfc2V0XzRi
eXRlX2FkZHJfbW9kZV9icndyKCkgLSBTZXQgNC1ieXRlIGFkZHJlc3MgbW9kZSB1c2luZwo+ICsg
KgkJCVNQSU5PUl9PUF9CUldSLiBUeXBpY2FsbHkgdXNlZCBieSBTcGFuc2lvbiBmbGFzaGVzLgo+
ICAgKiBAbm9yOglwb2ludGVyIHRvICdzdHJ1Y3Qgc3BpX25vcicuCj4gICAqIEBlbmFibGU6CXRy
dWUgdG8gZW50ZXIgdGhlIDQtYnl0ZSBhZGRyZXNzIG1vZGUsIGZhbHNlIHRvIGV4aXQgdGhlIAo+
IDQtYnl0ZQo+ICAgKgkJYWRkcmVzcyBtb2RlLgo+ICAgKgo+ICsgKiA4LWJpdCB2b2xhdGlsZSBi
YW5rIHJlZ2lzdGVyIHVzZWQgdG8gZGVmaW5lIEFbMzA6QTI0XSBiaXRzLiBNU0IgCj4gKGJpdFs3
XSkgaXMKPiArICogdXNlZCB0byBlbmFibGUvZGlzYWJsZSA0LWJ5dGUgYWRkcmVzcyBtb2RlLiBX
aGVuIE1TQiBpcyBzZXQgdG8g4oCYMeKAmSwgCj4gNC1ieXRlCj4gKyAqIGFkZHJlc3MgbW9kZSBp
cyBhY3RpdmUgYW5kIEFbMzA6MjRdIGJpdHMgYXJlIGRvbuKAmXQgY2FyZS4gV3JpdGUKPiBpbnN0
cnVjdGlvbiBpcwo+ICsgKiBTUElOT1JfT1BfQlJXUigxN2gpIHdpdGggMSBieXRlIG9mIGRhdGEu
Cj4gKyAqCgpObyAidHlwaWNhbGx5IHVzZWQgYnkgc3BhbnNpb24iPyBJIGd1ZXNzIHRoZXJlIGlz
IGEgcmVhc29uIGZvciB0aGF0LgoKSW4gYW55IGNhc2U6ClJldmlld2VkLWJ5OiBNaWNoYWVsIFdh
bGxlIDxtaWNoYWVsQHdhbGxlLmNjPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
