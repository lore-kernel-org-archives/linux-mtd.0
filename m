Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039ACC10F25
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C096F2192A
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cvqecOyI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C096F2192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEEvYXeeocD7F2f3ugtwFTMDgs2b7P9YhUUAVzjXVAc=; b=cvqecOyIpcGo14
	gZsRxxvJ1k7+Fj9kGzsWvclrK1i4LbAvXFqZWYVY921VVqLTGDcrdy88O8QGqisYnBlO0dSaly1Ow
	/BDdh204nK7SwK2JOMsHD1Lga95FA1VbGyZbSaq8dSb++npzaoy3cmqnSDZ11gwjiXi5XbEO4HK/G
	aSROzcTNFxGwYg9GIhiYl8nnlct1+tmvTlgR6+WWLF0SXVbr7QJwywaYA+EVIFIabghZRWuXwXIvN
	hYKgybK65QrlYCrTeT6ENEeGu3yh42P9pBQBhlqRjunRKdsluHcMYjutR3dSciowpG3GJo5DtuDyv
	flnoOrNAIHnexVovcOuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBvzA-000317-SC; Wed, 11 Mar 2020 07:41:00 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBvz7-0002zD-OH
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 07:40:59 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 60A9F1BF205;
 Wed, 11 Mar 2020 07:40:53 +0000 (UTC)
Date: Wed, 11 Mar 2020 08:40:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
Message-ID: <20200311084052.3ca3c331@xps13>
In-Reply-To: <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_004057_922664_5029C0F2 
X-CRM114-Status: GOOD (  10.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9lLAoKSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGUgb24gVHVlLCAxMCBN
YXIgMjAyMCAyMTo1MToyNyAtMDcwMDoKCj4gQ29udmVydCB0aGUgdmFyaW91cyB1c2VzIG9mIGZh
bGx0aHJvdWdoIGNvbW1lbnRzIHRvIGZhbGx0aHJvdWdoOwo+IAo+IERvbmUgdmlhIHNjcmlwdAo+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYjU2NjAyZmNmNzlmODQ5ZTczM2U3
YjUyMWJiMGUxNzg5NWQzOTBmYS4xNTgyMjMwMzc5LmdpdC5qb2UuY29tLwo+Cj4gU2lnbmVkLW9m
Zi1ieTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYyAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbW1j
L2hvc3Qvano0NzQwX21tYy5jICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0KPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMgfCAyICstCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYyAgICAgIHwgNCArKy0tCj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzgwX2JjaC5jICAgICAgIHwgNCArKy0tCj4g
IHNvdW5kL3NvYy9jb2RlY3Mvano0NzcwLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+
ICA2IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpJIGxp
a2UgdmVyeSBtdWNoIHRoZSBuZXcgd2F5IHRvIGFkdmVydGlzZSBmb3IgZmFsbHRocm91Z2ggc3Rh
dGVtZW50cywKYnV0IEkgYW0gbm90IHdpbGxpbmcgdG8gdGFrZSBhbnkgcGF0Y2ggY29udmVydGlu
ZyBhIHNpbmdsZSBkcml2ZXIKYW55bW9yZS4gSSBoYWQgdG9vIG1hbnkgZnJvbSBHdXN0YXZvIHdo
ZW4gdGhlc2UgY29tbWVudHMgaGFkIHRvIGJlCmluc2VydGVkLiBJIHdvdWxkIHJlYWxseSBwcmVm
ZXIgYSBNVEQtd2lkZSBvciBhIE5BTkQtd2lkZSBvciBhdCBsZWFzdCBhCnJhdy1OQU5ELXdpZGUg
c2luZ2xlIHBhdGNoIChhbnl0aGluZyBpbnNpZGUgZHJpdmVycy9tdGQvbmFuZC9yYXcvKS4KCkhv
cGUgeW91J2xsIHVuZGVyc3RhbmQhCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
