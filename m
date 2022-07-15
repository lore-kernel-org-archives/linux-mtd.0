Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E638C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A0SDoXSexhb+Owk3G2MIPgqEwI0qu4kppuQUsgEHihI=; b=f2khVkkMwB3SZFbuq05g/DJsZb
	YSsBP7kguXgHKsNG4vb1lNsTUvfJ45cFoLqHO/eqs4nTHGVpzqsB1usmSsjjwuXvEVbQguwfapSpC
	b6lqQhcKf4iLPnH+HcILKYCHcG0kegxdHijCq2L+MVOwNA1GWp7azjqm0T3nOkGif56CgjLOXE9e8
	zkgHmu9bklM0oebJPYwgzahdbwa4O+9T0+mkkM33cX4WhQx7XMKlZ6+8BM7U6p5c/dPo0LcqzvhV+
	U6eCRdgvbojggPkZ29d07sg/EgZdFN5Mo5HsehZSge55W2ws8RK1TnyvxciKhYPTcyZYC5kuKdYt6
	IqCSPtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGEV-005EGv-5x; Fri, 15 Jul 2022 07:59:31 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGEQ-005DrD-Ur
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 07:59:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B215E62B9C68;
	Fri, 15 Jul 2022 09:59:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 1TIbjO2dgAkX; Fri, 15 Jul 2022 09:59:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 468FC6081104;
	Fri, 15 Jul 2022 09:59:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XYp_pi8sEsn6; Fri, 15 Jul 2022 09:59:11 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1702562B9C5F;
	Fri, 15 Jul 2022 09:59:11 +0200 (CEST)
Date: Fri, 15 Jul 2022 09:59:10 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
	Tomasz =?utf-8?B?TW/FhA==?= <tomasz.mon@camlingroup.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sasha Levin <sashal@kernel.org>, 
	torvalds <torvalds@linux-foundation.org>, Han Xu <han.xu@nxp.com>, 
	kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>, 
	k drobinski <k.drobinski@camlintechnologies.com>
Message-ID: <770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
In-Reply-To: <YtEdIujszEKSprbF@kroah.com>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de> <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com> <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com> <YtD/9KJZwlVj+6hS@kroah.com> <20220715074631.GA7333@pengutronix.de> <YtEdIujszEKSprbF@kroah.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times
Thread-Index: tNvwF06jkVVUKvGeMUaVv400VmkHJQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_005927_161777_20BBC07D 
X-CRM114-Status: UNSURE (   5.43  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBNeSBJUkMgaGlzdG9yeSBkb2Vzbid0
IGdvIGJhY2sgZmFyIGVub3VnaCwgYnV0IGlmIEkgcmVjYWxsIGNvcnJlY3RseQo+PiBNaXF1ZWwg
aXMgb24gdmFjYXRpb24sIGhlIHdvdWxkIGhhdmUgcGlja2VkIHVwIHRoaXMgcGF0Y2ggZm9yIGxp
bnV4LW5leHQKPj4gb3RoZXJ3aXNlLgoKRXhhY3RseS4KIAo+IE9rLCBsZXQgbWUgZG8gYSByb3Vu
ZCBvZiBzdGFibGUgcmVsZWFzZXMgc28gdGhhdCBwZW9wbGUgZG9uJ3QgZ2V0IGhpdCBieQo+IHRo
aXMgbm93Li4uCgpUaGFua3MgYSBsb3QgZm9yIGRvaW5nIHNvLgogCj4gSG9wZWZ1bGx5IHRoaXMg
Z2V0cyBmaXhlZCB1cCBieSA1LjE5LWZpbmFsLgoKU3VyZSwgSSdsbCBwaWNrdXAgdGhpcyBwYXRj
aC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
