Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39399EB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9z6fRXoUwW/Fd4Nt/vaV/x2xgzoVl9hwhtiKBFloSg=; b=BGFUH0/S5vBgb2UVnoJDml3GQv
	uiTK8gHXhaF8MItnfMvmTjN6QQp8vsfcUGl/BXLCIZla99SbRHEqGeRNlZlIGlJUO35Nz0DJhFquc
	AawyhLrQuwQQjxJT+D9KNxVMy+cso0HaP8iZE+4BDM6pCc/O4mnR+GEEZSseqzMkpDpNBFPO2zUUW
	NUY98XN2WJixUGD9OtWIr6Y/H2uiVK8lWe14YKoWJlvJMfeWvrBdwfr0FjXpYRo0ssDb+Nzj50rnI
	068MJfDqE8M7SqXf7LKBLin7Q7MpT9FJE7j9lWZB1yYQJLpr0ZN+MkTBavtpzHOmFohgH5mLxxSMq
	DwEN0aFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGNI-00FQ2d-0C;
	Tue, 11 Jul 2023 16:38:04 +0000
Received: from 18.mo582.mail-out.ovh.net ([46.105.73.110])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGND-00FPzW-2P
	for linux-mtd@lists.infradead.org;
	Tue, 11 Jul 2023 16:38:02 +0000
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.4.200])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 5D8E623382
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jul 2023 16:37:44 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-4bbwg (unknown [10.110.171.111])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9A90E1FE8B;
	Tue, 11 Jul 2023 16:37:42 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net ([151.80.29.18])
	by ghost-submission-6684bf9d7b-4bbwg with ESMTPSA
	id wnZYIlaFrWQzBQAAcMPekA
	(envelope-from <rafal@milecki.pl>); Tue, 11 Jul 2023 16:37:42 +0000
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 18:37:42 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Yang Rong <yangrong@vivo.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com, luhongfei@vivo.com
Subject: Re: [PATCH v3] mtd: core: Fix resource leak in a
 for_each_child_of_node() loop
In-Reply-To: <20230711020752.2344-1-yangrong@vivo.com>
References: <20230711020752.2344-1-yangrong@vivo.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <ffc8f6162a863179f88304ed8801d44f@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 9608429805198093183
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpefghfeuiefhiedttedtheefhfeifeffveekvdegteetkeetjedtiedvvdfhgfffffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipdduhedurdektddrvdelrddukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_093759_965032_D66D5BB1 
X-CRM114-Status: GOOD (  14.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMy0wNy0xMSAwNDowMywgWWFuZyBSb25nIHdyb3RlOgo+IEVuc3VyZSBjaGlsZCBub2Rl
IHJlZmVyZW5jZXMgYXJlIHByb3Blcmx5IGRlY3JlbWVudGVkIGluIHRoZSBlcnJvciBwYXRoCj4g
ICBvZiB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLgoKTml0cGlja2luZzogaXQncyBhY3R1
YWxseSBhIC9zdWNjZXNzLyBjb2RlIHBhdGggdGhhdCBtaXNzZXMKb2Zfbm9kZV9wdXQoKS4KCgo+
IEZpeGVzOiAyZGYxMWYwMDEwMGQgKCJtdGQ6IGNvcmU6IHRyeSB0byBmaW5kIE9GIG5vZGUgZm9y
IGV2ZXJ5IE1URCAKPiBwYXJ0aXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgUm9uZyA8eWFu
Z3JvbmdAdml2by5jb20+CgpBY2tlZC1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgoKCj4gLS0tCj4gdjI6IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDcx
MDA2MTQxMi4yMjcyLTEteWFuZ3JvbmdAdml2by5jb20vCj4gVGhlIG1vZGlmaWNhdGlvbnMgbWFk
ZSBjb3BhcmVkIHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uIGFyZSBhcyBmb2xsb3dzOgo+IDEuT3B0
aW1pemVkIHRoZSBleHByZXNzaW9uIG9mIHRoZSBTdWJqZWN0LCBtYWtpbmcgaXQgbW9yZSBhY2N1
cmF0ZS4KPiAyLk9wdGltaXplZCB0aGUgY29udGVudCBvZiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4g
My5BZGQgdGhlIHRhZyAiRml4ZXMiLgo+IAo+ICBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gIG1vZGUgY2hhbmdlIDEwMDY0NCA9
PiAxMDA3NTUgZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IGUwMGIxMmFhNWVj
OS4uYjAyY2I4YjFhMzhkCj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTU5MSw2ICs1OTEsNyBAQCBzdGF0aWMgdm9pZCBtdGRf
Y2hlY2tfb2Zfbm9kZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgCQlpZiAocGxlbiA9PSBtdGRf
bmFtZV9sZW4gJiYKPiAgCQkgICAgIXN0cm5jbXAobXRkLT5uYW1lLCBwbmFtZSArIG9mZnNldCwg
cGxlbikpIHsKPiAgCQkJbXRkX3NldF9vZl9ub2RlKG10ZCwgbXRkX2RuKTsKPiArCQkJb2Zfbm9k
ZV9wdXQobXRkX2RuKTsKPiAgCQkJYnJlYWs7Cj4gIAkJfQo+ICAJfQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
