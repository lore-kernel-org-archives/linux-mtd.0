Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20761CD6E52
	for <linux-mtd@archiver.kernel.org>; Sun, 31 May 2026 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E9kLFGBMatH1J9GDfMkX9rPdkJGF4oanWH6sIPWtEpg=; b=Oi2cEDsaUu7G4X5zl0jNSAvR10
	rrxobAoR1K2ROR7aSizLdCm7LblNeHqZ07gIdyCU3qkFild5tY2V3vIKP86c5om6h7+T6sAprqFbR
	CsGRFIeY7OvvmFnfKhkWqzI9VEDQMyOGaRmsFOM/IsNGZvu33zzOIiKyvfyL2N5RFL4egVWIU2x1A
	rr1Qz5KCMhDV+h96SvH9DGeojlqhnvns3BuGz6BP9O3dp02JrP60YZ3STe7Bg4iD22LQJfCMVnFV9
	xJedMZR3YCzKHQ5DZFs/ihArCAltiCNSh29aQVpsKf3+Lyg0Wx2FeAYdM0bRQqsO6gdKbHFjSZjQX
	j4OW3CZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTgwF-00000009dzR-31T9;
	Sun, 31 May 2026 14:14:51 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTgwC-00000009dyz-1W3l
	for linux-mtd@lists.infradead.org;
	Sun, 31 May 2026 14:14:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B3844298580;
	Sun, 31 May 2026 16:14:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id B9WgskCc2koJ; Sun, 31 May 2026 16:14:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 03BAB298599;
	Sun, 31 May 2026 16:14:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X4Pd-f7Qa2fE; Sun, 31 May 2026 16:14:41 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D2A38298580;
	Sun, 31 May 2026 16:14:41 +0200 (CEST)
Date: Sun, 31 May 2026 16:14:41 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Tristan Madani <tristmd@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <885639730.46489.1780236881726.JavaMail.zimbra@nod.at>
In-Reply-To: <69f9e8df.050a0220.21ce45.4f26@mx.google.com>
References: <20260501110246.50647-1-tristmd@gmail.com> <69f9e8df.050a0220.21ce45.4f26@mx.google.com>
Subject: Re: [PATCH 1/3] jffs2: always stop garbage collection thread on
 unmount
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF150 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: always stop garbage collection thread on unmount
Thread-Index: /ZuXZCVo9rgqSUotqWtDZKFCPZGHtA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_071448_544616_F7F269F5 
X-CRM114-Status: UNSURE (   7.38  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRyaXN0YW4gTWFkYW5pIiA8
dHJpc3RtZEBnbWFpbC5jb20+Cj4gQW46ICJEYXZpZCBXb29kaG91c2UiIDxkd213MkBpbmZyYWRl
YWQub3JnPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBDQzogImxpbnV4LW10ZCIgPGxp
bnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IEdlc2VuZGV0OiBEaWVuc3RhZywgNS4gTWFp
IDIwMjYgMTQ6NTU6NTkKPiBCZXRyZWZmOiBSZTogW1BBVENIIDEvM10gamZmczI6IGFsd2F5cyBz
dG9wIGdhcmJhZ2UgY29sbGVjdGlvbiB0aHJlYWQgb24gdW5tb3VudAoKPiBIaSBEYXZpZCwgUmlj
aGFyZCwKPiAKPiBKdXN0IGNoZWNraW5nIGlmIHlvdSBoYWQgYSBjaGFuY2UgdG8gbG9vayBhdCB0
aGlzIHNlcmllcy4gUGF0Y2hlcyAxLzMKPiBhbmQgMy8zIGhhdmUgc3l6Ym90IFRlc3RlZC1ieSBj
b25maXJtYXRpb25zLiBIYXBweSB0byBhZGRyZXNzIGFueQo+IGZlZWRiYWNrLgoKSSdtIHNvcnJ5
LCBJIGhhZCBubyBjaGFuY2Ugc28gZmFyLgpCdXQgSSBwcm9taXNlIHRvIGxvb2sgOi1ECgpUaGFu
a3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
