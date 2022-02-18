Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F53C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKSXiyqAHl0BR0OVK1AACBECcKBDf9JzVWAEr7B8qx0=; b=iDu05mnN6ndfgi
	vt+N3E5msyQJH/+uc2rRuB0D7vFyi47Ckq3waJEZW81+sKojiR4WsY4Wa3O4xsdTw7YLa8uHBlzwW
	bE2JWa6nt4FchJtESBx+f6Ha2xoLbbXbVHerGPH0wqH3nZ8ITWythDb2RMhU56qfuSQaFXLRJqrfw
	WEbdimujRDS43wwBHg4g/BLgYg6osFiszPuzB7gJMWRNAxF2qvDFFe8/UwXXXPGgT1bElSQbRqoX5
	o7uSowRN2ugGbQECDYuv2/iUcVTvLrqP/iEVcKHQxLBuy1VBs1K4RC73swSnPDZm1WrEnOY4TQMDe
	muE30Z9qUGHbjgU1fqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzqX-00DfCO-80; Fri, 18 Feb 2022 09:46:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzqG-00Df65-Fa
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 09:46:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id f3so13401137wrh.7
 for <linux-mtd@lists.infradead.org>; Fri, 18 Feb 2022 01:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TNPs3XUIKSJGHFJT31aKb5KrR4RIhs82BSGaW6p5+r8=;
 b=aMnVyUqa2iZNrnxcPBcAiBODjipAWB0m4PbyPEvAMm+dWL6d9x5uyTW2u76utu6bLk
 Ac0vPLp8pDxRVjmI1e+T8dQ6LmVsJSOnsSXvLXWVcz8kbZr+eNbQfdQ0dfzNcQWp7N/k
 mN9n/YgIb4eu+SY76EihV15a2Qm7HwADUzWPQ9cwJ/Bj8dAxBq0hbFCl66YLxWOOG+jj
 D3NLR5KJ4hYzhc//UhA0kqw8PSzm4TBFJVe5iqhk+d/t8L5l4nJqxEcb/ZG+W9uU13jI
 oUKolYaAoX4iTb1eCrmV1sAhc3KMqKNauyUiNbVxufjW2XOKe1cL8xOlMKEUrvZdCUcC
 7uLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TNPs3XUIKSJGHFJT31aKb5KrR4RIhs82BSGaW6p5+r8=;
 b=Cx9TLgv6tT7dQJxeipybByeOFu0sH9PrOmIBs9+wgf25/EJKVu3X6P1nxrc7mUsJpa
 /TEykr4e80IJT2i7sRbExI3Dm1p2qpr+7cDwQDrLeQL4quvtj0zpMBgG9zpUBVex9F1X
 Yzmt0606Fbs+y+AySPVVcNNZ8sA8EavJQJzsitxa8myj4c0eQW3i9gA15Mc2+4xqc42h
 X1k6afG7n0RW7s/hZJmKoXqCRQzeDhXchUmkAa8gi0UN/3BJPOb6un2+MuouGiK3bmD7
 etc89Oa3VU8Opn8z/fzSt5QaD57kXoIPt1yLydL2VDFWhPP/Wb5Y5JK0bsjYRouItntq
 MLVw==
X-Gm-Message-State: AOAM532tLnZ7EyZ81DmAuQVRZMuiPqtLrNXdWMUi1X2iQrpQLmuP2ILm
 PuUB4MlDF9WTsu+DqlMYorg31Q==
X-Google-Smtp-Source: ABdhPJz+D9bmvjgoT8qq45YSNK+QUrJSJSkPVo+OcczsyGu5pCnQnNkzQok/8IEwR4pVbDWeRIo2Og==
X-Received: by 2002:a5d:42ca:0:b0:1e6:2bf3:5c17 with SMTP id
 t10-20020a5d42ca000000b001e62bf35c17mr5254344wrr.621.1645177577821; 
 Fri, 18 Feb 2022 01:46:17 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id g22sm3649606wmh.12.2022.02.18.01.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:46:17 -0800 (PST)
Message-ID: <f44ae992-5408-6f4c-2d03-6c0c64336fb1@linaro.org>
Date: Fri, 18 Feb 2022 09:46:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/4] mtd: core: Fix a conflict between MTD and NVMEM on
 wp-gpios property
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, p.yadav@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 chenshumin86@sina.com, stable@vger.kernel.org
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
 <20220217144755.270679-5-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220217144755.270679-5-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_014620_590636_920CEE87 
X-CRM114-Status: GOOD (  23.21  )
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

Hi Miquel,


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
> A new Boolean flag named ignore_wp has been added in nvmem_config.
> In case ignore_wp is set, it means that the GPIO is handled by the
> provider. Lets set this flag in MTD layer to avoid the conflict on
> wp_gpios property.
> 
> Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: stable@vger.kernel.org
> ---


There seems to be already an mtd core patch [1] that is planned to go 
via nvmem tree, do you want me to take 3/4 and 4/4 via nvmem tree as well?
Or
you can pick up both the series via mtd tree?

Am okay either way.



[1] 
https://patchwork.kernel.org/project/linux-usb/patch/20220104133843.44272-4-andriy.shevchenko@linux.intel.com/

--srini


> Changes in v3:
>   - add a fixes tag
>   - rename skip_wp_gpio by ignore_wp in nvmen_config.
> 
>   drivers/mtd/mtdcore.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 70f492dce158..eef87b28d6c8 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -546,6 +546,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>   	config.stride = 1;
>   	config.read_only = true;
>   	config.root_only = true;
> +	config.ignore_wp = true;
>   	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
>   	config.priv = mtd;
>   
> @@ -833,6 +834,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
>   	config.owner = THIS_MODULE;
>   	config.type = NVMEM_TYPE_OTP;
>   	config.root_only = true;
> +	config.ignore_wp = true;
>   	config.reg_read = reg_read;
>   	config.size = size;
>   	config.of_node = np;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
