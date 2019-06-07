Return-Path: <SRS0=qE3A=UG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D8EC2BCA1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 20:09:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8EB8208C0
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 20:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G8yr8McV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8EB8208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wym/JFuT27iPcRexc0DRjqLL7vWf0yrjuHfm3iLDG/M=; b=G8yr8McV9zgZDt
	u9uN5IjrXrtZtBKWT9kVpSORLiE6AQ14b/uS6jteYkOuYeq5bUkCf7JY4qnqf4U9oHd6Isvzkq0dR
	oNR2FteXwx0eM0onvI0bMdEzIc+3IjLxHcQxBQn8VbTsfSqx0ipbNahBfzMULyHdTE60G3rzJ6lcQ
	kDgdtD/+I1QOEFY0o7SnKfOxK3VgMsATuM+Gb8FYNTQQWvBK4T3XjHKB71NAAvS2tsfam5AeNMnqf
	Lczo13vIhelRKWcnONtVCjMoswMG4IS5pkINDCPMpeSjRm/K5OUp8aNoUqkEoxH8aImkv1xDUbMdH
	LzqJC6Aj3R9qXFEy0qOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZLB7-00010d-2Z; Fri, 07 Jun 2019 20:09:33 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZLB3-0000zT-Hi
 for linux-mtd@lists.infradead.org; Fri, 07 Jun 2019 20:09:31 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 12E096074CC1;
 Fri,  7 Jun 2019 22:09:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kNthjU-GYg1E; Fri,  7 Jun 2019 22:09:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B8741608310F;
 Fri,  7 Jun 2019 22:09:24 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qx-a-PPfJeha; Fri,  7 Jun 2019 22:09:24 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8D0BC608F45A;
 Fri,  7 Jun 2019 22:09:24 +0200 (CEST)
Date: Fri, 7 Jun 2019 22:09:24 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Emil Lenngren <emil.lenngren@gmail.com>
Message-ID: <1644731533.84685.1559938164477.JavaMail.zimbra@nod.at>
In-Reply-To: <CAO1O6sdU=kAYS2sTKwiagxrbg+fMer9nvbwA9C4LoFMgH7e1dQ@mail.gmail.com>
References: <20190515210202.21169-1-richard@nod.at>
 <CAO1O6sdU=kAYS2sTKwiagxrbg+fMer9nvbwA9C4LoFMgH7e1dQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Add support for zstd compression.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: ubifs: Add support for zstd compression.
Thread-Index: rnvHZUv9ubNCdBXV/imbNn3Xo5b/uw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_130929_731766_76515FCA 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
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
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Michele Dionisio <michele.dionisio@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RW1pbCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBJbiBmcy91Ymlmcy9zYi5j
IHdlIGhhdmUKPiAKPiBzdGF0aWMgaW50IGdldF9kZWZhdWx0X2NvbXByZXNzb3Ioc3RydWN0IHVi
aWZzX2luZm8gKmMpCj4gewo+ICAgIGlmICh1Ymlmc19jb21wcl9wcmVzZW50KGMsIFVCSUZTX0NP
TVBSX0xaTykpCj4gICAgICAgIHJldHVybiBVQklGU19DT01QUl9MWk87Cj4gCj4gICAgaWYgKHVi
aWZzX2NvbXByX3ByZXNlbnQoYywgVUJJRlNfQ09NUFJfWkxJQikpCj4gICAgICAgIHJldHVybiBV
QklGU19DT01QUl9aTElCOwo+IAo+ICAgIHJldHVybiBVQklGU19DT01QUl9OT05FOwo+IH0KPiAK
PiBNYXliZSBhZGQgYW4gZW50cnkgZm9yIHpzdGQgaGVyZSBhcyB3ZWxsPwoKV2hlcmUgd291bGQg
eW91IGFkZCBpdD8gSWYgd2UgYWRkIGl0IGFmdGVyIFVCSUZTX0NPTVBSX1pMSUIsCml0IHdpbGwg
ZWZmZWN0aXZlbHkgbmV2ZXIgZ2V0IHNlbGVjdGVkLCB1bmxlc3Mgc29tZW9uZSBidWlsZHMgYSBr
ZXJuZWwKd2l0aG91dCBsem8gYW5kIHpsaWIgYnV0IHpzdGQuCklmIHdlIGFkZCBpdCBiZWZvcmUg
VUJJRlNfQ09NUFJfWkxJQiwgaXQgd2lsbCBiZSB1c2VkIGFsd2F5cyBhbmQgdXNlcnMKZW5kIHVw
IHdpdGggdW5yZWFkYWJsZSBmaWxlcyBpZiB0aGV5IHJlYm9vdCB0byBhbiBvbGRlciBrZXJuZWwu
ClBsZWFzZSBub3RlIHRoYXQgd2UgZGlkbid0IHJhaXNlIHRoZSBVQklGUyBmb3JtYXQgdmVyc2lv
biBmb3IgenN0ZC4KClNvIEknbSBub3Qgc3VyZSB3aGF0IGlzIHRoZSBiZXN0IGNob2ljZSBmb3Ig
dGhlIGRlZmF1bHQgZmlsZXN5c3RlbS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
