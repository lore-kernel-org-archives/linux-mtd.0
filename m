Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AF8C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Dec 2022 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itQfvMP6qeqpfcd51dBLIhEnyOMBWr4BgkUJgmHcixk=; b=4F3HuUloffHJpI
	inAdwIY+b97MoAienpN5x+7mP5iQr+VnHCnAbFy17Q7WHZwHwTNyOt98N9Jer2FW9XagvxdbDKmAf
	z0krW+i35qI65gqorvw3EDXkETy8yuC1mmMayiEZ+HckuT5TgRqqTvwUrz+UJ/4qAPrTQ+asxQVhk
	OQcUAItKCaPIbxsL8dh2yaU5zLCJZwt5f64tLsc8KfqvFgzfDmMcgVHHjJpf6S6TtTtbHdciPwGZg
	J95BmKG+WFjtomM0DC+3nZ6qvxte6eqHkuOUI6CNT+3sB3bjMBDoNoEpzoCoy0ilcb3goUDn3v+YP
	nQQqCztlu/0SCepjgutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p82GE-00H9ma-9E; Wed, 21 Dec 2022 16:48:06 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p82GB-00H9ku-5p
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2022 16:48:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id u5so16285515pjy.5
        for <linux-mtd@lists.infradead.org>; Wed, 21 Dec 2022 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zf7b1Um8dHFfJxzXmlJa5Ye00ncxyhJJVvmWoX+5UNg=;
        b=cXMnkLa/BEl6nLUkGegVRuJ8xP3NJvfAqoDs/4aAd/4kVWHWG0te6VfkTbUz+4Krmb
         WfBdJ26tmjnQl3Zs1pl40sBUE8qA5Qj1X3gRbYvE+qtsd8WAT/6cvCK3U8d3U0kuZ3Wn
         i2U1NDPwDUpXkh53mLz2UEPNQ3l3gEZZwurqquF/edSnip9aJ078wAupTNj0RPhe9n5C
         ZuWv8lfMdi/wsZwE3Unjk6sHcqffEhzedNuCBh7shGoHfk03rIIgBveDs53oKltETjyA
         /OmwvybSP89ZdaZe/gqm6+gRIfVf9nDmmKjo7lliMHfWaVb0pHCH7nLgpD/Ke1VwaTu9
         O4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf7b1Um8dHFfJxzXmlJa5Ye00ncxyhJJVvmWoX+5UNg=;
        b=gtNIU0wL2Qubdrb1Whjsz9iN3UIbQbIj71vpmaWFgzi3ATjl5eVmgPhW52jLVv/fjl
         h/1Ci0RYHAHy667MXNLIMpN6jbg0uvZRf+Qbmo5jHOLHpyNJlt31dv3ZsZpaB9H/5obF
         yO3hvQLitDQO+ZgiFUrSdxGk456EcJ55FWUnakkKrIzj4nFHyfcMeY6fKCnn0x5zchci
         CrRQ5n2O5+aZDnOumc3zw5ndio9lUjwO6PYG6K64PUhxyu5MqQUAMTWteseY2jZBZb/w
         YxE0kpHBVNSNv8wJOzIkRQEKuGyS/E0OmJYshAFExniNxDB+5GlsFyUxWwI+wm78VXd0
         zLJw==
X-Gm-Message-State: AFqh2kriNcjb/Zuoi9lX1q0HBPJIpCwfAgNCuJ5E6hzoUN1bfP8hpSZu
	2e7RQvyZPIARD4mtUmi+038=
X-Google-Smtp-Source: AMrXdXuYR9ISRKilIwT83DLgADmJAo7CNvXNazKKk2FaiV26xWK2a9ff1PC5F54Ydx3cjpzqQcKL5A==
X-Received: by 2002:a17:902:da86:b0:187:3921:2b1c with SMTP id j6-20020a170902da8600b0018739212b1cmr3498172plx.55.1671641279366;
        Wed, 21 Dec 2022 08:47:59 -0800 (PST)
Received: from ?IPV6:240b:10:2720:5500:24a0:f664:12ce:afd8? ([240b:10:2720:5500:24a0:f664:12ce:afd8])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902d49100b00186a437f4d7sm11712452plg.147.2022.12.21.08.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 08:47:58 -0800 (PST)
Message-ID: <ee2fa011-dac1-2495-cb17-e01ee99ce913@gmail.com>
Date: Thu, 22 Dec 2022 01:47:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mauro Lima <mauro.lima@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221220141352.1486360-1-arnd@kernel.org>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20221220141352.1486360-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_084803_290418_44FC635C 
X-CRM114-Status: GOOD (  15.60  )
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


On 2022/12/20 23:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
> fails to build, as it includes the shared CFI header:
>
> include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
>     62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
>
> linux/mtd/spi-nor.h does not actually need to include cfi.h, so
> remove the inclusion here to fix the warning. This uncovers a
> missing #include in spi-nor/core.c so add that there to
> prevent a different build issue.
Reviewed-by: Tokunori Ikegami <ikegami.t@gmail.com>
>
> Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>   drivers/mtd/spi-nor/core.c  | 1 +
>   include/linux/mtd/spi-nor.h | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d8703d7dfd0a..d67c926bca8b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -10,6 +10,7 @@
>   #include <linux/err.h>
>   #include <linux/errno.h>
>   #include <linux/module.h>
> +#include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/mutex.h>
>   #include <linux/math64.h>
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 25765556223a..a3f8cdca90c8 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -7,7 +7,6 @@
>   #define __LINUX_MTD_SPI_NOR_H
>   
>   #include <linux/bitops.h>
> -#include <linux/mtd/cfi.h>
>   #include <linux/mtd/mtd.h>
>   #include <linux/spi/spi-mem.h>
>   

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
