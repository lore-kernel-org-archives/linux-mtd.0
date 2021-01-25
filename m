Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFF8C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 01:07:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50DD122B4B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 01:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50DD122B4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1ToFIXL4eos3ZkuuJh9wWQNMqkcZmtvc4oiqRRFMawQ=; b=ri278sGnui2v8TSQpz5SKZE7y
	yhXMyK/SnguTvGAe4TMrMzXwg6n1QoSLVhEL052hFX9GZ125kUQe4GEFd0IEbsFSQ/K5CDuygcGV5
	a2uxbybm4l/rVYlyZskSNcWj3N+2pDqpQr8KzmPx6PtSzWjlKw0n0xR0sR7HTNOZFjDSrhkDTXx6D
	FD+Nc4t42to9TOboZ1PBHxEm0Ve3hqLKmLaFugAD0HTmlKdV47vtd4n0oghRBO54RKQwe0m0Y/tZe
	y84lYMBzze25me4g8WTAcFePpZxgP8qjP/WjwOBNOZ7gyWVdRW2Hk//oExZlm2NbNQEL7VBhZ7SsL
	2eYeayQ/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3qL4-0006nZ-3X; Mon, 25 Jan 2021 01:06:42 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3qL1-0006ma-Fx
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 01:06:40 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DPBVM3GdmzMPRl;
 Mon, 25 Jan 2021 09:04:59 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 25 Jan 2021 09:05:48 +0800
Subject: Re: [PATCH 3/4] ubifs: Update directory size when creating whiteouts
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20210122212229.17072-1-richard@nod.at>
 <20210122212229.17072-4-richard@nod.at>
 <5b51ff9c-8f5e-c348-5195-c0a0bf60b746@huawei.com>
Message-ID: <cca6ac4f-4739-76be-9b48-b3643017a556@huawei.com>
Date: Mon, 25 Jan 2021 09:05:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5b51ff9c-8f5e-c348-5195-c0a0bf60b746@huawei.com>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_200639_773994_11B5A2A1 
X-CRM114-Status: UNSURE (   7.98  )
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
Cc: david@sigma-star.at, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjEvMS8yMyAxMDo0NSwgWmhpaGFvIENoZW5nIOWGmemBkzoKCj4+IEBAIC00MzAsNiAr
NDMzLDcgQEAgc3RhdGljIGludCBkb190bXBmaWxlKHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3Qg
Cj4+IGRlbnRyeSAqZGVudHJ5LAo+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCBvdXRfY2Fu
Y2VsOgpTdGlsbCBvbmUgcXVlc3Rpb246Cj4gRG9lcyB0aGlzIG5lZWQgYSBqdWRnbWVudD8gTGlr
ZSB0aGlzLAo+IGlmICh3aGl0ZW91dCkKPiAgwqDCoMKgIGRpci0+aV9zaXplIC09IHN6X2NoYW5n
ZTsKCj4+ICvCoMKgwqAgZGlyLT5pX3NpemUgLT0gc3pfY2hhbmdlOwo+PiDCoMKgwqDCoMKgIG11
dGV4X3VubG9jaygmZGlyX3VpLT51aV9tdXRleCk7Cj4+IMKgIG91dF9pbm9kZToKPj4gwqDCoMKg
wqDCoCBtYWtlX2JhZF9pbm9kZShpbm9kZSk7Cj4+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
