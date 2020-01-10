Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9D5C33CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 11:59:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EBF62072A
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 11:59:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jlzOJMzJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EBF62072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i1DBz9anO3Rjn96RMWnyu4LqDJbgUth7sVMRfCbg4tQ=; b=jlzOJMzJ45Q93tiT/aiBs682+
	2C0ofv1P4651tLG9ECUB5G1ZPiP3BvfhqmvHRoT/QFf/mX+S2hy1FJ8yxDHacxQM0flWY0rt40riA
	7BQD0ICLJILRzxG0mEQQvMqb7ZzkJwbb/HSPjjgOeBGY+CiJaSnrTgYkH2hPBS/a5i/5OCATudit/
	ZjHdl+HBe7DYl/vjqw4d+0r1I8ZapMERhVAm8Ls2zK+NI5gwrKQ1PMfL62T5GZU7mc0iAoW/cEHxD
	u0iyjDcNo+TUay0uHhnuJOKyhHzpc+fVe60geFNYWhunmYsTKtf1PHcypNs1vfVYvrWvCj4likFGZ
	XXdr3YGOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipsx5-00041c-Hg; Fri, 10 Jan 2020 11:59:43 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipstG-0000H5-1J
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 11:55:52 +0000
Received: from lhreml701-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id AFF0FA5C9FD9699058BD;
 Fri, 10 Jan 2020 11:55:39 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml701-cah.china.huawei.com (10.201.108.42) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 10 Jan 2020 11:55:39 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 10 Jan
 2020 11:55:39 +0000
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: Mark Brown <broonie@kernel.org>
References: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
 <1575900490-74467-3-git-send-email-john.garry@huawei.com>
 <0dc5cb2e-b765-9e13-b05e-9e3c835c5985@huawei.com>
 <20200109212842.GK3702@sirena.org.uk>
From: John Garry <john.garry@huawei.com>
Message-ID: <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
Date: Fri, 10 Jan 2020 11:55:37 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200109212842.GK3702@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_035546_283309_727D96EE 
X-CRM114-Status: GOOD (  18.36  )
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
Cc: tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org,
 chenxiang66@hisilicon.com, linuxarm@huawei.com, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 xuejiancheng@hisilicon.com, fengsheng5@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 09/01/2020 21:28, Mark Brown wrote:
> On Thu, Jan 09, 2020 at 03:54:00PM +0000, John Garry wrote:
> 
>>  From checking acpi_spi_add_resource() or anywhere else, I cannot see how
>> SPI_RX_DUAL or the others are set for spi_device.mode. What am I missing?
>> Are these just not supported yet for ACPI? Or should the spi-nor code not be
>> relying on this since we should be able to get this info from the SPI NOR
>> part?
> 

Hi Mark,

> I'm not aware of any work on integrating this sort of stuff into ACPI
> platforms so I think it's just not yet supported in ACPI.  I'm not
> really sure what would be idiomatic for ACPI, figuring it out from what
> the part supports might well be idiomatic there though I don't know how
> common it is for people not to wire up all the data lines even if both
> controller and device support wider transfers. 

OK, so I guess that is why we require the width property from the FW and 
can't blindly rely on SFDP.

  I've got a horrible
> feeling that the idiomatic thing is a combination of that and a bunch of
> per-device quirks.  There may be a spec I'm not aware of though I'd be a
> bit surprised.
> 

I'm not sure on that. I don't see anything in the ACPI spec.

I will note that PRP0001+"jedec,spi-nor" compatible DSD seems to be the 
defacto method to describe the SPI NOR-compat part for ACPI - that's 
what I'm using. We could add properties there, but that seems improper.

I'll continue to look....

Thanks,
John

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
