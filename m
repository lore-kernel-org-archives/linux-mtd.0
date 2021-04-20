Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06367C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 05:49:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB74613AE
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 05:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB74613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kgWyddQBotch3eK/+4GNyiObt4glrDlkIJNTL7gcirs=; b=E8bJxAmSSq5PzjtgqmtWIVvqU
	dVE35p5E3YT++KX9rcelOi5PR+uCVu/HR5HU+Ukukr1pmtRvspGznnxi5O3OgkfLp0XCDQW1i4V7O
	wFUBo3uDRrZw+lU4NoYQMOL9wajeaM17rMXQKHsDkqr4XNbVwA/CRbDC+BhFhF9S8TFUgzOFbws3r
	sULmjJNMXadtU6QK/ZLi5DmlKhNQ+tSOJVsTbA6IAVx6Z0jMYQBNmLTVr2+jrN2UnE19VDnvknOjD
	/ql62zLQdeuL9iYEpL2Qb3/SjsuHfWUL98qRIWlOzh3vm1y+0cTREBbkjS6A33Wka7wG9hlt5p2/O
	FthFqre9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYjFR-00BHHA-9S; Tue, 20 Apr 2021 05:48:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjFN-00BHGy-DU
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 05:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=lFrYoVwF8BP1WGD5j6NkSeEfXpx8zimcm5/lgLP/iTk=; b=pbcxEDgqLQUGGgtcSWFqEbJobU
 kvqOsnTcYwftBlp/Su5cvf7JMg0N5AMhQTfFoIIE5aMiprX//l/unAVDpepDJ2GjCQioEhFC+K1Kr
 wvHO+DNj8L9ih8oMlkjAMAvZZkz/Y40Qyx1xrzfEuv+GY/1tMvnYDkpivHk9aSxEjTyPheSIFnnB0
 atulNudQV/A4eKNaUJZOBDYL88TZZAGhBHUCD68H70KaQ9j9B47UTxi36wDSjnJxD2Xin2XTg/lYn
 2+brrXLVlBjBz4sSAGPG7mFju3lAbj8Ovu0Pn6MpshxtY6yuEyt2wsTArdcXB3EgLdlT7W0b1pCC+
 gBL0UOjQ==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjFH-00BpKB-Nk
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 05:48:28 +0000
Received: by mail-pg1-x535.google.com with SMTP id p2so10398516pgh.4
 for <linux-mtd@lists.infradead.org>; Mon, 19 Apr 2021 22:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lFrYoVwF8BP1WGD5j6NkSeEfXpx8zimcm5/lgLP/iTk=;
 b=lzYTPVWUj+7eddNM71XaTNbQkm4XkhQ0OmMUgnAaO7uNpuJIAKix0bGfEM2NarKSFc
 KSzwI2U6kCdCzbEGK6mwtyKPCUxUw3Op9ZigsO9AwN+OPowg5AnxoHBODHpUAWvg3Ifk
 TZBF6zMbyuGyicTfhhBaRTaGtQil1VUKhUeDTOcRCE/lHfdIB2ZPBGj6TT3Yp0vfULXP
 tSmlLbQT6UdeS8Fb7Do5JInlxVrIGKgWcP2KauiuVjFxB7LAeb24xhRWAZRcD+PGGWbO
 gO1W0CJj1n10cOJ20vp+qbcmaomKM2ghkXemBIcQmAPX0KiqJ0SyEeIrzadjOZgz1FB4
 e7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFrYoVwF8BP1WGD5j6NkSeEfXpx8zimcm5/lgLP/iTk=;
 b=T8MUoEUXA2NkXHiPI7tUI7SimSEjRaba8HNJfn9epTSlliKVKmXkFIbzFlhEu0SYmy
 aWPQz1O8/Rzwxmkse4rI1wwDN+FqKc85qlQd4LmLhX80ynaN3VqAq6jHmIM2gKlI8T5p
 t6xkYlZngz02r2ptLOD4f8t4e8FSY/648WxMlgDJTh6WRzqUmnbM1zOAIJ2nqPUf/Xty
 ccDYSZvE/3eNX+XFUupfK58o0EMOSM/Nlli/f0hOCQm+Mqd9zbi6Xh8aHTm2rAxoWRG3
 p0RF9PDLfYZHr+eZdrAyUKzJBdw0boKKETO2MlvPvjF0d6rWuqKwG7IluWcytaopE6b/
 CTEQ==
X-Gm-Message-State: AOAM5309MgYxLfNxLExSSAiJVGFe1Q3BaeSz5jk7lxoiSkyhohf1sq3a
 Ccvd4aglt/08ogu1BkjsHxM=
X-Google-Smtp-Source: ABdhPJy6Vv9DrPaRCknXSfBRJuiEeO+faTczApH98bhk0MqCfKX397U6h40iCNIDp6qgmvcwy/TeqA==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr13417597pgp.258.1618897702478; 
 Mon, 19 Apr 2021 22:48:22 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id w1sm15438584pgh.26.2021.04.19.22.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 22:48:22 -0700 (PDT)
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <af93c67815185940b02e95dfddcedda0dd1a6d36.1616130675.git.Takahiro.Kuwano@infineon.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <b403fdf1-0260-788b-28e7-369efb40a334@gmail.com>
Date: Tue, 20 Apr 2021 14:48:09 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <af93c67815185940b02e95dfddcedda0dd1a6d36.1616130675.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_224823_975343_A115DF81 
X-CRM114-Status: GOOD (  22.82  )
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



On 3/19/2021 3:56 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Spansion/Cypress chips support Read/Write Any Register commands.
> These commands are mainly used to write volatile registers and access to
> the registers in second and subsequent die for multi-die package parts.
> 
> The Read Any Register instruction (65h) is followed by register address
> and dummy cycles, then the selected register byte is returned.
> 
> The Write Any Register instruction (71h) is followed by register address
> and register byte to write.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v4:
>   - Fix dummy cycle calculation in spansion_read_any_reg()
>   - Modify comment for spansion_write_any_reg()
>   
> Changes in v3:
>   - Cleanup implementation
> 
>  drivers/mtd/spi-nor/spansion.c | 106 +++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b0c5521c1e27..52a427d0af02 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -19,6 +19,112 @@
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>  
> +/**
> + * spansion_read_any_reg() - Read Any Register.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @reg_addr:	register address
> + * @reg_dummy:	number of dummy cycles for register read
> + * @reg_val:	pointer to a buffer where the register value is copied into
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
> +				 u8 reg_dummy, u8 *reg_val)
> +{
> +	ssize_t ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),
> +				   SPI_MEM_OP_ADDR(nor->addr_width, reg_addr, 0),
> +				   SPI_MEM_OP_DUMMY(reg_dummy, 0),
> +				   SPI_MEM_OP_DATA_IN(1, reg_val, 0));
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		op.dummy.nbytes = (reg_dummy * op.dummy.buswidth) / 8;
> +		if (spi_nor_protocol_is_dtr(nor->reg_proto))
> +			op.dummy.nbytes *= 2;
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		enum spi_nor_protocol proto = nor->read_proto;
> +		u8 opcode = nor->read_opcode;
> +		u8 dummy = nor->read_dummy;
> +
> +		nor->read_opcode = SPINOR_OP_RD_ANY_REG;
> +		nor->read_dummy = reg_dummy;
> +		nor->read_proto = nor->reg_proto;
> +
> +		ret = nor->controller_ops->read(nor, reg_addr, 1, reg_val);
> +
> +		nor->read_opcode = opcode;
> +		nor->read_dummy = dummy;
> +		nor->read_proto = proto;
> +
> +		if (ret == 1)
> +			return ret;

This is wrong. Will fix this to

		if (ret < 0)
			return ret;


> +		if (ret != 1)
> +			return -EIO;
> +
> +		ret = 0;
> +	}
> +
> +	return ret;
> +}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
