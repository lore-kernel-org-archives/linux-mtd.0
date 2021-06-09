Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE8AC48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 18:23:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422CC6128A
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 18:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 422CC6128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vJ0UE2o4jGlxgn8sDrN6LpABSN9CSXI4Sk346CKrqbo=; b=qqJiSU5Xw6wXdvQM+WTFDV1F9I
	DJIvT5viSSYrMWpAtE425jc4dUDMSj6o/Jyuyyis4NrbJWCKYtV6ZinjnccPe3cN0gEyvnvNDwIq8
	ysPGhxD5KHYifMm3l4HDX2dfmVmdfcBep8u27K3OFuiHPrRY3sgKXpeS/GnmgOZRNpfkGMWsefY5S
	nd3tZfSiQyNWpujYOyVdWbcE9/TOybiAAvh9p+MMV3J+vloLX3hRc4P+1iI7yDkdx3vefKfZJj514
	N/gV3Meb/7JQMWdA3YsqGMNTCqQRYBwDYfed8cdNBMIcSOa+lNUAClGApkEfrIoxNTPyqYbnD4Cs9
	i+KNGagQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr2qZ-00FXXN-0n; Wed, 09 Jun 2021 18:22:35 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr2qW-00FXVD-B0
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 18:22:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B28CA610819B;
 Wed,  9 Jun 2021 20:22:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NzIECcYGWfXl; Wed,  9 Jun 2021 20:22:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 59F426083273;
 Wed,  9 Jun 2021 20:22:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HwGQNDz1K7Wk; Wed,  9 Jun 2021 20:22:21 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1E7456108194;
 Wed,  9 Jun 2021 20:22:21 +0200 (CEST)
Date: Wed, 9 Jun 2021 20:22:20 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <295072107.94766.1623262940865.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLiRDZ9M4n3uh=i6FpHXoVEWMHpt0At8YaydrOM=LvSvdg@mail.gmail.com>
References: <CAOuPNLiRDZ9M4n3uh=i6FpHXoVEWMHpt0At8YaydrOM=LvSvdg@mail.gmail.com>
Subject: Re: qemu: arm: mounting ubifs using nandsim on busybox
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: qemu: arm: mounting ubifs using nandsim on busybox
Thread-Index: RJ64NFz5i2HW9LxJVNrur1Kl9viauw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_112232_547278_71BD3B82 
X-CRM114-Status: UNSURE (   4.78  )
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

UGludHUsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gS2VybmVsIHBhbmljIC0g
bm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50IHJvb3QgZnMgb24gdW5rbm93bi1ibG9j
aygzMSwwKQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gCj4gSWYgYW55IG9uZSBo
YXMgdXNlZCBuYW5kc2ltIG9uIHFlbXUgYmVmb3JlLCBwbGVhc2UgbGV0IHVzIGtub3cgdGhlIGV4
YWN0IHN0ZXBzLgoKbmFuZHNpbSB3b3JrcyBhcyBleHBlY3RlZC4gSXQgY3JlYXRlcyBhIG5ldyBh
bmQgKmVyYXNlZCogTkFORCBmb3IgeW91LgpTbyB5b3UgaGF2ZSBubyBVQkkgdm9sdW1lcy4gVGhl
cmZvcmUgVUJJRlMgY2Fubm90IGJlIG1vdW50ZWQuCkkgc3VnZ2VzdCBjcmVhdGluZyBhIHRpbnkg
aW5pdHJhbWZzIHRoYXQgY3JlYXRlcyBVQkkgdm9sdW1lcyBiZWZvcmUgbW91bnRpbmcgVUJJRlMg
b24Kb25lIG9mIHRoZSBmcmVzaGx5IGNyZWF0ZWQgKGFuZCBlbXB0eSkgdm9sdW1lcy4KClRoYW5r
cywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
