Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A83C5DF6D
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n4jYVdpycC5by3/VNVOiYqfXUJOIl0WmY3N9c14xFxY=; b=gHbeZkfiWFKFRDoC24paZ75TVa
	rwIe5drWDnrVC4ZwaQJzQO+KbeLwp3YY2A9r312Rb+7p3UkmDDHe5/na0LhLgeP/tM8/KOwEHByUY
	RQ7oZRySqX6AFNshczY7iNaRc5PaKUVZemzOHcwYpx0vEvAbQEpF4ayARx1BvMmgrQd0NW2jVlTxk
	mG2cLoIxqYOqspO2kQHd1d33kyYljd1cheYQEF+/8PcQIwbOqfGveMkUDczypcMQ0YwIQ7ZDdvQJR
	DXmvEqXbKQlNxtt0iYMSKJ3vI67RbMUj9zXVJbAFf87UPrqaTJUB7s7UD6pwxYkDBdnZBa01ECOX5
	HYNDIeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdqd-00000009aQv-3yIB;
	Wed, 19 Aug 2026 10:48:43 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdqb-00000009aPW-0yUI
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 10:48:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4D2312ABFA3;
	Wed, 19 Aug 2026 12:48:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Y3tUH4L-z4t2; Wed, 19 Aug 2026 12:48:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C329F1012C9;
	Wed, 19 Aug 2026 12:48:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BQjyNchttuXN; Wed, 19 Aug 2026 12:48:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9CD772ABFA3;
	Wed, 19 Aug 2026 12:48:28 +0200 (CEST)
Date: Wed, 19 Aug 2026 12:48:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: stable <stable@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>, 
	Liyuan Pang <pangliyuan1@huawei.com>
Message-ID: <1200997805.161072.1787136508436.JavaMail.zimbra@nod.at>
In-Reply-To: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
References: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
Subject: Re: [PATCH 0/2] Backport fixes for UBI
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF153 (Linux)/8.8.12_GA_3809)
Thread-Topic: Backport fixes for UBI
Thread-Index: F+2qznxSfnYf+NuSw3xrvttzN/fCaQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_034841_424018_42A698C2 
X-CRM114-Status: UNSURE (   9.69  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRvbWluaXF1ZSBNYXJ0aW5l
dCIgPGRvbWluaXF1ZS5tYXJ0aW5ldEBhdG1hcmstdGVjaG5vLmNvbT4KPiBXaGlsZSBsb29raW5n
IGF0IHJlY2VudCBVQkkgcGF0Y2hlcyBJIGZvdW5kIHRoZXNlIHR3byBjb21taXRzIHRoYXQgSQo+
IGJlbGlldmUgYXJlIHdvcnRoIGJhY2twb3J0aW5nLgo+IAo+IFdlJ3JlIG5vdCB1c2luZyBmYXN0
bWFwIHNvIEkgZG9uJ3QgY2FyZSBtdWNoIGFib3V0IHRoZSBsZWFrIHRoZXJlLCBidXQKPiByZWR1
Y2luZyB3ZWFyIGlzIGFsd2F5cyBnb29kIHRvIHRha2UKPiAKPiBUaGFua3MhCj4gCj4gU2lnbmVk
LW9mZi1ieTogRG9taW5pcXVlIE1hcnRpbmV0IDxkb21pbmlxdWUubWFydGluZXRAYXRtYXJrLXRl
Y2huby5jb20+Cj4gLS0tCj4gQ2hlbmcgTWluZyBMaW4gKDEpOgo+ICAgICAgbXRkOiB1Ymk6IHNr
aXAgcHJvZ3JhbW1pbmcgdW51c2VkIGJpdHMgaW4gdWJpIGhlYWRlcnMKPiAKPiBMaXl1YW4gUGFu
ZyAoMSk6Cj4gICAgICB1Ymk6IGZhc3RtYXA6IGZpeCB1YmktPmZtIG1lbW9yeSBsZWFrCgpXaGls
ZSBwb3J0aW5nIHRoZXNlIGJhY2sgaXMgbm90IHdyb25nLCBJIGhhdmUgYSBoYXJkIHRpbWUgdG8g
c2VlIGhvdyB0aGUKY3VycmVudCBzdGFibGVzIHJ1bGVzIGFwcGx5IGhlcmUuCgoibXRkOiB1Ymk6
IHNraXAgcHJvZ3JhbW1pbmcgdW51c2VkIGJpdHMgaW4gdWJpIGhlYWRlcnMiIGRvZXMgbm90IGZp
eCBhbnl0aGluZy4KSXQncyBhIHB1cmUgb3B0aW1pemF0aW9uIGZvciBmdXR1cmUgZmxhc2hlcywg
VUJJIHdvcmtlZCBzaW5jZSBldmVyIHdpdGhvdXQgdGhpcwpjaGFuZ2UuCgoidWJpOiBmYXN0bWFw
OiBmaXggdWJpLT5mbSBtZW1vcnkgbGVhayIgZml4ZXMgYSBtZW1vcnkgbGVhaywgeWVzLiBCdXQg
b25seSBpbiBhIGZhaWx1cmUKcGF0aCBhdCBhdHRhY2ggdGltZS4gVXNlcnNwYWNlIGNhbm5vdCB0
cmlnZ2VyIHRoaXMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
