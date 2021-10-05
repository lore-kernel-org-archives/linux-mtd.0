Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE02C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 09:35:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDDE61372
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 09:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBDDE61372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMb2fmNxmaFQ+bFhH+8N8nKMNOYFg+GxScFXtxT6BqY=; b=u01OHn6Bs+KICI
	mYHPEJSocpLUgwDDXYonml1/XYEctIWQ74OM4M+HqSooRU4X5j7LRgk0OwIJroIwJGgNV5ntxrY/O
	A6ZWqMc9wgjSERng8TMud/r+DC3kPhKfxt3BmBWENhq7WiAAoJskyfnkAlxE7nZyO+0iK348LGtTz
	4uooKQaX9O7WoR5xuyUamSmLS0+83c+DA8j7iHqw46TjlvPknomKvyFKL8E84MUBdHtLwqX3tAnNh
	10J1SIUw9HPAvmhpID/5MgYlhuT02719dChTdBoU3XuxVxMPLLqVYRjUDqrqQZDtuoO0Hp35SwIRC
	ypK6xLepYuj83YmQuGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXgqA-009oDt-7W; Tue, 05 Oct 2021 09:34:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXgq7-009oBs-BR
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 09:34:24 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mXgpt-0004TB-7y; Tue, 05 Oct 2021 11:34:09 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mXgpr-0003p8-Es; Tue, 05 Oct 2021 11:34:07 +0200
Message-ID: <ce254cc123f2809976c2f2404941a9074c458309.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] reset: socfpga: add empty driver allowing consumers
 to probe
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=C5=82?= Anikiel <pan@semihalf.com>, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org,  arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 tn@semihalf.com, ka@semihalf.com, jam@semihalf.com
Date: Tue, 05 Oct 2021 11:34:07 +0200
In-Reply-To: <20210920124141.1166544-4-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
 <20210920124141.1166544-4-pan@semihalf.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_023423_411477_0C04BAC1 
X-CRM114-Status: GOOD (  22.02  )
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

SGkgUGF3ZcWCLAoKT24gTW9uLCAyMDIxLTA5LTIwIGF0IDE0OjQxICswMjAwLCBQYXdlxYIgQW5p
a2llbCB3cm90ZToKPiBUaGUgZWFybHkgcmVzZXQgZHJpdmVyIGRvZXNuJ3QgZXZlciBwcm9iZSwg
d2hpY2ggY2F1c2VzIGNvbnN1bWluZwo+IGRldmljZXMgdG8gYmUgdW5hYmxlIHRvIHByb2JlLiBB
ZGQgYW4gZW1wdHkgZHJpdmVyIHRvIHNldCB0aGlzIGRldmljZQo+IGFzIGF2YWlsYWJsZSwgYWxs
b3dpbmcgY29uc3VtZXJzIHRvIHByb2JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2XFgiBBbmlr
aWVsIDxwYW5Ac2VtaWhhbGYuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2Zw
Z2EuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtc29j
ZnBnYS5jIGIvZHJpdmVycy9yZXNldC9yZXNldC1zb2NmcGdhLmMKPiBpbmRleCAyYTcyZjg2MWY3
OTguLjhjNjQ5MmU1NjkzYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2Zw
Z2EuYwo+ICsrKyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtc29jZnBnYS5jCj4gQEAgLTkyLDMgKzky
LDI5IEBAIHZvaWQgX19pbml0IHNvY2ZwZ2FfcmVzZXRfaW5pdCh2b2lkKQo+ICAJZm9yX2VhY2hf
bWF0Y2hpbmdfbm9kZShucCwgc29jZnBnYV9lYXJseV9yZXNldF9kdF9pZHMpCj4gIAkJYTEwX3Jl
c2V0X2luaXQobnApOwo+ICB9Cj4gKwo+ICsvKgo+ICsgKiBUaGUgZWFybHkgZHJpdmVyIGlzIHBy
b2JsZW1hdGljLCBiZWNhdXNlIGl0IGRvZXNuJ3QgcmVnaXN0ZXIKPiArICogaXRzZWxmIGFzIGEg
ZHJpdmVyLiBUaGlzIGNhdXNlcyBjZXJ0YWluIGRldmljZSBsaW5rcyB0byBwcmV2ZW50Cj4gKyAq
IGNvbnN1bWVyIGRldmljZXMgZnJvbSBwcm9iaW5nLiBUaGUgaGFja3kgc29sdXRpb24gaXMgdG8g
cmVnaXN0ZXIKPiArICogYW4gZW1wdHkgZHJpdmVyLCB3aG9zZSBvbmx5IGpvYiBpcyB0byBhdHRh
Y2ggaXRzZWxmIHRvIHRoZSByZXNldAo+ICsgKiBtYW5hZ2VyIGFuZCBjYWxsIHByb2JlLgo+ICsg
Ki8KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc29jZnBnYV9yZXNldF9kdF9p
ZHNbXSA9IHsKPiArCXsgLmNvbXBhdGlibGUgPSAiYWx0cixyc3QtbWdyIiwgfSwKPiArCXsgLyog
c2VudGluZWwgKi8gfSwKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQgcmVzZXRfc2ltcGxlX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArCXJldHVybiAwOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciByZXNldF9zb2NmcGdhX2RyaXZlciA9
IHsKPiArCS5wcm9iZQk9IHJlc2V0X3NpbXBsZV9wcm9iZSwKPiArCS5kcml2ZXIgPSB7Cj4gKwkJ
Lm5hbWUJCT0gInNvY2ZwZ2EtcmVzZXQiLAo+ICsJCS5vZl9tYXRjaF90YWJsZQk9IHNvY2ZwZ2Ff
cmVzZXRfZHRfaWRzLAo+ICsJfSwKPiArfTsKPiArYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIocmVz
ZXRfc29jZnBnYV9kcml2ZXIpOwoKSWYgd2UgY2FuIGp1c3QgbGV0IGRldmxpbmsgZGVsYXkgYWxs
IGNvbnN1bWVycyB1bnRpbCB0aGUgZW1wdHkgZHJpdmVyIGlzCnByb2JlZCwgZG9lcyB0aGUgcmVz
ZXQgY29udHJvbGxlciBoYXZlIHRvIGJlIHJlZ2lzdGVyZWQgZWFybHkgYXQgYWxsPwoKcmVnYXJk
cwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
