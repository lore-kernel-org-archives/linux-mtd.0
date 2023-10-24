Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A713C07545
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 16:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+KvGgPxwf7WKVPGW/7piu3Sb5Uvnj36lqe2Blx895k=; b=eqiovNF29z9izKnR1NotrQDVWN
	7dwtHLehc3YCMCjcB3s29bplSOVl8eY72FMM0zzvbsyBKJ7/PcUVELp4Dq6jBry3oUwyBaGSmx8I5
	+53HXcXfjSjhliP13l9eN1wFCG44UNp2Df24mFGWUsZcHtdt7n9TX27Wn5tw/p8KnTl8qJXyo6ipZ
	XwkYGG3VvWJbSlS4M11ci6ZgxotSEOH84dDtVoTyRBHqlbEqA+R0AaeCQo2QjbJ7kdWF/cfW4B8w2
	Dis4kiR7BmSy0pjRO9bMgaG+DEz8QaOJ12z21Ds6A4k3WwaWFLeoXR+sQNB73X9Wse5szx3N9a8+b
	JNYYkYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKOr-00AVvV-1P;
	Tue, 24 Oct 2023 16:37:01 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKOn-00AVsZ-1F
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 16:37:00 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D6B2FFF;
	Tue, 24 Oct 2023 18:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698165412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HXvgD/l4jJRnWwfK9S1cFuBobgafBIXvpcCdZcGjEUE=;
	b=jO79WnPLshc2vFWd8CfpCLPjvtZLYfbB8oRECw2mnqLwjEShwMGlIVycs8+/KvAT2n3vWe
	Ydp/rJFGaz6nmcJaZpkea576jH3jFKAvbGXbLAA9cwTZUrYGd2ZM0zxdyKkxtLJHDQw5un
	ZKJNSlm3Cz7pREqOHDkU3neixOjASLlZ7zELn+euSbbsCPp25Jem7OgmYzDjrW14xRfB1P
	mtlF/z5HpeVzNbqQt/VBhf5EuEngfk7WeJPxsr64bW+sDFqA7a1ziKgkByJYoaWGmD0VIK
	miltdB/VN8E/D5Ldiz/wE5oWTOCVcJJsMOz9+ah3lvJEDtDfcqNkMuz0rHwGOQ==
MIME-Version: 1.0
Date: Tue, 24 Oct 2023 18:36:52 +0200
From: Michael Walle <michael@walle.cc>
To: Fabio Estevam <festevam@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <festevam@denx.de>,
 tkuw584924@gmail.com
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
In-Reply-To: <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com>
References: <20231023213800.2599704-1-festevam@gmail.com>
 <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
 <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc>
 <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
 <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org>
 <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com>
Message-ID: <4e2de38da5a3e492eac522b9a68141c7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_093657_578086_06595717 
X-CRM114-Status: GOOD (  11.61  )
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

QW0gMjAyMy0xMC0yNCAxODoyMCwgc2NocmllYiBGYWJpbyBFc3RldmFtOgo+IE9uIFR1ZSwgT2N0
IDI0LCAyMDIzIGF0IDEyOjUz4oCvUE0gVHVkb3IgQW1iYXJ1cyAKPiA8dHVkb3IuYW1iYXJ1c0Bs
aW5hcm8ub3JnPiB3cm90ZToKPiAKPj4gZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMsIHNlYXJj
aCBmb3Igbl9kaWNlLiBzcGlfbm9yX3BhcnNlX3NjY3JfbWMoKQo+IAo+IE9uIG15IHRlc3RzLCBz
cGlfbm9yX3BhcnNlX3NjY3JfbWMoKSBuZXZlciBnZXRzIGNhbGxlZC4KPiAKPiBJbiB0aGUgJ3N3
aXRjaCAoU0ZEUF9QQVJBTV9IRUFERVJfSUQocGFyYW1faGVhZGVyKSknIHRoZSBmb2xsb3dpbmcK
PiBjYXNlIGlzIHJlYWNoZWQuCj4gCj4gY2FzZSBTRkRQXzRCQUlUX0lEOgo+IGVyciA9IHNwaV9u
b3JfcGFyc2VfNGJhaXQobm9yLCBwYXJhbV9oZWFkZXIpOwo+IGJyZWFrOwo+IAo+IHNvIHNwaV9u
b3JfcGFyc2Vfc2Njcl9tYygpIGRvZXMgbm90IHJ1bi4KPiAKPiBXaGF0IHNob3VsZCBiZSBkb25l
IHRvIGdldCBzcGlfbm9yX3BhcnNlX3NjY3JfbWMoKSBjYWxsZWQ/CgpNaGgsIHRoYXQncyBhIHBp
dHkuIEl0IHNlZW1zIHRoYXQgeW91ciBTRkRQIGluIHRoZSBmbGFzaCBkb2Vzbid0CmNvbnRhaW4g
dGhhdCB0YWJsZS4gSSBoYXZlbid0IGNvbmZpcm1lZCBpdCBieSBsb29raW5nIGF0IHlvdXIgZHVt
cAphcyBJJ20gYWJvdXQgdG8gZ28gb24gdmFjYXRpb24gdG9tb3Jyb3cgYW5kIHBhY2tpbmcgcmln
aHQgbm93LgoKV2hhdCBkbyB3ZSBkbyBpbiB0aGF0IGNhc2UsIFR1ZG9yPyBJIHByZXN1bWUgYSBm
aXh1cCB3aGljaCBzZXRzIG5fZGljZQooYW55IG1heWJlIG90aGVycykgdG8gdGhlIGNvcnJlY3Qg
dmFsdWU/CgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
