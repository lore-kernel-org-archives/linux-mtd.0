Return-Path: <SRS0=kP7/=XR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99616C3A5A6
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2019 06:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142D320830
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2019 06:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7/hXfuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142D320830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8K1uAsQoWNAuszXSZs/4uCnQW4BVLiVrMiRxaGTqwOY=; b=q7/hXfuc2VC1JG
	5vFuzXeKVf0EuMfFjxF+IaIwmPIkoSYrFK6Oa4iMR2Cy7l1fvZGTFxKqfhuPPehgt7ejfPzmWw+Ik
	dRtUCPiZQufJktMul5WpPnOzKWRrv1uh0Zl67DyAttVfkzTGZHq3b3fyg8ta+Hypa+zXqoeMva8mE
	C00Xirg7pyrVZpqpn2vbRtb/1MYTLH+xXKRGriPNdLCPngBvVudy3W1kUzULBv3XnULT6RybOXJqQ
	guCr0X+GIicNdlJwMcsXPOW/aLfx/Iic9hZyjv2rfDol4NyBIsKpfLhOQJvBruiiWP3rrsCczwr57
	J1jdFOFSDa49vH5GDceQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBuzG-0004vR-D3; Sun, 22 Sep 2019 06:04:47 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBuz9-0004sm-GU
 for linux-mtd@lists.infradead.org; Sun, 22 Sep 2019 06:04:42 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AFE75F75DB4AC30847CA;
 Sun, 22 Sep 2019 14:04:22 +0800 (CST)
Received: from SZXY1Y004550421.china.huawei.com (10.61.99.243) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Sun, 22 Sep 2019 14:04:13 +0800
From: Huaijie Yi <yihuaijie@huawei.com>
To: <richard.weinberger@gmail.com>
Subject: RE: Re: [PATCH] mtd: fix oops when writing to phram device on arm64
Date: Sun, 22 Sep 2019 06:03:14 +0000
Message-ID: <1569132194-22076-1-git-send-email-yihuaijie@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <CAFLxGvx_adbxyfA5iUZaHHw4aM1gbdOTMQdirx0FH1LamihdKg@mail.gmail.com>
References: <CAFLxGvx_adbxyfA5iUZaHHw4aM1gbdOTMQdirx0FH1LamihdKg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.61.99.243]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_230440_368311_26ECC88B 
X-CRM114-Status: UNSURE (   6.37  )
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
Cc: yihuaijie@huawei.com, joern@lazybastard.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

>On Mon, Aug 19, 2019 at 3:39 PM Huaijie Yi <yihuaijie@huawei.com> wrote:
>>
>> From: yihuaijie <yihuaijie@huawei.com>
>>
>> memcpy() to memory remaped by ioremap() at an address not aligned to 
>> 8-bytes will cause oops on arm64 platform, fixing this by using 
>> ioremap_wc().
>
>This might be the right thing on arm64, but I fear not for all other archs and configurations.
>
>We had a similar chain of problems already with our sram driver.
>See:
>eb43e023130b ("misc: sram: add optional ioremap without write combining")
>0ab163ad1ea0 ("misc: sram: switch to ioremap_wc from ioremap")
>
>--
>Thanks,
>//richard

Hi, richard

I verified this on x86_64, and there isn't the problem.

I will resend a V2 to fix this only on ARM64.

--
Regards
//Huaijie Yi


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
