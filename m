Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59ECC00140
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Aug 2022 07:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3q6jBck1RUMcg0MGBLfZZmqitC9P8qtG01PYQXhrWBk=; b=Yp6Qgu2wMYhLIVv7za5JV3abRb
	0FUjuPmSfiGjI+XRRkOuzkEPEZ9LKWsAl5One3RiZh59+r4LCnnA2i5AcF/jjSGheIM/FKcc/Dy0B
	B4vZP/NmABQI2sH/tJRegpCMm/5g/HlDaTAMweqVwo++iqURGsQCIZlAJfJO5nyX5NovJ1QwFCsy7
	+ubcr3qVzh4FtN7DIjSC+WuPtjQxiHTFfatIp5l9AmTYAplJ1jZdIXXNAGMC10gBSvF7R5sdRq9+p
	vzF7ztFnUHr3nghHQODa17593grSqCo+FXjXDdpgLJmr/9WGHN1S8mvPKw2LVTeeoZGLBDX+eNbZp
	PZnvqeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZVC-00HOIV-UO; Thu, 18 Aug 2022 06:59:38 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZV9-00HOEZ-Jt
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2022 06:59:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AB65D61F1132;
	Thu, 18 Aug 2022 08:59:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id B7xKpa3dEKri; Thu, 18 Aug 2022 08:59:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 45B1F61F113A;
	Thu, 18 Aug 2022 08:59:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id I6RGV6UGPG4Y; Thu, 18 Aug 2022 08:59:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 23A6A61F1132;
	Thu, 18 Aug 2022 08:59:28 +0200 (CEST)
Date: Thu, 18 Aug 2022 08:59:27 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: cuigaosheng <cuigaosheng1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, gongruiqi1@huawei.com, 
	wangweiyang2@huawei.com
Message-ID: <1160016027.119085.1660805967979.JavaMail.zimbra@nod.at>
In-Reply-To: <6733eee6-bfb6-7ee9-1331-2a739520fcd5@huawei.com>
References: <20220715071105.2321311-1-cuigaosheng1@huawei.com> <6733eee6-bfb6-7ee9-1331-2a739520fcd5@huawei.com>
Subject: Re: [PATCH -next] mtd/ftl: Fix memleak in ftl_add_mtd()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd/ftl: Fix memleak in ftl_add_mtd()
Thread-Index: V5oJKIljgIpBvfWjk+sGiwgnVw0TaA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_235935_845971_C59509C0 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImN1aWdhb3NoZW5nIiA8Y3Vp
Z2Fvc2hlbmcxQGh1YXdlaS5jb20+Cj4KPiBQSU5HCgpUaGVyZSBzZWVtcyB0byBiZSBhIHByb2Js
ZW0gd2l0aCB5b3VyIGNhcHMgbG9jayBrZXkuIDstKQogCj4g5ZyoIDIwMjIvNy8xNSAxNToxMSwg
R2Fvc2hlbmcgQ3VpIOWGmemBkzoKPj4gV2hlbiBhZGRfbXRkX2Jsa3RyYW5zX2RldiBmYWlsZWQs
IHBhcnRpdGlvbidzIG1lbW9yeSB3aWxsIGJlIGZyZWVkCj4+IGJ5IGtmcmVlLCBidXQgdGhlcmUg
YXJlIHNvbWUgc3RydWN0dXJlIG1lbWJlcnMgdGhhdCBhcmUgYWxsb2NhdGVkCj4+IGZvciBtZW1v
cnkgaW5kZXBlbmRlbnRseSwgc3VjaCBhcyBwYXJ0aXRpb24tPlZpcnR1YWxCbG9ja01hcCwKPj4g
cGFydGl0aW9uLT5FVU5JbmZvLCBwYXJ0aXRpb24tPlpmZXJJbmZvLCBhbmQgcGFydGl0aW9uLT5i
YW1fY2FjaGUsCj4+IHNvIGtmcmVlKHBhcnRpdGlvbikgbWF5IGNhdXNlIG1lbW9yeSBsZWFrcywg
dXNpbmcgZnRsX2ZyZWVwYXJ0KHBhcnRpdGlvbikKPj4gd2lsbCBmaXggaXQuCgpJcyB0aGlzIGxl
YWsgb2JzZXJ2YWJsZSB2aWEga21lbWxlYWsgb3Igc3VjaD8KSSBhbHdheXMgdGhvdWdodCAtPnJl
bW92ZV9kZXYoKSB1bmNvbmRpdGlvbmFsbHkgZG8gYSBjbGVhbnVwIGxhdGVyLgoKPj4gRml4ZXM6
IDFkYTE3N2U0YzNmNCAoIkxpbnV4LTIuNi4xMi1yYzIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBHYW9z
aGVuZyBDdWkgPGN1aWdhb3NoZW5nMUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210
ZC9mdGwuYyB8IDEgKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZnRsLmMgYi9kcml2ZXJzL210ZC9mdGwuYwo+PiBpbmRl
eCBmNjU1ZDI5MDUyNzAuLjIwMDI3MWJkYzdhYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQv
ZnRsLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvZnRsLmMKPj4gQEAgLTEwMzEsNiArMTAzMSw3IEBA
IHN0YXRpYyB2b2lkIGZ0bF9hZGRfbXRkKHN0cnVjdCBtdGRfYmxrdHJhbnNfb3BzICp0ciwKPj4g
c3RydWN0IG10ZF9pbmZvICptdGQpCj4+ICAgCQlwYXJ0aXRpb24tPm1iZC5kZXZudW0gPSAtMTsK
Pj4gICAJCWlmICghYWRkX210ZF9ibGt0cmFuc19kZXYoJnBhcnRpdGlvbi0+bWJkKSkKPj4gICAJ
CQlyZXR1cm47Cj4+ICsJCWZ0bF9mcmVlcGFydChwYXJ0aXRpb24pOwo+PiAgIAl9Cj4+ICAgCj4g
PiAgIAlrZnJlZShwYXJ0aXRpb24pOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
