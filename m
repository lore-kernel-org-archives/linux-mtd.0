Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7478C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Feb 2022 19:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+NkcLWgkoUj593NXiq6tQBY0E0bP7Y1g+Rgtmy6RAE=; b=2gEs6HiSbbLGQy
	D0SqV3FOVQb9RbXl/K0K764xNarLOb476MRQe1IVwYt76dPZbEUQioZeAiUtO8zVlPGQ6mEH+SXzU
	TytUsttGPyZcBQGLCknfcfi4W5lqUW1qy7ZXJq7HpFCujw8zb6mqPcb52bT7iSO5XCdlRUkKMj4u2
	0PjOIluv2LEfWv991jUanbx+YlWvxc5e3LCc5ySlUS/VDYVbMbQZjO0yx8yjj4IxLaeGlCjGTGloz
	bkzv/9kxsnUqbqU6SbpvS6+AHJfwm5scWNd0SI65wa+fzbTpPCRdXkcF81e38K3kMHzTl+9PzIPD0
	D+tcANU72SP5Skhi4lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLV9D-0000zq-LP; Sat, 19 Feb 2022 19:11:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLV9A-0000zH-Cs
 for linux-mtd@lists.infradead.org; Sat, 19 Feb 2022 19:11:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 00E2FCE0ABD;
 Sat, 19 Feb 2022 19:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE901C004E1;
 Sat, 19 Feb 2022 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645297912;
 bh=AdNNP3f2nzvuisqB37U22ZFFkpwe6bfxYYWqRev4vwQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cbImLl1jXLs7ShzBAg0QzQ/sXVqTMPCMrfHZqCGqMSUjIOz377LkoRYgiWxWerz47
 S+P4Njx8QALDuCOrtvLQoJJEJyzmu6+Ys0agpbpIkSHa7e11ZZ1xhT/6pAPjjGROIz
 O3pfVo8flWDxHh/T0t+TRQg+G4hTzRzPLCZV06ufKkdCw6tzqWjZ5+Pz91XJy80pua
 LbLQFNRk4OxzFeAhtGXqiawsfvaREGgh30X4LlAA0PHb5iMK3zf3Jel2o2vMQ+h88B
 x+yWKeq/n3/wz0LB9qC/gh3bMAje6XH3SOJ+JMVErgjBsNsJtQl3YhJrYU2el3Erq+
 yocwGKyFRAmDw==
Message-ID: <8a6f24eb-a256-3d0e-5a2c-f62b4afd30aa@kernel.org>
Date: Sat, 19 Feb 2022 21:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd: rawnand: omap2: Prevent invalid configuration and
 build error
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
Cc: miquel.raynal@bootlin.com, krzysztof.kozlowski@canonical.com,
 vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220118123525.8020-1-rogerq@kernel.org>
 <20220219150836.GA1035394@roeck-us.net>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220219150836.GA1035394@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_111156_847421_805456E0 
X-CRM114-Status: GOOD (  22.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 19/02/2022 17:08, Guenter Roeck wrote:
> On Tue, Jan 18, 2022 at 02:35:25PM +0200, Roger Quadros wrote:
>> We need to select MEMORY as well otherwise OMAP_GPMC will not be built.
>> For simplicity let's select MEMORY and OMAP_GPMC unconditionally as
>> this driver depends on OMAP_GPMC driver and uses symbols from there.
>>
>> Fixes: dbcb124acebd ("mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> 
> This patch ignores OMAP_GPMC dependencies and results in:
> 
> WARNING: unmet direct dependencies detected for OMAP_GPMC
>   Depends on [n]: MEMORY [=y] && OF_ADDRESS [=n]
>   Selected by [m]:
>   - MTD_NAND_OMAP2 [=m] && MTD [=m] && MTD_RAW_NAND [=m] && (ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
> 
> when configuring sparc64:allmodconfig, and in the following
> build failure when trying to build that image.
> 
> Building sparc64:allmodconfig ... failed
> --------------
> Error log:
> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> sparc64-linux-ld: drivers/memory/omap-gpmc.o: in function `gpmc_probe_generic_child':
> omap-gpmc.c:(.text.unlikely+0x14c4): undefined reference to `of_platform_device_create'
> 
> Guenter
> 
>> ---
>>  drivers/mtd/nand/raw/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>> index 20408b7db540..d986ab4e4c35 100644
>> --- a/drivers/mtd/nand/raw/Kconfig
>> +++ b/drivers/mtd/nand/raw/Kconfig
>> @@ -42,7 +42,8 @@ config MTD_NAND_OMAP2
>>  	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
>>  	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>>  	depends on HAS_IOMEM
>> -	select OMAP_GPMC if ARCH_K3
>> +	select MEMORY
>> +	select OMAP_GPMC

I think selecting these was a bad idea in the first place. I'll send out a patch to remove the selects.
This driver should depend on them instead.

We will figure out how to enable OMAP_GPMC for K3 architecture some other way.

>>  	help
>>  	  Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
>>  	  and Keystone platforms.
>> -- 
>> 2.17.1
>>

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
