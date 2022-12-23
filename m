Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0411DC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Dec 2022 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXaumplF5zSMoaNEYrT+SU3w419nflACBs8NDvHmDXk=; b=ydmLLrlrU0DUc/
	cWEaQx2D61d49D0L9gjL/sfNLefmQYsVCmTh/fPn9jCKfr89fQwLbjivTadjhWA0qQsCf3lTgNpE/
	FG7ymIqWG2orHlIYm7WZ3n4AP8hY6iewpUbN4nQm5BTVm7v3GEsalO1rusg8KBWCwxKoDg4/K8xof
	4qtwQSmC8fGsF4zzaRjJAs/psEgWIxGtiXg4fDRr6Vc2EG0pFUAohhZbRc0mJPyGAKwD3X/Mxlcna
	3xGLJ5qrM2YbSdGvw7SWISntaVie4dZdDG17Dwnz+TcVlykbq5xnH0yDdPtX6IMdGVLvvcnuBDq5i
	0dhNq/TPURgnCEj0oGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cbY-004pNZ-I7; Fri, 23 Dec 2022 07:36:32 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cbP-004pIo-E3
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2022 07:36:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id i9so6064730edj.4
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 23:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EmR013QRf1fWL3Wf6uAgIc7+JbR803zpXCdpiOvV2uQ=;
        b=KMEt6Q/6JPfnxC5KG/dFSUMDXYFT2kw/qoB8CuZIqHJFVjvMboQYx6b+rDJCyrYtUs
         YgwW3JcNV5f6S9Sga7lRi8VYISr4f5ol/u83jwnxVz6ncXuM/z2uNmlyq1EkS38vM/VO
         0Rw/CoWJAHDQTOgcnMKbXSs8JeY9S1mb8WVbDxp6UGtKqHnD5gbbPQiHeSYazXR0Z42i
         Rhx9h+JwNdOz0MxWBWYJKfTcBfuGgNz8a8nmp3OomHolh9rmQNeuI3RZiYCuCiXe1oDS
         y3zi6OOYIgJbJMzSFl7TfgQ5JU4aV+OhSCaJ0KoimVdWnQ0/cX9+4SSayt5P3OhCYbB8
         FJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EmR013QRf1fWL3Wf6uAgIc7+JbR803zpXCdpiOvV2uQ=;
        b=Zl9WTZxADveZncZaH1BXxVFaRCYLaQYhba1WzjOyfUOrX8I48g3vkSKS7Eia08c6EQ
         0Du/KNA2usjAMEh3PS8ZLUTXdnce7BNNJ6QbCcni5gi7MZLISXbnp4IXL10nVR9+s8Ce
         g0+hEd0TH2gtNb+QFzzct2pxjmYzXI013HvDlUFsU1a+6ioX15DHVYHJ1/yMMh6LgHXb
         8lojEedjfaks9YUKE0BPsU76VNVa+d9QrFziQctWRqt18CD64S5nVAJoaDBsiOZAQ5bN
         tolbyO83tGGJLxTb7aVThp1f7B7hth6aGVB/FS2qM4DLGRRTB//krwA2i5KBqtMn8+0U
         395w==
X-Gm-Message-State: AFqh2koxeT83xCXmsNPpKH7GavNd3bt0xfNvXknAeOYq0yleJavRxjM0
	FdaydLnlTE0oxGmbwYxBOp7j9voQjQaQ/IOL
X-Google-Smtp-Source: AMrXdXtuTwAg5RjWyUc93bmIVJM6gopMtCBurDlWnjE2MpFipHZ3JaA47fADskD9XCzsjbBD1gBxoA==
X-Received: by 2002:a50:ee0d:0:b0:461:568b:fb22 with SMTP id g13-20020a50ee0d000000b00461568bfb22mr7378642eds.8.1671780977990;
        Thu, 22 Dec 2022 23:36:17 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id c25-20020aa7d619000000b0046c53c3b2dfsm1177650edr.38.2022.12.22.23.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 23:36:17 -0800 (PST)
Message-ID: <50792a0d-f1f2-4c61-36d0-c0f29bc8fcf9@linaro.org>
Date: Fri, 23 Dec 2022 09:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for
 optional parameter tables
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
 <84bd91b96d6824e0c1b3f8a5e33e3e392e7113e7.1671684805.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <84bd91b96d6824e0c1b3f8a5e33e3e392e7113e7.1671684805.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_233623_601574_76220782 
X-CRM114-Status: GOOD (  18.67  )
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



On 23.12.2022 09:21, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Change 0-based indexing values of parameter tables to 1-based ones by
> SFDP_DWORD() macro.
> 

marvelous! The series is looking good. If you want to resubmit for those
small comments, fine, otherwise I'll handle them when applying.

Cheers,
ta

> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/sfdp.c | 28 ++++++++++++++++------------
>   1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 5c2ab868707b..3acc01c3a900 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1004,7 +1004,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>   
>   		discard_hwcaps |= read->hwcaps;
>   		if ((params->hwcaps.mask & read->hwcaps) &&
> -		    (dwords[0] & read->supported_bit))
> +		    (dwords[SFDP_DWORD(1)] & read->supported_bit))
>   			read_hwcaps |= read->hwcaps;
>   	}
>   
> @@ -1023,7 +1023,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>   		 * authority for specifying Page Program support.
>   		 */
>   		discard_hwcaps |= program->hwcaps;
> -		if (dwords[0] & program->supported_bit)
> +		if (dwords[SFDP_DWORD(1)] & program->supported_bit)
>   			pp_hwcaps |= program->hwcaps;
>   	}
>   
> @@ -1035,7 +1035,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>   	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
>   		const struct sfdp_4bait *erase = &erases[i];
>   
> -		if (dwords[0] & erase->supported_bit)
> +		if (dwords[SFDP_DWORD(1)] & erase->supported_bit)
>   			erase_mask |= BIT(i);
>   	}
>   
> @@ -1086,7 +1086,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>   
>   	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
>   		if (erase_mask & BIT(i))
> -			erase_type[i].opcode = (dwords[1] >>
> +			erase_type[i].opcode = (dwords[SFDP_DWORD(2)] >>
>   						erase_type[i].idx * 8) & 0xFF;
>   		else
>   			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
> @@ -1145,15 +1145,15 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
>   	le32_to_cpu_array(dwords, profile1_header->length);
>   
>   	/* Get 8D-8D-8D fast read opcode and dummy cycles. */
> -	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[0]);
> +	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[SFDP_DWORD(1)]);
>   
>   	 /* Set the Read Status Register dummy cycles and dummy address bytes. */
> -	if (dwords[0] & PROFILE1_DWORD1_RDSR_DUMMY)
> +	if (dwords[SFDP_DWORD(1)] & PROFILE1_DWORD1_RDSR_DUMMY)
>   		nor->params->rdsr_dummy = 8;
>   	else
>   		nor->params->rdsr_dummy = 4;
>   
> -	if (dwords[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
> +	if (dwords[SFDP_DWORD(1)] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
>   		nor->params->rdsr_addr_nbytes = 4;
>   	else
>   		nor->params->rdsr_addr_nbytes = 0;
> @@ -1167,13 +1167,16 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
>   	 * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
>   	 * flashes set the correct value if needed in their fixup hooks.
>   	 */
> -	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
> +	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[SFDP_DWORD(4)]);
>   	if (!dummy)
> -		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
> +		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ,
> +				  dwords[SFDP_DWORD(5)]);
>   	if (!dummy)
> -		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
> +		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ,
> +				  dwords[SFDP_DWORD(5)]);
>   	if (!dummy)
> -		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
> +		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ,
> +				  dwords[SFDP_DWORD(5)]);
>   	if (!dummy)
>   		dev_dbg(nor->dev,
>   			"Can't find dummy cycles from Profile 1.0 table\n");
> @@ -1228,7 +1231,8 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
>   
>   	le32_to_cpu_array(dwords, sccr_header->length);
>   
> -	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
> +	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
> +		      dwords[SFDP_DWORD(22)]))
>   		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
>   
>   out:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
