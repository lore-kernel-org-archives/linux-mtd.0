Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F67FC433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 09:32:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F75F22CA2
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 09:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F75F22CA2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FlWm2ezF95Hy5NB1DJbfjrcQbxwtaWVO9t5VWpg9lNw=; b=gNcbfylVSWNfWA3JkidF+crWx
	c6zrlR2IOOFZ0R9H8maMSZkHYOzBYlzJOYbATpsqDsMfe/PNRMHgltBbGv56JBtfAJuYxtpebSNP8
	Fe/4Ai8CiylIKyJmbRX4D83u8uTxBVFxsPYosMiO4UA1DTMA+h593SxEPvg1ZP+tfdq+JjwOSTKVL
	+bFgxXBsX57HkkJLoV7RdsQ/bW37A6yuCbPasdRp0aA/HlRsdvOhPgVoteHq5EP2lpUFWoYQlv9YT
	HbH/15fvA65WXcQkgzjJtaD8iPBZQKhEGbCD5cvCHXxXtDuVJIoBEhOgq2UB6b8xK2mQHoYVQMQNR
	FZwSjMFpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3yDT-0001hD-Da; Mon, 25 Jan 2021 09:31:23 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3yDQ-0001gJ-JG
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 09:31:21 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DPPj60jNnzjD82;
 Mon, 25 Jan 2021 17:30:02 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 25 Jan 2021 17:31:07 +0800
Subject: Re: [PATCH 3/4] ubifs: Update directory size when creating whiteouts
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20210122212229.17072-1-richard@nod.at>
 <20210122212229.17072-4-richard@nod.at>
 <5b51ff9c-8f5e-c348-5195-c0a0bf60b746@huawei.com>
 <cca6ac4f-4739-76be-9b48-b3643017a556@huawei.com>
 <CAFLxGvyHL5AMWcfLQg2fS6Nbp255yjve5nJ83ELYHnPhKp6Wxw@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <45bacc97-5fe0-baed-ce6a-321f15406575@huawei.com>
Date: Mon, 25 Jan 2021 17:31:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyHL5AMWcfLQg2fS6Nbp255yjve5nJ83ELYHnPhKp6Wxw@mail.gmail.com>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_043120_886894_C397B9B3 
X-CRM114-Status: UNSURE (   5.41  )
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
Cc: Richard Weinberger <richard@nod.at>, David Gstir <david@sigma-star.at>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjEvMS8yNSAxNTo1NSwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKCj4gCj4gVGhl
IGlkZWEgd2FzIHRoYXQgaW4gdGhlICF3aGl0ZW91dCBjYXNlLCBzel9jaGFuZ2UgaXMgYWx3YXlz
IDAuCj4gCk9oLCBzel9jaGFuZ2Ugd2FzIGluaXRpYWxpemVkIHRvIDAsIEkgbWlzc2VkIGl0LgpU
aGFua3MuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
