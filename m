Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2E8C33CB1
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 09:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9594207FF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 09:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JyYrykEh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9594207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wJ8nYRtaLlBlgF7Q59lXUkMF9zKjqN94dpvgUi9akVQ=; b=JyYrykEhrOExVScUsiOJ2jD+d
	lWbDl/8BzqG1IgWriAWXjXBj5Zrd+t4M4t8qDMXYKL71Cuho86yBpa1F4uO6kGd7pv8ptYTswQLMT
	B5pPQM61hTYPwFIyIt6DaRif/IX3RtyNF1JrvqaV/UgFz0x+tTMq4YEaPsDr8q2f4Ue73wTtd918P
	h+BodzBO5+OUGRNpmLPZIEzKlwCU58k2y1tjF3jVEkj7YsW6vUyXZUV674J2ycWAYVEwBqKyAqsnJ
	+uVQ62DyrP0OsFAl1cn5WmltKmPQSEjrisG+4J7rpHR3WcX+4EEt9FA6KfpX9ZbH6OS7noVcpaTGd
	FdIbYYErA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ireyj-00075D-Pm; Wed, 15 Jan 2020 09:28:45 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ireyd-00074r-Vi
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 09:28:44 +0000
Received: from LHREML713-CAH.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 6350F9ED83CE5BC66AB3;
 Wed, 15 Jan 2020 09:28:36 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML713-CAH.china.huawei.com (10.201.108.36) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Jan 2020 09:28:36 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 15 Jan
 2020 09:28:35 +0000
Subject: Re: flash_lock issue for n25q 128mb spi nor part
From: John Garry <john.garry@huawei.com>
To: <Tudor.Ambarus@microchip.com>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <6667f429-4732-d098-843a-7a030010f192@ti.com>
 <e7d782d3-2b7a-4141-e511-a238de626688@huawei.com>
 <3245882.KdgdznRmvK@localhost.localdomain>
 <1e034044-decb-be72-9455-33f0a6f7fc12@huawei.com>
Message-ID: <8ab0407a-b5ca-63ca-76a9-36ca961d20ca@huawei.com>
Date: Wed, 15 Jan 2020 09:28:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1e034044-decb-be72-9455-33f0a6f7fc12@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml730-chm.china.huawei.com (10.201.108.81) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_012840_170304_CFEEFB8E 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: vigneshr@ti.com, chenxiang <chenxiang66@hisilicon.com>,
 fengsheng5@huawei.com, broonie@kernel.org, linux-mtd@lists.infradead.org,
 js07.lee@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/01/2020 11:56, John Garry wrote:
> On 10/01/2020 11:51, Tudor.Ambarus@microchip.com wrote:
>> On Thursday, January 9, 2020 12:36:11 PM EET John Garry wrote:
>>> Apart from this issue, on another topic, is there any special reason
>>
>> Ups, I forgot about this. I had a patch for it, let me find it.
> 
> ok, cool
> 
>>
>>> which we don't support status register.BP3? Is it that it is not
>>> adjacent to BP2 in the register, so makes handling trickier?
>>
>> Jungseung worked in the past for adding BP3 support. He have just sent 
>> a new
>> patch set for addressing this, feedback is welcomed:
>> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=152401
> 
> oh, great. I'll have a look.
> 
> Thanks,
> John

Hi guys,

It turns out now that we may need support a macronix part also - 
mx25u12835f.

Do you know why flash locking is not supported yet in the kernel for 
macronix parts? Did no one get around to it? Or just a technical issue?

Cheers,
John


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
