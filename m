Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC4BC54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB85206B9
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U2xObJU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB85206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zgcdSJ1aHQh/GAYjcoLxbUGyCiUpmmW3dylOsFESzA=; b=U2xObJU9m6mRa1
	Kqbw9vHp0PAeAKHu/IIkTVYhoNHfhdKcX8khgGBmXTBGux3L+GY4ayiUf58KJqQuBE8t+1SfC2bFa
	QlluS9iqD3W4HCuA3gpU4Z9YcwDT6IwigcVdkZiceVLQGE/u0b1WFcn1NoN87jyq7aRCukiDRVahb
	ej3IQ1O3XydNjsiB51F/VSpZXGpK5J0loYb3okkdHdLwzFhwed/zQDT1hX+s34jvOn54k9ACppifC
	UrGt9+PDuOIl79lTwxK357npKhuJRA/5ojGd9zgYdkHNdtWY19haDaPoDLkKiG/eRZ/Xr76eHXvvI
	vXjhV3HanGNXk7IDTi3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT5FG-0006wm-Px; Mon, 27 Apr 2020 15:00:30 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT5Ey-0005fs-TZ
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 15:00:14 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E703A200005;
 Mon, 27 Apr 2020 15:00:04 +0000 (UTC)
Date: Mon, 27 Apr 2020 17:00:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: Propage CS selection to sub operations
Message-ID: <20200427170002.37d78066@xps13>
In-Reply-To: <20200418194959.1017197-1-boris.brezillon@collabora.com>
References: <20200418194959.1017197-1-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_080013_142071_2F279BFC 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTYXQsIDE4IEFwcgoyMDIwIDIxOjQ5OjU4ICswMjAwOgoKPiBTb21lIGNvbnRy
b2xsZXIgdXNpbmcgdGhlIGluc3RydWN0aW9uIHBhcnNlIGluZnJhc3RydWN0dXJlIG1pZ2h0IG5l
ZWQKPiB0byBrbm93IHdoaWNoIENTIGEgc3BlY2lmaWMgc3ViLW9wZXJhdGlvbiBpcyB0YXJnZXRp
bmcuIExldCdzIHByb3BhZ2F0ZQo+IHRoaXMgaW5mb3JtYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1i
eTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCAxICsKPiAgaW5jbHVkZS9saW51
eC9tdGQvcmF3bmFuZC5oICAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBpbmRleCBjMjRlNWUyYmExMzAu
LmZhOWFjMThlOTdhMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jh
c2UuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gQEAgLTIxNzYs
NiArMjE3Niw3IEBAIGludCBuYW5kX29wX3BhcnNlcl9leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsCj4gIAkJCSAgIGNvbnN0IHN0cnVjdCBuYW5kX29wZXJhdGlvbiAqb3AsIGJvb2wgY2hl
Y2tfb25seSkKPiAgewo+ICAJc3RydWN0IG5hbmRfb3BfcGFyc2VyX2N0eCBjdHggPSB7Cj4gKwkJ
LnN1Ym9wLmNzID0gb3AtPmNzLAoKSSB0aGluayB0aGlzIGluZm9ybWF0aW9uIG1pZ2h0IGJlY29t
ZSBpbXBvcnRhbnQsIGNvdWxkIHlvdSBhcyB3ZWxsIGFkZAppdCB0byB0aGUgcGFyc2VyIHRyYWNl
cj8gU29tZXRoaW5nIGxpa2UgdGhpcyB3b3VsZCBkbyB0aGUgdHJpY2s6CgotLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2Jhc2UuYwpAQCAtMjExMiw3ICsyMTEyLDcgQEAgc3RhdGljIHZvaWQgbmFuZF9vcF9wYXJzZXJf
dHJhY2UoY29uc3Qgc3RydWN0IG5hbmRfb3BfcGFyc2VyX2N0eCAqY3R4KQogICAgICAgIGNoYXIg
KnByZWZpeCA9ICIgICAgICAiOwogICAgICAgIHVuc2lnbmVkIGludCBpOwogCi0gICAgICAgcHJf
ZGVidWcoImV4ZWN1dGluZyBzdWJvcDpcbiIpOworICAgICAgIHByX2RlYnVnKCJleGVjdXRpbmcg
c3Vib3AgKENTJWQpOlxuIiwgY3R4LT5zdWJvcC5jcyk7CiAKICAgICAgICBmb3IgKGkgPSAwOyBp
IDwgY3R4LT5uaW5zdHJzOyBpKyspIHsKICAgICAgICAgICAgICAgIGluc3RyID0gJmN0eC0+aW5z
dHJzW2ldOwoKPiAgCQkuc3Vib3AuaW5zdHJzID0gb3AtPmluc3RycywKPiAgCQkuaW5zdHJzID0g
b3AtPmluc3RycywKPiAgCQkubmluc3RycyA9IG9wLT5uaW5zdHJzLAo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgK
PiBpbmRleCAxZTc2MTk2Zjk4MjkuLjhlOGQxYTYxZTJmYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L210ZC9yYXduYW5kLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgK
PiBAQCAtNjk0LDYgKzY5NCw3IEBAIHN0cnVjdCBuYW5kX29wX2luc3RyIHsKPiAgCj4gIC8qKgo+
ICAgKiBzdHJ1Y3QgbmFuZF9zdWJvcCAtIGEgc3ViIG9wZXJhdGlvbgo+ICsgKiBAY3M6IHRoZSBD
UyBsaW5lIHRvIHNlbGVjdCBmb3IgdGhpcyBOQU5EIHN1Yi1vcGVyYXRpb24KPiAgICogQGluc3Ry
czogYXJyYXkgb2YgaW5zdHJ1Y3Rpb25zCj4gICAqIEBuaW5zdHJzOiBsZW5ndGggb2YgdGhlIEBp
bnN0cnMgYXJyYXkKPiAgICogQGZpcnN0X2luc3RyX3N0YXJ0X29mZjogb2Zmc2V0IHRvIHN0YXJ0
IGZyb20gZm9yIHRoZSBmaXJzdCBpbnN0cnVjdGlvbgo+IEBAIC03MDksNiArNzEwLDcgQEAgc3Ry
dWN0IG5hbmRfb3BfaW5zdHIgewo+ICAgKiBjb250cm9sbGVyIGRyaXZlci4KPiAgICovCj4gIHN0
cnVjdCBuYW5kX3N1Ym9wIHsKPiArCXVuc2lnbmVkIGludCBjczsKPiAgCWNvbnN0IHN0cnVjdCBu
YW5kX29wX2luc3RyICppbnN0cnM7Cj4gIAl1bnNpZ25lZCBpbnQgbmluc3RyczsKPiAgCXVuc2ln
bmVkIGludCBmaXJzdF9pbnN0cl9zdGFydF9vZmY7CgpXaXRoIHRoaXMgc21hbGwgYWRkaXRpb246
CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
