Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F1DC7618E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 06:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0w3w7kpk5WOWjFBlWHWW1SqaH0Vjil+43+H4M3B+SiE=; b=u66/RvTG6xCssK
	Nh7VQLWFc92t5OIh1GXMDvp1EqFFWIpo+FFG/eQTglW0HS8OMFUP69pjPCmu8yIz1mEQVI6mxySlQ
	0r7gZy5pTTa9CG2rZwACAhs3H2vP2rrjFEiwQ3t0P/MJxN3a/8ISw4v96nTu4XplvrtNyNhAXLKP8
	ZfK4ecK3tJwlLvuC4pIj1ZwpEqAzRPG6D10uUPafB+fpbsLM8B5U9Yjzf16vRUBSVqnFqZ8+LuS+s
	LBSVSsObWeeGOhUVmUMBArn2kGvBXxRDWI1fB+c8p3BdvpcDaFH91SvdTnt2D7ovPy4iVYrwt1HPm
	FfBA6AUj6dMSe1T8uVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3H2-0018qa-22;
	Fri, 17 Mar 2023 06:09:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3Gz-0018pg-18
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 06:09:06 +0000
Received: by mail-ed1-x533.google.com with SMTP id x13so16378592edd.1
        for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2023 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679033342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGtwOiJHkNZcEhuKsqjysm/FALfciPmAW++ypvlGgL8=;
        b=AQQxpToxwKe43vmem0vPBaZpBACrknbEViEdx+6Q7D1KyAXi67bHVN4OY/ihbLNLQv
         CB9UsYlfQC2dhN0qbMY+FTcw3Qzixz+BPougamSbJl5p9Jg5Cl2GZN3bYiKQWDqNkb6Z
         oGWl/31clmN/qXfVqibEoOZmfsJ4VafL9hDC7rM3Ipn8p5+N+p/+oQI6FxZ0pr1LLX2A
         7myiKnpQISfGOugCA/wML42RsgVeVKqcKTDQ5Xz5S1StHqxVCZDSmaxtuhEEvtUOZlCw
         pZn72AhEKFU/hlzJuXSMxqIicm3NRlD/BdukYU+rb71Odi3uWBDdMmTK37a4oimLlgZb
         0MhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679033342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGtwOiJHkNZcEhuKsqjysm/FALfciPmAW++ypvlGgL8=;
        b=jsfT/VsQoIDV9lsL7VmIa2QvRF3h7PYEMLM8kPGqPzJSuqQaZKuTtS5vEAQPLMdQjL
         Sxlzd7dWhiNw63I2OK8r0iHw9WRReK4MVFi8TIWbz5hFeJHsGRm7OlR6MWkOkEfVf+nH
         PJkZCx8ldTS/oeUPEEdUoafpHOrUnzYclVTc8fig+W2WEQkZSP+BF7lcAg2AqQjDX4G/
         sabshlsHJEfnLvk1hTobtS5T3uZ0cwN+dOQTC7ZYmSTKdbzshrbpwEvXmraO8iyY6Ih6
         5JsHmqZcy67XBJ4lMm5WsnzjU///PcOxImhWLqttXSS0lFrBIQRxwyYWnB+Y9/dFSUSW
         ztbg==
X-Gm-Message-State: AO0yUKVf1Rvt8uPrEfAl25qrOoOJUKDRVg+ui6Irdxdx/J6DUW35bnNV
	wRnTcLiNNZ8AHT2hBtxtwgT4YA==
X-Google-Smtp-Source: AK7set9F9efCPAKdl+qOKLHwld2XG/b8jilOSjmYfg4B/Bh+DcsLIlqB4q0LGDbF0lasU65UVjqd2Q==
X-Received: by 2002:a17:906:2357:b0:931:7709:4c80 with SMTP id m23-20020a170906235700b0093177094c80mr2003375eja.71.1679033342516;
        Thu, 16 Mar 2023 23:09:02 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id x9-20020a1709065ac900b0092ce7c94332sm539716ejs.148.2023.03.16.23.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 23:09:02 -0700 (PDT)
Message-ID: <8c54df69-52ac-b2e7-09d8-2066fb15c998@linaro.org>
Date: Fri, 17 Mar 2023 06:09:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Jaime Liao <jaimeliao@mxic.com.tw>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-9-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230201113603.293758-9-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_230905_396182_EBB68C94 
X-CRM114-Status: GOOD (  16.25  )
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

Hi, Jaime, Miquel,

Any news with the datasheet, can you send me a copy of it?

On 2/1/23 11:36, Miquel Raynal wrote:
> Describe this new part and provide the RWW flag for it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 6853ec9ae65d..655e7eec865c 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -82,6 +82,9 @@ static const struct flash_info macronix_nor_parts[] = {
>  	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_RWW)
> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },

Is this flash not really supporting SFDP?

We ask people that update or add new flash entries to do a erase, verify
erase, write, read back and compare test. Also to dump the sysfs
entries. Here's how to do that:

https://lore.kernel.org/lkml/97a3b023-b9bc-c34d-45a4-ddd56f47bd76@microchip.com/T/

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
