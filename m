Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E70BC27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PhPnAuM0G5tECM877HpLmM8uGGu4ZwN30m481ivQ714=; b=MazN+skw8vYMP34ZT7S+CZxNip
	h36dk28MKH3LaX5XYY8hGOAmMFflySJ6CuegcNaIY4KeO7L8cA97RQQdXB/068FvYA5EEqdllTL1H
	LwV9gwevKCb2QLN22lh78dyh7xUI53IVHIsJcLuIMNk5VSlUHm24rd+8C55jDo81Y/B9+ihiJUMJY
	5b/n1jKu7cjHP2Wi7zmLZIUeMUixhwDdIEwXeOOffld46GZdfDa+JS3sPkhRnx7nTgNbJH2jCjkKB
	GyD1r2lvgLdEDznjudVRevmOOF1jZJjluJ1SJZVoWjsxeCvb/SXqA16L9nlwXnZmsy6aEhKj8/3A8
	ZLZIz5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDOz-0000000BBnJ-3QvZ;
	Mon, 17 Jun 2024 14:32:09 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDOw-0000000BBju-087X
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 14:32:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E1DD161966BD;
	Mon, 17 Jun 2024 16:31:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ylp9hY2GKHJa; Mon, 17 Jun 2024 16:31:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8404561966BE;
	Mon, 17 Jun 2024 16:31:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JW9koqa3rudw; Mon, 17 Jun 2024 16:31:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5CC9861966BD;
	Mon, 17 Jun 2024 16:31:59 +0200 (CEST)
Date: Mon, 17 Jun 2024 16:31:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Gagan Sidhu <broly@mac.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <976649573.251318.1718634719216.JavaMail.zimbra@nod.at>
In-Reply-To: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: mFBxGNSof92Nq/KN5lgnAM/4Uq7Bqw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_073206_270742_262A4584 
X-CRM114-Status: UNSURE (   3.91  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkdhZ2FuIFNpZGh1IiA8YnJv
bHlAbWFjLmNvbT4KPiBBbjogIlpoYW9Mb25nIFdhbmciIDx3YW5nemhhb2xvbmcxQGh1YXdlaS5j
b20+Cj4gaSBoYXZlIGF0dGFjaGVkIGEgbG9nIG9mIHRoaXMgYmVoYXZpb3VyLiBhbmQgYnkgcmVt
b3ZpbmcgbXIgd2FuZ+KAmXMg4oCcZml4ZXPigJ0sIGl0Cj4gbW91bnRzIGFzIHdlIHdvdWxkIGV4
cGVjdC4KPiAKPiB0aGlzIGNoYW5nZSBtdXN0IGJlIHJldmVydGVkLiBleHRyZW1lbHkgc3VycHJp
c2VkIHRoZSBvcGVud3J0IHRlYW0gaGFzIG5vdAo+IHJhaXNlZCBpc3N1ZXMgb3ZlciB0aGlzIGJ5
IG5vdy4KCk5vIG5lZWQgdG8gYmUgb2ZmZW5kZWQsIHNvbWV0aW1lcyB1c2UtY2FzZXMgYXJlIGZv
cmdvdHRlbi4KVGhhbmtzIGZvciB5b3VyIHJlcG9ydCwgd2UnbGwgbG9vayBpbnRvIGl0LgoKVGhh
bmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
