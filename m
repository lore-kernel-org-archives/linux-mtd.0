Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53377C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 12:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253EF20B1F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 12:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dg4+m/ZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253EF20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BFR42x3c681xtVlUGRBNeB13QqozDOz7RUhZ17Yb5U=; b=Dg4+m/ZRbdwj4H
	AH6Ta5FIn3xpKk9I3o8+n0XrjGaVQmref+owZGjzFoVn8aw1cnoNsab3bvb0cc4I3YbwUSd4l9Bui
	JYENep4lnaP0zRVhfZlesxemdSsXV7mPBs3a6ijMKXgeJqbVDQQtJusnvMAKWHHZE88VuCTJRUNjU
	sfhQaAZhpa8PbxbyATd/7azM3H0ayEQO7jSy17Qt5CutvRIWnJs9lMngWhxMI4S2FyKXuNck6QLUM
	C9Ko2hecWKVn0poO32HK97d3iaKcJUXt1tdga83FvmjpbfiSgBZVVgqz5AFcNEHpXQxHhiDetdCRc
	o0Cfs27W2jQo2BzGCWCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlBAT-0005rc-GQ; Tue, 16 Jun 2020 12:58:21 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlBAL-0005bA-Lz
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 12:58:15 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0462820011;
 Tue, 16 Jun 2020 12:57:57 +0000 (UTC)
Date: Tue, 16 Jun 2020 14:57:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] mtd: rawnand: qcom: fix incorrect masking
 operator, used & instead of |
Message-ID: <20200616145756.4875d0c6@xps13>
In-Reply-To: <20200616115125.74298-1-colin.king@canonical.com>
References: <20200616115125.74298-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_055813_888650_939EE928 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ29saW4sCgpDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9u
IFR1ZSwgMTYgSnVuIDIwMjAKMTI6NTE6MjUgKzAxMDA6Cgo+IEZyb206IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gQ3VycmVudGx5IHRoZSBleHByZXNzaW9u
IChuYW5kX2N0cmwgfCBCQU1fTU9ERV9FTikgaXMgYWx3YXlzIHRydWUgbm8KPiBtYXR0ZXIgdGhl
IHZhbHVlIG9mIG5hbmRfY3RybCBiZWNhdXNlIHRoZSBpbmNvcnJlY3QgbWFza2luZyBvcGVyYXRv
cgo+IGlzIGJlaW5nIHVzZWQuICBGaXggdGhpcyBieSB1c2luZyBiaXQtd2lzZSAmIGluc3RlYWQg
b2YgfC4KCkkgc2F3IGl0IHdoZW4gcmV2aWV3aW5nIGFuZCBtYXJrZWQgaXQgdG8gc29sdmUgYmVm
b3JlIGFwcGx5aW5nIGJ1dCBpdApsb29rcyBsaWtlIEkgZm9yZ290IHRvIGRvIHNvLiBJZiB5b3Ug
ZG9uJ3QgbWluZCBJJ2xsIG1lcmdlIHRoaXMgd2l0aAp0aGUgb3JpZ2luYWwgY29tbWl0LgoKPiAK
PiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiV3Jvbmcgb3BlcmF0b3IgdXNlZCIpCj4gRml4ZXM6IGRk
MGMxZmM4ZGUxMiAoIm10ZDogcmF3bmFuZDogcWNvbTogc2V0IEJBTSBtb2RlIG9ubHkgaWYgbm90
IHNldCBhbHJlYWR5IikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCBhM2VmNDI4OGJlMjcuLjM3
ZDk1NTMyYmE3ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMjc5MCw3
ICsyNzkwLDcgQEAgc3RhdGljIGludCBxY29tX25hbmRjX3NldHVwKHN0cnVjdCBxY29tX25hbmRf
Y29udHJvbGxlciAqbmFuZGMpCj4gIAkJICogb25seSBpZiBpdCBpcyBub3QgaW4gQkFNIG1vZGUu
IEluIG1vc3QgY2FzZXMgQkFNCj4gIAkJICogbW9kZSB3aWxsIGJlIGVuYWJsZWQgaW4gYm9vdGxv
YWRlcgo+ICAJCSAqLwo+IC0JCWlmICghKG5hbmRfY3RybCB8IEJBTV9NT0RFX0VOKSkKPiArCQlp
ZiAoIShuYW5kX2N0cmwgJiBCQU1fTU9ERV9FTikpCj4gIAkJCW5hbmRjX3dyaXRlKG5hbmRjLCBO
QU5EX0NUUkwsIG5hbmRfY3RybCB8IEJBTV9NT0RFX0VOKTsKPiAgCX0gZWxzZSB7Cj4gIAkJbmFu
ZGNfd3JpdGUobmFuZGMsIE5BTkRfRkxBU0hfQ0hJUF9TRUxFQ1QsIERNX0VOKTsKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
