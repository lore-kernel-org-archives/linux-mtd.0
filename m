Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02913C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8nPaH4OvqHud/r4O2nNv+7Xy1uhv43W/I2gwRDaI00=; b=c15DEzAOUjJXi8
	1RF+pmz6lYNvEnfSiv7J+yXMP8T2WlqJpyaW/V7soqecGX0lF04vADeWWgxfPQisndAVRRywkdI2R
	scLVn/kdksa+0sJcZHkLQk6vfYZKPAXNRc0ayUhbGmH9Z0wO3EYQqvT1s4LULpg8hu8KwK0zLmSCM
	IFd51y2Uncupaxa1AoJOW8zLW1ba0OapXSF+ZfI0CnbCg46gOduDJD2i2UEIf+5LRugfA7pbFC6Fc
	knT/DowumvNWdiCAlgc4/v1qyM/2il5+PXGVoLCDNK5SsMBytcopXCKly8NjZGZHuuIDT+rqsnEUD
	OknXThkDK833c7xL5uMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKeXS-00A0jH-OH; Thu, 17 Feb 2022 11:01:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKeXN-00A0gc-Tu
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 11:01:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id w13so2434843wmi.2
 for <linux-mtd@lists.infradead.org>; Thu, 17 Feb 2022 03:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QXC2GiLyRlkqPnLb5RTTqLhrVnBmNGVL+2tFHU8g1sI=;
 b=CtUdkgz2hg93fo3XUEKwndi79ezxDuyHljn03vTtZrEXhCgOIIegtqY8XTc8yN48Pz
 VIitZ95P+D9FHuit6ONJBVLLpHzqILZ19XOnVFgbJ6+7YT79pOwqRa9kC/iF6+ojhuJG
 /Wy8nrw/nYjUKUvr9oPVWdBiTv7hU4M1FtcUBxP/+PGJMZSVwcV1lJKebYNCLhzj2fdG
 axNpEkmz1RwlxzA9YIP2NhHZk2+GnIMVr1Q9VqaNlo9Q/83IwuOAx1eE3cuvULYt69Y6
 cz2SrSfdpbDaGYENK6PHTFxc+dz5dipVW3urJ4tvt8/q14yQYLlUfrnpWZDTq6B+Y6ZY
 bBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QXC2GiLyRlkqPnLb5RTTqLhrVnBmNGVL+2tFHU8g1sI=;
 b=cCibCWx2QhzzGpF0Fm1z216HFo2VO/I2pB64IeViJcKTVQkT0JO4/JThsgEjxZm5QA
 JmbmNOFoc9kQRKJdZleKxtsdVfrymY+sgz3vOKPJj3tx+Y9VSbSbClTnQtg9w591eTv6
 /HJOuB1qPr8/6OXSqUxlbPukDPWqQVuoDPfXx7tqhaCCCrdi/nKScD/2++7+trLalQie
 H0pWy/2e0G9huRiomTm1EBNkMUHx2dQSMa3b+ZgxlKWb9H4OjtDPRjAwMN1XsB5RYA10
 d13WhPlOxYVzoNUFXl0wfhHf0u9m+84uIuT+vpA+7xWHfIp2wYn/u2E7s8LjCKwkzXov
 LD1g==
X-Gm-Message-State: AOAM5320wbihXGIxVfLHfEzc/Nw1ohwMcoSfJqVsLhqPqjQwGQ7VYavA
 Y1K+nfbVCAEd/ttDtadS+rp/Xg==
X-Google-Smtp-Source: ABdhPJwo6VBJNlSl7oeCrwIVAZva1FiIsBkDn9KyEqH3zZAZH3PrJSWbG1QTWYEUSOT0J0m0fv0Hng==
X-Received: by 2002:a05:600c:224a:b0:37b:b620:77cf with SMTP id
 a10-20020a05600c224a00b0037bb62077cfmr5546414wmm.5.1645095683659; 
 Thu, 17 Feb 2022 03:01:23 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id m22sm968413wmq.35.2022.02.17.03.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 03:01:23 -0800 (PST)
Message-ID: <1bd281d8-a576-26dc-79c3-b1a72a4a9691@linaro.org>
Date: Thu, 17 Feb 2022 11:01:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/4] nvmem: core: Fix a conflict between MTD and NVMEM
 on wp-gpios property
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 chenshumin86@sina.com
References: <20220131095755.8981-1-christophe.kerello@foss.st.com>
 <20220131095755.8981-4-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220131095755.8981-4-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_030126_004629_E70F347E 
X-CRM114-Status: GOOD (  28.78  )
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



On 31/01/2022 09:57, Christophe Kerello wrote:
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
> named skip_wp_gpio. In case skip_wp_gpio is set, the GPIO resource will
> be managed by the provider.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> Changes in v2:
>   - rework the proposal done to fix a conflict between MTD and NVMEM on
>     wp-gpios property.
> 
>   drivers/nvmem/core.c           | 2 +-
>   include/linux/nvmem-provider.h | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 23a38dcf0fc4..cb40dca6a51d 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -771,7 +771,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   
>   	if (config->wp_gpio)
>   		nvmem->wp_gpio = config->wp_gpio;
> -	else
> +	else if (!config->skip_wp_gpio)
>   		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
>   						    GPIOD_OUT_HIGH);
>   	if (IS_ERR(nvmem->wp_gpio)) {
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 98efb7b5660d..4b480023c265 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -70,7 +70,8 @@ struct nvmem_keepout {
>    * @word_size:	Minimum read/write access granularity.
>    * @stride:	Minimum read/write access stride.
>    * @priv:	User context passed to read/write callbacks.
> - * @wp-gpio:   Write protect pin
> + * @wp-gpio:	Write protect pin
> + * @skip_wp_gpio: Write Protect pin is managed by the provider.

Can we rename this to ingore_wp as suggested by Miquel.

--srini

>    *
>    * Note: A default "nvmem<id>" name will be assigned to the device if
>    * no name is specified in its configuration. In such case "<id>" is
> @@ -92,6 +93,7 @@ struct nvmem_config {
>   	enum nvmem_type		type;
>   	bool			read_only;
>   	bool			root_only;
> +	bool			skip_wp_gpio;
>   	struct device_node	*of_node;
>   	bool			no_of_node;
>   	nvmem_reg_read_t	reg_read;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
