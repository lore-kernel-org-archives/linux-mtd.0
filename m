Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77F8C10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:56:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A34820873
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gVS7ME6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A34820873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DxH8onEOR+c36pJvD2QE7cMn/MfJh0ZN4ZEbVKVfD9k=; b=gVS7ME6ZgxtpMTlZ2Kf4vdcon
	JSe2V5onqv1fwaEii051bL4dnzRwcCQsxHRxxqJ5LC8+nLhlWelhBhE7q7t2CrS+p59GsFjCpAcKC
	NUr3VkA//Kxajf/SGdvcRfXnFVviY9g9y01ocFO+xHxnku+aDF75wTRGZAOBD7W5c04vFrIaEwCDm
	a9xHPMzRupVlsqksv9yxyoSnX570biqAgBbB3uldw2egb/6tGRS1fvCC9m3v7ly+VVN5yFpdR+Vee
	NUllbF9HyxLgHofaI2xBYnfZvUER22D79rY7U5TbsXNmqB9WBd7EgjAwvX/nkH4oOq4F+2n2vfwhm
	NEgN3T8hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBwED-0003rz-Hw; Wed, 11 Mar 2020 07:56:33 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBwE9-0003qk-Qh
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 07:56:31 +0000
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id BAC71261D951A4DBCAE3;
 Wed, 11 Mar 2020 07:56:26 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml703-cah.china.huawei.com (10.201.108.44) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 07:56:26 +0000
Received: from [127.0.0.1] (10.210.172.48) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Wed, 11 Mar
 2020 07:56:25 +0000
Subject: Re: linux-next: Tree for Mar 10 (mtd/spi-nor/)
To: <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
References: <20200310201923.24e34363@canb.auug.org.au>
 <43df5279-7d91-020d-1632-9b3528f4feee@infradead.org>
 <f9d33b09-fe9f-2c26-96dc-b2eaa53c614b@huawei.com>
 <1993805.xNpbgTSjYd@localhost.localdomain>
From: John Garry <john.garry@huawei.com>
Message-ID: <b547776c-2749-8b78-e35f-c6ed42be9759@huawei.com>
Date: Wed, 11 Mar 2020 07:56:23 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1993805.xNpbgTSjYd@localhost.localdomain>
Content-Language: en-US
X-Originating-IP: [10.210.172.48]
X-ClientProxiedBy: lhreml707-chm.china.huawei.com (10.201.108.56) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_005630_013850_EF8146E0 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: sfr@canb.auug.org.au, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-next@vger.kernel.org, joe@perches.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/03/2020 07:12, Tudor.Ambarus@microchip.com wrote:
> On Tuesday, March 10, 2020 7:14:13 PM EET John Garry wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
>> content is safe
>>
>> +
>>
>> On 10/03/2020 14:37, Randy Dunlap wrote:
>>> On 3/10/20 2:19 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20200306:
>>>>
>>>> Removed tree: nfc-next (abanboned)
>>>>
>>>                                 doned
>>>
>>> on i386:
>>>
>>> WARNING: unmet direct dependencies detected for MTD_SPI_NOR
>>
>> Uh, so kbuild honors a "select" of a config option which has unmet
>> dependencies:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Docu
>> mentation/kbuild/kconfig-language.rst?h=v5.6-rc5#n143
>>
>> So this looks introduced by:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/d
>> rivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e8
> 
> Hi, John,
> 
> Is there any need to select the MTD_SPI_NOR in SPI_HISI_SFC_V3XX? Can't we
> just drop the select?

Yes, I think that we can just drop it. That effectively reverts Joe's 
change. The reason I added the select wasn't for building, but just for 
practicality - MTD_SPI_NOR enables the driver of the devices attached.


In response to Randy:


 >>> So this looks introduced by:
 >>>
 >>> 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e823
 >>>
 >>>>     Depends on [m]: MTD [=m] && SPI_MASTER [=y] >    Selected by [y]:
 >>>>     - SPI_HISI_SFC_V3XX [=y] && SPI [=y] && SPI_MASTER [=y] && 
(ARM64 && ACPI [=y] || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
 >>
 >> Would it be acceptable to move the Kconfig entry for this:
 >>
 >> config SPI_HISI_SFC_V3XX
 >> 	tristate "HiSilicon SPI-NOR Flash Controller for Hi16XX chipsets"
 >> 	depends on (ARM64 && ACPI) || COMPILE_TEST
 >> 	depends on HAS_IOMEM
 >> 	select MTD_SPI_NOR
 >>
 >> into drivers/mtd/spi-nor/Kconfig, say after this one:
 >>
 >> config SPI_HISI_SFC
 >> 	tristate "Hisilicon FMC SPI-NOR Flash Controller(SFC)"
 >> 	depends on ARCH_HISI || COMPILE_TEST
 >> 	depends on HAS_IOMEM
 >>
 >> and drop the "select MTD_SPI_NOR" because when it's in 
drivers/mtd/spi-nor/Kconfig,
 >> it will depend on MTD_SPI_NOR.
 >>
 >
 > These changes to 2 Kconfig files does fix the kconfig warning and 
build errors.
 > I don't know if it's acceptable, or if the source file also wants to be
 > relocated.  (I almost said "needs to be relocated," but it builds 
fine without
 > that change.)

As above, I think that we can drop the select for now. I'll do some 
building test for that - even though it should be same as pre-e14572c52546

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
