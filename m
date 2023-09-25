Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4209CE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8s6dQQNtTrAPMYuXdJuAQpIU2UIDkbynRNfGNFH/luE=; b=hT3gy/THEeJ7RZRo2sNNBPlc0k
	Gx24ozd/kDCJGgqQUURrAMbWgQoeAY4qeKMBwvjQtUfLDBPdxomWvQztn8m9sLnpNaHQrjcuonCu6
	xtkznjngDxsfjWltuHSiWS6ImB0lm7XWhjNKD6tUc3weMBhOLn1fJI3SRXVaBufsop/tfD+UCeHBW
	wgtzSkmOR+psPJEL7F+JzdThlxIGIDqpCpaelfQdNRQ7a0JW6iBKZzJhmDnLsqQjQ+OqCuDNtTtt0
	JJJEPpgIbfSV0upvlm7PJw96s+4qMvD/3QGYh04HtRZbAJg2mXqk954QeCTwJvkpm+2anPTh/DU2h
	LWt9KGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhwW-00DrN3-1n;
	Mon, 25 Sep 2023 09:31:52 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhwT-00DrMi-2O
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 09:31:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 43D0C635DB5B;
	Mon, 25 Sep 2023 11:31:48 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id M_5O8PH87ned; Mon, 25 Sep 2023 11:31:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CE4CE622F591;
	Mon, 25 Sep 2023 11:31:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id R0w8n3XsPmXs; Mon, 25 Sep 2023 11:31:47 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 96F04635DB5B;
	Mon, 25 Sep 2023 11:31:47 +0200 (CEST)
Date: Mon, 25 Sep 2023 11:31:47 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <1385178592.80194.1695634307277.JavaMail.zimbra@nod.at>
In-Reply-To: <20230925112853.6cb7fff3@xps-13>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com> <20230925104938.3f7b4284@xps-13> <495954216.80155.1695633280285.JavaMail.zimbra@nod.at> <20230925112853.6cb7fff3@xps-13>
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix error code loss in mtdchar_read() function.
Thread-Index: W7/WnPiEM/oyGFOILGmf+sfD68BiaA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_023149_949926_8746A4B1 
X-CRM114-Status: UNSURE (   7.83  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBBcyBwb2ludGVkIG91dCBieSBNaXF1ZWwsIHRo
ZSBjb21tZW50IG1ha2VzIGl0IGNsZWFuIHRoYXQgdGhpcyBiZWhhdmlvciBpcwo+PiBvbiBwdXJw
b3NlLiBJZiB3ZSByZXR1cm4gbm93IGFsbCBvZiBhIHN1ZGRlbiAtRUJBRE1TRyBmb3IgdGhlIGRl
c2NyaWJlZAo+PiBzY2VuYXJpbyB3ZSBtaWdodCBldmVuIGJyZWFrIGV4aXN0aW5nIE1URCB1c2Vy
c3BhY2UuCj4gCj4gVGhlIGJ1Z3ppbGxhIGxpbmsgaW4gdGhlIGNvbW1pdCBsb2cgWzFdIG1lbnRp
b25zOgoKVXBzLgogCj4gKiBkZCB3b3VsZCBqdXN0IHN0b3AgaW4gdGhlIG1pZGRsZSB3aXRob3V0
IHNob3dpbmcgZXJyb3JzCj4gIC0+IHdlIHByb2JhYmx5IGRvbid0IGNhcmUsIHdlIGV4cGVjdCB0
aGUgdXNlcnNwYWNlIHRvIGtub3cgdGhpcyBpcwo+ICBOQU5EIHdoZW4gZGVhbGluZyB3aXRoIG10
ZCBkZXZpY2VzIGRpcmVjdGx5LCBkZCBpcyBub3QgbXRkLWF3YXJlCj4gIGFueXdheS4KClllcC4g
VGhhdCdzIGZpbmUuCiAKPiAqIHViaWZvcm1hdCB3b3VsZCBsb29wIGZvcmV2ZXIKPiAgLT4gdGhh
dCBvbmUgbmVlZHMgYXR0ZW50aW9uIEkgZ3Vlc3MgOikKCkhtbS4gTGV0IG1lIGNoZWNrIHRoZSBz
b3VyY2UuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
