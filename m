Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FF2ECAAD5
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgguD+OBoIAaGlI4VcOW3hTvXbWrRbbkfbA//Z7J2NE=; b=HHom1VXw5AmA1k
	eeQThvv5XYYPTwUCDOLPhuIA4FKsrONe4jMWg1O4xXVktg5HdRrpHRETyi9XrL+SPCT5qGw/M77eD
	GyvZj807G1nr4/jbO8XxWEQyka/zv094LvnSmot0me9XlfZFgufFdvwWkfdOlME6n5VEQZvXd89KP
	67pPUN0sLSIr1+Bw1S3BJquNp1QdSy9dD4c7bSQCjK1xVomxe8E01Qm3JQ+2k+4sEKp3jj/rFzO8o
	3/lYwtsokESMDWPjzMtadMcXoP7IwjCSuXqKiZjCVp+Q1GZN1BBhu3EOABkoxIfE+RQ+h3mVXEBNV
	tjL7JOd7RHVyxbLrVs2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZkX-00EmU2-Kk; Fri, 09 Sep 2022 08:52:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZkR-00EmRM-Mr
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2022 08:52:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id bz13so1602874wrb.2
        for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2022 01:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jP0pFkmG2zxr05jAdP1hMbeqbKg9CqioB38AAHYVmvI=;
        b=MWcZT2bBh9VDvvGbZLvEXabNfeumwaVjX+C8C2lPoW4Lzw2BVRn9kf1sdPts0yU59Z
         6w+JLleDLWIcIh/3S3Ff0eN/U+jzEy41q+IYpzzmHe/N1iGnVQZSoQzADliQBn1KENxq
         j38StCiYIncAbOmbMVjX78rijk0Ts7f0yZTOaxH8hL704wVr3jhAv8dT3/8RORO1kP02
         PsR0Nv6voD2mRfTNa2D3quz4Yg5ywoWqkPBTATHfI4uio4FeFwF5pTbCW4cXqCupay9F
         QlaIOHDnK9FTYRmjbW0ZA98pihdseqyVQPMNL9xDTi90hZxNEGC4PFTZK7QNfNtUzIit
         EgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jP0pFkmG2zxr05jAdP1hMbeqbKg9CqioB38AAHYVmvI=;
        b=NtmPl/fD00bwDQfyVZghwWE2pJACY0zg0SRkV88U1B8eJ6RWcLTxK32YEgvKoWkGLt
         bR3sYBYVfEhbHA65KD6giENP0Fc5Z7Yu7fNYWDfm29kxwEIQHp2+f5kv5uMoTrwuXEDx
         KNFV1skWtw01iaSgbNbc2xvgBliIRbo6X+Q9QXLRBsVhhqQZXahbdL7X+Ds611qDU3EH
         l1AAdCKTlp6YwURZarHuGPThYXuHqvAWbMD807k70FeoqBu8p7bQvTmHaBq/01L4PJeY
         Wapv1Alb7Rsf6JJB53lb1jUPZis01Nd0TlWkyVcBGifarYyqRX4cjOwpnJ3rHfkDi8BC
         BADw==
X-Gm-Message-State: ACgBeo2iEWFGqKkyrtLcZI5chnVpcLSqI1Gi5qtnMROxVP+sNQ9SJBjU
	EG66YlKK1FGXi+RdI/ND3eqctA==
X-Google-Smtp-Source: AA6agR7U4hYZ9NiomZcOOo9VGy/PUI8bKuRPuMPqKufZMN5CbjFrj0TUBx99J+MQ2ojU8hv9P1zvqw==
X-Received: by 2002:a05:6000:110d:b0:228:db67:75c4 with SMTP id z13-20020a056000110d00b00228db6775c4mr7518711wrw.217.1662713543296;
        Fri, 09 Sep 2022 01:52:23 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id q3-20020adff783000000b0021f15514e7fsm21381wrp.0.2022.09.09.01.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:52:22 -0700 (PDT)
Message-ID: <373b10aa-f5c8-28b3-88b0-f87a1a40b000@linaro.org>
Date: Fri, 9 Sep 2022 09:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 13/20] nvmem: core: drop priv pointer in post process
 callback
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-14-michael@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220901221857.2600340-14-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_015227_837468_6499F204 
X-CRM114-Status: GOOD (  22.06  )
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



On 01/09/2022 23:18, Michael Walle wrote:
> It doesn't make any more sense to have a opaque pointer set up by the
> nvmem device. Usually, the layout isn't associated with a particular
> nvmem device.
> 
This is really not a good idea to remove the context pointer, as this is 
the only way for callback to get context which it can make use of.

I would prefer this to be left as it is.

--srini

> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v1:
>   - new patch
> 
>   drivers/nvmem/core.c           | 4 ++--
>   drivers/nvmem/imx-ocotp.c      | 4 ++--
>   include/linux/nvmem-provider.h | 5 +++--
>   3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index d31d3f0ab517..6910796937f9 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1523,8 +1523,8 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
>   		nvmem_shift_read_buffer_in_place(cell, buf);
>   
>   	if (cell->read_post_process) {
> -		rc = cell->read_post_process(nvmem->priv, id, index,
> -					     cell->offset, buf, cell->bytes);
> +		rc = cell->read_post_process(id, index, cell->offset, buf,
> +					     cell->bytes);
>   		if (rc)
>   			return rc;
>   	}
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index ac0edb6398f1..5e869d4a81c5 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -222,8 +222,8 @@ static int imx_ocotp_read(void *context, unsigned int offset,
>   	return ret;
>   }
>   
> -static int imx_ocotp_cell_pp(void *context, const char *id, int index,
> -			     unsigned int offset, void *data, size_t bytes)
> +static int imx_ocotp_cell_pp(const char *id, int index, unsigned int offset,
> +			     void *data, size_t bytes)
>   {
>   	u8 *buf = data;
>   	int i;
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 9d22dc5a3fa5..46067a6a0395 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -19,8 +19,9 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
>   typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
>   				 void *val, size_t bytes);
>   /* used for vendor specific post processing of cell data */
> -typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
> -					 unsigned int offset, void *buf, size_t bytes);
> +typedef int (*nvmem_cell_post_process_t)(const char *id, int index,
> +					 unsigned int offset, void *buf,
> +					 size_t bytes);
>   
>   enum nvmem_type {
>   	NVMEM_TYPE_UNKNOWN = 0,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
