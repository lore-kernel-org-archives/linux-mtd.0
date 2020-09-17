Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9A7C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:30:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4209B22224
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vAMOZKb6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4209B22224
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fLUUu+MV8pIJw767lMsHxtABEciPv5PnP73OzO+l5u4=; b=vAMOZKb6vkXwiIaVzScO1BKj+
	7DgQhWk04mex5qRIUZfzAerT+OGItbxJ53Ao2EVsVjTq8jSirCncKETA/iLfOZRAYQi+26K8AoWhx
	aBo1Oiuf5mBBy95tStashOzH2L/3Fw85wSQsAwHxJ3jKfCp+ReOzhhk8nClP7EGM+nRG5MM+dZZhj
	4Oei5X9smGPsRX3v9l6fAzPXlnZ0RrE9ZxsBz8B4hpq5KRdbC7uJPnOc7GZsq5USp3MNMuCYAQ+Zo
	yNmUrxlrIfRPY/MwJQKeeJT6bxWJhpJv8G2Z0tHlTzTy2PYg7s9TiXv7sV8h5DqH459dhD77jFcZB
	j4JiBckdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIwnY-0003V2-KL; Thu, 17 Sep 2020 16:30:16 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIwnT-0003U3-Ts; Thu, 17 Sep 2020 16:30:12 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E6D0F1BF217;
 Thu, 17 Sep 2020 16:30:02 +0000 (UTC)
Date: Thu, 17 Sep 2020 18:30:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Evgeny Novikov <novikov@ispras.ru>
Subject: Re: [PATCH] mtd: rawnand: mtk: avoid underflow in
 mtk_nfc_nand_chip_init()
Message-ID: <20200917183001.393245e8@xps13>
In-Reply-To: <20200916194045.6378-1-novikov@ispras.ru>
References: <20200916194045.6378-1-novikov@ispras.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_123012_082204_C40A41AE 
X-CRM114-Status: GOOD (  18.33  )
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
Cc: ldv-project@linuxtesting.org, Vignesh Raghavendra <vigneshr@ti.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRXZnZW55LAoKRXZnZW55IE5vdmlrb3YgPG5vdmlrb3ZAaXNwcmFzLnJ1PiB3cm90ZSBvbiBX
ZWQsIDE2IFNlcCAyMDIwIDIyOjQwOjQ1CiswMzAwOgoKPiBJZiBvZl9nZXRfcHJvcGVydHkoKSB3
aWxsIHNldCBuc2VscyB0byBuZWdhdGl2ZSB2YWx1ZXMgdGhlIGRyaXZlciBtYXkKCklzIHRoaXMg
cmVhbGx5IGEgcG9zc2libGUgY2FzZT8KCkxvb2tpbmcgYXQgdGhlIE9GIGNvZGUsIEkgZG9uJ3Qg
dGhpbmsgaXQgY2FuIGV2ZXIgaGFwcGVuLi4uCgo+IGFsbG9jYXRlIGluc3VmZmljaWVudCBtZW1v
cnkgZm9yIGNoaXAuIE1vcmVvdmVyLCB0aGVyZSBtYXkgYmUgdW5kZXJmbG93Cj4gZm9yIGRldm1f
a3phbGxvYygpLiBUaGlzIGNhbiByZXN1bHQgaW4gdmFyaW91cyBiYWQgY29uc2VxdWVuY2VzIGxh
dGVyLgo+IFRoZSBwYXRjaCBjYXVzZXMgbXRrX25mY19uYW5kX2NoaXBfaW5pdCgpIHRvIGZhaWwg
Zm9yIG5lZ2F0aXZlIHZhbHVlcyBvZgo+IG5zZWxzLgo+IAo+IEZvdW5kIGJ5IExpbnV4IERyaXZl
ciBWZXJpZmljYXRpb24gcHJvamVjdCAobGludXh0ZXN0aW5nLm9yZykuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRXZnZW55IE5vdmlrb3YgPG5vdmlrb3ZAaXNwcmFzLnJ1Pgo+IC0tLQo+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbXRrX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiBpbmRl
eCBhZDFiNTVkYWIyMTEuLmRmOThhMmVlYzI0MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9tdGtfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQu
Ywo+IEBAIC0xMzc2LDcgKzEzNzYsNyBAQCBzdGF0aWMgaW50IG10a19uZmNfbmFuZF9jaGlwX2lu
aXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXRrX25mYyAqbmZjLAo+ICAJCXJldHVybiAt
RU5PREVWOwo+ICAKPiAgCW5zZWxzIC89IHNpemVvZih1MzIpOwo+IC0JaWYgKCFuc2VscyB8fCBu
c2VscyA+IE1US19OQU5EX01BWF9OU0VMUykgewo+ICsJaWYgKG5zZWxzIDw9IDAgfHwgbnNlbHMg
PiBNVEtfTkFORF9NQVhfTlNFTFMpIHsKPiAgCQlkZXZfZXJyKGRldiwgImludmFsaWQgcmVnIHBy
b3BlcnR5IHNpemUgJWRcbiIsIG5zZWxzKTsKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCX0KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
