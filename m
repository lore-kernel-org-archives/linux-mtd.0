Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DF3C6FA8E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 06:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4Da3UI/b3VFzygnuvH11t/956yDo5JB0+FlOVoYnkY=; b=QUvd+d17fIr14X
	bWqtn3ZaZVz1fV15ETxeIZuVJ6M8MgQDjO9L9uQHwddEqG+fMN21reNoP67TfcxFvuXpvlWw1sixa
	9yir7UoAsXMT7m25ZJbgNrZLUFEUtYyQRqYutkM/MNunF7IrDOZKEUpofpnAA3he0VZkkThGZQlgp
	QKfGuCB0I73y2JKnL5hq2X4FiukwKrGcwqpw+i1aN/rwNXSs7M11Y8M4Lx+nV6RKCARwEs/wMZAud
	7VJTPIy7kq9oauRxKMzjVpAayNzc+PsJFGn5TU1DmeW3WsD7Dbnj8P5aPj/0xUEIgDQ/tilUKyh6l
	HGIh/w3ZYuoBQpFXIqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcPh-0010yg-C5; Thu, 02 Mar 2023 06:27:37 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcPd-0010xu-Ms
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 06:27:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g3so7961567eda.1
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 22:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677738449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxDaOTn/t/JqxcoZ5jMFiff/S09JLakRYJp/NWXh6H0=;
        b=g3Jm+2LLqp1ZhfEi/3X0pIHxIYspQ0j9Dfrf2IGo8xnyVy8J/XkrSwK0aIib6Yby60
         3FSyh2G9hh+46rjyIh+6CFNTbNH+3cg7Lmgdu7Ha07fMhWMHMF9kxvdXi0yZcwB7RTQG
         2AanBg5AflfrAUh4EPImLoMxlGL0i8+FKsgJnRdWqHT7zb9Y8QXAqP//RZsg9boYsTFR
         xmRuQX34pXrukZYMd7OoO5FYOBgMlEGpcmWqJjdewLidiZyH4OukJPuSXuqbV40wCM0K
         CfhQfPLJcG0g1DOMRm15z3YoJP3tJnhU9oHFyW1Sf8+bl5EY/QfIL8c4Fx4KsydVwjK7
         ztmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677738449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxDaOTn/t/JqxcoZ5jMFiff/S09JLakRYJp/NWXh6H0=;
        b=ikw+FXIO5KUTQpYa+ffeLQL+5b5hb6N69mSIdnjvm3J5GBJOcclH6Hi1uV0vrh/hZL
         GJbb1geb7V4AOMfXodQ8arUfw22VkSmMvEe2OA6apqdaMg+qPgQ7N/ihqCG51NG/f6wm
         R6QUNOcOdIV5BDk9GH6DUcr4fNaymnfjv/vx1nF57MuKnrKjGLR6Vx84sJeJPOg13Cq2
         RGECYLnL6w3xxDJU+2izXwR5IXy6DWxDElE+YNa4oW47Wi87zA+JKE/U1HEJyvimWC+C
         JnlshDov+AyQvUKBrAQ/Bgcng7RT7wpeS2pKI4uYzzD2vdKi96to/ClbpAH7Hw5DjPXX
         +2Ow==
X-Gm-Message-State: AO0yUKUjrjYenY1S8uy7s/qtecWLla18AMsoDYMRpI8fdX/Z9Zv3jhye
	CLGZsdcS74uNynp6FsA4Ibv6LFf0t39dtkQ7pnE+IQ==
X-Google-Smtp-Source: AK7set8nRlzgUzKab59KUN1DAhIeXOXo1SNeVcDOEEmkq/ZjOqdhpVpOdD8w+7rs1SSqsbwz7sMp4g==
X-Received: by 2002:a17:907:a47:b0:8b1:7b12:2917 with SMTP id be7-20020a1709070a4700b008b17b122917mr12823072ejc.12.1677738449038;
        Wed, 01 Mar 2023 22:27:29 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id 24-20020a508e18000000b004af6c25ef98sm6492088edw.8.2023.03.01.22.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 22:27:28 -0800 (PST)
Message-ID: <ba3a9194-5310-fe7b-03db-d390d74c3ab6@linaro.org>
Date: Thu, 2 Mar 2023 08:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 6/8] mtd: spi-nor: spansion: Add a new ->ready() hook
 for multi-chip device
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <cd8e3bb4372479989ae33685524afda749f6e02b.1675835253.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <cd8e3bb4372479989ae33685524afda749f6e02b.1675835253.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_222733_806983_80DE6E7C 
X-CRM114-Status: GOOD (  26.36  )
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



On 08.02.2023 07:53, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> For multi-chip devices, we need to make sure the all dice in the device
> are ready. The cypress_nor_sr_ready_and_clear() reads SR in each die and
> returns true only when all dice are ready. This function also takes care
> for program or erase error handling by reusing spansion_nor_clear_sr().
> To do that, spansion_nor_clear_sr() is moved to top.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/spansion.c | 96 ++++++++++++++++++++++++++--------
>   1 file changed, 73 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 33c8a5afcb76..45377566ecbd 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,6 +14,7 @@
>   #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>   #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>   #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> +#define SPINOR_REG_CYPRESS_STR1			0x0
>   #define SPINOR_REG_CYPRESS_CFR1			0x2
>   #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
>   #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
> @@ -49,6 +50,74 @@
>   		   SPI_MEM_OP_NO_DUMMY,					\
>   		   SPI_MEM_OP_NO_DATA)
>   
> +/**
> + * spansion_nor_clear_sr() - Clear the Status Register.
> + * @nor:	pointer to 'struct spi_nor'.
> + */
> +static void spansion_nor_clear_sr(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op = SPANSION_CLSR_OP;
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> +						       NULL, 0);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> +}
> +
> +/**
> + * cypress_nor_sr_ready_and_clear() - Query the Status Register of each die by
> + * using Read Any Register command to see if the whole flash is ready for new
> + * commands and clear it if there are any errors.
> + * @nor:	pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)

we could rename this to cypress_nor_md_sr_ready_and_clear to indicate
it's solely used for multi die devices.

> +{
> +	struct spi_mem_op op =
> +		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes, 0,
> +					  nor->bouncebuf);
> +	int ret;
> +	u8 i;
> +
> +	for (i = 0; i < nor->params->num_of_dice; i++) {

as long as you rollback the num of dice to 1 in case of errors in the
sccr tables, this should be fine.

Looks fine.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
