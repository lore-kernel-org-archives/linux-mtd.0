Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610DCC7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85HL974Yn4o/m04RgXFwf41CncFewhCgB1ZiZ3uki6s=; b=Pkm/tzmss5fXh0
	inpCr7z4u+01QI02fZkp9BA1KKLtMLNAMiyjYHNups5TXSCAZz4lx0eGCB5CbM+idGd5tY367mU+V
	7qzFAAktL8XJSpbwxpB7bvD833UYcTkFp800/hMWquUHTa/DabUlVrnb0Io1B6e9bLEaCWWNBCFA5
	6s7salAH9buAkYEvH2Vviy6MmF3EvaCclwZ1O4NjkKwAOTfelgP6A+b9zCokqb6cFRCnzIu2mQn0o
	ecgD1KN+RcDhCS/Vc2Y5PKAB3Pl0x76u6AlHnuQB3a85ENk2pfYxVSyWRfGFo5nh/hoISGIjO/bac
	XTGDhLa+5LGhp7B9PoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gVC-003yaJ-3A;
	Mon, 12 Jun 2023 12:18:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gV9-003yZP-38
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 12:18:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so6135239a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686572305; x=1689164305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LwHFgrtNKs0I5KFwE85uCWXWmvJxouplbyWbwJGOkdY=;
        b=YE+pEdt+zKThjzD2leZmm8gl+auEW9mkZzTx0i+rcFeMDSn2N2oglfbw1xKeO1s0tI
         dkZ5dulrAD38iL9hEoWIStgFnEyFDRcWScMgZW1pvDQz5lzpZSPHKjIP3j8Oerm6uSpi
         0Qs0Tz0d4UGhZZ4ZbSsi/z4/pZR5rGfnlZS5V6uQ7xfkqnJOWrGu/eNoYsmkYuH1xfYy
         4jE6ny6Cl2BBul2jwFKEwEbLRaFA9EN/XIWqyxqB3K6VRUDB2VZo2Gd9y2qNV9oXWCK5
         vaolQQljVwEor5Wd9LlBGZSMlDL19uY0Ltb4oX0NsGuwh0v/PaIh3osf9EolSFfXI8nV
         xHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686572305; x=1689164305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwHFgrtNKs0I5KFwE85uCWXWmvJxouplbyWbwJGOkdY=;
        b=LwMpKIxL9hzyFVdwdKZPYR6cXsHzOFCEQsA2Sr+Qxu8k/JybsVpJDtY/0bo5/9m3Lb
         Td5pOBV44YDxd0l7wEq1GWSHLDWFqYT3Mq7M4XrzrxH+iP/Ye0yp1kAsDXr538Ra+P3h
         kCqiHVziOV6Q/7255TEI+Hzw60x2qQHKEqyO/T/1NgzcaMSwYZp1EwxCzpODshsG3C/N
         9dYejX/b1LDAj83iw6CiiIUPjMi1G6beYmQwDDY5oSLZz/2YyzQjZMcbucrcblopv0J/
         uT+x/+AM1dqpGbep67M78/I+NWZXEgMf4hNgQhF8qHTZIi8T1QhXhDYbPyK3F5m3vDzm
         plVg==
X-Gm-Message-State: AC+VfDxRakgImDtGpsmLMtILHaaO9Ym9e5jr1STXyPGj+YolPSDZazZL
	mhuXj3DaCe/UEFiaaE6YqOP3+A==
X-Google-Smtp-Source: ACHHUZ6757Edcyk8VM5NmKx4V5K5ZeE+CvUA0jKbqe6pGmEAsB5rwHFxTM3fqpNnRtNzh/WmKIGphQ==
X-Received: by 2002:aa7:c904:0:b0:514:9e3c:d826 with SMTP id b4-20020aa7c904000000b005149e3cd826mr4592850edt.5.1686572304703;
        Mon, 12 Jun 2023 05:18:24 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id f16-20020a50ee90000000b0051425ba4faasm5028943edr.50.2023.06.12.05.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:18:24 -0700 (PDT)
Message-ID: <df6ce0f0-4dbe-ad93-27d5-9227a7627e96@linaro.org>
Date: Mon, 12 Jun 2023 13:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] mtd: spi-nor: spansion: Octal DTR support in
 RD_ANY_REG_OP
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
 <5322b787dc0a2943d2563d433216429b47ce7ff8.1686557139.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5322b787dc0a2943d2563d433216429b47ce7ff8.1686557139.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_051828_014601_B4973159 
X-CRM114-Status: GOOD (  17.54  )
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



On 6/12/23 11:04, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> S28HS02GT uses RD_ANY_REG_OP to read status of each die. In Octal DTR
> mode, RD_ANY_REG_OP needs dummy cycles (same as params->rdsr_dummy) and
> data length should be 2.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index eda3731c17be..8b8512402639 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -103,11 +103,17 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
>  
>  static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
>  {
> +	struct spi_nor_flash_parameter *params = nor->params;
>  	struct spi_mem_op op =
> -		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes, addr,
> +		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, addr,
>  					  0, nor->bouncebuf);
>  	int ret;
>  
> +	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
> +		op.dummy.nbytes = params->rdsr_dummy;

yet another dummy nbytes nonsense.

$ git grep rdsr_dummy drivers/mtd/spi-nor/core.h
drivers/mtd/spi-nor/core.h: * @rdsr_dummy:              dummy cycles
needed for Read Status Register command

rdsr_dummy is defined as number of cycles and here you assume it's in
bytes. Who's right?

> +		op.data.nbytes = 2;
> +	}
> +
>  	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>  	if (ret)
>  		return ret;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
