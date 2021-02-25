Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089D7C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 07:49:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98A9364E21
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 07:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98A9364E21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0/Y3LS0H2UiYwdo6/FVVdeIn2HBtovDdyoWE9u7YNrU=; b=24+QjT6mb7xkyAyCN9Qw0sZOW
	sfkGR8WU1J6kRY/XXpkue3k5FAz0zi6i7BuyjkxRC1FrZby5ZlB+HYZgOaZpfAHJ3KGjMhnw9bXYl
	Wjjze0FX1wlShunhBwfzZua/p1OqQxu+wA8Zd2ZAqKoSPqyPODeuwDor5XYhYcs9TzlbaWHSbKOVF
	Cz9J0+5Kell3jn0IETzF5w0xOXcuGLkaBYFlh6E7TdAewpOYwB1whppHLZzYpWV/J7TTVJn3TcQpx
	9fjAhhShnAiK6Z0nfHyGLG545TEIMjCgDkuiQ1nwwq2ABwUiLe9GdpvmCJiRkgDALQMrcrVYGFLBG
	t/7QI9Qpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFBO8-0005Id-Gq; Thu, 25 Feb 2021 07:48:44 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFBO5-0005Hj-QB
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 07:48:42 +0000
X-Originating-IP: 86.250.253.134
Received: from xps13 (lfbn-tou-1-813-134.w86-250.abo.wanadoo.fr
 [86.250.253.134]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D5391E0007;
 Thu, 25 Feb 2021 07:48:39 +0000 (UTC)
Date: Thu, 25 Feb 2021 08:48:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] nand: brcmnand: fix OOB R/W with Hamming ECC
Message-ID: <20210225084838.34bbdbff@xps13>
In-Reply-To: <CAN8TOE_Eg6zYqy8wLtrNcTiCQdcihM7wGM5JHw=bh4=b1CL-_A@mail.gmail.com>
References: <20210222201655.32361-1-noltari@gmail.com>
 <20210224080210.23686-1-noltari@gmail.com>
 <CAN8TOE_Eg6zYqy8wLtrNcTiCQdcihM7wGM5JHw=bh4=b1CL-_A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_024841_976435_978A187F 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>,
 linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCkJyaWFuIE5vcnJpcyA8Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPiB3
cm90ZSBvbiBXZWQsIDI0IEZlYiAyMDIxCjEzOjAxOjEzIC0wODAwOgoKPiBPbiBXZWQsIEZlYiAy
NCwgMjAyMSBhdCAxMjowMiBBTSDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMKPiA8bm9sdGFyaUBn
bWFpbC5jb20+IHdyb3RlOgo+ID4gRml4ZXM6IDI3YzViMTdjZDFiMSAoIm10ZDogbmFuZDogYWRk
IE5BTkQgZHJpdmVyICJsaWJyYXJ5IiBmb3IgQnJvYWRjb20gU1RCIE5BTkQgY29udHJvbGxlciIp
ICAKPiAKPiBGV0lXLCBJIGNvdWxkIGJlbGlldmUgdGhpcyB3YXMgYnJva2VuLiBXZSB3ZXJlbid0
IHRlc3RpbmcgSGFtbWluZyBFQ0MKPiAobm9yIEpGRlMyKSBhdCB0aGUgdGltZSwgc28gaXQgY291
bGQgZWFzaWx5IGhhdmUgb2J2aW91cyBidWdzIGxpa2UKPiB0aGlzLgoKUmlnaHQsIHlvdSBzaG91
bGQgcHJvYmFibHkgbGltaXQgdGhlIGJhY2twb3J0IHRvIHRoZSB0aW1lIHdoZW4gcmF3CmFjY2Vz
c29ycyBnb3QgaW50cm9kdWNlZC9maXhlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
