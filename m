Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D77C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 11:27:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7919606A5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 11:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7919606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAEJZM8IGpBmjKYwjLvMBZ00AZl/6VxFQxCHV3NJ1G0=; b=jWQqLHcBWdJtPy
	iVWV/gFRMMofLp13Lz/PDBJp+0vDqgHLJjNm6acb6uQ/JoPjWBuKhmH5bn0EsZgrG9Ox0mOWnVTNr
	JGaiWwpR6vZQcYtaLFrayqTM/QsPIWWj218z+zc9Fs+rYdloUs+cpY2UQelA9xMYq7IVfLx34Pcaa
	73nHG5Cd3vNz4WoyuBec8p6ty4dcSyB27XNk+WyWQ3kT5WCzPcXolUIle096zjD7krZdru0yB6kzZ
	dGxbEh6TKbuH3LHM8cJF5Y/f4zQa6cPMkm72DRYNoAb6yZTqrnW6Gx84hVdHzNC9yh/drdOOjRaxv
	6+aSrzf0d+3oZ5Rn1SCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSHRV-001Q0a-SI; Mon, 20 Sep 2021 11:26:37 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSHRS-001Q00-Nb
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 11:26:36 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18KBQV6e076767;
 Mon, 20 Sep 2021 06:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632137191;
 bh=jCzRi2/Q+0qdOaYQDAel4Djg+QKzuUcYOJFl8ExjccE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=gslmWWViQGtRHDvDVMQ9orNl04Bf+K8fIo2WAwv2MNojHn12S/17Cq/rgytdXB9rl
 LKdgMA+9Nv8/1dE4uD38ghI8c8HJjHvfkrU/32YGY4UFeRkt3u0TX4BOF3+o3zS7/d
 CDMJsgeBy1n8XKRo7AxnkMMTqZZQC3rqvWpkAfPs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18KBQUmS056486
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Sep 2021 06:26:31 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Sep 2021 06:26:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Sep 2021 06:26:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18KBQSZ9103835;
 Mon, 20 Sep 2021 06:26:29 -0500
Date: Mon, 20 Sep 2021 16:56:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Daniel Palmer <daniel@0x0f.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <michael@walle.cc>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for ZB25VQ128
Message-ID: <20210920112625.fnqayim5mg5iggag@ti.com>
References: <20210918072256.3505379-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918072256.3505379-1-daniel@0x0f.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_042634_898276_EA6026D1 
X-CRM114-Status: GOOD (  22.61  )
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

On 18/09/21 04:22PM, Daniel Palmer wrote:
> Add support for the ZBIT ZB25VQ128 128MBit SPI NOR
> flash.
> 
> Link: http://www.cipatelje.eu/pdf/ZB25VQ128.pdf
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  drivers/mtd/spi-nor/zbit.c   | 21 +++++++++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/zbit.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 6b904e439372..a6f3646824cb 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -17,6 +17,7 @@ spi-nor-objs			+= sst.o
>  spi-nor-objs			+= winbond.o
>  spi-nor-objs			+= xilinx.o
>  spi-nor-objs			+= xmc.o
> +spi-nor-objs			+= zbit.o
>  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
>  
>  obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index cc08bd707378..75f6ac9485b9 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1846,6 +1846,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>  	&spi_nor_winbond,
>  	&spi_nor_xilinx,
>  	&spi_nor_xmc,
> +	&spi_nor_zbit,
>  };
>  
>  static const struct flash_info *
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 3348e1dd1445..ad3b34a3b80f 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -489,6 +489,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
>  extern const struct spi_nor_manufacturer spi_nor_winbond;
>  extern const struct spi_nor_manufacturer spi_nor_xilinx;
>  extern const struct spi_nor_manufacturer spi_nor_xmc;
> +extern const struct spi_nor_manufacturer spi_nor_zbit;
>  
>  extern const struct attribute_group *spi_nor_sysfs_groups[];
>  
> diff --git a/drivers/mtd/spi-nor/zbit.c b/drivers/mtd/spi-nor/zbit.c
> new file mode 100644
> index 000000000000..d240dd65d249
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/zbit.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021, Daniel Palmer<daniel@thingy.jp>
> + */
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info zbit_parts[] = {
> +	/* zbit */
> +	{ "zb25vq128", INFO(0x5e4018, 0, 64 * 1024, 256,

Zbit should be in bank 10, so it should be preceeded by 9 0x7f bytes, 
correct? I don't see any logic to handle that in SPI NOR currently so I 
assume this manufacturer does not implement the continuation codes.

In that case, it should go to the manufacturer collisions driver 
proposed here [0].

[0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210727045222.905056-6-tudor.ambarus@microchip.com/

> +			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_zbit = {
> +	.name = "zbit",
> +	.parts = zbit_parts,
> +	.nparts = ARRAY_SIZE(zbit_parts),
> +};
> -- 
> 2.33.0
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
