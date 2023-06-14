Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89DDEB64DC
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 07:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2o9tLKB/R9fy8PzrmAJWAlNcNCALV80syxVM4EynI2U=; b=34cW9UJPmWMmQdJv6l57cNb10w
	anx96sPnvkEwwRuU7Yf685QrW0k6vpZAQZa2VKwE4JYRjo8ci+hp2lcIOlpsGN7vN+J48VEciEJ6q
	LgBX5gpvepACJd9HPEDgTOpAU/oPpv6LSlpdqPpMV+Oe0jO4+AwSQWVhvbgsyRLzYvL3R5ZTUycc0
	4DD5ENJfRcHttqd9MBzcJKH1gcdBpBpkdUd7ybnnRWZjA/iELl8Wv9LEpK/LHSQmoY7fOBQ8nlJ8z
	bQfrh6qsrOlrE8PDYjanV0biaUpnuKTXxWogh6eGB0bAiMBzJ+CnPLwj4Eg6ta3GXUqrA7APL+Dic
	1EYA+b+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9KYP-00AaBx-2J;
	Wed, 14 Jun 2023 07:04:29 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9KYN-00Aa9x-1K
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 07:04:28 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A274C278;
	Wed, 14 Jun 2023 09:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1686726264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KkSAV2ncVhxCJv4CMTi3Wwyuw9i5L6FUuP/MaNcbLZA=;
	b=PaIpzLgk8L6gg1Kkl+YIGpAQqfnF1uzvch8eK1b3guVeVBORfn9ZO5NexbK22KDbr+R6jW
	kwDmeeAmlb2pMy8EOgHZIByQ3TtGs59hGroCFsWQSkmSdbFWFH8iXeJAaiBu8wq9kDHS90
	2p6sp1F9dwLfR7Vc0ym84DM7ErBBRwmIopzuJmFYzPLyD1vOuMyYNMK38EW9P0zKYAOxRK
	M1bxBtLbtt2F1zBETFftUu1nk/ehtCeoZpf/yGjCXQMWyh0NMOGRh/8O3Yr/U2oLVs+gUm
	N5QYHhdIoMEJUkDS06RHNOxXpWWVy8/DMHA4gI6P2wOAxAA42/D/ZiwHBibePQ==
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 09:04:24 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add support for sst26vf032b flash
In-Reply-To: <9cc52c0a-c765-2cb1-93f2-6f406e676604@linaro.org>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
 <20230609144324.850617-3-miquel.raynal@bootlin.com>
 <b3267c392523277bf15fe8d24679add3@walle.cc>
 <9cc52c0a-c765-2cb1-93f2-6f406e676604@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6bc68bc829f171dee260d1646ba58c50@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_000427_606633_D781A5E5 
X-CRM114-Status: UNSURE (   8.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMy0wNi0xNCAwODo1Niwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+IEhpLCBNaWNoYWVs
LAo+IAo+IE9uIDYvMTMvMjMgMTQ6MzQsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+PiArwqDCoMKg
IHsgInNzdDI2dmYwMzJiIiwgSU5GTygweGJmMjY0MiwgMCwgNjQgKiAxMDI0LCA2NCkKPj4gCj4+
IFBsZWFzZSB0cnkgd2l0aCBJTkZPKDB4YmYyNjQyLCAwLCAwLCAwKS4gWW91IGNhbiBhbHNvIGhh
dmUgYSBsb29rCj4gCj4gT2gsIHllcywgSSBmb3Jnb3QgYWJvdXQgdGhpcy4gV2lsbCB5b3Ugc2Vu
ZCBhIG5ldyB2ZXJzaW9uIG9mCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2xpbnV4LW10ZC9wYXRjaC8yMDIyMDUxMDE0MDIzMi4zNTE5MTg0LTItbWljaGFlbEB3YWxsZS5j
Yy8KPiBvciB5b3UnZCBsaWtlIHNvbWVvbmUgZWxzZSB0byB0YWtlIG92ZXI/CgpOb3cgdGhhdCBJ
J20gYmFjayBmcm9tIHZhY2F0aW9uLCBJJ2xsIGdldCBiYWNrIHRvIGl0IHNvb24gOikKCi1taWNo
YWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
