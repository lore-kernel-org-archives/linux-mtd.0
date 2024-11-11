Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5C8D2E9F1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WOua4UYiH+Kd0hHjiuarZ85ZXmQ4Rtv0uZ16SwObOk=; b=QJewrtNtYteRom
	FhQe4Cx0ov7Smc9bNA99BpAW6Kder/FURpiOa07wwGRTnkXquQrhgNEZ8G7wsI11bPp1lea0WsiK0
	6iZBnIXhAu/YGS/TpdzWGzd3opqw+VTIUb34IHiQItlSINW5Prkwod4fymrpwaI0IFr/ze2mzBgd3
	DHZd8PwPuGKNNSXaZ4YJ+y4sGJNqTM33ZfCh5lfR3fYQtNANKWpRERlUEREucNC8MsDiemdJnc0Dw
	3lXn1wVW8/Xue8Dc56smEAN9/13VBvc/mo4HD3XDINTD8PjFiVZne7D7mW7DFv/3kJCYzegCiBIeh
	aLpxTXQCG0/z+1jJ2tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUbi-00000000C5o-1Uze;
	Mon, 11 Nov 2024 13:37:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUaa-00000000BxD-1Raq
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 13:36:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4319399a411so42888015e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 05:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731332178; x=1731936978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1Qw4yUdezst90A3OaSW7+Czevxz1AHdZNP7o9+iGUw=;
        b=kX5dQUhL2QWUO90+mKi3sjo5QStrzpnI8znMM/sf1fZO+jB5kOXfM4scl5mQ1YVGUl
         7QoMDyVPgxJqj7KehO8J7WTTElyxgTFEtfB2ZswOyObPHWasdV5lD/2j9vtkGH7kk0b7
         XpqN5GjNgRN0ksVQxBuoy+GMRyuRX9wqqeWfZtzaDZp525l780S8CdfBqIb1+9AcSqBD
         L6+ckMATB30ueKhydeHgWlhULq++f8R1J1RZyw07q8XcvHR9t+WxoPXjJdiUOX2BZww2
         3h7hUvPVUwKyCH4M8XBs/JRQNCGpA/5PkrCev2vZX8O3C7dAyEHxvxzuN07iao4W6fpr
         jLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731332178; x=1731936978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1Qw4yUdezst90A3OaSW7+Czevxz1AHdZNP7o9+iGUw=;
        b=H/FR2QBRi25CVyeKfqneYaP3SRmQ5K5JdQK4XIiTvJg79GaY8EUY44f9Mp7IZNvHOf
         L2gxRYGDaApuja/wIVkyg7JCzRPnonfMvTZMfSL9nyAgpSX6ctuYsRf45moUgE6Ez3bp
         wb7orT/7ycIGiMKFSwPqYrlNznIdzlWHiP6amyXF740rFQc6HS8ZjbJddKXArfo/ho4f
         uKh/jXOOoNFX/m02ua0aDmKOJKYQla7CjafDfz5VYlIaP+8aIMymY4kBWBf+I/pj94iT
         Ick3nyU56puIooIb74ITPmdAh46/O9XLLw20QZKbAU0IvXcbQSxdYfddfRqEuagoPE5r
         0x2A==
X-Forwarded-Encrypted: i=1; AJvYcCU14HgGJahLEN/jBWEuZz12N52QX/3O8M8FKvbN/6lJ7+qXriB6Ob2j/xKp+GoWMIKAaRZiRQhoQKY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHnQR+KiS/3P9+ti4BxqEWQzVxxI/j8dDu5OKuwE8HcntPrUiO
	tUWftvhqxS6dMIuMW/aH3jgtvBSRiEAmDg44qRMfvq0FL1Gnsn0RzupskXeseNzPWZO26z+Rj1x
	a
X-Google-Smtp-Source: AGHT+IEdBCKU11SXShmf+ASOGWCtFd+QYwaO/LBhwXYdyIAFQI6sp6uez78lCCFomWX0PCaBNF/ogQ==
X-Received: by 2002:a05:6000:2a5:b0:381:c5ee:9c00 with SMTP id ffacd0b85a97d-381f18855c6mr10511312f8f.47.1731332177749;
        Mon, 11 Nov 2024 05:36:17 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea5d9sm13013041f8f.75.2024.11.11.05.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 05:36:17 -0800 (PST)
Message-ID: <64ade17d-3800-4afc-847c-b8e5fc5d7360@linaro.org>
Date: Mon, 11 Nov 2024 13:36:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] spi: amd: Support per spi-mem operation frequency
 switches
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-4-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_053620_422178_56E845A2 
X-CRM114-Status: GOOD (  24.09  )
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



On 10/25/24 5:14 PM, Miquel Raynal wrote:
> Every ->exec_op() call correctly configures the spi bus speed to the
> maximum allowed frequency for the memory using the constant spi default
> parameter. Since we can now have per-operation constraints, let's use
> the value that comes from the spi-mem operation structure instead. In
> case there is no specific limitation for this operation, the default spi
> device value will be given anyway.
> 
> This controller however performed a frequency check, which is also
> observed during the ->check_op() phase.
> 
> The per-operation frequency capability is thus advertised to the spi-mem
> core.
> 
> Cc: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-amd.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
> index 2245ad54b03a..f58dc6375582 100644
> --- a/drivers/spi/spi-amd.c
> +++ b/drivers/spi/spi-amd.c
> @@ -368,6 +368,9 @@ static bool amd_spi_supports_op(struct spi_mem *mem,
>  	    op->data.buswidth > 1 || op->data.nbytes > AMD_SPI_MAX_DATA)
>  		return false;
>  
> +	if (op->max_freq < AMD_SPI_MIN_HZ)

How about using mem->spi->controller->min_speed_hz intead?

> +		return false;

I find the check fine here, but I see however that amd_set_spi_freq()
duplicates the same, returning -EINVAL when speed_hz < AMD_SPI_MIN_HZ
> +
>  	return spi_mem_default_supports_op(mem, op);
>  }
>  
> @@ -443,7 +446,7 @@ static int amd_spi_exec_mem_op(struct spi_mem *mem,
>  
>  	amd_spi = spi_controller_get_devdata(mem->spi->controller);
>  
> -	ret = amd_set_spi_freq(amd_spi, mem->spi->max_speed_hz);
> +	ret = amd_set_spi_freq(amd_spi, op->max_freq);
>  	if (ret)
>  		return ret;

however the return code is checked just on this call, and completely
ignored in the 2 other calls. I find the code a bit ugly for the non
SPIMEM case, but maybe something for the amd owner to address.

Looking good,
ta
>  
> @@ -469,6 +472,10 @@ static const struct spi_controller_mem_ops amd_spi_mem_ops = {
>  	.supports_op = amd_spi_supports_op,
>  };
>  
> +static const struct spi_controller_mem_caps amd_spi_mem_caps = {
> +	.per_op_freq = true,
> +};
> +
>  static int amd_spi_host_transfer(struct spi_controller *host,
>  				   struct spi_message *msg)
>  {
> @@ -521,6 +528,7 @@ static int amd_spi_probe(struct platform_device *pdev)
>  	host->setup = amd_spi_host_setup;
>  	host->transfer_one_message = amd_spi_host_transfer;
>  	host->mem_ops = &amd_spi_mem_ops;
> +	host->mem_caps = &amd_spi_mem_caps;
>  	host->max_transfer_size = amd_spi_max_transfer_size;
>  	host->max_message_size = amd_spi_max_transfer_size;
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
