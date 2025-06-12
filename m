Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6012C61CE8
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5TMqQ6zJuObU+HIfvl5rJy4gvxYEm9SUyU5OIXkHZ4=; b=x0NosS2EXPrybb
	ql5h76nGv379lSMNOjYPmIs0RQRbI+PLzkQZCAOUZCPGh/2Uw7InE2PYFZ1pD50RmoysaVFCqz6LM
	o0dRd32yYlZm/+Ii26bO116EyPDC6FcUNnjZVSV+aztgaSlL+t/p39j/Q9ciWdTa+/1LK2szL1BWr
	MiLoudFa1PdcBTeE4Rsud2JfCevFhcWVrDtFKPxh6+Zr0q0BRP1IBHiT3RMHvImL2l25bpaDXK8B7
	9EEK7Yj+Iulte08LoRTiiENwlr/03g+831h0ESbIukvbCRJb+3IXcT3XVlUg9CST1HzAP689N6Gzx
	/uM3Fb/mbntmyo3y5p2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPedC-0000000CsNs-44Av;
	Thu, 12 Jun 2025 09:53:58 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdPW-0000000Cdxs-0o1F
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 08:35:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a54690d369so676913f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2025 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749717345; x=1750322145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJx/HrdzuE9x0NoMDdG6v9qd2xd7uF+nlykGDjRW6c4=;
        b=JWBmj60apI6IKqed4OwO+s6dCSgM9tfMZRNLpsE4tV6fih6Bx93qcL4tANAJidflLb
         nezXN1+LuBL/nfiEDRz2kOkHZqoYS4Qzde7XN5fyIHwCkI97Hl5OFN3zXENIX9H8E5Dq
         Qzusznxeeyh5B0EABdVLKjkR0sxiav8zQmWHyVTrcZ2FrdCVECWCOlHqdaw5JhAdIRTC
         duRnxiyanpdoHr7hxkNRzWiAzgA9NDrGYF6DSNvPrzh+lBRStKaYHR6zb5m3nVQDUiB/
         K7F+0Lq2Ye7ZOi6LKpEkPPlSw32+feQVTU+OJksAuh1b+1ABHJxVo5/uA+PPyibVF4lO
         uuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717345; x=1750322145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJx/HrdzuE9x0NoMDdG6v9qd2xd7uF+nlykGDjRW6c4=;
        b=raJ8wjJDGKrx3xUhvbaPm2Bi7uA4dT1e2lH2P3TEgeWCqUpW7khABGYvmYzk/wREIO
         h7Hj4GezEV1eDTOntbR8hEEfQ8ziCyQn44BO5AM+UEwV1dg2CPrXz4gv/y4AZ6qzEdpI
         Zh9D8iRpONgOq1g7cDab9PEW5i7DWEhXa0QayyQM9DwOVSiZegx6hAoVrnJ1a9E2bF9u
         kjAXUJHJ7bpa7XBG56uetCljZaHRxEwvjYZyXJUPmgWAPeedCj/GUG20/cgFfeE+Qw8i
         21o6zn9W5bUjJk2IZy8EmgC6Jkgyzx3ChMSRS3+EZNX8SQVV1vO0YzzYKQXCftg/OJbC
         NOPA==
X-Forwarded-Encrypted: i=1; AJvYcCWO3lc2i2ufIXVJYSBG4qYoHJCV3zXBDGnoa+8SlEU6NNp7SqbMcjZNeRn0sbLsYD3zx8BGa3yjcgU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzctg5NRwrOzMq9i8O7B/f1YGHK6nqFC5qUzDeNeLo+ST6OYDE7
	O7xjsi81dOfjXY+qYHqP6B2asaqDNja3DC5/c13E9NmkK2SxJtxa1TTCxo5yY9cfB+g=
X-Gm-Gg: ASbGncurTXsYHFO49bjPA5N3xs3EhNtuNHDy8pLRZ23NcN0IHiPHy/RMznolGhT+lM9
	QaSifwpsQ4YLk48cvhPPs0eU7iCBfJUk7w1Qw8iNZqgi6VYljIvzWlxvVlsxWuzpR3OhN0sMBT1
	Q9HJrD24n9RINoAS1bpLW+wl9MwjeTpisBQrEhHfj8figDDgCqvD4Q6Q13WvLaDsDvfk187gvXt
	yw3t7+xUMmmQ04G9oLns5khh1ta7rm3yV60apXiwpO7f0aNccIpZxvGRCOI0HOp1YXgIVtj9TTN
	cx0NpWWAPzDOKcL6jEoDpA+wGCIOmAWyEhinOXxo/STANDq7w4QgNELnJiJ20rRVAP8Zr2Ak
X-Google-Smtp-Source: AGHT+IFgfsCjC4jqvBb2VvsaWQJ0fqcuQv9bMP9c5nqmV+Ohfl46fsYp2PojSKaKzcC9M8OAgyNeMA==
X-Received: by 2002:a05:6000:230a:b0:3a3:648d:aa84 with SMTP id ffacd0b85a97d-3a5613355d9mr1784429f8f.5.1749717344649;
        Thu, 12 Jun 2025 01:35:44 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224795sm13254195e9.7.2025.06.12.01.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 01:35:44 -0700 (PDT)
Message-ID: <831d6528-2185-4e4d-a712-590041b68d91@linaro.org>
Date: Thu, 12 Jun 2025 09:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: Fixup
 params->set_4byte_addr_mode for SEMPER
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20250612074427.22263-1-Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250612074427.22263-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_013546_259639_391D8C0A 
X-CRM114-Status: GOOD (  18.23  )
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



On 6/12/25 8:44 AM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon SEMPER flash family does not support E9h opcode as Exit 4-byte
> mode (EX4B). Therefore, params->set_4byte_addr_mode is not determined by
> BFPT parse. Fixup it up by introducing vendor specific EX4B opcode (B8h)
> and function.
> 
> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
> Changes in v2:
>   - Move set_4byte_addr_mode() assignment to post_bfpt fixup
> 
>  drivers/mtd/spi-nor/spansion.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index bf08dbf5e742..b9f156c0f8bc 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -17,6 +17,7 @@
>  
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
> +#define SPINOR_OP_CYPRESS_EX4B	0xB8	/* Exit 4-byte address mode */
>  #define SPINOR_OP_CYPRESS_DIE_ERASE		0x61	/* Chip (die) erase */
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> @@ -58,6 +59,13 @@
>  		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
>  		   SPI_MEM_OP_DATA_IN(1, buf, 0))
>  
> +#define CYPRESS_NOR_EN4B_EX4B_OP(enable)				\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B :		\
> +					   SPINOR_OP_CYPRESS_EX4B, 0),	\
> +		   SPI_MEM_OP_NO_ADDR,					\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_NO_DATA)
> +
>  #define SPANSION_OP(opcode)						\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
>  		   SPI_MEM_OP_NO_ADDR,					\
> @@ -356,6 +364,20 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static int cypress_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
> +{
> +	int ret;
> +	struct spi_mem_op op = CYPRESS_NOR_EN4B_EX4B_OP(enable);
> +
> +	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
> +
> +	return ret;
> +}
> +
>  /**
>   * cypress_nor_determine_addr_mode_by_sr1() - Determine current address mode
>   *                                            (3 or 4-byte) by querying status
> @@ -526,6 +548,9 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
>  	struct spi_mem_op op;
>  	int ret;
>  
> +	/* Assign 4-byte address mode method that is not determined in BFPT */
> +	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;
> +
>  	ret = cypress_nor_set_addr_mode_nbytes(nor);
>  	if (ret)
>  		return ret;
> @@ -591,6 +616,9 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
>  {
>  	int ret;
>  
> +	/* Assign 4-byte address mode method that is not determined in BFPT */
> +	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;
> +
>  	ret = cypress_nor_set_addr_mode_nbytes(nor);
>  	if (ret)
>  		return ret;
> @@ -718,6 +746,9 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
>  				   const struct sfdp_parameter_header *bfpt_header,
>  				   const struct sfdp_bfpt *bfpt)
>  {
> +	/* Assign 4-byte address mode method that is not determined in BFPT */
> +	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;
> +
>  	return cypress_nor_set_addr_mode_nbytes(nor);
>  }
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
