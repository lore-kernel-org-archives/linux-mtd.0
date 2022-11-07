Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F273DC43219
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAKOPY2fhLvU5KWScSh3sJBVr2KqoqELuqn+IXE9M8Y=; b=WmC9Ca6y8w+Goh
	pfevNkwbhrufHJG7P6ylCNaCrkU1Kl8UPOg35tIUE6pqn2ZQeV9ZSYjJMl75B68VI3sPLQSYLedh8
	eI4vx/M1ixrYaufBDZw4GJZ54q78GJka9tItdHCY9DJAuTl56mwFp/R98hMK/5nLNfVnb5MP6dkje
	b+58DkvKS94Dj4VF87K+S9hw2/E3vzmWMi4vw64XQf3Ecv0Ngj5sjxDbGk5sakDJyJfm00bByFRGS
	J3eOjxe6G6J4a1k2CPOVq7JrugrXwfGHL8LgLjKeF7NqcstOvTJAkx5V49cGy3CZ3Q82hmXboS/Vm
	2xyv+RWTJX7xvxUX5dHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ory0o-00D2ST-Cu; Mon, 07 Nov 2022 09:01:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ory0i-00D2QT-LH
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 09:01:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3804A60F60;
	Mon,  7 Nov 2022 09:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF63C433D6;
	Mon,  7 Nov 2022 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667811699;
	bh=SPtH20/96GdEvJGs3c70fuLCrm80coIng1kX3ldY4a0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YmhjOp9cdbqjRcY6UGQnj8sR06ymK0olBJdZz81umlUEkTpCg+qydNcahxqIfbJjn
	 neDY9uWn5nVGhAW1RdREC/5ZWtCuZCrHnllqe2M+yWElig/4Qwd3ygJ2pl+uFP0NSR
	 66J9gLXXw3jFXm42ZgFFFHKaF5ksrxJ4yeFb/eXvd2tqT2dw+qXsz4408twr3ayQlh
	 b0gMKTGB3mQdBxhcW3syOQaixNgpfzuemJNOLjK3Qiwg8sGsUO+dG48q3RPabai63m
	 ZnfAIrLkP76QHagXzfHbJ4SNGQ/sKXjf57BZCOH+wYsP3Ls+8Zoaw4lcWqKSa/rlSQ
	 Z6lT3tFIsprwA==
Message-ID: <f5645515-ccc2-2fd9-8943-f514b20e0c98@kernel.org>
Date: Mon, 7 Nov 2022 11:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] mtd: onenand: omap2: add dependency on GPMC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20221104194934.384371-1-krzysztof.kozlowski@linaro.org>
 <eef60a26-ef23-1b79-22f7-adaee3be9360@kernel.org>
 <742d9ff1-8af8-8fa1-4f37-4b50bd874e82@linaro.org>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <742d9ff1-8af8-8fa1-4f37-4b50bd874e82@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_010140_793237_D23E70CD 
X-CRM114-Status: GOOD (  17.06  )
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



On 07/11/2022 10:55, Krzysztof Kozlowski wrote:
> On 07/11/2022 09:44, Roger Quadros wrote:
>> Hello Krzysztof,
>>
>> On 04/11/2022 21:49, Krzysztof Kozlowski wrote:
>>> OMAP2 OneNAND driver uses gpmc_omap_onenand_set_timings() provided by
>>> OMAP GPMC driver, so the latter cannot be module if OneNAND driver is
>>> built-in:
>>>
>>>   /usr/bin/arm-linux-gnueabi-ld: drivers/mtd/nand/onenand/onenand_omap2.o: in function `omap2_onenand_probe':
>>>   onenand_omap2.c:(.text+0x520): undefined reference to `gpmc_omap_onenand_set_timings'
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Fixes: 854fd9209b20 ("memory: omap-gpmc: Allow building as a module")
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  drivers/mtd/nand/onenand/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
>>> index 34d9a7a82ad4..fa94c514626d 100644
>>> --- a/drivers/mtd/nand/onenand/Kconfig
>>> +++ b/drivers/mtd/nand/onenand/Kconfig
>>> @@ -26,6 +26,7 @@ config MTD_ONENAND_OMAP2
>>>  	tristate "OneNAND on OMAP2/OMAP3 support"
>>>  	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
>>>  	depends on OF || COMPILE_TEST
>>> +	depends on OMAP_GPMC || !OMAP_GPMC
>>
>> Why did you add !OMAP_GPMC?
>>
>> If OMAP_GPMC is not set we don't want to be able to build this driver correct?
> 
> It will build fine because of stubs, so building is not a problem. We
> just want to forbid having this built-in if OMAP_GPMC is a module. The
> question is whether this is a runtime dependency as well?

Yes, there is a runtime dependency. Without the OMAP_GPMC driver
this MTD_ONENAND_OMAP2 will not work.

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
