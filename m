Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FA0C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:36:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9AC761969
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9AC761969
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uakFe2jFNK2W780R71eJyJ7PGgKaKcm63oU2UkW3JSk=; b=QYGxKgJUdHMpMv0YqfG2lse/c
	RF9SjBKDaEHyLCn1FWxcCdKuIgSfiEAisNuhm9Z8ufz8lTycT9b/Hpo37tj2cl4/PXp7PuXbgjaxa
	+2FJ9sMEOoTYND4Lu0KTpH9geS6W1jCL0ZurfEIHLJXZmy7t0Qg/rDKQkR89pTyetteajnEeawdUv
	M4pmRpDGwRy7BEi7wtSjYsT7qVF1OBCehBatcUJ8eFcEUH+OB1QC/+ihMSnh8V2r1oDoGYeP5lE+P
	v+9lfpKm2TXSq8+sgA5zFIa0H2ZGOTQB/iyzwYDo9RYrW9t3lFWxuoomZEaROKm/yweYGpeEfP9YC
	sCyafSeRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBiZ-003Pn1-B4; Tue, 30 Mar 2021 10:35:27 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBiK-003Pkd-NJ
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 10:35:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id o19so17610683edc.3
 for <linux-mtd@lists.infradead.org>; Tue, 30 Mar 2021 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Y9LMyDk4b0iimwt+wvW5tEwZ7sVo50tBsIS9q6O8BE=;
 b=mZZGYOlELnuyff8io3XcjGwmLOyC17x2BAEPKr7y0IH98IQ+7PnkjC3tLHSYxSNBmb
 SHfyzcEYurFach/EVbZOaP1doU2i0smxrXCJf/HxgvwasQViz5cvsXRkZBNvGu25zEc4
 iZMz4JbXHv7CMhieBG5whgaQ9PdaS7OrISzXThreOaLB/0uoZmmEfMKGcpN++pfUukjW
 nqGAFYNlJPpgXvRsMgRURIZMV2qBv1tTGihVbnU/LBiupbnRUOR/cv3gQB6Syqoh7JlL
 1NxWhxPmM88JeAniqmre6Lhzr+2dZ/ibQP51m9qUiRrkFc724BlwLFrQfNKwXvjMzZFL
 hc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Y9LMyDk4b0iimwt+wvW5tEwZ7sVo50tBsIS9q6O8BE=;
 b=Ipn/+I40sUKRUPv9qWsOAUoJWahqJjfRmFoq9n2i/HEkXfXZbPIDoIgqPcP4cHFDLH
 1qhPHNgrF1srIgm/UCX1K0pVoZDDdDB7ANxIQrCS9SCkF8DVph8vJp5GQNNtAAGdKtFG
 xAnnuj3JdgR7UqvJOni0ctWDe/ROg6jPUrpyEIpMrcNQERPNxeMj08vt0wLXx8uoQGeU
 MIry6gQZ7uTZ8XQRFt53Y+NhNovS1U+LVFeAyj2+dFyBgJmOQn+SmozWIBMrGsQC5iq0
 idOZ7GF//qOibblRfNdSo/tGAycWKf9X4xMDnp3XJrXj+RJgqv99ydR+TYt3Nnxulnlo
 fYUA==
X-Gm-Message-State: AOAM530hN0FdDzA8eHKxjYdmXv86Uvmi3pSrTX4wdfjxaCC8h4JFNdrY
 Ve5IAbgT6TvUq3m7QiVtSskcZA==
X-Google-Smtp-Source: ABdhPJzXribJX90G+5FtWdp57MiNA+X1KsdT7xNJEXdMj5f+GQHExjbyYMmfMNWYg4Y19YzzhQvKyA==
X-Received: by 2002:a05:6402:13ca:: with SMTP id
 a10mr32840223edx.320.1617100512170; 
 Tue, 30 Mar 2021 03:35:12 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u24sm10775642edt.85.2021.03.30.03.35.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:35:11 -0700 (PDT)
Subject: Re: [RFC PATCH 1/4] nvmem: core: allow specifying of_node
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20210322181949.2805-1-michael@walle.cc>
 <20210322181949.2805-2-michael@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <835a8124-0a22-e885-0bd4-c7493520558e@linaro.org>
Date: Tue, 30 Mar 2021 11:35:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210322181949.2805-2-michael@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_113513_482046_B4C5765F 
X-CRM114-Status: GOOD (  26.05  )
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



On 22/03/2021 18:19, Michael Walle wrote:
> Until now, the of_node of the parent device is used. Some devices
> provide more than just the nvmem provider. To avoid name space clashes,
> add a way to allow specifying the nvmem cells in subnodes. Consider the
> following example:
> 
>      flash@0 {
>          compatible = "jedec,spi-nor";
> 
>          partitions {
>              compatible = "fixed-partitions";
>              #address-cells = <1>;
>              #size-cells = <1>;
> 
>              partition@0 {
>                  reg = <0x000000 0x010000>;
>              };
>          };
> 
>          otp {
>              compatible = "mtd-user-otp";

I would have expected this to come up as a proper device, but am not 
100% sure how MTD handles flashes and its partitions.

>              #address-cells = <1>;
>              #size-cells = <1>;
> 
>              serial-number@0 {
>                  reg = <0x0 0x8>;
>              };
>          };
>      };
> 
> There the nvmem provider might be the MTD partition or the OTP region of
> the flash.
> 
> Add a new config->of_node parameter, which if set, will be used instead
> of the parent's of_node.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Patch is fine as it its.
If you plan to take this via mtd tree here is my Ack

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

>   drivers/nvmem/core.c           | 4 +++-
>   include/linux/nvmem-provider.h | 2 ++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index bca671ff4e54..62d363a399d3 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -789,7 +789,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   	nvmem->reg_write = config->reg_write;
>   	nvmem->keepout = config->keepout;
>   	nvmem->nkeepout = config->nkeepout;
> -	if (!config->no_of_node)
> +	if (config->of_node)
> +		nvmem->dev.of_node = config->of_node;
> +	else if (!config->no_of_node)
>   		nvmem->dev.of_node = config->dev->of_node;
>   
>   	switch (config->id) {
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index e162b757b6d5..471cb7b9e896 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -57,6 +57,7 @@ struct nvmem_keepout {
>    * @type:	Type of the nvmem storage
>    * @read_only:	Device is read-only.
>    * @root_only:	Device is accessibly to root only.
> + * @of_node:	If given, this will be used instead of the parent's of_node.
>    * @no_of_node:	Device should not use the parent's of_node even if it's !NULL.
>    * @reg_read:	Callback to read data.
>    * @reg_write:	Callback to write data.
> @@ -86,6 +87,7 @@ struct nvmem_config {
>   	enum nvmem_type		type;
>   	bool			read_only;
>   	bool			root_only;
> +	struct device_node	*of_node;
>   	bool			no_of_node;
>   	nvmem_reg_read_t	reg_read;
>   	nvmem_reg_write_t	reg_write;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
