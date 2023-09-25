Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44867CE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r20pXdqIlKbAeYWwRqh881ZMSI2aATV+PTI7qSM7/oA=; b=W+cUDWSOumkLhXMizvNj4lRKcx
	2Y2Ndd1E/tn82nxOIh8yJkmCsRX0j+2Lkjp9oLrHEFTkCrDeL+Pm3/ZL5dyh3zDTYNbY8W7SS6zL7
	+20CO94JCn3P/L8p2UVUPeACw2DEzaKF+FMC5SywM8tar+WEV0SLI+sf57QavNnCAJquvjqOtur2m
	mACL+YOtrcKcNijAz70rIVg81/Do46L2st3u7Ek2Oj25VzUtX4utz9lmzWRIQ6REEb2OBJvC2L6zU
	LvHKjt+YRGnNBHNamNTFy3gXpIL0KFI1GtpkopR5OIRwtkSpiKNU6wC+TIOIW6vOgCwzHZM+bsImk
	vq14MQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkn3h-00EUN0-1G;
	Mon, 25 Sep 2023 14:59:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkn3e-00EUM7-0u
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 14:59:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2B679635DB44;
	Mon, 25 Sep 2023 16:59:32 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2CG2CtXr0tWR; Mon, 25 Sep 2023 16:59:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AF815635DB53;
	Mon, 25 Sep 2023 16:59:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IIRgHpfaaJM8; Mon, 25 Sep 2023 16:59:31 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8A104635DB44;
	Mon, 25 Sep 2023 16:59:31 +0200 (CEST)
Date: Mon, 25 Sep 2023 16:59:31 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <488305749.81257.1695653971403.JavaMail.zimbra@nod.at>
In-Reply-To: <20230925163727.7ecebe9a@xps-13>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com> <1131184426.81026.1695650583370.JavaMail.zimbra@nod.at> <20230925163727.7ecebe9a@xps-13>
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix error code loss in mtdchar_read() function.
Thread-Index: OEbc/pJ3ZpcGhIHTGpc8YMoVo8AlzQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_075934_470477_1711658D 
X-CRM114-Status: UNSURE (   8.63  )
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
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBHaXZlbiB0aGlzIGEgc2Vjb25kIHRob3VnaHQu
IEkgZG9uJ3QgdGhpbmsgYSBOQU5EIGRyaXZlciBpcyBhbGxvd2VkIHRvIHJldHVybgo+PiBsZXNz
IHRoYW4gcmVxdWVzdHMgYnl0ZXMgYW5kIHNldHRpbmcgRUJBRE1TRy4KPj4gVUJJJ3MgSU8gcGF0
aCBoYXMgYSBjb21tZW50IG9uIHRoYXQ6Cj4+IAo+PiAgICAgICAgICAgICAgICAgLyoKPj4gICAg
ICAgICAgICAgICAgICAqIFRoZSBkcml2ZXIgc2hvdWxkIG5ldmVyIHJldHVybiAtRUJBRE1TRyBp
ZiBpdCBmYWlsZWQgdG8gcmVhZAo+PiAgICAgICAgICAgICAgICAgICogYWxsIHRoZSByZXF1ZXN0
ZWQgZGF0YS4gQnV0IHNvbWUgYnVnZ3kgZHJpdmVycyBtaWdodCBkbwo+PiAgICAgICAgICAgICAg
ICAgICogdGhpcywgc28gd2UgY2hhbmdlIGl0IHRvIC1FSU8uCj4+ICAgICAgICAgICAgICAgICAg
Ki8KPj4gICAgICAgICAgICAgICAgIGlmIChyZWFkICE9IGxlbiAmJiBtdGRfaXNfZWNjZXJyKGVy
cikpIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgdWJpX2Fzc2VydCgwKTsKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgZXJyID0gLUVJTzsKPj4gICAgICAgICAgICAgICAgIH0KPiAKPiBJ
bnRlcmVzdGluZy4gU2hhbGwgd2UgYWRkIHRoaXMgY2hlY2sgdG8gdGhlIG10ZF9yZWFkKCkgcGF0
aCBhcyB3ZWxsPwo+IAo+IE1heWJlIHdpdGggYSBXQVJOX09OKCk/CgpXQVJOX09OX09OQ0UoKSwg
cGxlYXNlLiBCdXQgeWVzLCBsZXQncyBhZGQgaXQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
