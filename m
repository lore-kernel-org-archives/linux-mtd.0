Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F14C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 13:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684802078C
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 13:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="duFmsnr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 684802078C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmpgC7CPPmmu4+zMwRX8Q0DNNlKmXXszLOlnO2efgvY=; b=duFmsnr6uBI5R7
	bmNtt7VmGowkrQKYTMJYEQiD+bhGrEF32z4idCTvXRLtzuyt7h/nGfoVAq0duwlaUP33LC0ZV8KPV
	zqWQSdXiIcYt64k8z+BgZxui7jNnf3QESdCSAS40wPYvQtQFEP0EwxJqkhimm7uQOVUjZv1/WFpqK
	H/DDMJFHTs2nXDp/FirfDXhz6RYomVNJEB4BMkGPMBFbduEgtbhOqocbulmw0EH+th8KIm7BB4nPf
	p4Aba0UlfFV8s6IDcm//SYSa88ElXjy2CfQ1ygnM4FJBn6OgPwM+pKltes9nHES5Da+nW6042WzUK
	xYzmb85wzLNpxMroF56w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdwUf-0005iP-NS; Wed, 27 May 2020 13:53:17 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdwUc-0005hc-8j
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 13:53:16 +0000
X-Originating-IP: 93.23.196.54
Received: from xps13 (54.196.23.93.rev.sfr.net [93.23.196.54])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AE2641BF213;
 Wed, 27 May 2020 13:53:05 +0000 (UTC)
Date: Wed, 27 May 2020 15:53:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: rawnand: arasan: select CONFIG_BCH
Message-ID: <20200527155304.0cf42848@xps13>
In-Reply-To: <20200527134210.847411-1-arnd@arndb.de>
References: <20200527134210.847411-1-arnd@arndb.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_065314_443098_CB3F0495 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCkFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlIG9uIFdlZCwgMjcg
TWF5IDIwMjAgMTU6NDI6MDMgKzAyMDA6Cgo+IExpa2Ugc2V2ZXJhbCBvdGhlciBuYW5kIGZsYXNo
IGRyaXZlcnMsIHRoaXMgb25lIHJlcXVpcmVzIHRoZSBCQ0gKPiBsaWJyYXJ5IHRvIGJlIHNlbGVj
dGVkIGZyb20gS2NvbmZpZy4KCkFjdHVhbGx5IG1vc3Qgb2YgdGhlIHRpbWUgdGhlc2UgZHJpdmVy
cyBkbyBub3QgZGVwZW5kIG9uIEJDSCBkaXJlY3RseS4KSGVyZSBpdCBpcyBhIGJpdCBwYXJ0aWN1
bGFyOiB0aGUgaGFyZHdhcmUgRUNDIGVuZ2luZSBsb2dpYyBiZWluZwpicm9rZW4sIEkgZm91bmQg
YSB3b3JrYXJvdW5kIGJ5IHVzaW5nIEJDSCdzIGxpYnJhcnkgZnVuY3Rpb25zIGRpcmVjdGx5CnRv
IHZlcmlmeSB0aGUgaGFyZHdhcmUgY29ycmVjdG5lc3MuCgpBbnl3YXksIHRoYW5rIHlvdSB2ZXJ5
IG11Y2ggZm9yIHRoZSBmaXggYnV0IGlmIEkgZGlkbid0IG1ha2UgYSBtaXN0YWtlCml0IHNob3Vs
ZCBoYXZlIGJlZW4gZml4ZWQgeWVzdGVyZGF5IG5pZ2h0IGFscmVhZHksIHNvIGl0J3MgcHJvYmFi
bHkgbm90CmluIGxpbnV4LW5leHQgeWV0LgoKPiBhcm0tbGludXgtZ251ZWFiaS1sZDogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5vOiBpbiBmdW5jdGlvbiBgYW5m
Y19hdHRhY2hfY2hpcCc6Cj4gYXJhc2FuLW5hbmQtY29udHJvbGxlci5jOigudGV4dCsweDg5NCk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGJjaF9pbml0Jwo+IGFybS1saW51eC1nbnVlYWJpLWxk
OiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLm86IGluIGZ1bmN0
aW9uIGBhbmZjX2RldGFjaF9jaGlwJzoKPiBhcmFzYW4tbmFuZC1jb250cm9sbGVyLmM6KC50ZXh0
KzB4OThjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYmNoX2ZyZWUnCj4gYXJtLWxpbnV4LWdu
dWVhYmktbGQ6IGRyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIubzog
aW4gZnVuY3Rpb24gYGFuZmNfcmVhZF9wYWdlX2h3X2VjYyc6Cj4gYXJhc2FuLW5hbmQtY29udHJv
bGxlci5jOigudGV4dCsweDEwODApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBiY2hfZGVjb2Rl
Jwo+IAo+IEZpeGVzOiAxOTdiODhmZWNjNTAgKCJtdGQ6IHJhd25hbmQ6IGFyYXNhbjogQWRkIG5l
dyBBcmFzYW4gTkFORCBjb250cm9sbGVyIikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZp
Zwo+IGluZGV4IGUyYmM4Nzc3OWJmOS4uMTEzZjYxMDUyMjY5IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29u
ZmlnCj4gQEAgLTQ1Niw2ICs0NTYsNyBAQCBjb25maWcgTVREX05BTkRfQ0FERU5DRQo+ICBjb25m
aWcgTVREX05BTkRfQVJBU0FOCj4gIAl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgQXJhc2FuIE5BTkQg
Zmxhc2ggY29udHJvbGxlciIKPiAgCWRlcGVuZHMgb24gSEFTX0lPTUVNICYmIEhBU19ETUEKPiAr
CXNlbGVjdCBCQ0gKPiAgCWhlbHAKPiAgCSAgRW5hYmxlcyB0aGUgZHJpdmVyIGZvciB0aGUgQXJh
c2FuIE5BTkQgZmxhc2ggY29udHJvbGxlciBvbgo+ICAJICBaeW5xIFVsdHJhc2NhbGUrIE1QU29D
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
