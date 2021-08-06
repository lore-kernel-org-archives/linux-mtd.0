Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9A3C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BAFF60ED6
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BAFF60ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpEGgYSdjdKmSqQZL3Ab0Y1IbSN1qU83zajLctRu2B0=; b=iJS5DTBEee/V8S
	NjJV/jarZmqxsphoHy2NHRu5Tgs3P4ZEef9bVVnrZjs3zzlWOvYvtATMBz+/8hpuhB2GOcJbJrbmp
	8FucCx7PjUAMzfUlStaCDqHF+F6SihHJFkzC5v+U8aFXqzlhjKk+uYTtSO1LwUlBv8z7iQmg69WLT
	rKJDJVEgrainQzoN8xHLiYmGJ6SKSy94QNty11jaxsKq1QOEi4YlUnTszLumiPnt2UUm2tfNOjcBh
	liKJf5t8rF7rJhNbs3WoQLHi2oaeFPhOzqGh/79D0ue82xzYcZQXdGcLWPGJKjdxZe0wgJ1V1DMm8
	13svVEphl+nlPFfQfiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC4Tu-00D7rn-AG; Fri, 06 Aug 2021 18:22:06 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC4Tq-00D7qI-Is
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 18:22:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A74B5100006;
 Fri,  6 Aug 2021 18:21:59 +0000 (UTC)
Date: Fri, 6 Aug 2021 20:21:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Young <sean@mess.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/4] mtd: rfd_ftl: fix use-after-free
Message-ID: <20210806202158.5aa6ee26@xps13>
In-Reply-To: <29e817be984471dc2438a9414a9a7e1768d62950.1626169090.git.sean@mess.org>
References: <cover.1626169090.git.sean@mess.org>
 <29e817be984471dc2438a9414a9a7e1768d62950.1626169090.git.sean@mess.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_112202_811472_29866491 
X-CRM114-Status: GOOD (  15.06  )
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

SGkgU2VhbiwKClNlYW4gWW91bmcgPHNlYW5AbWVzcy5vcmc+IHdyb3RlIG9uIFR1ZSwgMTMgSnVs
IDIwMjEgMTA6NDQ6MDMgKzAxMDA6Cgo+IGRlbF9tdGRfYmxrdHJhbnNfZGV2KCkgd2lsbCBrZnJl
ZSBwYXJ0LCBzbyB0aGlzIGlzIGEgdXNlLWFmdGVyLWZyZWUuIFVzZQo+IGNvbnRhaW5lcl9vZigp
IHRvIG1ha2UgaXQgY2xlYXJlciB3aGF0IHRoZSBjYXN0IGlzIGRvaW5nLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFNlYW4gWW91bmcgPHNlYW5AbWVzcy5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3Jm
ZF9mdGwuYyB8IDE0ICsrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3JmZF9m
dGwuYyBiL2RyaXZlcnMvbXRkL3JmZF9mdGwuYwo+IGluZGV4IDdmNWY2ZDI0N2NhZS4uYWYyMGEw
YTcxMTA4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3JmZF9mdGwuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL3JmZF9mdGwuYwoKWy4uLl0KCj4gQEAgLTgwMCwxMCArODAwLDEwIEBAIHN0YXRpYyB2
b2lkIHJmZF9mdGxfcmVtb3ZlX2RldihzdHJ1Y3QKbXRkX2Jsa3RyYW5zX2RldiAqZGV2KQo+ICAJ
CQlwYXJ0LT5tYmQubXRkLT5uYW1lLCBpLCBwYXJ0LT5ibG9ja3NbaV0uZXJhc2VzKTsKPiAgCX0K
PiAgCj4gLQlkZWxfbXRkX2Jsa3RyYW5zX2RldihkZXYpOwo+ICAJdmZyZWUocGFydC0+c2VjdG9y
X21hcCk7Cj4gIAlrZnJlZShwYXJ0LT5oZWFkZXJfY2FjaGUpOwo+ICAJa2ZyZWUocGFydC0+Ymxv
Y2tzKTsKPiArCWRlbF9tdGRfYmxrdHJhbnNfZGV2KCZwYXJ0LT5tYmQpOwoKSSBhbSBub3Qgc3Vy
ZSBtb3ZpbmcgdGhpcyBjYWxsIGF0IHRoZSBib3R0b20gb2YgZnRsX3JlbW92ZV9kZXYgbWFrZXMK
c2Vuc2UsIGNhbiB3ZSBrZWVwIGl0IHdoZXJlIGl0IHdhcyBhbmQganVzdCBkbyB0aGUgcy9kZXYv
cGFydC0+bWJkLyA/Cgo+ICB9Cj4gIAo+ICBzdGF0aWMgc3RydWN0IG10ZF9ibGt0cmFuc19vcHMg
cmZkX2Z0bF90ciA9IHsKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
