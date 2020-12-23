Return-Path: <SRS0=nxGi=F3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910C1C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Dec 2020 10:01:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B335E22288
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Dec 2020 10:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B335E22288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YSOe7QnZff92FGBIXGaLVk9cBKbM4+JhmrMaiXG39Ik=; b=YFfUFkf+1rG7qGaLGzo/wTdKM
	U+qd5RDh0L+f2eCSfIimEnNQ0XHIMXurCJyUjB+StZ1jfZtP1cyeXD6MCBOjreQwcJ3XYCNA/MH5m
	L9XxTEhrOH08dIoDZKQJvkXofeT3DPfMuwfY9KcVZMqubbjfG8wMB5IwRWmGTalpxrAXR9r39bR7h
	meDEZxFHwf5pAI4rvCNFak1kOWG7XQPjO1IRZvjNCEPPIfLilBkufpaN+JQAoKZlvjdGMs3vBXGDg
	lLSIy9SScPlprHUWeXQj/Kh3YAn9MTevAdjM5VbtNj7lGuMNoeG9JCegoyrb2M40weWBbSYpwLqCk
	Wqwkqsq4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks0wV-00013s-El; Wed, 23 Dec 2020 10:00:27 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks0wS-00011p-QB
 for linux-mtd@lists.infradead.org; Wed, 23 Dec 2020 10:00:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 00029625DE06;
 Wed, 23 Dec 2020 11:00:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PvEedl0pH8YN; Wed, 23 Dec 2020 11:00:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 85EB3625DE07;
 Wed, 23 Dec 2020 11:00:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X7jk5AndnOpC; Wed, 23 Dec 2020 11:00:13 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 591BE625DE06;
 Wed, 23 Dec 2020 11:00:13 +0100 (CET)
Date: Wed, 23 Dec 2020 11:00:13 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Chengsong Ke <kechengsong@huawei.com>
Message-ID: <135307670.158287.1608717613022.JavaMail.zimbra@nod.at>
In-Reply-To: <20201223062808.27512-1-kechengsong@huawei.com>
References: <20201223062808.27512-1-kechengsong@huawei.com>
Subject: Re: [PATCH] ubifs: Fix read out-of-bounds in ubifs_jnl_write_inode()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix read out-of-bounds in ubifs_jnl_write_inode()
Thread-Index: z+tkpY/z0vMi1cpMRZMXcPO+z7DtJw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_050024_973506_BF0272A1 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: chengzhihao1 <chengzhihao1@huawei.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, wangfangpeng1@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q2hlbmdzb25nIEtlLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFRoZSBtZW1v
cnkgYXJlYSBhbGxvY2F0ZWQgaW4gdWJpZnNfam5sX3dyaXRlX2lub2RlKCkgaXMgbm90IGFsaWdu
ZWQgd2l0aCA4Cj4gYnl0ZXM6Cj4gaW5vX3N0YXJ0ID0gaW5vID0ga21hbGxvYyh3cml0ZV9sZW4s
IEdGUF9OT0ZTKTsKPiAKPiBXaGVuIGlub19zdGFydCBwYXNzZWQgaW50byB3cml0ZV9oZWFkIC0+
IHViaWZzX3didWZfd3JpdGVfbm9sb2NrOgo+ICAgIG4gPSBhbGlnbmVkX2xlbiA+PiBjLT5tYXhf
d3JpdGVfc2hpZnQ7Cj4gICAgaWYgKG4pIHsKPiAgICAgIG4gPDw9IGMtPm1heF93cml0ZV9zaGlm
dDsKPiAgICAgIGVyciA9IHViaWZzX2xlYl93cml0ZShjLCB3YnVmLT5sbnVtLCBidWYgKyB3cml0
dGVuLCB3YnVmLT5vZmZzLCBuKTsKPiAgICAgIC8vIFJlYWQgb29iIG9jY3VycyBoZXJlLCByZWFk
IG4gYnl0ZXMgZnJvbSBidWYsIGFuZCBidWYgaXMgcGFzc2VkIGZyb20KPiAgICAgIEBpbm9fc3Rh
cnQgd2hpY2ggaXMKPiAgICAgIC8vIG5vdCA4IGJ5dGVzIGFsaWduZWQod3JpdGVfbGVuIDwgbiku
IFByb2dyYW0gcmVhZCAobiAtIHdyaXRlX2xlbikgbW9yZSBieXRlcy4KPiAgICB9Cj4gCj4gUmVw
cm9kdWNlcjoKPiAwLiBjb25maWcgS0FTQU4gJiYgYXBwbHkgcHJpbnQucGF0Y2gKPiAxLiBtb3Vu
dCB1YmlmcyBvbiAvcm9vdC90ZW1wCj4gMi4gcnVuIHRlc3Quc2gKPiAzLiBjZCAvcm9vdC90ZW1w
ICYmIGxzIC8vIGNoYW5nZSBhdGltZSBmb3IgbGlua19maWxlCj4gNC4gd2FpdCAxfjIgbWludXRl
cwo+IAo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBGaXhlczogMWU1MTc2NGEzYzJh
YzAgKCJVQklGUzogYWRkIG5ldyBmbGFzaCBmaWxlIHN5c3RlbSIpCj4gTGluazogaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTA4NjUKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaGVuZ3NvbmcgS2UgPGtlY2hlbmdzb25nQGh1YXdlaS5jb20+Cj4gLS0tCj4gZnMvdWJp
ZnMvaW8uYyB8IDExICsrKysrKysrKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCkdvb2QgY2F0Y2ghClBsZWFzZSBhZGRyZXNzIHRoZSBwcm9ibGVt
IGluIHViaWZzX2pubF93cml0ZV9pbm9kZSgpLgpUaGUgbGVuZ3RoIHRoZXJlIG5lZWRzIHRvIGJl
IHByb3Blcmx5IGFsaWduZWQgbGlrZSBhbGwgb3RoZXIgam91cm5hbApmdW5jdGlvbnMgZG8uCkkg
dGhpbmsgeW91IG1hbmFnZWQgdG8gdHJpZ2dlciB0aGUgaXNzdWUgYmVjYXVzZSB1aS0+ZGF0YV9s
ZW4gaXMgbm90IGFsaWduZWQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
