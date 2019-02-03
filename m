Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0201BC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:16:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE60E2084A
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lhlwoGlr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nc1vYNH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE60E2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXjCv3zG88p2zIiQUftWR4ed5WoXVMB1fpc3aPb7XMM=; b=lhlwoGlr7erKni
	7Nm0PrMo7/Bedlm3qhRS4kFDYUF32ie8H4qbspehh3zEBmWmV7Rc0yGWx0tCtok9jJVzYXuTWkbQ1
	o4LiedUayT/+vqfOBIg/Ie8t4iLGelV82fueB9OBQ4plVK0vLA5PRpmRkMhK2NTI7lht5N+wJeAC6
	78i5Rigfqe2BweA37WJ81PIBNfEusETV5q2f1osQejUKXxu70j1a8Fz68TLztsfqR93mYibI9FWsi
	H4z4WNtIYogR/0nYd1oaw5oQFsiurekw7eYgbhtEenteEvhvZ+b/3mzX2T+Uzw7PnRnpVF7eC3MkO
	+H0yGpJRmuHLjnpnExmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqIZI-0003S0-A4; Sun, 03 Feb 2019 14:16:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqIZF-0003Rg-Dj
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 14:16:18 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C9342084A;
 Sun,  3 Feb 2019 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549203376;
 bh=fqlKxu6hC/LlcgpY7oFMpeGGedZGIO72wvaf6VO46aA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nc1vYNH2aiPeOvUIMecerWMyQFFu2HFGF4st653jxRukQ+zYIXWHYS/cwGAN0LduS
 VOTfAAQ0Ub4IriSrxnVCP5BClu0iZ42xGibKkjrBHVFlvxVSqlGUqH5gsNPHdKqubJ
 7Mexw2WmFGqOPUDf5LiInN5OqnLhyt/ZSkNnmuhE=
Date: Sun, 3 Feb 2019 15:16:04 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 9/9] mtd: rawnand: jz4780-bch: Add support for the
 JZ4740
Message-ID: <20190203151604.23061e2a@bbrezillon>
In-Reply-To: <1549202293.1950.2@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-10-paul@crapouillou.net>
 <20190203083505.4dc52278@bbrezillon>
 <1549202293.1950.2@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_061617_485517_8BA7BD59 
X-CRM114-Status: GOOD (  23.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwMyBGZWIgMjAxOSAxMDo1ODoxMyAtMDMwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IExlIGRpbS4gMyBmw6l2ci4gMjAxOSDDoCA0OjM1LCBC
b3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gCj4gYSDDqWNyaXQgOgo+ID4g
T24gU2F0LCAgMiBGZWIgMjAxOSAyMDoxOToyNiAtMDMwMAo+ID4gUGF1bCBDZXJjdWVpbCA8cGF1
bEBjcmFwb3VpbGxvdS5uZXQ+IHdyb3RlOgo+ID4gICAKPiA+PiAgQWRkIHRoZSBiYWNrZW5kIGNv
ZGUgZm9yIHRoZSBqejQ3ODAtYmNoIGRyaXZlciB0byBzdXBwb3J0IHRoZSBKWjQ3NDAKPiA+PiAg
U29DIGZyb20gSW5nZW5pYy4KPiA+PiAKPiA+PiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVp
bCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPj4gIC0tLQo+ID4+IAo+ID4+ICBDaGFuZ2VzOgo+
ID4+IAo+ID4+ICB2MjogTmV3IHBhdGNoCj4gPj4gCj4gPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9pbmdlbmljL01ha2VmaWxlICAgICAgICAgfCAgIDIgKy0KPiA+PiAgIGRyaXZlcnMvbXRkL25h
bmQvcmF3L2luZ2VuaWMvano0NzQwX2JjaC5jICAgICB8IDE3MyAKPiA+PiArKysrKysrKysrKysr
KysrKysKPiA+PiAgIC4uLi9tdGQvbmFuZC9yYXcvaW5nZW5pYy9qejQ3ODBfYmNoX2NvbW1vbi5j
ICB8ICAgMSArCj4gPj4gICAuLi4vbmFuZC9yYXcvaW5nZW5pYy9qejQ3ODBfYmNoX2ludGVybmFs
LmggICAgfCAgIDEgKwo+ID4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxNzYgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL25hbmQv
cmF3L2luZ2VuaWMvano0NzQwX2JjaC5jCj4gPj4gCj4gPj4gIGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9pbmdlbmljL01ha2VmaWxlIAo+ID4+IGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvaW5nZW5pYy9NYWtlZmlsZQo+ID4+ICBpbmRleCBmMzhiNDY3NDkwY2YuLmQxNmM5NjExM2E5
MyAxMDA2NDQKPiA+PiAgLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9NYWtlZmls
ZQo+ID4+ICArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL01ha2VmaWxlCj4gPj4g
IEBAIC0xLDMgKzEsMyBAQAo+ID4+ICAgb2JqLSQoQ09ORklHX01URF9OQU5EX0paNDc0MCkgKz0g
ano0NzQwX25hbmQubwo+ID4+ICAgb2JqLSQoQ09ORklHX01URF9OQU5EX0paNDc4MCkgKz0gano0
NzgwX25hbmQubyBqejQ3ODBfYmNoX2NvbW1vbi5vIAo+ID4+IFwKPiA+PiAgLQkJCQkgano0Nzgw
X2JjaC5vIGp6NDcyNWJfYmNoLm8KPiA+PiAgKwkJCQkgano0NzgwX2JjaC5vIGp6NDcyNWJfYmNo
Lm8gano0NzQwX2JjaC5vICAKPiA+IAo+ID4gSSBzdGlsbCBkb24ndCBzZWUgdGhlIHBvaW50IG9m
IHRoZSBqejQ3ODBfYmNoX2NvbW1vbi9qejQ3eHh4X2JjaAo+ID4gc2VwYXJhdGlvbi4gWW91IHNl
ZW0gdG8gYWx3YXlzIGVtYmVkIGFsbCBvYmplY3RzIGFueXdheSwgc28geW91IGNhbgo+ID4ganVz
dCBwdXQgdGhlIGNvZGUgZm9yIGJvdGggZW5naW5lcyBpbiB0aGUgc2FtZSBzb3VyY2UgZmlsZSBh
bmQgZGVjaWRlCj4gPiB3aGljaCBvbmUgdG8gdXNlIGJhc2VkIG9uIHRoZSBjb21wYXQgKHdoaWNo
IHlvdSBhbHJlYWR5IGRvIGFueXdheSkuICAKPiAKPiBFYWNoIFNvQyBoYXMgYSBkaWZmZXJlbnQg
c2V0IG9mIHJlZ2lzdGVycyBmb3IgdGhlIEJDSCBoYXJkd2FyZS4gSSBjYW4gCj4gdHJ5IHRvCj4g
Y3JhbSBldmVyeXRoaW5nIGludG8gb25lIGZpbGUsIGJ1dCBpdCB3b24ndCBiZSB0aGF0IG11Y2gg
Y2xlYW5lci4KClRoZW4gbWF5YmUgdGhleSBkZXNlcnZlIHNlcGFyYXRlIGRyaXZlcnMvbW9kdWxl
cy4KCkJUVywgZGlkbid0IHlvdSBzYXkgdGhhdCBvbmUgSVAgdXNlcyBSZWVkLVNhbG9tb24gaW5z
dGVhZCBvZiBCQ0guIEknZApzdWdnZXN0IHByZWZpeGluZyBzdHJ1Y3RzIGFuZCBmdW5jdGlvbnMg
d2l0aCBqejQ3eHhfZWNjIGluc3RlYWQgb2YKano0N3h4X2JjaCBhbmQgbmFtaW5nIHRoZSBjb21t
b24gcGFydCBqejQ3eHhfZWNjLmMgdG8gcmVmbGVjdCB0aGF0LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
