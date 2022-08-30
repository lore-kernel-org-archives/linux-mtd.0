Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CF7ECAAD4
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TeusTzI7KX/+iFMs+sn9KMTFSFoupwzMUgU2ZlqAF8Q=; b=ETGWhwcvYrHelc
	rnDCh3auwPQvzE+tm7CAelyFH5f/Ua4ZkJMn3MIF5qgT8aPXmxcBkJj/a1zwqHz1Onnm2TOjcCl0M
	FbbKC9TAuODPAt4vM3IOQiKqEct29CHGUlMxge+9l56zBPHpNUr/o+wRMtf/0BAkutBDC2dkblTOy
	ZTAVGEAbXqdBj03O8/Svle8a+8vhL1sFdCOtZ5p5NXXkzabbHVvEj32UOyyNpzSy2XZ9c9xtKyTdv
	YmSMexUB3lT2tWoFLM/xyGeWUHaedzpF4fapd6tgsCVnMdvpZ5g82T0uuU+mLw2/AYTPHBy7lE8zj
	wNUtXn2Y9ah4XN36j+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT1Qk-00HOfk-6q; Tue, 30 Aug 2022 13:37:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT1QX-00HOZ9-FJ
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 13:37:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id k9so14307776wri.0
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+q3Kcm7Z8JcF1d1hb0GI/ucgVEvk8yb2HItfmD3paZk=;
        b=NU3/EStJBPHlk7kN6uEG1oz84H5Jcs+QKIu8/T+eB/3agx+f6pCskn8M4SDPWD7Dyq
         q66EgziiJZ3EdGRB2x0QZF0ph1SxDX7zaqKnqMJne5GdZfQ4wBqEajYGSoos5VbOVBL3
         8il6dedrXJzyFPi4QcVDTsG96O8uo174kTXjtGUbnrtRF6npeLqqL8JPIoB41MzzFX86
         xwa2w1kVBYdgy8SaK2jnXy+8VdVV5uCkJRk0kIfKeg7t9DnQSmkodAUSrrGpw4wNr9o5
         g2nYirYCEjT0UMph0lOxsMILoLFsaOaHCdso/wavDP/Dk2L1u3o8MI6nKX4MW4cQi+R6
         sG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+q3Kcm7Z8JcF1d1hb0GI/ucgVEvk8yb2HItfmD3paZk=;
        b=TFzwtQTZ+/VWHSUc5rB4bWVZBbPHBlyXy+8ccr5OTrKxxZQuNxS6o7k12Vr6ZuTDKH
         Kbe9Zcq6fcIIDBBEhVV3PiLGGGF2yFAdWxBL/8gvgDbdpdDdBR/AyDjAkQzLQVavl20c
         sVGtqQczGEZBMI35dG/p/fYeV/gjSUGvhuCCefOD5jJOreBmQonsAk4wb4JXtOqUi3Xg
         vf3SENgHmqtTtIfcA+zjJIVDEssNig5bm4mBAY9btJCGeNiJiWv1aZjXOjZM/+wWe8cT
         /Wow+oTwbGbTQ4xKb6X+NBJ7ryzECYM0BMixZUO3fdMlIW/d8tYhfzrm1EcPjj6Y7a4W
         P77w==
X-Gm-Message-State: ACgBeo0qqQcELbP+RZvDRQA+qZeK/VOIcQ7mD2Dp5xRNRvOYnCrTpqNW
	kC40xbvy+d5ipP3kUkJJ7jHLkw==
X-Google-Smtp-Source: AA6agR7lWkpWZIi5bIEym5Qu4vx/h9f4HQXzOy/VgIM2LgtlZz93g9irL0WAuwvzH65xnDqgHu1sfw==
X-Received: by 2002:a5d:69c5:0:b0:226:e04f:eb2c with SMTP id s5-20020a5d69c5000000b00226e04feb2cmr2813035wrw.523.1661866626547;
        Tue, 30 Aug 2022 06:37:06 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id b17-20020adfde11000000b0021eaf4138aesm11283959wrm.108.2022.08.30.06.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 06:37:05 -0700 (PDT)
Message-ID: <ddae21bf-a51b-7266-60ba-8a10c293888a@linaro.org>
Date: Tue, 30 Aug 2022 14:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 07/14] nvmem: core: add per-cell post processing
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-8-michael@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220825214423.903672-8-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_063713_575943_AAA0473E 
X-CRM114-Status: GOOD (  26.13  )
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



On 25/08/2022 22:44, Michael Walle wrote:
> Instead of relying on the name the consumer is using for the cell, like
> it is done for the nvmem .cell_post_process configuration parameter,
> provide a per-cell post processing hook. This can then be populated by
> the NVMEM provider (or the NVMEM layout) when adding the cell.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>   drivers/nvmem/core.c           | 16 ++++++++++++++++
>   include/linux/nvmem-consumer.h |  5 +++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 5357fc378700..cbfbe6264e6c 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -52,6 +52,7 @@ struct nvmem_cell_entry {
>   	int			bytes;
>   	int			bit_offset;
>   	int			nbits;
> +	nvmem_cell_post_process_t post_process;


two post_processing callbacks for cells is confusing tbh, we could 
totally move to use of cell->post_process.

one idea is to point cell->post_process to nvmem->cell_post_process 
during cell creation time which should clean this up a bit.

Other option is to move to using layouts for every thing.

prefixing post_process with read should also make it explicit that this 
callback is very specific to reads only.


>   	struct device_node	*np;
>   	struct nvmem_device	*nvmem;
>   	struct list_head	node;
> @@ -468,6 +469,7 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
>   	cell->offset = info->offset;
>   	cell->bytes = info->bytes;
>   	cell->name = info->name;
> +	cell->post_process = info->post_process;
>   
>   	cell->bit_offset = info->bit_offset;
>   	cell->nbits = info->nbits;
> @@ -1500,6 +1502,13 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
>   	if (cell->bit_offset || cell->nbits)
>   		nvmem_shift_read_buffer_in_place(cell, buf);
>   
> +	if (cell->post_process) {
> +		rc = cell->post_process(nvmem->priv, id, index,
> +					cell->offset, buf, cell->bytes);
> +		if (rc)
> +			return rc;
> +	}
> +
>   	if (nvmem->cell_post_process) {
>   		rc = nvmem->cell_post_process(nvmem->priv, id, index,
>   					      cell->offset, buf, cell->bytes);
> @@ -1608,6 +1617,13 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
>   	    (cell->bit_offset == 0 && len != cell->bytes))
>   		return -EINVAL;
>   
> +	/*
> +	 * Any cells which have a post_process hook are read-only because we
> +	 * cannot reverse the operation and it might affect other cells, too.
> +	 */
> +	if (cell->post_process)
> +		return -EINVAL;

Post process was always implicitly for reads only, this check should 
also tie the loose ends of cell_post_processing callback.


--srini
> +
>   	if (cell->bit_offset || cell->nbits) {
>   		buf = nvmem_cell_prepare_write_buffer(cell, buf, len);
>   		if (IS_ERR(buf))
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 980f9c9ac0bc..761b8ef78adc 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
> @@ -19,6 +19,10 @@ struct device_node;
>   struct nvmem_cell;
>   struct nvmem_device;
>   
> +/* duplicated from nvmem-provider.h */
> +typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
> +					 unsigned int offset, void *buf, size_t bytes);
> +
>   struct nvmem_cell_info {
>   	const char		*name;
>   	unsigned int		offset;
> @@ -26,6 +30,7 @@ struct nvmem_cell_info {
>   	unsigned int		bit_offset;
>   	unsigned int		nbits;
>   	struct device_node	*np;
> +	nvmem_cell_post_process_t post_process;
>   };
>   
>   /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
