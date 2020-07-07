Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63544C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:48:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F13206E2
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b7hgeZoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F13206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4lU3Z6vRygJT0r9zB8riBeDdWaxJ8ka8glE1phcMqbw=; b=b7hgeZoOXlk0RiS8kfYeZj/8i
	rNe8pdPUiH3+4TgezH4bPFgxbwCG/+mgvlf0x8/8lxJOGR90I6CsVWPfxAqqAmhqfCr+otWH5iz6H
	Y1nksu6ArOQk6fFWniaYTctRELKrhR2HSni2dK7DhEoRMrdRj/9amyjm64p5LiXbkSo/MjODKQtzI
	ScT65i0qXi6F7/3HJ3w5tqBUGOgUoIFXJfxyQmL6MErRoct5t9LRZrex/El3bC/pDRUBcXnhia4ay
	FSR+viZ0/jVkyMKafA46pSiFENFzd1tLUT+tOGPFYs9PHQu21EqvYj2IVnQbkV9pZSWblf6PSr+kX
	hmHlRIJ5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsn0b-0004nh-Qp; Tue, 07 Jul 2020 12:47:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsn0Z-0004mx-J3
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 12:47:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8BC25625BBD0;
 Tue,  7 Jul 2020 14:47:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id eijkKERwVYDA; Tue,  7 Jul 2020 14:47:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2D10D625BBD2;
 Tue,  7 Jul 2020 14:47:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xLztF4_PzNUd; Tue,  7 Jul 2020 14:47:34 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 053E3625BBD0;
 Tue,  7 Jul 2020 14:47:34 +0200 (CEST)
Date: Tue, 7 Jul 2020 14:47:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <1480699627.103583.1594126053947.JavaMail.zimbra@nod.at>
In-Reply-To: <963fa5c8-414f-783f-871e-47e751b54d87@huawei.com>
References: <20200701112643.726986-1-chengzhihao1@huawei.com>
 <CAFLxGvyO_aXGfgoO0mrNsoGP4Bfh3n6CUQxDx=ecH6o2ZDNYDg@mail.gmail.com>
 <082f18e0-d6f0-6389-43af-3159edb244cb@huawei.com>
 <1463101229.103384.1594123741187.JavaMail.zimbra@nod.at>
 <963fa5c8-414f-783f-871e-47e751b54d87@huawei.com>
Subject: Re: [PATCH] ubifs: Fix a potential space leak problem while linking
 tmpfile
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix a potential space leak problem while linking tmpfile
Thread-Index: z3Bxr4A9F54hqlSABBHN3RwegnQ+tw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_084735_740113_BAEC259C 
X-CRM114-Status: UNSURE (   6.91  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4gUGVyaGFwcyBJIG1pc3VuZGVyc3Rv
b2Qgd2hhdCBjb21taXQgMzJmZTkwNWMxN2YwMDEgKCJ1YmlmczogRml4Cj4+PiBPX1RNUEZJTEUg
Y29ybmVyIGNhc2UgaW4gdWJpZnNfbGluaygpIikgd2FudGVkIHRvIGZpeC4KPj4+IEkgdGhpbmsg
b3JwaGFuIGFyZWEgaXMgdXNlZCB0byByZW1pbmQgZmlsZXN5c3RlbSBkb24ndCBmb3JnZXQgdG8g
ZGVsZXRlCj4+PiBpbm9kZXMgKHdob3NlIG5saW5rIGlzIDApIGluIG5leHQgdW5jbGVhbiByZWJv
b3RpbmcuIEdlbmVyYWxseSwgdGhlIGZpbGUKPj4+IHN5c3RlbSBpcyBub3QgY29ycnVwdGVkIGNh
dXNlZCBieSByZXBsYXlpbmcgb3JwaGFuIG5vZGVzLgo+Pj4gUmFscGggcmVwb3J0ZWQgYSBmaWxl
c3lzdGVtIGNvcnJ1cHRpb24gaW4gY29tYmluYXRpb24gd2l0aCBvdmVybGF5ZnMuCj4+PiBDYW4g
eW91IHRlbGwgbWUgdGhlIGRldGFpbHMgYWJvdXQgdGhhdCBwcm9ibGVtPyBUaGFua3MuCj4+IE9u
IG15IHRlc3QgYmVkIEkgZGlkbid0IHNlZSBhIGZzIGNvcnJ1cHRpb24sIHdoYXQgSSBzYXcgd2Fz
IGEgZmFpbGluZyBvcnBoYW4KPj4gc2VsZiB0ZXN0IHdoaWxlIHBsYXlpbmcgd2l0aCBPX1RNUEZJ
TEUgYW5kIGxpbmthdCgpLgo+IERvIHdlIGhhdmUgYSByZXByb2R1Y2VyLCBvciBjYW4gSSBnZXQg
dGhlIGZhaWwgdGVzdGNhc2U/IElzIGl0IGEgeGZzdGVzdAo+IGNhc2U/CgpJIHRoaW5rIHhmc3Rl
c3RzIHRyaWdnZXJlZCBpdCwgeWVzLgpMYXRlciB0b2RheSBJIGNhbiBjaGVjay4gOikKClRoYW5r
cywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
