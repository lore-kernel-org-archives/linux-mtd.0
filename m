Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6807AC38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 05:58:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142E420753
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 05:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tAS3k8Iy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142E420753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJJEg9ogizPQqyVczpBj/yMr6IRFFGqZkR8I0GBMwL4=; b=tAS3k8IyzZAZaM
	TUafMPf6lbf6aVEtdCFGmZncF+mjXhspi3nR0bLAKeBcmkZOBlGhGZQisy6xMieVrNX8uJ8RCxHnA
	5Rj7BLxQ3qR7XZNk5ystM9ApjVuH71wEg+gI3RccXB01KW5keOfpWIQxH1URa6WVHp4CO451g7cIk
	chztCgmVU9Dx7ZAmxgGy6kikVxyqzjSNz1v6ku6a8kIQNYqi3oW/eb7KWPsAg8g0ffMAvTgcLPBjv
	vMs2DegXGYyOTjQtx6t02AZXIdKyQmqAeP4UTEhQ828Vv00MnyXKzKPfyHuppFKq+Bdlg8L8CeIXH
	+g+bCQ8oEVemId+v53EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWZXn-00064X-QL; Thu, 07 May 2020 05:58:03 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWZXl-00063Y-Oi
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 05:58:02 +0000
IronPort-SDR: Q5P5m8peGREIt+3ocVjNlMd8TTeiOqprdwjp5CxKVFlZGY6p98Q7einPM8yV6YCFhPwYlcQ2mU
 Qw3naJhK7uwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 22:58:00 -0700
IronPort-SDR: +dQnhUyCtoAS7P9tJ4kRMIintnMG83RYJknm6ccVykoDNKn6QhOzw9gQqKVoh5FN/wQSzfvv3t
 43ny4/J9n+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,362,1583222400"; d="scan'208";a="370016534"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 06 May 2020 22:57:59 -0700
Received: from [10.213.151.174] (unknown [10.213.151.174])
 by linux.intel.com (Postfix) with ESMTP id 7A0B6580378;
 Wed,  6 May 2020 22:57:54 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <35cf7227-0045-9916-7994-a5763367aab3@infradead.org>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <68b1f45b-4d44-83a1-ddd9-710ff8e03016@linux.intel.com>
Date: Thu, 7 May 2020 13:57:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <35cf7227-0045-9916-7994-a5763367aab3@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_225801_816128_3CF0DC32 
X-CRM114-Status: GOOD (  13.29  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de, richard@nod.at,
 brendanhiggins@google.com, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 boris.brezillon@collabora.com, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 7/5/2020 8:22 am, Randy Dunlap wrote:
> On 5/6/20 5:15 PM, Ramuthevar,Vadivel MuruganX wrote:
>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>> index a80a46bb5b8b..a026bec28f39 100644
>> --- a/drivers/mtd/nand/raw/Kconfig
>> +++ b/drivers/mtd/nand/raw/Kconfig
>> @@ -457,6 +457,14 @@ config MTD_NAND_CADENCE
>>   	  Enable the driver for NAND flash on platforms using a Cadence NAND
>>   	  controller.
>>   
>> +config MTD_NAND_INTEL_LGM
>> +	tristate "Support for NAND controller on Intel LGM SoC"
>> +	depends on OF || COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	help
>> +	  Enables support for NAND Flash chips on Intel's LGM SoC.
>> +          NAND flash interfaced through the External Bus Unit.
> 
> Please use one tab + 2 spaces for indentation in the line above.

Thank you for the review comments, will update in the next patch-set.

Regards
Vadivel
> 
>> +
>>   comment "Misc"
>>   
>>   config MTD_SM_COMMON
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
