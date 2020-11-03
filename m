Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DBEC00A89
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 02:05:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D9322243
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 02:05:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKgMndEy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04D9322243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K2xT8KgAl+CclnKykUeuSYWlO0L5ec4NrGV+mOJww7U=; b=RKgMndEyK3rq1J+ymkXyX0Ac8
	cZ0KQEgjcLDIUJAIQ6cAbz3sva/6qHlM5WQRdtNdDpjoH8HczAAElvkz6TqaDtKgwpTufq5dsus0W
	P5l3grEsm4ekRtCo19JDtavCZJLpPSuMU/d5Y5/SFiIisIIHMJeW5JzW89SmLsrJInPThXcvipEr/
	fhagYc6PwGXS7ha9OYZPMIZrh9wM0SDpdNQYxTBU5KWmvut11MXivv6Hqu8h3mGuwhDMLaKU/aMA6
	Gx2fTXbnmeXh8K8FNLvItGw/a0mHNMEONigALOWXh195qOo8PFxXCBr7eGNo9yEgYYlhW60yOnmFW
	jGnQ7hhDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZlgf-00011s-Be; Tue, 03 Nov 2020 02:04:41 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZlgc-00010e-1f
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 02:04:39 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CQClG6Dkgzhg3W;
 Tue,  3 Nov 2020 10:04:26 +0800 (CST)
Received: from [10.174.177.167] (10.174.177.167) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 10:04:20 +0800
Subject: Re: [PATCH 0/3] fixes for ubifs xattr operations
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200630130438.141649-1-houtao1@huawei.com>
 <e2a0ddaa-402f-a4e0-ed0a-74ce7d620722@huawei.com>
 <CAFLxGvxHiFuHpwUOWxbf7djG0__-Z9qB5eG1oBYwGzY3FKSDGA@mail.gmail.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <b3b82f88-c87e-6077-7189-f2f84a2739c2@huawei.com>
Date: Tue, 3 Nov 2020 10:04:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxHiFuHpwUOWxbf7djG0__-Z9qB5eG1oBYwGzY3FKSDGA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.167]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_210438_330808_0B6132C2 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 2020/11/1 5:10, Richard Weinberger wrote:
> Tao,
> 
> On Fri, Oct 23, 2020 at 9:25 AM Hou Tao <houtao1@huawei.com> wrote:
>>
>> Hi Richard,
>>
>> I have written two xfstest cases [1] for these fixes three months ago, could you please
>> check whether the proposed solution is OK ?
> 
> Thanks for your time and reminding me about this issue!
> I agree that this is a problem but I'm not sure whether the lockless
> solution is the right path to go.
> DId you try the locking approach?
> 
Yes. Adding an extra lock for xattr ops also works. I will post a V2 soon.

Regards,
Tao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
