Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329B6C48BC4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KLk8sbdXvXl1JwCP0o4WVFnDawENR4hDt+GMdLqmj0=; b=qmKPCGNoiJYjhq
	HvzTTto7yVO53iZdyP+cclsBphMEyQYuroqSLpmXaaugZN6OPXlHCYGP1Mkz9sjyUSFvefzFSMv9s
	adRQGeAjKVnwZROMISfQJJ3sCq+4ld+ekqiEpQnnI8AQWHoXB9X6bM3Ykye6wD9b5wxVtD7KsmDBN
	E3xmgdLRt1rDFTMPeWG6uTkfcdSvqVmPqXzULi7Pv5vCmADFQ9Fp0ISxz7vqPD9g+3nqvExucmUCP
	XjiM7UdzlEiWVmMJg2acRS7KseP0KTshFnBvKfWEfCS6brl/9cwMs0RlaEpzkn+3+c/8Ib/vlu72K
	sD8DkFXcIUa7N8jOB0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rafxT-0000000HGUz-11Xo;
	Thu, 15 Feb 2024 17:55:39 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rafxJ-0000000HGSE-2gO7
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 17:55:32 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d0cdbd67f0so16133261fa.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708019727; x=1708624527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDWXjBWcKFEbyW8Uf48hnpLWCBqnIeEgb6RPWjwQokE=;
        b=t/tskts5ABuFYUQTx+VlMzoGGLTkiBP7Y1dcl4nD9WyH+cGBUR5iB81Bv7XHlNrNJ0
         mgmca7mOAVEr6I+ZtBYl+1ZZmXZ84UHjN9UIlRzfcH0q7WstKWsJl+zw8YkiFUGNFdE0
         UtP4b3d3vGgxIq0lFGW6hQOMql8rugL29wRFnKc23ZMFw0wwpq9Jgv11X/FPP0CWzGDz
         p5dyOmXI2yJQoZ2sVICVait76rMjzwlmj65b8zm5O+FHKVwW7iluybbt3h09Zckaq8in
         P8FRitiyWTlKuC73qHM8PMtRhwL9dX8+PgHrBS6tHtyp35BNC/9rQTzPMMgSR7xv18+u
         xefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708019727; x=1708624527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDWXjBWcKFEbyW8Uf48hnpLWCBqnIeEgb6RPWjwQokE=;
        b=HikPnnUeD5ilumaBGKz7RDduqsFxME3MQScZIboMrovqNptVxezBZlBgo0Uv9JdoOG
         ZDQbxvbhgg3zW3EyAMxi6nO6fvhN03zJky8nGLJb8cw3ySnrjhSUlv94QP+DXvOgo3lI
         rj5Sx3UlGgDDT6TlZy2KLTEjeIkgQ4i1cl+SxHgUH8iW4DclheoDwiNAoivI+kjUV31D
         y4azMx5G3LVvyis+hLrNXFU/6dsJQwjkC25zFCSkNdsS29wwmcZZZ1k/f4jg0k03VaT/
         xMW0ZEJrfSJrJi5aVgVrqyp/Fvi2YR9hR7hiGSXm8p+uOA+gziJhuwaIf4RKbp4HXVrT
         ex5w==
X-Forwarded-Encrypted: i=1; AJvYcCVR7pqp2ASKHDktAktUxTF8Wq8NeXtCoC1CZiqMo9Dn2CHTnOLZRXKRcz/1vJogbz8nlDgEPwqwsEWpx8BxuVVyDcG3thV+J6mWiYXYWw==
X-Gm-Message-State: AOJu0YwqrqiyrAPLdFvT9BnFnNqj2IPeRUZXVUz7vc7Vbx7gIwg23c0P
	/0NHZePm5HRTMLe3gKLr0Z3aCykKt5/2rpMIRdeSBp4CPEPTUcuW1PjVFdGk1Qs=
X-Google-Smtp-Source: AGHT+IHCLIfN6muAhaewbjdhnO1CjXkKfDODDb3Jlvpzo3uuFHn1hyVeYSewW3DaaUIu7nCHSXFxCA==
X-Received: by 2002:ac2:4d8d:0:b0:511:5537:fb26 with SMTP id g13-20020ac24d8d000000b005115537fb26mr1993787lfe.39.1708019720252;
        Thu, 15 Feb 2024 09:55:20 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id g6-20020aa7c586000000b005619eea3d52sm749980edq.8.2024.02.15.09.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 09:55:14 -0800 (PST)
Message-ID: <4cb0144c-303b-4b91-bf88-0a7d7412afe1@linaro.org>
Date: Thu, 15 Feb 2024 18:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drivers: mtd: nand: Add qpic_common API file
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-3-quic_mdalam@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240215134856.1313239-3-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_095529_775252_46E548C4 
X-CRM114-Status: GOOD (  20.59  )
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

On 15.02.2024 14:48, Md Sadre Alam wrote:
> Add qpic_common.c file which hold all the common
> qpic APIs which will be used by both qpic raw nand
> driver and qpic spi nand driver.
> 
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

IIUC this is mostly moving code around?

I do however have some suggestions..

>  drivers/mtd/nand/Makefile            |    1 +
>  drivers/mtd/nand/qpic_common.c       |  786 +++++++++++++++++
>  drivers/mtd/nand/raw/qcom_nandc.c    | 1226 +-------------------------
>  include/linux/mtd/nand-qpic-common.h |  488 ++++++++++
>  4 files changed, 1291 insertions(+), 1210 deletions(-)
>  create mode 100644 drivers/mtd/nand/qpic_common.c
>  create mode 100644 include/linux/mtd/nand-qpic-common.h
> 
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 19e1291ac4d5..131707a41293 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -12,3 +12,4 @@ nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_MXIC) += ecc-mxic.o
> +obj-y += qpic_common.o
> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
> new file mode 100644
> index 000000000000..4d74ba888028
> --- /dev/null
> +++ b/drivers/mtd/nand/qpic_common.c
> @@ -0,0 +1,786 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * QPIC Controller common API file.
> + * Copyright (C) 2023  Qualcomm Inc.
> + * Authors:	Md sadre Alam           <quic_mdalam@quicinc.com>
> + *		Sricharan R             <quic_srichara@quicinc.com>
> + *		Varadarajan Narayanan	<quic_varada@quicinc.com>
> + *
> + */
> +
> +#include <linux/mtd/nand-qpic-common.h>
> +
> +struct qcom_nand_controller *
> +get_qcom_nand_controller(struct nand_chip *chip)
> +{
> +	return container_of(chip->controller, struct qcom_nand_controller,
> +			    controller);
> +}
> +EXPORT_SYMBOL(get_qcom_nand_controller);

#define to_qcom_nand_controller()?

> +
> +/*
> + * Helper to prepare DMA descriptors for configuring registers
> + * before reading a NAND page.
> + */

Can you convert these to kerneldoc instead?

> +void config_nand_page_read(struct nand_chip *chip)
> +{
> +	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> +
> +	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
> +	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> +	if (!nandc->props->qpic_v2)

This is not going to scale going forward.. please include a version
enum instead.

[...]

> +
> +int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
> +		      int reg_off, const void *vaddr, int size,
> +			     bool flow_control)
> +{
> +	struct desc_info *desc;
> +	struct dma_async_tx_descriptor *dma_desc;
> +	struct scatterlist *sgl;
> +	struct dma_slave_config slave_conf;
> +	struct qcom_adm_peripheral_config periph_conf = {};
> +	enum dma_transfer_direction dir_eng;
> +	int ret;

Revertse-christmas-tree, please

> +
> +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	sgl = &desc->adm_sgl;
> +
> +	sg_init_one(sgl, vaddr, size);
> +
> +	if (read) {
> +		dir_eng = DMA_DEV_TO_MEM;
> +		desc->dir = DMA_FROM_DEVICE;
> +	} else {
> +		dir_eng = DMA_MEM_TO_DEV;
> +		desc->dir = DMA_TO_DEVICE;
> +	}
> +
> +	ret = dma_map_sg(nandc->dev, sgl, 1, desc->dir);
> +	if (ret == 0) {

if (!ret)

> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	memset(&slave_conf, 0x00, sizeof(slave_conf));

Just zero-initialize it (= { 0 }) at declaration time

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
