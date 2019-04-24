Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5016C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 16:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92CDB208E4
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 16:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yps/1mRX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeN9DlT1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92CDB208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GQENjAYhbE21wB9ylmt03CEr7XNcJmJQeRlaIG5L5o=; b=Yps/1mRXGnykDm
	yOxavsE9I3dv/yn0PakoXupBIWdwzzGNFpMdV9by0yWuZ2UMq4GxBv8CZ0n0R3BYtlBdHrB07m1r0
	Kk/wLhRURjsCYmoJE1yJg12OYHJDjp1NYxtNpvSIP+Pe+s74jmSEbKDHW2TqHIuEvBK5CmmCF7bPv
	/KIysGGH/J1u+boUboRmZ9ZGUln39N0pnkWnOUYRtREDXaaH6tMv0JurVSFOpY8xwcl+bW9tHsM/k
	Fd/RoZBoi03m/OPi0rGOXd3ytYfW9wQmRzugc5Mpo5EPfLqG3zYBcTWrbNgc/PzasRtEuGUIHBZH9
	vis0XvDUgfJ+H9xnCj4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJKYc-00038x-Fp; Wed, 24 Apr 2019 16:15:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJKYY-000380-NU
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2019 16:15:36 +0000
Received: by mail-wr1-x443.google.com with SMTP id g3so25953669wrx.9
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2019 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zi8fvpIJsVo5vdKGwjeqGHfGNcRLjxEsDUOgwJ93F9o=;
 b=AeN9DlT1lON9THuaofqSc55KoIa7wFqJ48mZwnJ/DUdIK7eX0W+gCVKbG8i81pku6s
 /VW6Ilh4PPlSNHuX77JUaFDIx54xtpbh7uggKUZW+gZArrNcJGluGtl4mC4lvJi7dF7K
 e3yVYODvR+IhC45K+jSs4+CNtIeZOutU0RaYG2n33XLfWiLYfovmyPUFYOLgr3cK8yfa
 uXedT1BCzdHw+XpDMCoT/RH3oM2K1gaxRKXDpsjwyOcWkWCYKVbRS/M26DXSsi/eMHMb
 NRLBIwGrRLR3RhrrkOJQm1pVzFi9QNs6oHoQzp24biBeBuHThjYZ6eqnqOhiDAjnWfWV
 fCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zi8fvpIJsVo5vdKGwjeqGHfGNcRLjxEsDUOgwJ93F9o=;
 b=drTACsUg2QuOTIoaTlal90+6aaYDUmAbO/g/1AuhB2MmfVLJXf2hor1FteJctIuVgY
 tumWLtXKnZADfam5pTrsdMwO5WBgi1LJ3ucBXgU93iOQF5fSwkX/aALq4UuyJ76YdVas
 FARjBFoxm/cnYuIotSYBncqrabkAwnb/Wid9nWhRgcdX9LWDRAmQmbDgd+MvYOgVZWf4
 wVXbHmkyQoVgxeLVdsPbioToYupVibeSUk7swZdw2c426eWZf2hkN5PWYv2HActn6pxx
 iuc3VxG4wWaL4tfIfDUctCggtE9T9zEfE2npYJBY3MN8RTvXrNagabOa4YpbPGrWvP/i
 hlpg==
X-Gm-Message-State: APjAAAWZxi1CGwQU+0fR3NHl8eLauLETVQSy3On4r+EOAfy6ukeXhnnQ
 m39L+/787UEo+2F7iIXAamqhdA==
X-Google-Smtp-Source: APXvYqyFLdPEWhiwlZr7ZpZjDffqRjDHHANuJbm40+gVIHKa0u9C6FRIkTbS8PQZv94I+9wxlxL9VA==
X-Received: by 2002:a5d:4a83:: with SMTP id o3mr5085953wrq.90.1556122532669;
 Wed, 24 Apr 2019 09:15:32 -0700 (PDT)
Received: from [192.168.1.2] (200.red-83-34-200.dynamicip.rima-tde.net.
 [83.34.200.200])
 by smtp.gmail.com with ESMTPSA id q202sm4246560wme.9.2019.04.24.09.15.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Apr 2019 09:15:32 -0700 (PDT)
Subject: Re: [RFC PATCH 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver as
 Dual MIT/GPL
To: Xiaolei Li <xiaolei.li@mediatek.com>, miquel.raynal@bootlin.com,
 richard@nod.at
References: <20190424064522.33501-1-xiaolei.li@mediatek.com>
 <20190424064522.33501-2-xiaolei.li@mediatek.com>
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <7be16a76-0099-2776-9ee1-9c87ce492839@linaro.org>
Date: Wed, 24 Apr 2019 18:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190424064522.33501-2-xiaolei.li@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_091534_778478_E7867252 
X-CRM114-Status: GOOD (  17.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: daniel.thompson@linaro.org, srv_heupstream@mediatek.com,
 boris.brezillon@bootlin.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 4/24/19 08:45, Xiaolei Li wrote:
> It is allowed to use MTK NAND driver with GPL-2.0 or MIT license.
> But now it is only licensed as GPL-2.0.
> So re-license it as dual MIT/GPL.

Relicensing is OK with respect to any Linaro copyright interest deriving
from upstreaming this work.

Acked-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  drivers/mtd/nand/raw/mtk_ecc.c  | 12 ++----------
>  drivers/mtd/nand/raw/mtk_ecc.h  |  4 +---
>  drivers/mtd/nand/raw/mtk_nand.c | 12 ++----------
>  3 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
> index 6432bd70c3b3..eea0f903bc24 100644
> --- a/drivers/mtd/nand/raw/mtk_ecc.c
> +++ b/drivers/mtd/nand/raw/mtk_ecc.c
> @@ -1,17 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * MTK ECC controller driver.
>   * Copyright (C) 2016  MediaTek Inc.
>   * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
>   *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>   */
>  
>  #include <linux/platform_device.h>
> @@ -600,4 +592,4 @@ module_platform_driver(mtk_ecc_driver);
>  
>  MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
>  MODULE_DESCRIPTION("MTK Nand ECC Driver");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/drivers/mtd/nand/raw/mtk_ecc.h b/drivers/mtd/nand/raw/mtk_ecc.h
> index a455df080952..0e48c36e6ca0 100644
> --- a/drivers/mtd/nand/raw/mtk_ecc.h
> +++ b/drivers/mtd/nand/raw/mtk_ecc.h
> @@ -1,12 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * MTK SDG1 ECC controller
>   *
>   * Copyright (c) 2016 Mediatek
>   * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
>   *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published
> - * by the Free Software Foundation.
>   */
>  
>  #ifndef __DRIVERS_MTD_NAND_MTK_ECC_H__
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index b6b4602f5132..3cbc25793062 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1,17 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * MTK NAND Flash controller driver.
>   * Copyright (C) 2016 MediaTek Inc.
>   * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
>   *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>   */
>  
>  #include <linux/platform_device.h>
> @@ -1598,6 +1590,6 @@ static struct platform_driver mtk_nfc_driver = {
>  
>  module_platform_driver(mtk_nfc_driver);
>  
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("Dual MIT/GPL");
>  MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
>  MODULE_DESCRIPTION("MTK Nand Flash Controller Driver");
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
