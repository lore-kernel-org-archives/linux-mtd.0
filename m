Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D2C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GltGYxUhs7DZ09wTW2GJV0JzrOIMgtjaX8gU+PfX5wM=; b=P1fe7Ks+CNi4Op
	Xh9AF9E6uwsVYRWW8kc9RYB+lImerIK9653yYo9KsUuLahHI2hsJy90b1pKFvEfHI0K92YkpB796a
	NtVSQjrhq8SqrIRHtZGGJ0MP8EOqqCJpwBoOJBNyYIs7tYoZyH0LzU07Bv8RzjVHa72glL6dtsDK4
	7OAOqVN4rWu2kddFUtwgHacXCR/Q3ok+cqoT7pJFSDx4GPRhtZWQY6qQbXVTRIMpv5+CSTzIrhLtV
	6aWLKCaLvzhkbxjcNqdScq06WpBvhkDZJvluZirl30C/lw6soU/1IWLjxKdSWWrWz805qz4kRsrBM
	0+w1DTegDfIiqPK1V9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDiB-007n5K-1n;
	Wed, 01 Nov 2023 16:04:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDi4-007n3w-0o
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 16:04:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9c3aec5f326so210507666b.1
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698854684; x=1699459484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hd0hsJXBNlWI7JL88xLXQjMMDrSkOCS5C17zd8NN5m8=;
        b=S0IMLubJGGZGWtowccqALkK/d2ALANgoziyqEqbQMSDwA3U7XmQ4CL2vfEr49JXe5O
         EMkxxqQHMvEPMplW4HZf2H5KTwF//L24v8MTzt6bEEI7NiJZFRL4aYwZOviTkFn3vbRo
         4DJnC/gI/cZgVx5P3yBCZa7Qze+UQCKychnO5zc/jnWh1WOjjHKSoi5Pd/PbX7+IYglv
         fGyNXOBuO+NQKorwgJeX4IFvWY9e6NV4hAhUp6E2Hx+nu2lzBLUMPtVL/t+2+khKfze3
         bowNOguTE4kPBuG/sNzSgVtvUWGlXdrsW2pGCnQvWXC2+FBAjBQhrx2XmL5U5YLij3Ev
         tRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698854684; x=1699459484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hd0hsJXBNlWI7JL88xLXQjMMDrSkOCS5C17zd8NN5m8=;
        b=cKxaBE+sz45o0C+dHqyBaxDzM/ij0fdTfiaQT8mbGNMWY1IJ262zKtEMLm1Rk0DUlQ
         mGF/p+PiVA6tkNzJIVRN1P4OAWf6GtdfJBBdUzivmHc+3TJe4aLXRv7CiAZQsrOMfkSx
         udtjqCRMwoUARleSPA9S7ipChb6Ikd6MkH+U/oab7/ewUVHArcYFAibJ0+dBWm0+ikZt
         j6LahT4tmPOe+d3Sc7FNCoJ3pHLpV+W1r7N/a0hbbqHclDBLwLu3jEYiXghaZg4mQ9j1
         nGSl84Mz5qtToG4LK8/+Z/8urTpzP/9dWadSxRHvr3XenOIQWMc3xXknQHY6/ACzECQP
         YjBg==
X-Gm-Message-State: AOJu0YzcI2rJykFJhtD3BUD5IWNZbpcwcVz30HqXmiVC23Ky1XH0os8V
	jyRsFT5dDfyIdY59elIOcFqxCQ==
X-Google-Smtp-Source: AGHT+IGB1QJ/k8+vvBqnfrkjefMudjqLHWOxxlglQID01rZJy5TngeIqTGbIlwvoJX7AurMrQGkHhg==
X-Received: by 2002:a17:906:fe41:b0:9ad:f60c:7287 with SMTP id wz1-20020a170906fe4100b009adf60c7287mr2336480ejb.28.1698854684502;
        Wed, 01 Nov 2023 09:04:44 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id l12-20020a1709062a8c00b0099315454e76sm80658eje.211.2023.11.01.09.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 09:04:44 -0700 (PDT)
Message-ID: <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
Date: Wed, 1 Nov 2023 16:04:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: michael@walle.cc, festevam@denx.de, takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231101145853.524045-3-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_090448_287455_FD66FBD7 
X-CRM114-Status: GOOD (  22.59  )
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


Hi, Fabio,

On 11/1/23 14:58, Tudor Ambarus wrote:
> JESD216 defines a chip as a die, one and the other are the same thing.
> JESD216 clarifies that the chip erase time defined in BFPT dword(11)
> applies separately to each die for multi-die devices in which the dice
> are individually accessed. Based on this, update the
> spi_nor_erase_chip() method to support multi-die devices.
> 
> For now, benefit of the die erase when addr and len are aligned with die
> size. This could be improved however for the uniform and non-uniform
> erases cases to use the die erase when possible. For example if one
> requests that an erase of a 2 die device starting from the last 64KB of
> the first die to the end of the flash size, we could use just 2
> commands, a 64KB erase and a die erase. This improvement is left as an
> exercise for the reader, as I don't have multi die flashes at hand.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/core.c    | 104 +++++++++++++++++++++++-----------
>  drivers/mtd/spi-nor/core.h    |   8 ++-
>  drivers/mtd/spi-nor/debugfs.c |   2 +-
>  3 files changed, 78 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 25a64c65717d..ac2651e76285 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1065,19 +1065,25 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_erase_chip(struct spi_nor *nor)
> +static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t die_size)
>  {
> +	bool multi_die = nor->mtd.size == die_size;

this is wrong, it should have been
	bool multi_die = nor->mtd.size != die_size;

Sorry :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
