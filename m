Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616D3D2E9E6
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uc7e9qyE1lr3MRiqwlsB80ShfZMEwr6G69eGk3ERUOY=; b=oKqF98nt+IdlDs
	b66+wiDoMF72Sq9MlOEPCRdrnRM7oj0qBFNdKVgW9OcJKkY8bbH4D5Uam0Br2rpNKLRLHbGjXorZs
	YGBlMcIy7GxFOyj1vAJyoULDFzsI89DzmK+2iJTi73QGSlT+wr1BGxn98b/lHvgpayUoJCmkT6xGz
	lsZ/ovxFME3A6FGOWlpDAtXAP/txyfzj9RAoS+lAgdlh2/RWE2oc5/KFlPIoS2F68B/WV9L8Fs3NR
	dIFhwFFHzqWJrEJqzG5V4vzNttRvpF2YUvpnDuZ12zIYPQqMrczJrRlZNQ1uFT8AebY2beLDHVgrr
	9NhWSzEMIPq/UzZkWm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUFr-000000009q2-2UKR;
	Mon, 11 Nov 2024 13:14:55 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAU8Q-000000008PG-3JRa
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 13:07:16 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso773428066b.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 05:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731330433; x=1731935233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuqbWEUKeRUyLa/FoT+dFXMmWuM2evJHexwWQ7irf3o=;
        b=wUOZl0Igg4IFp/ep8sV7PNQrAPKgHtMFHa420hpk1HL60xw926LajvrZmmGVCdzZs0
         l+9P2O3wcoem+E4upN6fsJolqmeX7+FT0ZlNW2PKJ0ERIH7Yu4UTaESXDw64CKPXDAKf
         LYLH8/2JRZlOhFRbYFlTaC8291s3nSAY2lIOe+SNZuPRG1eCSbPEBQcBzYeC9tla4AQI
         h+k4zduC0BHB3KzrdZYD1c+vZmPdU2c8N35tV1Jz5WhInUpMOLAK3FD76wXIIRF7Gj+D
         tzL51gbsJMQNCv/FL9H/fz3S8xDi49sYF/kuvtcDs1Rm15rlOhkwBdAF/nZMx46ws3Hx
         uzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731330433; x=1731935233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuqbWEUKeRUyLa/FoT+dFXMmWuM2evJHexwWQ7irf3o=;
        b=Qat2wVZIehX0goTIX+DROfxfbZ3ufzXIanw8rwhtChfTbRl0A+ZfTDvgnuUn0kLXVV
         tNMNq7f9HyC1n/BOJUZbMcHBjKVgUqwmVeYkML+6rXHkhELNW5L3a9COLyIm2p2Ab9YK
         Y1hETdX0oGZz8IcKyU/bx4sYmEF/fxgx52dODKExUyKji6fagHWRGIuWWR5zMao/dDtQ
         GO8hwwx6+hjZRVXK3PdsClOnMPVOBtjEsNcBFqnRvKQj54wozdeBV9FK4NvWJzaOGzfd
         nBGLWGJPw2TZXFzWrCLSIyrD01ySncVQ9jKw0X9y74nr0dg92g703ts5zs2KZ/osFrqv
         s9wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWMhcGPdLpF+sLGUpOQV23RnoJOVADT46Dhy1XkFZus7odrVeGhiyhM+EhaqnouYOXmGz1r2D+RQ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIMFXXlmrvAHEIPTKNJmGfqQhFuieBUz6WhC0EPuNM26L5No3J
	MZJUmbvj4aB2J6+Q2sIQpU9ioWxQmQlrpPmcDPZjclrPs1g5/CpO1BoB2yzEjpw=
X-Google-Smtp-Source: AGHT+IEnb9jV9y5YcXAyyhZyx653iOkhdQJRgdvB95DAl/f1lUVteBRKumj4+CzwSQbTSU2R/No6gQ==
X-Received: by 2002:a17:907:3f14:b0:a9e:380b:8ce with SMTP id a640c23a62f3a-a9eeff44e9amr1235984466b.35.1731330432898;
        Mon, 11 Nov 2024 05:07:12 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e92esm597386666b.182.2024.11.11.05.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 05:07:12 -0800 (PST)
Message-ID: <e76ff30b-342e-4e4c-aa84-40312c3ffc72@linaro.org>
Date: Mon, 11 Nov 2024 13:07:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
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
 <20241025161501.485684-2-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_050714_869661_E7AC70F5 
X-CRM114-Status: GOOD (  15.89  )
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

cut

> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 17b8baf749e6..ab650ae953bb 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -356,6 +356,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  {
>  	unsigned int tmpbufsize, xferpos = 0, totalxferlen = 0;
>  	struct spi_controller *ctlr = mem->spi->controller;
> +	unsigned int xfer_speed = op->max_freq;

be aware that for controllers that don't support SPIMEM ops, you pass
the frequency from the upper layers, without adjusting it with
spi->max_speed_hz. Was this intentional?


>  	struct spi_transfer xfers[4] = { };
>  	struct spi_message msg;
>  	u8 *tmpbuf;
> @@ -368,6 +369,9 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	if (!spi_mem_internal_supports_op(mem, op))
>  		return -EOPNOTSUPP;
>  
> +	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
> +		((struct spi_mem_op *)op)->max_freq = mem->spi->max_speed_hz;

not a big fan of casting the const out. How about introducing a
spi_mem_adjust_op_freq()? The upper layers will use that were needed,
and you'll still be able to pass a const op to spi_mem_exec_op()

cut

> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index f866d5c8ed32..8963f236911b 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -68,6 +68,9 @@ enum spi_mem_data_dir {
>  	SPI_MEM_DATA_OUT,
>  };
>  
> +#define SPI_MEM_OP_MAX_FREQ(__freq)				\
> +	.max_freq = __freq
> +
>  /**
>   * struct spi_mem_op - describes a SPI memory operation
>   * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
> @@ -95,6 +98,9 @@ enum spi_mem_data_dir {
>   *		 operation does not involve transferring data
>   * @data.buf.in: input buffer (must be DMA-able)
>   * @data.buf.out: output buffer (must be DMA-able)
> + * @max_freq: frequency limitation wrt this operation. 0 means there is no
> + *	      specific constraint and the highest achievable frequency can be
> + *	      attempted).

nit: you close a parenthesis without opening one

Looking good,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
