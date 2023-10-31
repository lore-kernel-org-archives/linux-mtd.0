Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EF1C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsOcsQiiiA4AAyAboWvz8dmqio29I+Pt858szpz7w/U=; b=pFxPIy/QTih0wl
	ffNorhOgCeJAqT5UlevLTZsvWcRJWjsFvNygB8y/VL5YpVj2uai0RUtqIPm1LYKod39YZ0qd5azJo
	MntXFAonCIHjfE91Yt2JgpgepKfKgNFPhciZfYiLWomvYG814SJ1SgrdBF9EHNNIpS0q/eE8yqLFL
	1RS7/4yAgC7QtOLoPqCVTp8442Ua2K7og1E0sYYnktR/v62dEZd5UZePsCb+hCO20uvGOsHG50jbd
	13VNupuUh/xfkQIfl114e6uEZSE6L/DrWUbSjgHZFn4p5a3cV5IannhMvwefIH3yOf0craBwHLDtb
	yW7EAzF6odOxfaZ5EpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsGs-005ouI-2B;
	Tue, 31 Oct 2023 17:11:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsGp-005otX-0H
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 17:11:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9c603e2354fso5072666b.1
        for <linux-mtd@lists.infradead.org>; Tue, 31 Oct 2023 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698772271; x=1699377071; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqSOgBlMAL0p4luVZj/K6kb8seEHM+WZo7c0FNWQQTQ=;
        b=ooyk6oI3ZT6xhDG9s/doEUFEgbxTQ7nicCybqVsHM/2r3/gIL5zhzA+YY7+eE55I2J
         otxz/ngZDqsfFhMysj4fL9K4tlBuXL9Jaqj51GVpHj5Z5WCRG3LEJNySiRUKcKdcF9Li
         yURVK5uAfmOrmj+95AO2jmEEF+tDA26xivk77Q/UfMp6GRIA11x0sn541F+1bpZpZp5l
         Kbhrrqa1Cu4+qtLTavbhLOXILA+k+BwcxbNsAjv29itAQKI9DKBOhyCf9sMEekywR4HW
         YxwFmx8Pmj1lrWaQ9zYV/hSu7khRq7ybL0hshBqcftsfaab9ybBwyR6rsKDUYTsxexgJ
         Ee0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698772271; x=1699377071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqSOgBlMAL0p4luVZj/K6kb8seEHM+WZo7c0FNWQQTQ=;
        b=dupTt58jGUgrqN4Ball06jEA0dpCIDH8sIUYIDBZVOgLD6vdWTfiVIIC6K1RWqYLaL
         ytjLx8YNDvvN2SIdXN9KuzYEmgcFl4sf0yAtm0AkukMLRq3F8zJ7tdNrXqegaYktP1B+
         7Sjj38j8HYFGMZCA5DxQYTUP4qlt/bom3IilRbC0PhjN/1LfibUxoHiQjWqguXp6ucjF
         /2xe6WFivn7VZ+CCMCQpi0wz6i/htXvYubhY8LVo5LdHzhh23UoK1IrsPouKQ/yelDSe
         dNHQoeFJe52R33oKfENBP3nM7IVJRTQw6JxRFnu0w9I6VlH4dAph7TbLN4ZQNC1RFNXv
         HDdw==
X-Gm-Message-State: AOJu0YyTvbnHp/QyowlA6Y4011BtoJQmLl8dTbW6afER7Y/dlIabWuEM
	jy0WYhsAp1skWVkZdDm1rmDcMQ==
X-Google-Smtp-Source: AGHT+IGPHvjQZdLx0skQOwgx1vhUZ3Q8/68RlhfDkl0id4LPnPh7EfNpx3PmhRPkfvwXsXvFFBXa/g==
X-Received: by 2002:a17:906:d9d0:b0:9ae:6648:9b53 with SMTP id qk16-20020a170906d9d000b009ae66489b53mr240679ejb.23.1698772271133;
        Tue, 31 Oct 2023 10:11:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id pj17-20020a170906d79100b0099bc8bd9066sm1268384ejb.150.2023.10.31.10.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 10:11:10 -0700 (PDT)
Message-ID: <b9af01d2-1a86-4b41-9bd6-3bf7a0dde1c0@linaro.org>
Date: Tue, 31 Oct 2023 18:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] mtd: nand: ecc-qcom: Add support for ECC Engine
 Driver
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 quic_srichara@quicinc.com, qpic_varada@quicinc.com
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-2-quic_mdalam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231031120307.1600689-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_101115_145153_E6C03F65 
X-CRM114-Status: GOOD (  16.04  )
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

On 31/10/2023 13:03, Md Sadre Alam wrote:

Eh? Empty?

> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> ---
>  drivers/mtd/nand/Kconfig    |   7 ++
>  drivers/mtd/nand/Makefile   |   1 +
>  drivers/mtd/nand/ecc-qcom.c | 198 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 206 insertions(+)
>  create mode 100644 drivers/mtd/nand/ecc-qcom.c
> 

...

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(qcom_ecc_config);
> +
> +void qcom_ecc_enable(struct qcom_ecc *ecc)
> +{
> +	ecc->use_ecc = true;
> +}
> +EXPORT_SYMBOL(qcom_ecc_enable);

Drop this and all other exports. Nothing here explains the need for them.

> +
> +void qcom_ecc_disable(struct qcom_ecc *ecc)
> +{
> +	ecc->use_ecc = false;
> +}
> +EXPORT_SYMBOL(qcom_ecc_disable);
> +
> +static const struct of_device_id qpic_ecc_dt_match[] = {
> +	{
> +		.compatible = "qcom,ipq9574-ecc",

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Checkpatch is preerquisite. Don't send patches which have obvious issues
pointed out by checkpatch. It's a waste of reviewers time.

> +	},
> +	{},
> +};
> +
> +static int qpic_ecc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct qpic_ecc *ecc;
> +	u32 max_eccdata_size;
> +
> +	ecc = devm_kzalloc(dev, sizeof(*ecc), GFP_KERNEL);
> +	if (!ecc)
> +		return -ENOMEM;
> +
> +	ecc->caps = of_device_get_match_data(dev);
> +
> +	ecc->dev = dev;
> +	platform_set_drvdata(pdev, ecc);
> +	dev_info(dev, "probed\n");

No, no such messages.



Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
