Return-Path: <SRS0=IIRZ=RK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C56C43381
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 13:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023DB20684
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 13:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYSz1A2V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023DB20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LG+GxdLB+MOsQt0CTNuhLnLw/VvpLL/cJKkohZce85o=; b=TYSz1A2VF4IO2M
	T4/8mEfWP3Oj9sUD01GAw22B/jMmZXTtzpqHxahOTwqpPEfEY0eP2PajzKN4ZMl79WfkPnO89LRP4
	KIkhXJYsU45rLhp/zYKc1Y0XrczhmhWJ5Y3d4h+WQ0q2tKpK3L1310r1N5gVHUX4yWvvox9rncIrd
	Z4HCyKSKwWTFvWQYszhMr1/k7ZwiEyJAuxl4Arn6LkLDHbgI6ERXeM3HGVpmuLYtJp0q+/xchsim+
	xq/FZH3j7PzJN4RaIzXHFaXDoJ2XOAS3FMp+mm6b5s7yr39kGy4Hk5IBE6pL9faBo2+2MSfmSOIds
	Rp+0llsYFbG0VjELZ4sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1t0t-0005XJ-Sj; Thu, 07 Mar 2019 13:24:43 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1t0q-0005W5-Qh
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2019 13:24:42 +0000
X-Originating-IP: 90.88.150.179
Received: from xps13 (aaubervilliers-681-1-31-179.w90-88.abo.wanadoo.fr
 [90.88.150.179]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4F80BE0011;
 Thu,  7 Mar 2019 13:24:32 +0000 (UTC)
Date: Thu, 7 Mar 2019 14:24:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Danzberger <daniel@dd-wrt.com>
Subject: Re: [PATCH] mtdram: Add module parameter name.
Message-ID: <20190307142431.4d290497@xps13>
In-Reply-To: <20190222123205.20015-1-daniel@dd-wrt.com>
References: <20190222123205.20015-1-daniel@dd-wrt.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_052441_008577_A8397461 
X-CRM114-Status: GOOD (  13.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKQWxzbywgIm10ZDogbXRkcmFtOiIgd291bGQgYmUgYSBiZXR0ZXIgcHJlZml4
LCBhbmQgeW91IGNhbiBkcm9wIHRoZQpwZXJpb2QgYXQgdGhlIGVuZCBvZiB0aGUgY29tbWl0IHRp
dGxlLgoKRGFuaWVsIERhbnpiZXJnZXIgPGRhbmllbEBkZC13cnQuY29tPiB3cm90ZSBvbiBGcmks
IDIyIEZlYiAyMDE5CjEzOjMyOjA1ICswMTAwOgoKPiBUaGlzIHBhcmFtZXRlciB3aWxsIG92ZXJ3
cml0ZSB0aGUgZGVmYXVsdCBuYW1lICJtdGRyYW0gdGVzdCBkZXZpY2UiLCB3aGVuIHNldC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgRGFuemJlcmdlciA8ZGFuaWVsQGRkLXdydC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvbXRkcmFtLmMgfCA1ICsrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRyYW0uYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbXRkcmFt
LmMKPiBpbmRleCA0NjIzODc5NjE0NWYuLjFhOGVjMzc1NmExZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL210ZC9kZXZpY2VzL210ZHJhbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRy
YW0uYwo+IEBAIC0xOCw2ICsxOCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkcmFtLmg+Cj4gIAo+ICtzdGF0aWMgY2hhciBuYW1lWzMy
XSA9ICJtdGRyYW0gdGVzdCBkZXZpY2UiOwo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyB0b3RhbF9z
aXplID0gQ09ORklHX01URFJBTV9UT1RBTF9TSVpFOwo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBl
cmFzZV9zaXplID0gQ09ORklHX01URFJBTV9FUkFTRV9TSVpFOwo+ICBzdGF0aWMgdW5zaWduZWQg
bG9uZyB3cml0ZWJ1Zl9zaXplID0gNjQ7Cj4gQEAgLTMxLDYgKzMyLDggQEAgbW9kdWxlX3BhcmFt
KGVyYXNlX3NpemUsIHVsb25nLCAwKTsKPiAgTU9EVUxFX1BBUk1fREVTQyhlcmFzZV9zaXplLCAi
RGV2aWNlIGVyYXNlIGJsb2NrIHNpemUgaW4gS2lCIik7Cj4gIG1vZHVsZV9wYXJhbSh3cml0ZWJ1
Zl9zaXplLCB1bG9uZywgMCk7Cj4gIE1PRFVMRV9QQVJNX0RFU0Mod3JpdGVidWZfc2l6ZSwgIkRl
dmljZSB3cml0ZSBidWYgc2l6ZSBpbiBCeXRlcyAoRGVmYXVsdDogNjQpIik7Cj4gK21vZHVsZV9w
YXJhbV9zdHJpbmcobmFtZSwgbmFtZSwgc2l6ZW9mKG5hbWUpIC0gMSwgMCk7Cj4gK01PRFVMRV9Q
QVJNX0RFU0MobmFtZSwgIkRldmljZSBuYW1lIik7Cj4gICNlbmRpZgo+ICAKPiAgLy8gV2UgY291
bGQgc3RvcmUgdGhlc2UgaW4gdGhlIG10ZCBzdHJ1Y3R1cmUsIGJ1dCB3ZSBvbmx5IHN1cHBvcnQg
MSBkZXZpY2UuLgo+IEBAIC0xNzAsNyArMTczLDcgQEAgc3RhdGljIGludCBfX2luaXQgaW5pdF9t
dGRyYW0odm9pZCkKPiAgCQltdGRfaW5mbyA9IE5VTEw7Cj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4g
IAl9Cj4gLQllcnIgPSBtdGRyYW1faW5pdF9kZXZpY2UobXRkX2luZm8sIGFkZHIsIE1URFJBTV9U
T1RBTF9TSVpFLCAibXRkcmFtIHRlc3QgZGV2aWNlIik7Cj4gKwllcnIgPSBtdGRyYW1faW5pdF9k
ZXZpY2UobXRkX2luZm8sIGFkZHIsIE1URFJBTV9UT1RBTF9TSVpFLCBuYW1lKTsKPiAgCWlmIChl
cnIpIHsKPiAgCQl2ZnJlZShhZGRyKTsKPiAgCQlrZnJlZShtdGRfaW5mbyk7CgoKCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
