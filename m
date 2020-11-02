Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81095C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:49:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E734A22268
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dgyxC5z5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E734A22268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=haQNBlKE+pK/e2OUcD8BznKBgmya89teEwhO8pMlBwg=; b=dgyxC5z542JtDAQ6Z/Q/Yb05f
	nljvcr2BIlBu9RRzw96SgxX1B250/5bfCE1245h1rD9zxCJuUySvyWoZgahueyT8YhV2ZctTg1lSP
	UW6vW6fO3bbAnfogXqFZlQ4zTIbAa89VZnSbfeM1rbyF6w4JTTbQTnAk4vfRhcGfpi5knkTHyS39x
	EEVtXWFQzZ3yzGEMnQuKleZupxqp8IbMF4jcWK5gwwtxySIYrwUREIo+kyyaYttFcf6umeOq6pfey
	YRrlSLzEiW8zFQKMXlkIca579Dd/oJSIdBtYSui1C+zL7bibCIg6/1CK719lXVQfe37aAKzP+UwBj
	d+CinAFeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZZGg-0002pk-Mf; Mon, 02 Nov 2020 12:49:02 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZZGd-0002o4-3T
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 12:48:59 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 983A5C000C;
 Mon,  2 Nov 2020 12:48:53 +0000 (UTC)
Date: Mon, 2 Nov 2020 13:48:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 20/23] mtd: nand: raw: sunxi_nand: Document 'sunxi_nfc's
 'caps' member
Message-ID: <20201102134852.28830ae7@xps13>
In-Reply-To: <20201102115406.1074327-21-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-21-lee.jones@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_074859_274992_BDB3795B 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, vigneshr@ti.com,
 Richard Weinberger <richard@nod.at>, Sergey Lapin <slapin@ossfans.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org,
 Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitriy B <rzk333@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGVlLAoKTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGUgb24gTW9uLCAg
MiBOb3YgMjAyMCAxMTo1NDowMworMDAwMDoKCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25h
bmQuYzoyNTA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2NhcHMnIG5v
dCBkZXNjcmliZWQgaW4gJ3N1bnhpX25mYycKPiAKPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5v
ZC5hdD4KPiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+IENjOiBN
YXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IENoZW4tWXUgVHNhaSA8d2Vu
c0Bjc2llLm9yZz4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4K
PiBDYzogQm9yaXMgQlJFWklMTE9OIDxiLmJyZXppbGxvbi5kZXZAZ21haWwuY29tPgo+IENjOiBR
aWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KPiBDYzogRG1pdHJpeSBCIDxyemszMzNAZ21haWwu
Y29tPgo+IENjOiBTZXJnZXkgTGFwaW4gPHNsYXBpbkBvc3NmYW5zLm9yZz4KPiBDYzogbGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5k
LmMgfCAxICsKCldvdWxkIHlvdSBtaW5kIHVwZGF0aW5nIGFsbCBjb21taXQgdGl0bGVzIHdpdGgg
dGhlIGZvbGxvd2luZyBsb2dpYzoKCnMvbmFuZDogcmF3Oi9yYXduYW5kOi8KCk90aGVyd2lzZSBJ
IGFtIGZpbmUgd2l0aCBhbGwgdGhlIHBhdGNoZXMgd2hlcmUgSSBkaWQgbm90IHJlc3BvbmQuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
