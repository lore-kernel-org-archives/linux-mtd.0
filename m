Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220EAC4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:01:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60B16246A4
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:01:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cAqPn5dQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60B16246A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D6H7uDzpl2FZQv54nQum+WpnfvEl5gKwXtT54mNMfJk=; b=cAqPn5dQpc0EcDQGwI5BEu/Y0
	z2UpYzDg2Vh14mpijb2pdBsEwEfyzrhlz33XAAdaR1/ijiuMXJYT13rvq4GiLLtFpFzun8gK2FQB6
	Ec2FsCwYzrogMMJ3/KDydwo3vB2TgNqUnyriVLY+GLgPrp7+7b9pXQYouScWDhAzlwEgia8B8GSgr
	HlNkG/C89xuQYYtSYe1RMYt4IEHVD6zmuJg70A/B9R9NeHOf98qQ2AyOVMYXSnTrPgV8jkx6ZYhZB
	ctB6e2NZPMMO0Qw0/Ztg3lZvIwOCx19hdhrf+PIbbKRZs9j8tJ4z6P4SpvovBQACSomX8TjJ58wzB
	tu9pS6H4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXiFs-0001zr-KX; Wed, 28 Oct 2020 10:00:33 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXiCj-0000MY-Tz
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 09:57:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id A69661816C710;
 Wed, 28 Oct 2020 10:57:14 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id F3j420V43Nlb; Wed, 28 Oct 2020 10:57:14 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9Gqh70Vk6WpQ; Wed, 28 Oct 2020 10:57:14 +0100 (CET)
To: Junling Zheng <zhengjunling@huawei.com>, linux-mtd@lists.infradead.org
References: <2bbc8a93-42db-163e-daa7-467cdfa5ed66@huawei.com>
 <5c1a563c-4365-b103-2e8c-b077d0b9f0c4@huawei.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Subject: Re: [RFC] mtd-utils: tag for previous release versions
Message-ID: <0f69b3d0-ab67-2720-0ea3-9b6e95102916@sigma-star.at>
Date: Wed, 28 Oct 2020 10:57:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5c1a563c-4365-b103-2e8c-b077d0b9f0c4@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_055718_142393_1503CD8B 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: hukeping <hukeping@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxMC8yOC8yMCAxMDozNyBBTSwgSnVubGluZyBaaGVuZyB3cm90ZToKPiDlnKggMjAy
MC8xMC8yOCAxNzoxNywgSnVubGluZyBaaGVuZyDlhpnpgZM6Cj4+IEhpLAo+Pgo+PiBJIG5vdGUg
dGhhdCB0aGVyZSBhcmUgbm8gVGFncyBpbiB0aGUgbXRkLXV0aWxzIHJlcG9zaXRvcnkgZm9yIHYy
LjEuMSBhbmQgcHJldmlvdXMgdmVyc2lvbnMuCj4+Cj4+IERvIHdlIGhhdmUgYW55IHBsYW5zIHRv
IHRhZyB0aGVtIGZvciBjb252ZW5pZW5jZT8KPj4KCkEgZmV3IG1vbnRocyBhZ28gdGhlcmUgd2Fz
IGEgZGlzayBmYWlsdXJlIG9uIHRoZSBzZXJ2ZXIgaG9zdGluZyB0aGUgbWFpbGluZwpsaXN0IGFy
Y2hpdmUgYW5kIHRoZSBnaXQgcmVwb3NpdG9yaWVzLiBJIHB1c2hlZCB0aGUgbXRkLXV0aWxzIHJl
cG9zaXRvcnkgYWdhaW4KYW5kIG11c3QgaGF2ZSBtaXNzZWQgdG8gcHVzaCB0aGUgb2xkZXIgdGFn
cyBhcyB3ZWxsLgoKSSBwdXNoZWQgdGhlIHRhZ3Mgbm93LiBUaGFua3MgZm9yIHJlcG9ydGluZyEK
Cj4gCj4gSW4gYWRkaXRpb24sIHRoZSAncmVsZWFzZSBhbm5vdW5jZW1lbnQnIGxpbmtzIGZvciBt
dGQtdXRpbHMgMi4xLjEgYW5kIDIuMS4wIG9uIHRoZSBob21lIHBhZ2UgY2Fubm90IGJlIG9wZW5l
ZDoKPiAKPiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8y
MDE5LUp1bHkvMDkwNDg4Lmh0bWwKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1h
aWwvbGludXgtbXRkLzIwMTktTWFyY2gvMDg4MjY3Lmh0bWwKPiAKPiBXZXJlIHRoZXNlIHR3byBt
YWlscyBkZWxldGVkIGJ5IG1pc3Rha2U/Cj4gCgpJbiBhIHdheSwgeWVzLiBUaGUgb25seSBhdmFp
bGFibGUgYmFja3VwcyBvZiB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUgd2hlcmUgZnJvbQpNYXkg
MjAxOCwgc28gdGhlcmUgaXMgbm93IGEgfjIgeWVhciBnYXAgaW4gdGhlIG1haWwgYXJjaGl2ZS4K
CkdyZWV0aW5ncywKCkRhdmlkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
