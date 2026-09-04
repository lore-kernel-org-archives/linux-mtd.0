Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577DDC79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQRFjp3/dCCraGgqI5CP/r9EqXvKcW3zagTj6V2AXTc=; b=1G3VMV3vfMhH15
	t/USc6qxaI5+Ru/h4p4QvRyCnAAX3I+ISngI2Eixcx2BiYiIwNDcAf14JDSJs7eHVJe/8iBNHS/ml
	2QFkXQ7ZBEVs8rEicUwdlLUsHTo55troGAj6tmOxaW2VTyowTR6jiLa95lqsT35UJ9Q/jbLTiT1x2
	cMGnXzHjc3THe3KCxaXri/sIid8TSYTpdyChxrjBJKgL3Z4ro/+jWin4XMwmRqivnQnimttBSMrSE
	MrxKacbtcC+SnjhwYUjWE+r7SZBpZMRVA7HSIF5+pgTRzYSYj6cx1snTU5kXWX+juDc/ftbcaXeMO
	l4tiu0vVJu4PR8AdvfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VnP-00000002WFq-3Rqv;
	Fri, 04 Sep 2026 15:25:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VnM-00000002WEA-3gpe
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 15:25:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B5E51A19AB;
	Fri,  4 Sep 2026 15:25:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1A9B6057F;
	Fri,  4 Sep 2026 15:25:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9AFA11C78288;
	Fri,  4 Sep 2026 17:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788535532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v1mdNZgtA3Wo9M3mbbKh8ENXPA2Gg1HukmOKrHjLDus=;
	b=lL/IgV+0tG/cxZy8W9MtDYgTLdFCSAp1pFWMdy+8VxRNCLS4Vqy99w5bAWZeBgC3WbAsI7
	blqA35NXsvUgoOba39w9A/drk2o/XnufvFUm9qtEvwZXyH89zuMxBGlRxzma5+DIc9I0a5
	crtENZZ1VMCcqNVBZnWYcIsIoDuR8wemKMmeTDXSo3pcIyQs+lycebfVFiqER1eGd5OFLi
	ipLCu6FVfYyFP+2mnr9kuKljFNdy8O94U3NXYGsF4sOqqFX4o01wZvJ4VLNxQO0ofi0usj
	rIakqMFrwl4aLVWgMBuzRUXFlIHKwH3dhBvQ7dgT3YvY5rpqeSvsYz80wEq/hg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  stable@vger.kernel.org,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
In-Reply-To: <20260811060651.227431-1-james.hilliard1@gmail.com> (James
	Hilliard's message of "Tue, 11 Aug 2026 00:06:48 -0600")
References: <20260811060651.227431-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 17:25:28 +0200
Message-ID: <87ecf911jr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_082537_053332_CB65C348 
X-CRM114-Status: GOOD (  16.15  )
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

T24gMTEvMDgvMjAyNiBhdCAwMDowNjo0OCAtMDYsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gRUNDIG1heGltaXphdGlvbiBmb3JjZXMgYSAxMDI0
LWJ5dGUgRUNDIHN0ZXAgYW5kIGRpdmlkZXMgdGhlCj4gYXZhaWxhYmxlIE9PQiBieXRlcyBieSB0
aGUgbnVtYmVyIG9mIHN0ZXBzLiBBIE5BTkQgd2l0aCBhIHNtYWxsZXIKPiBwYWdlIHRoZXJlZm9y
ZSBwcm9kdWNlcyB6ZXJvIHN0ZXBzIGFuZCBhIGRpdmlzaW9uIGJ5IHplcm8uCgpObywgc3RlcHMg
Y2Fubm90IGJlIDwgMS4gSWYgdGhleSBhcmUsIGl0J3MgYSBidWcgdGhhdCBtdXN0IGJlIGZpeGVk
LgoKPiBBbiBleHBsaWNpdGx5IGNvbmZpZ3VyZWQgRUNDIHN0ZXAgd2hpY2ggaXMgbGFyZ2VyIHRo
YW4sIG9yIGRvZXMgbm90Cj4gZGl2aWRlLCB0aGUgcGFnZSBhbHNvIHByb2R1Y2VzIGFuIHVudXNh
YmxlIHN0ZXAgY291bnQgYmVmb3JlIHRoZSBOQU5ECj4gY29yZSBjYW4gZGlhZ25vc2UgdGhlIGNv
bmZpZ3VyYXRpb24uCj4KPiBWYWxpZGF0ZSB0aGUgc3RlcCBzaXplIGF0IGJvdGggcG9pbnRzIHdo
ZXJlIHRoZSBkcml2ZXIgZGVyaXZlcyB0aGUKPiBudW1iZXIgb2Ygc2VjdG9ycyBhbmQgcmVqZWN0
IGludmFsaWQgZ2VvbWV0cmllcy4KPgo+IEZpeGVzOiA0Nzk2ZDg2NTU5MTUgKCJtdGQ6IG5hbmQ6
IHN1bnhpOiBTdXBwb3J0IEVDQyBtYXhpbWl6YXRpb24iKQo+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBn
bWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDE3
ICsrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhp
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+IGluZGV4IDQ1Y2Ni
Y2U5MTU1MS4uYWQzMTRjMGUzMGIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3N1bnhpX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+
IEBAIC0yMDMyLDYgKzIwMzIsMTUgQEAgc3RhdGljIHZvaWQgc3VueGlfbmFuZF9kZXRhY2hfY2hp
cChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+ICAJc3VueGlfbmFuZC0+dXNlcl9kYXRhX2J5dGVz
ID0gTlVMTDsKPiAgfQo+ICAKPiArc3RhdGljIGludCBzdW54aV9uZmNfZWNjX3N0ZXBzKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCB1bnNpZ25lZCBpbnQgc3RlcF9zaXplKQo+ICt7Cj4gKwlpZiAoIXN0
ZXBfc2l6ZSB8fCBtdGQtPndyaXRlc2l6ZSA8IHN0ZXBfc2l6ZSB8fAo+ICsJICAgIG10ZC0+d3Jp
dGVzaXplICUgc3RlcF9zaXplKQoKSSBkb24ndCBnZXQgaXQsIG10ZC0+d3JpdGVzaXplIDwgc3Rl
cF9zaXplIGlzIGNvbmNlcHR1YWxseQppbXBvc3NpYmxlLiBJZiB0aGF0IGhhcHBlbnMsIGl0IG11
c3QgYmUgZml4ZWQgZWFybGllciB0aGFuIHRoYXQuCgo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsK
PiArCXJldHVybiBtdGQtPndyaXRlc2l6ZSAvIHN0ZXBfc2l6ZTsKPiArfQo+ICsKPiAgc3RhdGlj
IGludCBzdW54aV9uZmNfbWF4aW1pemVfdXNlcl9kYXRhKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQs
IHVpbnQzMl90IG9vYnNpemUsCj4gIAkJCQkJaW50IGVjY19ieXRlcywgaW50IG5zZWN0b3JzKQo+
ICB7CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
