Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25A9C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:24:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D23651EB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D23651EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PE56CgbFgKiTKyPJnmPi5tnJIkBZd9nxAwDvwcx/0AM=; b=ckjASgB6quQsTK4z+E0rGdwMr
	LB8cb7xj+5OTg4Phrz+D5W0xzqMhEOS8QlTbIin85rJabKlVM1IMzOGu2KfXgh9LG55RgSsjQ7jG2
	9H742iKqTqrlyWHFGIu8i6YHPpfjIIpBYOpIAOUp1AlP4FBFFjGhHQP/D760+JSXo3rCZ6TSXEd5f
	QC8vmJ/F7l0ASN7L769tVQOJk7nbwAghbiCJ1S/Xp/OWE7GfaSAtGt+CdbhcJ9hChoXdUgLh0Qa0S
	cv9BsaNxsAMfEM2M4ObuYj0JiI2uHgUCBVLIhcqfVj10kMgBvjFiUUenAhx/e8ibKyKch47CM3pNh
	fWS8qs9dA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9IW-00FTDE-09; Mon, 08 Mar 2021 06:23:20 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9IP-00FTAg-9D
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:23:15 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1286N75W051359;
 Mon, 8 Mar 2021 00:23:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615184587;
 bh=QklpySCLOwECbEk2YWP3FRQbNMYZhudGOqMYSRereIc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cqMnerDD9HPv1w2NGd/PV60ZTgBBK67KVh3pr6VEJ+JMUkbDEOIchqoz35qbyYdjW
 hu2T/1vnWyYsEKqcLafb9oFgYapnhcoh7OO8ZQCz2wmXgw/RxljTmR+/67oQc3zEuw
 ui5fMvC6jLhJhHWVTIAdB8saQtEKtgqEHDlvDUC0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1286N7Yx026903
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 00:23:07 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 00:23:07 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 00:23:07 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1286N4Od093672;
 Mon, 8 Mar 2021 00:23:05 -0600
Subject: Re: [PATCH v1 1/1] mtd: spi-nor: intel-spi: Move platform data header
 to x85 subfolder
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Lee Jones <lee.jones@linaro.org>
References: <20210304140820.56692-1-andriy.shevchenko@linux.intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a515499d-d91d-117e-8cc9-de1f12912358@ti.com>
Date: Mon, 8 Mar 2021 11:53:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304140820.56692-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_062313_759720_A6E4FFFA 
X-CRM114-Status: GOOD (  15.82  )
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



On 3/4/21 7:38 PM, Andy Shevchenko wrote:
> In order to group x86 related platform data move intel-spi.h to x85 folder.
> 
> While at it, remove duplicate inclusion in C file.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Nit, typo in $subject and commit message: s/x85/x86. Tudor may be able
to fix it locally while applying.

Apart from that

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

>  drivers/mtd/spi-nor/controllers/intel-spi.c       | 1 -
>  drivers/mtd/spi-nor/controllers/intel-spi.h       | 2 +-
>  include/linux/mfd/lpc_ich.h                       | 2 +-
>  include/linux/platform_data/{ => x86}/intel-spi.h | 0
>  4 files changed, 2 insertions(+), 3 deletions(-)
>  rename include/linux/platform_data/{ => x86}/intel-spi.h (100%)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> index b54a56a68100..a413892ff449 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> @@ -15,7 +15,6 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/mtd/spi-nor.h>
> -#include <linux/platform_data/intel-spi.h>
>  
>  #include "intel-spi.h"
>  
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.h b/drivers/mtd/spi-nor/controllers/intel-spi.h
> index e2f41b8827bf..f2871179fd34 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi.h
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.h
> @@ -9,7 +9,7 @@
>  #ifndef INTEL_SPI_H
>  #define INTEL_SPI_H
>  
> -#include <linux/platform_data/intel-spi.h>
> +#include <linux/platform_data/x86/intel-spi.h>
>  
>  struct intel_spi;
>  struct resource;
> diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
> index 6ddca2bbb3a8..39967a5eca6d 100644
> --- a/include/linux/mfd/lpc_ich.h
> +++ b/include/linux/mfd/lpc_ich.h
> @@ -8,7 +8,7 @@
>  #ifndef LPC_ICH_H
>  #define LPC_ICH_H
>  
> -#include <linux/platform_data/intel-spi.h>
> +#include <linux/platform_data/x86/intel-spi.h>
>  
>  /* GPIO resources */
>  #define ICH_RES_GPIO	0
> diff --git a/include/linux/platform_data/intel-spi.h b/include/linux/platform_data/x86/intel-spi.h
> similarity index 100%
> rename from include/linux/platform_data/intel-spi.h
> rename to include/linux/platform_data/x86/intel-spi.h
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
