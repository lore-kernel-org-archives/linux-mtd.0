Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82867C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2024 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I91ggNlJMh3PM7ppdkM/z3DeLTnDHKLHG/eAlZWoyMw=; b=asOBwDNOHGhDZp
	818Lvm7wMu6+FnXHwYkGZy0U5OUNVMKcDdwYI3KKUp6XN39Fmt8iB0RVAwS546SdzeDPc6xbJQUB7
	YRNTfAI5h5O9lPav7BmY8UYj9git/ZIuyDXePgbVlq7eblPbQ2iyW0vT1BzO3TNLcU9AlinN42J30
	bFA1B/yexZwMUxs82nmDqsmvILPqtqBcIzs6ynR+v4wkCTYvbPsi9vQHFTci6UmAc4R609tDrJzSI
	rSStxRB4EgCexHY/FCD9Yq8Nd5UYkpHl/8vzYXzcjqJsIlNT630RTIZKnXaf2Lh3b6v8stNiG1Ut6
	TCSgS4t8x2Fi2E9oqRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IXh-0000000C51M-26VO;
	Fri, 26 Apr 2024 10:10:57 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IXd-0000000C4zk-3M6P
	for linux-mtd@lists.infradead.org;
	Fri, 26 Apr 2024 10:10:56 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2dcc8d10d39so22278261fa.3
        for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2024 03:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714126251; x=1714731051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTzf8B5xaF9nwt/4/HviUjeHQGltnTZQ9twI2ClHj4c=;
        b=LZCfCVPpZgi8VyauIJ3cNehIY6rG3G4ZbDHK0Dw4UlkT7H3hTL4lgJYGiqkF91+9/3
         Y1C6a6wcyvmU6+Xjjzt0lvaFx5bIkafENX5GR+tl9+N7eskTt3FlDgO2If7dTw51X+Ln
         prT6+alQqUi2CvBdcz4rDWj6zhX/qExFSoITpVIXonJHwWwaRehEslA6E/1ESoiAc2Zs
         2pr2VhCuyeQy3hIN+XQkutbRW1cDYc0W2+gbKXanYWRVSfVXzzqXfAN+RLOAwgrrYx5t
         s/1QjvhEwgT1zjUTv5mu6Dp637fEdOQ65PRgZVQOpnQTuSOAbXsLG33gVhCAjBXGzOrZ
         8mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126251; x=1714731051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTzf8B5xaF9nwt/4/HviUjeHQGltnTZQ9twI2ClHj4c=;
        b=BYM5rr4INS5dx0+Qti9/sXumQk69iD9EWBjc45fK6HvMiilFM5D15sSveHPgSlarSw
         DhL0rVo7n8V2BO3IyprEpJ/BoUPGMlDzVt359lfBIyK7mk49S0XMV+FjMfYEczM1Fb/l
         jCrysyoT9zLvf4X0GQ2yZmOuIJtD8cwTwSxFaSPCgYxvMSfQWizpOEYsQcWpMVowArYZ
         xSZYzvQRpCDDOK020W3YRfNzoH8P2QB8UIUtEQOFKEu5GQ/Y9QFvy/FbU63JWFTJSgJV
         PZd1XmSSKYvRBxFtIIYNC4Yo4MnP9DIv+TpEwx+7yN2zefwrl1bOkzhMWuhS2IFDAp2+
         JVhw==
X-Forwarded-Encrypted: i=1; AJvYcCUhqbaen927kOll+ZRq1yerbrV2XdEiBRqxKHbIQ23r/m31CRkNopEPoNf1HeMpcltP9KKQ+ozk25eCb1lIFvRe0qJ9uDjaeKFk6wDTgQ==
X-Gm-Message-State: AOJu0YwIICz6d5spXiUxY6n2o1CUfsCBQ1X/0MTLr1z1rfLC6iY8FwIs
	vrU8+7D48tW/bidqmnp7jaITDzftK8QmYv5ngTugv3inCXVJ0UQm7Ni+BWZLTgo=
X-Google-Smtp-Source: AGHT+IETNBTvduNcSZvQ1UED1Wabzp3E86pe63uLXem5m50jD/68R72SdO0dpZh999FcTtsL3zEqXg==
X-Received: by 2002:a05:651c:10d4:b0:2dd:987f:f9d7 with SMTP id l20-20020a05651c10d400b002dd987ff9d7mr1239494ljn.25.1714126250958;
        Fri, 26 Apr 2024 03:10:50 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c470b00b0041a963bf2cdsm14302754wmo.36.2024.04.26.03.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 03:10:50 -0700 (PDT)
Message-ID: <4b6e1399-7b1d-4506-9943-32e76aff22f4@linaro.org>
Date: Fri, 26 Apr 2024 11:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SPI Nand patch code of SkyHigh Memory
To: KR Kim <kr.kim@skyhighmemory.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: mika.westerberg@linux.intel.com, michael@walle.cc,
 acelan.kao@canonical.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, moh.sardi@skyhighmemory.com,
 zhi.feng@skyhighmemory.com, changsub.shim@skyhighmemory.com
References: <20240426072033.331212-1-kr.kim@skyhighmemory.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240426072033.331212-1-kr.kim@skyhighmemory.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_031054_033141_E0CE2478 
X-CRM114-Status: GOOD (  35.27  )
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

+Takahiro, I saw he was quoted as author

Hi, KR,

Thank you for the patch.

Plese run "./scripts/checkpatch.pl --strict" on your patch and fix the
errors and warning that are shown.

Subject is wrong, it should follow how other drivers were introduced.
You may use the following in the next version:
"mtd: spinand: add support for SkyHigh S35ML flashes"

Other comments below.

On 4/26/24 08:20, KR Kim wrote:
> The following list shows the additional features that are required to support Skyhighmemory S35ML0xG3 SPI Nand:
> 
>     [Always ECC On]
>        Always keep the ECC On during Bad Block Marking and Bad Block Checking
>        1. The on-die ECC feature is totally transparent to the host. The ECC parity bits used for this feature do not occupy the NAND spare areas.
>        2. The host is free to have its own ECC engine by using the spare areas that have standard size. 
>        3. We provide this patch to enable users who have limited ECC capabilities on the host side to use the NAND flash. This patch has been tested thoroughly on Linux. 
> 
>     [Change ECC Status information]
>        This patch changes the ECC status information as follows to maintain compatibility.
> 	00 (normal)                               
> 	01(1-2 errors corrected)          
> 	10(3-6 errors corrected)          
> 	11(uncorrectable)

Please read the guide on submitting patches before sending v2:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

It describes how one shall describe the changes. You missed to add your
Signed-of-by tag.

> ---
>  drivers/mtd/nand/spi/Makefile  |   2 +-
>  drivers/mtd/nand/spi/core.c    |  14 +++-
>  drivers/mtd/nand/spi/skyhigh.c | 145 +++++++++++++++++++++++++++++++++
>  include/linux/mtd/spinand.h    |   3 +
>  4 files changed, 162 insertions(+), 2 deletions(-)
>  mode change 100644 => 100755 drivers/mtd/nand/spi/Makefile
>  mode change 100644 => 100755 drivers/mtd/nand/spi/core.c
>  create mode 100644 drivers/mtd/nand/spi/skyhigh.c
>  mode change 100644 => 100755 include/linux/mtd/spinand.h

all these file mode changes are wrong, keep the files as they were.

> 
> diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
> old mode 100644
> new mode 100755
> index 19cc77288ebb..1e61ab21893a
> --- a/drivers/mtd/nand/spi/Makefile
> +++ b/drivers/mtd/nand/spi/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  spinand-objs := core.o alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
> -spinand-objs += micron.o paragon.o toshiba.o winbond.o xtx.o
> +spinand-objs += micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
>  obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> old mode 100644
> new mode 100755
> index e0b6715e5dfe..d09b2bd05284
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -196,6 +196,17 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
>  static int spinand_ecc_enable(struct spinand_device *spinand,
>  			      bool enable)
>  {
> +	/* 
> +	 * SkyHigh Memory : always ECC on 

how does the configuration register look like, would you please tell us
its fields?

> +	 * The on-die ECC feature is totally transparent to the host. 

this line brings no benefit, remove it

> +	 * The ECC parity bits used for this feature do not occupy the NAND spare areas.

its already implied, remove the line

> +	 * The host is free to have its own ECC engine by using the spare areas that have standard size. 

Why would one want to have both the on-die and on-host ecc engine work
in parallel?

> +	 * We provide this patch to enable users who have limited ECC capabilities on the host side to use the NAND flash. 

remove this line, it brings no value

> +	 * This patch has been tested thoroughly on Linux. 

all code is considered tested, remove this line
> +	 */
> +	if (spinand->flags & SPINAND_ON_DIE_ECC_MANDATORY)
> +		return 0;

the always on on-die ecc shall be discussed in a dedicated patch, as it
touches the core.
> +
>  	return spinand_upd_cfg(spinand, CFG_ECC_ENABLE,
>  			       enable ? CFG_ECC_ENABLE : 0);
>  }
> @@ -561,7 +572,7 @@ static int spinand_reset_op(struct spinand_device *spinand)
>  			    NULL);
>  }
>  
> -static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
> +int spinand_lock_block(struct spinand_device *spinand, u8 lock)
>  {
>  	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK, lock);
>  }
> @@ -945,6 +956,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
>  	&macronix_spinand_manufacturer,
>  	&micron_spinand_manufacturer,
>  	&paragon_spinand_manufacturer,
> +	&skyhigh_spinand_manufacturer,
>  	&toshiba_spinand_manufacturer,
>  	&winbond_spinand_manufacturer,
>  	&xtx_spinand_manufacturer,
> diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
> new file mode 100644
> index 000000000000..f001357b4d85
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/skyhigh.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 SkyHigh Memory Limited

Copyright followed by (c) is redundant. Update years.
> + *
> + * Author: Takahiro Kuwano <takahiro.kuwano@infineon.com>

You shall consider adding Takahiro as author, or co-author, or at least
specify that the patch is derived from Takahiro's work.
> + */
> +

cut

> +static int skyhigh_spinand_ooblayout_ecc(struct mtd_info *mtd, int section,
> +					 struct mtd_oob_region *region)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	/* SkyHigh's ecc parity is stored in the internal hidden area */
> +	region->length = 0;

what happens when length is zero?

> +	region->offset = mtd->oobsize;
> +
> +	return 0;
> +}

cut

> +};
> +
> +static int skyhigh_spinand_init(struct spinand_device *spinand)
> +{
> +	return spinand_lock_block(spinand, SKYHIGH_CONFIG_PROTECT_EN);

I see the core unlocks all blocks. Thus I assume you can as well remove
the init method altogether, it brings no functional change.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
