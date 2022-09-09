Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F80ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0VOwfCkKwwIq7aKd0LgmWIiYhtw4QcyZjCsjl0puDE=; b=Zq/bLfGg4Qp+Fy
	dZuPJrvMlU+7WZ5LzJD3x6Y17rMyHqUT+9qjm9344rkOp1jwyot4GP9Ou0NjRCB0YN+POWwcokgYQ
	PjttK8j3qNN2HVKds8nHN5PPWVN9d41Khvm2nVfep5Lqs5u20GChMqRLoQMf2Mdjj/yWcGD23Gama
	LXgdgntzKbxXppyaAQwu/MPS5zlhAMoGW/YWYOtDujPk/tKYv/o7V7rVRNqJrOyU/SJ1C4vyQfAae
	yvESxKnDTy5Cy/p3GnZeCmDL63myqvChbGjHcP57KBmiok2KgJeI+A/skh8mWqxLaDgRq6tpljFju
	BsR8UPlD2aT9JWLPuoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZkL-00EmQt-7b; Fri, 09 Sep 2022 08:52:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZkI-00EmPw-Fz
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2022 08:52:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id c2-20020a1c3502000000b003b2973dafb7so3957254wma.2
        for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2022 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xUYfPwKfjWj8UMEg1ZOqkwBhAmHe0cmPeP+wDEVrkOQ=;
        b=TubYt+GybM3R6FXjLZ/HMzhZe/TPRKvDFmW4wnSeSjkjwv7l4KlvYzC5QXADNJrGvd
         JOaD0zwqo1+n1dO/0X9WCrJ7DwiGCZ7yCZGN06+ztXv9HvKgMtS19rT43Y5/dXIu5bXS
         eYqIliMmVz+St0Navdlh2leuJlnzrJG4A5smh9Mf/cH8z2wJxaSKk+s9q/9dMTSgz3eM
         ch5re4PO6rxPqhP8acOlfiWaCVtgnEGZqqLvRPb+VjfyOC5uKlYUq9zOq9fx+tE6VNE9
         sc58LAPXfMnjboti2FKUJnFRul2unn2US5QO1sBHb80J369YvubNxnXsut6Tq0lcidTu
         S7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xUYfPwKfjWj8UMEg1ZOqkwBhAmHe0cmPeP+wDEVrkOQ=;
        b=IAzmJ7dvqtuMceBf4W571tGrWrUox48RWF8z7Z9yIhq2Zsc5n/4u4FsvJE2cHZRk36
         cTn7+TM2SeIkldWs8yYhgmXdyU5v/K/EVmJqnmdHcVI0d304+Gc/4aQJzqeDO/9MWMYk
         yg3n2MJ6k8GlutAAYpsBbQN8PUMIpZ0+TJaOBv2PwsV4XQnRAtiM1kjgmTV19awFOchf
         gKOHp9L9a+UpSrYuksOfbbGRQu46Rq6SVXOQa50ApI5Rxi2JGGp6x0xOrGpI8fA3Z8Kc
         /BasGvrzHBbClO3kTBxHwk6LbMbk1iyxDLrjXHPac4igrwaCVUILNsSI4tA9WKdnI0vM
         tEZA==
X-Gm-Message-State: ACgBeo1pWrV0wSatqC5qyLnXIptbT3gvN8NIX+mK+Bnvs6H5JYvdrrs9
	O6cKtwB2LVaiAo/MU4H/MFUyBg==
X-Google-Smtp-Source: AA6agR6YJCB2REeMJ4VtYkJNS0dCNv+3+WdATOvoAFtL5QD6iWSIVlpuGC2hE4dJ8XV2FmJqUy44nw==
X-Received: by 2002:a05:600c:2059:b0:3a5:92cc:19c5 with SMTP id p25-20020a05600c205900b003a592cc19c5mr4469580wmg.101.1662713534861;
        Fri, 09 Sep 2022 01:52:14 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id bg35-20020a05600c3ca300b003a5c1e916c8sm1012461wmb.1.2022.09.09.01.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:52:13 -0700 (PDT)
Message-ID: <bee9db9d-fc1b-41d8-5714-1c7f48bb0722@linaro.org>
Date: Fri, 9 Sep 2022 09:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 06/20] nvmem: core: add nvmem_add_one_cell()
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
 <20220901221857.2600340-7-michael@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220901221857.2600340-7-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_015218_569989_E7404C30 
X-CRM114-Status: GOOD (  27.03  )
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
> Add a new function to add exactly one cell. This will be used by the
> nvmem layout drivers to add custom cells. In contrast to the
> nvmem_add_cells(), this has the advantage that we don't have to assemble
> a list of cells on runtime.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v1:
>   - none
> 
>   drivers/nvmem/core.c           | 58 ++++++++++++++++++++--------------
>   include/linux/nvmem-provider.h |  8 +++++
>   2 files changed, 42 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index be38e62fd190..3dfd149374a8 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -501,6 +501,35 @@ static int nvmem_cell_info_to_nvmem_cell_entry(struct nvmem_device *nvmem,
>   	return 0;
>   }
>   
> +/**
> + * nvmem_add_one_cell() - Add one cell information to an nvmem device
> + *
> + * @nvmem: nvmem device to add cells to.
> + * @info: nvmem cell info to add to the device
> + *
> + * Return: 0 or negative error code on failure.
> + */
> +int nvmem_add_one_cell(struct nvmem_device *nvmem,
> +		       const struct nvmem_cell_info *info)
> +{
> +	struct nvmem_cell_entry *cell;
> +	int rval;
> +
> +	cell = kzalloc(sizeof(*cell), GFP_KERNEL);
> +	if (!cell)
> +		return -ENOMEM;
> +
> +	rval = nvmem_cell_info_to_nvmem_cell_entry(nvmem, info, cell);
> +	if (rval) {
> +		kfree(cell);
> +		return rval;
> +	}
> +
> +	nvmem_cell_entry_add(cell);
> +
> +	return 0;
> +}
> +

EXPORT_SYMBOL_GPL ???

>   /**
>    * nvmem_add_cells() - Add cell information to an nvmem device
>    *
> @@ -514,34 +543,15 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
>   		    const struct nvmem_cell_info *info,
>   		    int ncells)
>   {
> -	struct nvmem_cell_entry **cells;
> -	int i, rval = 0;
> -
> -	cells = kcalloc(ncells, sizeof(*cells), GFP_KERNEL);
> -	if (!cells)
> -		return -ENOMEM;
> +	int i, rval;
>   
>   	for (i = 0; i < ncells; i++) {
> -		cells[i] = kzalloc(sizeof(**cells), GFP_KERNEL);
> -		if (!cells[i]) {
> -			rval = -ENOMEM;
> -			goto out;
> -		}
> -
> -		rval = nvmem_cell_info_to_nvmem_cell_entry(nvmem, &info[i], cells[i]);
> -		if (rval) {
> -			kfree(cells[i]);
> -			goto out;
> -		}
> -
> -		nvmem_cell_entry_add(cells[i]);
> +		rval = nvmem_add_one_cell(nvmem, &info[i]);
> +		if (rval)
> +			return rval;
>   	}
>   
> -out:
> -	/* remove tmp array */
> -	kfree(cells);
> -
> -	return rval;
> +	return 0;
>   }
>   
>   /**
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 14a32a1bc249..385d29168008 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -155,6 +155,9 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
>   void nvmem_add_cell_table(struct nvmem_cell_table *table);
>   void nvmem_del_cell_table(struct nvmem_cell_table *table);
>   
> +int nvmem_add_one_cell(struct nvmem_device *nvmem,
> +		       const struct nvmem_cell_info *info);
> +
>   #else
>   
>   static inline struct nvmem_device *nvmem_register(const struct nvmem_config *c)
> @@ -172,6 +175,11 @@ devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
>   
>   static inline void nvmem_add_cell_table(struct nvmem_cell_table *table) {}
>   static inline void nvmem_del_cell_table(struct nvmem_cell_table *table) {}
> +static inline int nvmem_add_one_cell(struct nvmem_device *nvmem,
> +				     const struct nvmem_cell_info *info)
> +{
> +	return -EOPNOTSUPP;
> +}
>   
>   #endif /* CONFIG_NVMEM */
>   #endif  /* ifndef _LINUX_NVMEM_PROVIDER_H */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
