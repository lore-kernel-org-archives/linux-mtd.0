Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFD9C433E3
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 11:16:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C1920729
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 11:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TUXLrw1N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C1920729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5/k61nYNMfSS9alZCbTog07LUAE2U3EEL/SZiJYsJWs=; b=TUXLrw1NSDNV8ZQX9g9XEvwOM
	OaImEM6FbhFUSNJT7SZpuU4F85U+VvKIP7clR4CsWEXYCKkBPeja24bx1F5FLX2Vx940eRdqNWSEO
	OMvk+a0SY5zfxU7kMHsfQZKkWAW9i2Hncg7n+vUm4cJQVq8ve5Cr8nf8S5xSAnV8IfOfSiq6nhv5m
	AJKzM3LHSo0MNV4pi0kVLnuAYLAUghLLZdNIWywxxoUkpB+452oqiI2JG1BxCB+dqjfk9/7P8IH7C
	+FVTQUvvXS2YIL7NTdYwRctlwphBvhah58O7HH4ylUaVs30IxPq9mhRHwlyKGaSj3OHO5/kpZIzN7
	zs1bZYlLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyCj0-0007jb-Cy; Wed, 22 Jul 2020 11:15:50 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyCiy-0007ix-0v
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 11:15:48 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 319D462D8C69;
 Wed, 22 Jul 2020 13:15:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Zc9TNu-wkYTl; Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9006B62D8C68;
 Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ze2yEkGTJ1nH; Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5BAE56071A74;
 Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
Date: Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Message-ID: <1212963412.160863.1595416543195.JavaMail.zimbra@nod.at>
In-Reply-To: <20200722062552.212200-5-hch@lst.de>
References: <20200722062552.212200-1-hch@lst.de>
 <20200722062552.212200-5-hch@lst.de>
Subject: Re: [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: initialize ->ra_pages in bdi_init
Thread-Index: SEPLczWq50DYtFrGpPhckNZ8Awj6bw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_071548_186473_D0468291 
X-CRM114-Status: UNSURE (   5.12  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, cgroups@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFNldCB1cCBhIHJlYWRhaGVhZCBzaXpl
IGJ5IGRlZmF1bHQsIGFzIHZlcnkgZmV3IHVzZXJzIGhhdmUgYSBnb29kCj4gcmVhc29uIHRvIGNo
YW5nZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAtLS0KPiBibG9jay9ibGstY29yZS5jICAgICAgfCAxIC0KPiBkcml2ZXJzL210ZC9tdGRj
b3JlLmMgfCAxICsKPiBmcy85cC92ZnNfc3VwZXIuYyAgICAgfCA0ICsrLS0KPiBmcy9hZnMvc3Vw
ZXIuYyAgICAgICAgfCAxIC0KPiBmcy9idHJmcy9kaXNrLWlvLmMgICAgfCAxIC0KPiBmcy9mdXNl
L2lub2RlLmMgICAgICAgfCAxIC0KPiBmcy9uZnMvc3VwZXIuYyAgICAgICAgfCA5ICstLS0tLS0t
LQo+IGZzL3ViaWZzL3N1cGVyLmMgICAgICB8IDEgKwoKRm9yIHViaWZzIGFuZCBtdGQ6CgpBY2tl
ZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNo
YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
