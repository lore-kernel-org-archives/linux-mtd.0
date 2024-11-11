Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF8ED2E9F0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCaFp4GKvB6qzvmqYF4q2uGPaUYRGOwThxv+zk0c3uI=; b=h9azc0R/93uJ+j
	/HARTz6Psa3i7Z90b7K4ci4x99loelzLNf1tLiJnynepcMoU6ow8fQaBKsW3q1OCdM4DfGjqknbuV
	bIuctHbACrmTSXQHkX2E8PpXL6Lc8rQzlzaGiUwAyNoJTpK4mMB5PFVpF/xRAWmq6GMDnO58ZfUr1
	YXxzzdbW5fybuujqEp1dEjnS5RGT/T0opTtwKK4y2gZqHJ3q+Uv5jdm+Wjo1Y1ePOKbptyClddUmX
	3eGShK+BgepDe33nMyp1TNuDSmCtwWfZ5WEBM8WAIPHNTIHhT3Ez54VLKM+EindstsuywGPJfhrCr
	m6mr72gPbVuqTQizll7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAV85-00000000Gnf-1Lu8;
	Mon, 11 Nov 2024 14:10:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAV2b-00000000Fv2-1X7S
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:05:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43163667f0eso38442705e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 06:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731333915; x=1731938715; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUuoF0rVu8yLQVOlU2klya1GLjhEzhswqT49iwbZI44=;
        b=o/HD92fBOkHbhaNIAvYkwp3bs0Ro1Xbo8iYDWZcavMuJnpH5KZJeFn8C/9VATNmvYS
         wFUTV9O/gyoLWZ+J2KbeAek3RRI8j1PTc5DRXDVxKhkHIkmz6eGhH0CB1Ee4lxwFlTk9
         kqBjV8luAQrM/lwUH7r+IS4fLakYiZEGQv4Bat6tUHH6hvlLumsLjYRmTnp9jg1dtdHr
         gDfUh3gCfHOC2D0JVpN6iYQmS4/xF1f2WwnBt+MPQs+26lfJEhaZElEN0Fks6btlcg5E
         FBm2Mk0w55lkfcTudwQvNoQNH4USy+nbh7XH1nyzS18lMd9rvHHS0oyRZQQxmgtlSF0V
         bf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731333915; x=1731938715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUuoF0rVu8yLQVOlU2klya1GLjhEzhswqT49iwbZI44=;
        b=ElWkyBHlZTbYtHzy8zJZ0fb6BuD1RKd28y89Cq3A9BkpICwlbjsxHGtJmuR9N/F/Cv
         yN4RXUaEI9u7RR1l9O3w+fCVjs1VXRYnNtvMB0vDEJUcc/KUSUBT4gWga+IDxaJVmXIl
         pTUUKpoycpuglZJYYOUe8VMOhIzUyaWZVCg3Ij4SY/DLRCbeI7XtVpUADR8YK9XjxWJZ
         GokNAKlT2lj/F9rsEVkQuTiMZwPATw9UTSZcd7qFhw9KI+yO6Huc669GhXK8eQ3xkfui
         TB3Zqe58baoG6BFcI9hYcRVEw8tx8vWMU5v8oePThahtsz7NmxcUADtnaefqiJ/SZiGo
         OABA==
X-Forwarded-Encrypted: i=1; AJvYcCVL7ROgZgVe8gEaJ0nXWj9EZu1EvnTAAq41UCGpLnZnywQgSAzlKoOBxhZjmXnRws8HdleIupUe+GQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvzaJ4knVau4Po7MczcylSGaiuidMS/djwC6T/7k1mUvsMU3d5
	TY5ISo5vqZ1yvRdjverVm0ns8IRm66bOoP86ob6p0Ch6i2wDI9gFhoY9rwHl0Bg=
X-Google-Smtp-Source: AGHT+IFkKp60ux5VX81x3K6C5sHL8ZZWYxxqNmryS1kz6rRzgAWjB0iLpxlxaNBZqH/2wGg/7uh4nA==
X-Received: by 2002:a05:600c:46c8:b0:432:7c08:d11e with SMTP id 5b1f17b1804b1-432b74fedc8mr108724265e9.1.1731333914997;
        Mon, 11 Nov 2024 06:05:14 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9707c8sm12988363f8f.17.2024.11.11.06.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:05:14 -0800 (PST)
Message-ID: <03c363d6-3c0d-45fe-93a7-76e9fcaff96c@linaro.org>
Date: Mon, 11 Nov 2024 14:05:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] spi: dw: Support per spi-mem operation frequency
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
 <20241025161501.485684-7-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_060517_459902_5DC3C3B5 
X-CRM114-Status: GOOD (  20.22  )
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
> The per-operation frequency capability is thus advertised to the spi-mem
> core.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-dw-core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 431788dd848c..3d49b1dbaed4 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -677,7 +677,7 @@ static int dw_spi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	 * operation. Transmit-only mode is suitable for the rest of them.
>  	 */
>  	cfg.dfs = 8;
> -	cfg.freq = clamp(mem->spi->max_speed_hz, 0U, dws->max_mem_freq);
> +	cfg.freq = clamp(op->max_freq, 0U, dws->max_mem_freq);
>  	if (op->data.dir == SPI_MEM_DATA_IN) {
>  		cfg.tmode = DW_SPI_CTRLR0_TMOD_EPROMREAD;
>  		cfg.ndf = op->data.nbytes;
> @@ -894,6 +894,10 @@ static void dw_spi_hw_init(struct device *dev, struct dw_spi *dws)
>  		dw_writel(dws, DW_SPI_CS_OVERRIDE, 0xF);
>  }
>  
> +static const struct spi_controller_mem_caps dw_spi_mem_caps = {
> +	.per_op_freq = true,
> +};
> +
>  int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
>  {
>  	struct spi_controller *host;
> @@ -941,8 +945,10 @@ int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
>  		host->set_cs = dw_spi_set_cs;
>  	host->transfer_one = dw_spi_transfer_one;
>  	host->handle_err = dw_spi_handle_err;
> -	if (dws->mem_ops.exec_op)
> +	if (dws->mem_ops.exec_op) {
>  		host->mem_ops = &dws->mem_ops;
> +		host->mem_caps = &dw_spi_mem_caps;

I guess you need a dws->mem_caps, otherwise you overwrite whatever the
layer above specifies.

> +	}
>  	host->max_speed_hz = dws->max_freq;
>  	host->flags = SPI_CONTROLLER_GPIO_SS;
>  	host->auto_runtime_pm = true;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
