Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD16EC388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:38:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4655D2469B
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d1s7cmpk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4655D2469B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E0qk7yEP/Cb46bKe0ouel0G5ZoB39FJ7iat/+mLeAkY=; b=d1s7cmpkcuRlYGVLpoPupTfqC
	qXtMGN0E0sTnQHjtIYH03BuSl36Q/wZUunhWmdjoa8Fa/1I0w2A+EOrZgb32A1U2VTh2KZh2ds8hb
	joGeWPB+14M45xCWUpYH+NwcGub1mVFQtYJ+zlZPn+yrpaR+r4oBb+Og68NnAp+HwjTZ6auOq23Nw
	INJlugk98uIhTuu24N9DOjxXMA9FBHZn62QaC9ySdUuTWBQcOjY/6+OwfF9m8lJbf3qK7fueLEHGM
	PW++R4HerVMDM4g/BIEKoTAEGnu/IAubOk9ADKqPrHgY1Kj4Jr60g4bFIFM9Ri1ddoVcYwl1rOoXo
	06VXU8EEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXhtp-0003UY-17; Wed, 28 Oct 2020 09:37:45 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXhtm-0003TC-2v
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 09:37:43 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CLk4v5gdWz703R
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2020 17:37:35 +0800 (CST)
Received: from [10.108.148.36] (10.108.148.36) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 17:37:25 +0800
Subject: Re: [RFC] mtd-utils: tag for previous release versions
From: Junling Zheng <zhengjunling@huawei.com>
To: <linux-mtd@lists.infradead.org>
References: <2bbc8a93-42db-163e-daa7-467cdfa5ed66@huawei.com>
Message-ID: <5c1a563c-4365-b103-2e8c-b077d0b9f0c4@huawei.com>
Date: Wed, 28 Oct 2020 17:37:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2bbc8a93-42db-163e-daa7-467cdfa5ed66@huawei.com>
X-Originating-IP: [10.108.148.36]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_053742_376492_25320A24 
X-CRM114-Status: UNSURE (   8.57  )
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
Cc: hukeping <hukeping@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvMTAvMjggMTc6MTcsIEp1bmxpbmcgWmhlbmcg5YaZ6YGTOgo+IEhpLAo+IAo+IEkg
bm90ZSB0aGF0IHRoZXJlIGFyZSBubyBUYWdzIGluIHRoZSBtdGQtdXRpbHMgcmVwb3NpdG9yeSBm
b3IgdjIuMS4xIGFuZCBwcmV2aW91cyB2ZXJzaW9ucy4KPiAKPiBEbyB3ZSBoYXZlIGFueSBwbGFu
cyB0byB0YWcgdGhlbSBmb3IgY29udmVuaWVuY2U/Cj4gCj4gQ2hlZXJzLAo+IAo+IEp1bmxpbmcK
PiAKCkluIGFkZGl0aW9uLCB0aGUgJ3JlbGVhc2UgYW5ub3VuY2VtZW50JyBsaW5rcyBmb3IgbXRk
LXV0aWxzIDIuMS4xIGFuZCAyLjEuMCBvbiB0aGUgaG9tZSBwYWdlIGNhbm5vdCBiZSBvcGVuZWQ6
CgpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE5LUp1
bHkvMDkwNDg4Lmh0bWwKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4
LW10ZC8yMDE5LU1hcmNoLzA4ODI2Ny5odG1sCgpXZXJlIHRoZXNlIHR3byBtYWlscyBkZWxldGVk
IGJ5IG1pc3Rha2U/CgpDaGVlcnMsCgpKdW5saW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
