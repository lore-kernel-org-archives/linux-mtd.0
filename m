Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC6ACE79CF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lH5XD1BlzuZeK1xUJffni+B5NtVfbL3mwfeOP2DCro=; b=X95jAlxEKtQdc/
	9E3lZomKqILVeVQC2XQ5I6Eo9wylOta3wg+V6MOEpwpNfZ9Kap+MqUy4Fsk59XY7wFcEiSDt/iHMJ
	tuBFQWgL+aIPDBU6UkXgjnFRbe1kIASAXJD8IFnKV9cQzN2Ob2XKhCzQN7LcoviuYxIRR8sWFhZi9
	w5xsPs9ASzCg7ns9M+FuLXd6ZMXVd3xXf4ujvVIbzBR732hnvt6ApIcHCDQfzD83LiUsMT4/HXnEO
	cQA6A1tbUsFNVKgfc0PCTkIQSyI3tmuxsXXhRqx3ublSBHsHi/6W08Dxk4ZkRxC/Q/XaV8Oc/xppp
	a8VdLK2RVqKbtaPGzyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwgY-0035js-2V;
	Wed, 20 Sep 2023 12:52:06 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwgX-0035im-0C
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 12:52:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a21b6d105cso868801566b.3
        for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2023 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695214322; x=1695819122; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOz5yPuUsZYwMWEMqevmBScGt4qgEyDDyfwTzCd5Oqw=;
        b=eHGTrMYftRbuTpKY7utZzcZDxOAZ07c49uxUsm2RXwS4QGMxX1ZjKNAqBsR+/2RhDn
         lXhGrAVgIa1aVnZ9AtJ0i2RdE5hEmMD9Zwg2wVB9HBhWtWkyW18M8zQ3JmIu/4x1uAhK
         BxpLl8hNhRGHCPegtjlaijH3E0aBko+FP6DgVLCLruKHQloEj+/CgJxWXLJ3WlPxYLpB
         Ed+jTsC7p2tOXBZVqxGyIHU9RSDEw0kszRAVo1TzjGndTKxfdnxDqX1rMEBCXjlcMKSx
         pZgacJdAOLAA5H3lfxz/xfYWIMzDQG7MUVelnKNfSQmXLiMvW2tMnRkEYtInqEA5l2dM
         ijhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214322; x=1695819122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOz5yPuUsZYwMWEMqevmBScGt4qgEyDDyfwTzCd5Oqw=;
        b=GuwerIkJeyRyxsDBvmODil8sGC+2VXS7lIXRr6fg3WTTDMv6Ed/cII7NDbsdIX2QJU
         UBfviTSFUDDFlfe4AqP5zMnRfNqrTinB3g5qaJ79JILF3DP+CK3kT3itW4ycQYKsDVMO
         o7YSFJOKPwMxKS1uidJ76Wh9lGT8737Irhv2CRwHzQeKwEgZwhQGpfS0RK+f+OJ3mioy
         WmYr3TI3zy3KemMSFmaJJCt3Ku0hZ3JV1Qb6u9AVSViMkkI5UvgAT9T0mxbid6C4wDE7
         WZYNxxt1GAzaIxN5/LBuC0IOfScaZkcRiT7YGeqiKlLkTNEQC8xaJcRHEoCny9d5WtdA
         IzPA==
X-Gm-Message-State: AOJu0YzPmTgn2piGyANxGPpM2EHjLxSOAb2coogysSUd2hByboOhUFDg
	EKFQ+w0GpYDhks2Bz92DpxRCcw==
X-Google-Smtp-Source: AGHT+IEiWf6YzkwqeS7QHV8ErxYFaOwnybR1tKNnJa6JgJZYuZgsYBgS3CmA1rb/+mce1lhBv7vMtw==
X-Received: by 2002:a17:906:b044:b0:9a1:f73b:90ce with SMTP id bj4-20020a170906b04400b009a1f73b90cemr1675705ejb.54.1695214321692;
        Wed, 20 Sep 2023 05:52:01 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id o26-20020a170906359a00b009875a6d28b0sm9270900ejb.51.2023.09.20.05.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:52:00 -0700 (PDT)
Message-ID: <35677eed-7aee-297c-0512-acc3a948af9f@linaro.org>
Date: Wed, 20 Sep 2023 15:52:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order
 from BFPT
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-7-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230908064304.27757-7-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_055205_100429_C05901BD 
X-CRM114-Status: GOOD (  17.70  )
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



On 08.09.2023 09:43, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.

Oh, here it is. Why do you need the flash info flag then?

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 4 ++++
>  drivers/mtd/spi-nor/sfdp.h | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index b3b11dfed789..2241207556bf 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -650,6 +650,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		return -EOPNOTSUPP;
>  	}
>  
> +	/* Byte order in 8D-8D-8D mode */
> +	if (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
> +		nor->flags |= SNOR_F_DTR_SWAB16;
> +
>  	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>  }
>  
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 6eb99e1cdd61..eba760941d43 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -123,6 +123,7 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
>  #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
>  #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
> +#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31) /* Byte order of 16-bit words in 8D-8D-8D mode */
>  
>  struct sfdp_parameter_header {
>  	u8		id_lsb;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
