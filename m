Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319A1CA0EED
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJnyKj/qHOv0s9rnrmLmJY7BPD1RgDG53deIGU4wd+A=; b=r54TNyw3FWT4bX
	FbGp4w3IG7h4yCp1MXLZzs6nB5NdLlkGcYOL9+waZUwwWoSIJ/feaZNHyDIGewhtzntJrmgFR6YTy
	WS8QDWF/yBiiDX80T71XsZY/36AMV7ukxxH7I6Ap+CIaX6riFOyoaIBtZfLn/HkJvEc7T3frPh6x9
	1YIJamsx+5EubIyBOfbNYoPqxYKX5Jvri8kMQwrccJWsJPoLqSmDURwnu/T+GwJF6fyzlvsKEAJ1C
	8tdPh9MXTJwVfZYLs/ZDW91FocpCmgLPIga4CBj9Y4yBVD8U71uChvHv1y/CWHdLDg2xj0GVaFRqc
	NxYF6RJx370qWnB26ifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSas-00000002kKO-4Age;
	Fri, 22 Aug 2025 14:18:14 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKuO-00000001eXl-0KFj
	for linux-mtd@lists.infradead.org;
	Fri, 22 Aug 2025 06:05:53 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57M65cf9183015;
	Fri, 22 Aug 2025 01:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755842738;
	bh=nEe6gWDkfZ9f0+KLOCH9wNiWwtvjebZTmJiRwDqdgs0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iXk0uX+aWiYJwGCDH9zEt0Oz43gHcXph91uQsqo1F6mIGvVfWpkzEXXpuLMfhFGEl
	 aV9JcJ5w0gAYw3fq0o9TrQuNmAozmvvbp9wNZEkx3raX5mkbX+XcD7Bc2Rsg3qWYK5
	 h+YCZeJQuy/qAVa+Dq9qhwZvmamLsxWIoilRuAo4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57M65cY72495184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 01:05:38 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 01:05:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 01:05:37 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57M65XPJ3071881;
	Fri, 22 Aug 2025 01:05:34 -0500
Message-ID: <59c49efa-20b9-4d81-b66e-e9a363322274@ti.com>
Date: Fri, 22 Aug 2025 11:35:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
To: Mark Brown <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <p-mantena@ti.com>, <linux-spi@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <a-dutta@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>, <s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com>
 <6c35baad-a332-4b0a-96ca-1cdb3840ad94@sirena.org.uk>
 <20487e7f-33dd-4b65-b1a8-5bb8a06ef859@ti.com>
 <2f051eae-61c7-4bff-9f85-cf37b02a7ea3@sirena.org.uk>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <2f051eae-61c7-4bff-9f85-cf37b02a7ea3@sirena.org.uk>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_230552_210618_35125E73 
X-CRM114-Status: GOOD (  20.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 14/08/25 18:04, Mark Brown wrote:
> On Thu, Aug 14, 2025 at 05:04:33PM +0530, Santhosh Kumar K wrote:
>> On 14/08/25 01:56, Mark Brown wrote:
> 
>>> Should we have something that blocks these tuning required modes without
>>> the appropriate tuning, and/or allows discovery of which modes require
>>> this tuning?  This all feels very landmineish - client drivers just have
>>> to know when tuning is required.
> 
>> The flash's maximum operating frequency determines whether PHY tuning is
>> required, as we need tuning in case of Cadence controller for frequencies
>> over 50 MHz.
> 
> That's entirely specific to the Candence controller from the sounds of
> it, that makes it hard to write a client driver if you need to know
> exactly what the controller you're dealing with is and what it's
> requirements are.

PHY tuning is not very specific to the Cadence controller; this has been 
added for other controllers as well. [1] - [3]

spi_mem simply verifies the execute_tuning hook within the controller's 
mem_ops and invokes it if it exists, and the tuning implementation is 
entirely controller-dependent - ranging from straightforward parameter 
configuration of PHY registers to advanced tuning algorithms such as the 
one implemented in this tuning series.

Currently, spi_mem_execute_tuning() is called by default from flash. In 
the future, this could be improved by asking the controller if tuning is 
actually needed (considering different factors such as frequency), 
similar to *_get_tuning_params implementation. Let me know your opinion 
in this.

The get_tuning_params and execute_tuning hooks in spi_mem can also be 
utilized by any non-MTD spi-mem users.

> 
>> And we do check for this condition - see Patch 07/10,
>> cqspi_phy_op_eligible_sdr(), which currently verifies the flash frequency
>> against 166 MHz. This logic can be improved by implementing both min and max
>> frequency checks, will update in the following version.
> 
> I can't actually tell how that verifies if the tuning has been done
> appropriately TBH, at least not without more effort than I'd care to

The *_execute_tuning function takes the read_op as an argument from 
flash, and considering flash continues to utilize the same read_op and 
frequency, it should make sure the tuning is appropriately completed. In 
the Cadence controller, the tuning process is validated by performing a 
read-back of a pre-defined tuning pattern using the read_op provided by 
flash.

> (and the tuning only gets added in patch 10?).

Patches 7 and 8 add PHY read/write support, and patch 9 adds tuning. 
These three patches could be squashed into one, but kept them separate 
to make it more granular for the reviewers.

[1] https://lore.kernel.org/linux-spi/20220509175616.1089346-1-clg@kaod.org/
[2] https://lore.kernel.org/all/20230322090451.3179431-2-haibo.chen@nxp.com/
[3] 
https://lore.kernel.org/all/20241128174316.3209354-1-csokas.bence@prolan.hu/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
