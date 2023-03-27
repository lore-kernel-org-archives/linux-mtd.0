Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBC0C76195
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTN0w/c4oPZ2Kuo1IK7xw2iuOknmZ3G97OcK1QK89s0=; b=yJydj5U4wVBkI3
	o3LZlzt/EW0qw4PZAGKoecc9TohscMvPII4TjBst7S8pvdClYnsB7uDTlnGGEPmziS1V/ILxE1ETX
	4SVJiwtahg7T3tXBdju5htRb0sIIMzcocLQ/PqJwzbyHsFIrYHCUHAmEkKVgUZA9QjlWF0qSFWOfE
	Sh/QZpD22a2gk8h9iREfT7zwtQ19QXlf3DH6hN0W3Ms/mksarKUqPQKKWYWS73s37PuDRlHkeF64/
	bMvmAYGyv7jkgVrQoie6UQyVBPKPZLr+zaKKji5NFtHn9LRmRNdUuuX13Jgh1BYCKp3zpwK9egvPY
	R5LiH8nwIhkdbIae2MGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgk7t-00Ae8t-15;
	Mon, 27 Mar 2023 10:30:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgk7q-00Ae8B-23
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 10:30:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so4863998wms.2
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 03:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679913053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RY27zgzeo2/+h7DIhGEkGBVdjkuFT2cSOB/27xypFIc=;
        b=fOdVH/hECAL4wFQubNSlYN4PDodltQkSGcxz4dq3C03YK+0Q/KwtULN/xziMXHv8sV
         0WrkaSAK8pMYCCmuzuNYn9wrFD7IpDMasZv9ZkJ7digaa135se1/Yn1VOe7g664CKkQp
         F9tkTOn6PzWrO6irJvcr0B6MzgyMWHcfMXp0jQ+hb3XpH4i+q8WE6Mhk7yd9gLfSpbSb
         80wGKdjIgifl9Iy0aP35pLBhnEqdknWEaRiv0UKl1aPqVCPg0/TDgS4+hd5+EmfSg9SK
         0lYUZb9v8WjCebZmstIJXTB3Tm99at/jNl6SYZLieRU7MlIf3P0/rrYmBNZgV57FAZIT
         SKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679913053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RY27zgzeo2/+h7DIhGEkGBVdjkuFT2cSOB/27xypFIc=;
        b=NHVL3m5nGlmrV/saDOp77wXmZW6IarNsQRyBKcK1etI/RupfnaYY8HwFJSP8Guatax
         64g5JJ8avymuhEQkYQhmDeN0M3/G4X6yejiHXQKRCXeXylN7X/ICv2gsJws8ns64EfBS
         ZQ0iwRbWBDyBarec2CHsv3Dr9EaxzHXdhXHqrpRGYGgd5u9vWOKMZtuIvHXKKW4bYoAL
         d3SeQi8qFkSOQyTKduePmXqvl0EluVfRKVNXkEXzklrqItQGGpbrBGoEXfkuevOsfY+V
         ndiQ5P0NddjxR0VADQLuWMJl4B9LTCezl72pfNk5kzxFYzgN7Nwawfp0pObptb48jkB0
         AthQ==
X-Gm-Message-State: AAQBX9fb64/H6QdnYyEf/qsMIVDARuSI7iCw98zcVq6cW4cm44RclAQe
	sTkoASIqvE0/0CW1KlOC3NkzGg==
X-Google-Smtp-Source: AKy350bijtXyfmmTUEm5apbI4I5dJpRvgt+p2sW5YhazHqdvAVc9zhnq0B9uAOBd/By/F49mT6CJZw==
X-Received: by 2002:a7b:cb47:0:b0:3ef:68d5:9573 with SMTP id v7-20020a7bcb47000000b003ef68d59573mr3886507wmj.19.1679913053051;
        Mon, 27 Mar 2023 03:30:53 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id f24-20020a7bc8d8000000b003eb596cbc54sm13362684wml.0.2023.03.27.03.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:30:52 -0700 (PDT)
Message-ID: <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
Date: Mon, 27 Mar 2023 11:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use timings.mode instead
 of checking tRC_min
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-3-christophe.kerello@foss.st.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230327094742.38856-3-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_033054_673799_9C21F548 
X-CRM114-Status: GOOD (  15.76  )
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



On 3/27/23 10:47, Christophe Kerello wrote:
> This patch is using timings.mode value instead of checking tRC_min timing
> for EDO mode support.
> 

Fixes and Cc to stable here too, as you'd like to have this backported
as well, don't you?

> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 3abb63d00a0b..9e74bcd90aaa 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -1531,7 +1531,7 @@ static int stm32_fmc2_nfc_setup_interface(struct nand_chip *chip, int chipnr,
>  	if (IS_ERR(sdrt))
>  		return PTR_ERR(sdrt);
>  
> -	if (sdrt->tRC_min < 30000)
> +	if (conf->timings.mode > 3)
>  		return -EOPNOTSUPP;
>  
>  	if (chipnr == NAND_DATA_IFACE_CHECK_ONLY)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
