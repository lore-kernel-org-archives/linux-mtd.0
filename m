Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65744C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUvc56rcsDm7zaQ/wmpKeNMvOD5XmIEVLvkEJeyCZbs=; b=RcgjfKzE2acKwB
	C6dqVsRoBHdJ3hrqNIqyVmf8/06tj/0fsowB3zDfNkQ/xNUkrfX6BCqF4VSZTUo2yS5z286WSxuRE
	AhViTdhZpLkFXA8ZKIG/iG4T5frBpTsAlSRIQ2lUDwwnVHsxkCCVcsh9tXwTFv/1bQd3AIKvr+wsk
	WeCa2Fyc9EPstLySwZiwSIKIEW1PVVBPUqGhDa/3fTirrO9D25ZNtT2fRqyf5ADZHDgvxL1gYDWx1
	la8FY6SQzLNJjsoBJjAbRgocTrMX2m0ZaDr3ezrCM4e2amtiwN2JS3qBI39Q4RRlaKq0p9n/cj2Uw
	qDDUPMTUu7iqIQ2n6/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3Xk-00EfxV-GO; Fri, 18 Feb 2022 13:43:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3Fh-00EY80-OI
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 13:24:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u2so13444878wrw.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Feb 2022 05:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ujmj8PwbJSvu47uw+CyCbxAA/eAxR/7pr/uKWTwQSVI=;
 b=d/5iEdmNQi1OPG/+LIV6gWpQUkUjCSHGIgH1D0FcX7ZyEgs8jS7MoQa4IJgJ2B6eqL
 FM4kzf/QUxUrCwUX2eIFNVmfzlNT63GrIWDj9FwpDaARAILH0RZ1/01qjCG0zSPh3dMJ
 HwvWOd6S8DF2OOneBoSwvAs0UzTJqknCOwwyfC3Om1DfojnRR+YPwbLY4hRuChuD+GNI
 TFnxA8s6wH7tGfns7Ivf21N8LvzoaL1LzjpjnDvBoGnfvN4KW+wm2FHcmLsKNwNcGnrB
 rOOOIDwBR598nXeua7jBinj0xTnuNLzO/uTX1BAaIh+fIw844Mqko7SZF1pi/5Zii1xs
 S8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ujmj8PwbJSvu47uw+CyCbxAA/eAxR/7pr/uKWTwQSVI=;
 b=5AXTru5FrCCDUWv14nEWK0rNM42iHr2hygpBEZsMoVdvzHwOPS09m37kjPMX5Zt0Qf
 aqt+kVqfh7g2pRuC5HsbZ1zHUlVanEaly3Kc2X8WaZw0pvJWeVhLwZhhwQxMnXLoPmuK
 1AvvelPnXpntn3wxkDimKiaIfsm0aTEIEVbF1+ol/kCwsk4fCDxzcCkWQ6x8PbZqcp+d
 ovEBrt8rIrPlVr2Jx9WGqyGq+kNZsqpZRLyZ2Ghy7zRvitVrm5OBwwRKYBtIE3kwc02m
 pCbCCDpiyIH+Z9UNdqhB0q0Lpc/LSuKZbSdbhe4uzvQaeDZLo5+5qxr7U3Lkh9N7hZ1h
 2k2Q==
X-Gm-Message-State: AOAM5334ghDEndSZXJgbjULepEKIY64UlUfLZOlUUwXGU8Tttfx5Y9ae
 kdYB2AFmqef1trtcJSUCmKbFC5gLJ4lZdA==
X-Google-Smtp-Source: ABdhPJy2nDo7yTxFYdHgagsn3pqhYbisII2MeTUOZhN6jb5RjapXtp3DM5vozRRBVGB3r4CtEsesrg==
X-Received: by 2002:a05:6000:1e04:b0:1e4:9b64:8cab with SMTP id
 bj4-20020a0560001e0400b001e49b648cabmr6038845wrb.608.1645190687489; 
 Fri, 18 Feb 2022 05:24:47 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id x18sm41464215wrw.17.2022.02.18.05.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 05:24:46 -0800 (PST)
Message-ID: <6f3ff8f3-82fb-1bb1-d854-bb48f1ea9b1d@linaro.org>
Date: Fri, 18 Feb 2022 13:24:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/4] nvmem: core: Fix a conflict between MTD and NVMEM
 on wp-gpios property
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, p.yadav@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 chenshumin86@sina.com, stable@vger.kernel.org
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
 <20220217144755.270679-4-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220217144755.270679-4-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_052449_910508_E83D8CF8 
X-CRM114-Status: GOOD (  29.33  )
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



On 17/02/2022 14:47, Christophe Kerello wrote:
> Wp-gpios property can be used on NVMEM nodes and the same property can
> be also used on MTD NAND nodes. In case of the wp-gpios property is
> defined at NAND level node, the GPIO management is done at NAND driver
> level. Write protect is disabled when the driver is probed or resumed
> and is enabled when the driver is released or suspended.
> 
> When no partitions are defined in the NAND DT node, then the NAND DT node
> will be passed to NVMEM framework. If wp-gpios property is defined in
> this node, the GPIO resource is taken twice and the NAND controller
> driver fails to probe.
> 
> It would be possible to set config->wp_gpio at MTD level before calling
> nvmem_register function but NVMEM framework will toggle this GPIO on
> each write when this GPIO should only be controlled at NAND level driver
> to ensure that the Write Protect has not been enabled.
> 
> A way to fix this conflict is to add a new boolean flag in nvmem_config
> named ignore_wp. In case ignore_wp is set, the GPIO resource will
> be managed by the provider.
> 
> Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: stable@vger.kernel.org
> ---
> Changes in v3:
>   - add a fixes tag.
>   - rename skip_wp_gpio by ignore_wp in nvmen_config.

Applied thanks,

--srini
> 
> Changes in v2:
>   - rework the proposal done to fix a conflict between MTD and NVMEM on
>     wp-gpios property.
> 
>   drivers/nvmem/core.c           | 2 +-
>   include/linux/nvmem-provider.h | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 23a38dcf0fc4..9fd1602b539d 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -771,7 +771,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   
>   	if (config->wp_gpio)
>   		nvmem->wp_gpio = config->wp_gpio;
> -	else
> +	else if (!config->ignore_wp)
>   		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
>   						    GPIOD_OUT_HIGH);
>   	if (IS_ERR(nvmem->wp_gpio)) {
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 98efb7b5660d..c9a3ac9efeaa 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -70,7 +70,8 @@ struct nvmem_keepout {
>    * @word_size:	Minimum read/write access granularity.
>    * @stride:	Minimum read/write access stride.
>    * @priv:	User context passed to read/write callbacks.
> - * @wp-gpio:   Write protect pin
> + * @wp-gpio:	Write protect pin
> + * @ignore_wp:  Write Protect pin is managed by the provider.
>    *
>    * Note: A default "nvmem<id>" name will be assigned to the device if
>    * no name is specified in its configuration. In such case "<id>" is
> @@ -92,6 +93,7 @@ struct nvmem_config {
>   	enum nvmem_type		type;
>   	bool			read_only;
>   	bool			root_only;
> +	bool			ignore_wp;
>   	struct device_node	*of_node;
>   	bool			no_of_node;
>   	nvmem_reg_read_t	reg_read;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
