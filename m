Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F52EC4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:17:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C25761181
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C25761181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCJLu0o7IP75Oh2oFiatsmGz0IPr0mSF3z8+QINARpY=; b=QLi+d6k87jXIw4
	Y3VSM+btXRc2OBc9zyuizr4zTh2TfZBBHpuEb/e+gHQ1d6PdQiuPUXnQAEpsPSzG42sLeeYjC39xV
	CG617R2d6x5NLs5tD16YR1Awcpe2g7S8SRszzL00cVDUf7EZw2lRX7ZR2JOqfqS0mf7+5fbXaCDEQ
	NrdehPvGVn7lJUQU/ML4R9k3pgD034N3DkCzn4N+zsNh0cqYR3U6kTrxMNTy609yme+UnHbzyD7kb
	6MG1ldgiThyZLFakt4vfH/KlKPq0nmmg2MLg/ENoo52CK7BZGVgknyvqlNHVy4cvHfCnogAZ91zhV
	B4h1oSFCWJW0Lamfi07g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC4Oa-00D6xs-1y; Fri, 06 Aug 2021 18:16:36 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC4OX-00D6xM-48
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 18:16:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 63419C0009;
 Fri,  6 Aug 2021 18:16:30 +0000 (UTC)
Date: Fri, 6 Aug 2021 20:16:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Young <sean@mess.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/4] mtd: rfd_ftl: allow use of MTD_RAM for testing
 purposes
Message-ID: <20210806201629.0aaf6cc6@xps13>
In-Reply-To: <5f9ca4ce43ab49e900339e2cef26782825e3ab6f.1626169090.git.sean@mess.org>
References: <cover.1626169090.git.sean@mess.org>
 <5f9ca4ce43ab49e900339e2cef26782825e3ab6f.1626169090.git.sean@mess.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_111633_345893_1186EB74 
X-CRM114-Status: GOOD (  16.88  )
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

SGkgU2VhbiwKClNlYW4gWW91bmcgPHNlYW5AbWVzcy5vcmc+IHdyb3RlIG9uIFR1ZSwgMTMgSnVs
IDIwMjEgMTA6NDQ6MDAgKzAxMDA6CgpZb3UgbWlzcyBhIGNvbW1pdCBtZXNzYWdlIGhlcmUuCgpJ
cyB0aGlzIGEgcmVhbCBwYXRjaCBvciBqdXN0IHNvbWV0aGluZyBmb3IgZGVidWdnaW5nIHB1cnBv
c2UgdGhhdCB3ZQpzaG91bGQga2VlcCBvdXQgb2YgdHJlZT8gSSBkb24ndCByZWFsbHkgc2VlIHRo
ZSByZWFzb24gZm9yIHRoaXMgcGF0Y2gKZXZlbiB0aG91Z2ggSSBhbSBub3Qgc3Ryb25nbHkgb3Bw
b3NlZCB0byBpdC4KCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBZb3VuZyA8c2VhbkBtZXNzLm9yZz4K
PiAtLS0KPiAgZHJpdmVycy9tdGQvcmZkX2Z0bC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9yZmRfZnRsLmMgYi9kcml2ZXJzL210ZC9yZmRfZnRsLmMKPiBpbmRleCA2ZTBkNWNlOWIw
MTAuLjdiMjQzZjJiMmZhMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9yZmRfZnRsLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9yZmRfZnRsLmMKPiBAQCAtNzIwLDcgKzcyMCw4IEBAIHN0YXRpYyB2
b2lkIHJmZF9mdGxfYWRkX210ZChzdHJ1Y3QgbXRkX2Jsa3RyYW5zX29wcyAqdHIsIHN0cnVjdCBt
dGRfaW5mbyAqbXRkKQo+ICB7Cj4gIAlzdHJ1Y3QgcGFydGl0aW9uICpwYXJ0Owo+ICAKPiAtCWlm
IChtdGQtPnR5cGUgIT0gTVREX05PUkZMQVNIIHx8IG10ZC0+c2l6ZSA+IFVJTlRfTUFYKQo+ICsJ
aWYgKChtdGQtPnR5cGUgIT0gTVREX05PUkZMQVNIICYmIG10ZC0+dHlwZSAhPSBNVERfUkFNKSB8
fAo+ICsJICAgIG10ZC0+c2l6ZSA+IFVJTlRfTUFYKQo+ICAJCXJldHVybjsKPiAgCj4gIAlwYXJ0
ID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHBhcnRpdGlvbiksIEdGUF9LRVJORUwpOwoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
