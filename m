Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B5AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tkt0TDfJ0y+WwSv1tJ9HwS/To71Vpc76ayuKXMBfnZI=; b=DoelRHMW+Xa4UZ
	K0i0VSBxLAD1UUPD9kWI7kV0u602TormQzogNG4N36XJXPaOzUqhqeZ5JnigvXjdwt0MP/siS4Lyh
	xWX8/HfeaZLCIu0kjPf8wJ+aJu6cRgmc6o6LY9d1BYJDU54aca4j7TpFF5zcI1KO06hdFX9UdqA82
	7VohdYkG1U+gQ9FRqDaXE/L9Y5NVpEdELY0seh8e2PKEIxQhIxBWV4ATQQzw7GIMbdt9NZBbu3peB
	4dJqm5FoaB/ywEugL0E34fhxyGlGeyJyZ7TCH+ZUfBZ5Uv6K6gfv+4o17p+C8oOBnmL+am4PgzRU1
	ht90x8bJwTMP4RKqf/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9b9-009Hqo-7q; Wed, 04 May 2022 07:38:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9b6-009Hpt-O8
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 07:38:58 +0000
Received: by mail-pj1-x1036.google.com with SMTP id iq10so539383pjb.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 00:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XHH7Vw5dUzaEVyh1MoC4Kmlw01gWY9rKgu00sC/lMTc=;
 b=oHFKiWApiuYhaXBv8jxLfuBqawLQpIa3S0tgCWGO9MRYVlpXVWGBgTlK+srPbNrF1v
 2LUt1IyQ//47DXx2o0CljPRyJiAY1HkZfGtUGy+DD85fzNUbDgJ4LuZJ2SNOlLkKPYqM
 GMznulLjmHaOORozFvylhaP4Et6V7051cADelUTUW7Q5Mz+NWGEpbEqE62og4Be2ITMK
 9EP0ppfi+ktdZjiQt6Xuk/F+GtyVyYNLayh5AhRfuMMq06TrcEoINvKCxgAwzlgTaphe
 6KHfiBxBVWo3JctzVX6nkY928ib7myQKw/nA50QAsZq7GDheJzmpaMS1oxqi6o0dpbRo
 oofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XHH7Vw5dUzaEVyh1MoC4Kmlw01gWY9rKgu00sC/lMTc=;
 b=bSJl26ITt2uAUXl6ssVYPBxrYJ2QQswCE24cpFXsqh9YTVn6ScIW8F39mCvwPiuKZH
 ur4by7p1GaI6ffNAa/enUYY/Phk8gvBN+FI7qtAAWCqHDPoDPJNfXCEilmjd6R/l9o/f
 foLGJ2xv1VNpfPI2URrRb+fNq0VUcoSvb0oJynRt4SP+G2W/QSb8+dgaPEQNsHmmdxhG
 XpgyYJldGbmeIzFWVQYkybMaOGADiCParXWMfuAbZR3tl2t+I5GwDpSsAEULQEdS7U5p
 z2w3vpzvsofynpHaLgx1oVEIWkaXg3mh1jk9+KOt7OV2LUh1QvcLTNu0xRX9EmnDj/fl
 nk/g==
X-Gm-Message-State: AOAM533h7Kqq1Fkfb2PDUTHXu+N/C84VEyroLQpXHu3GFhK5JXwg9QkS
 HYULBNM8PWQf/WSRsoCM9Ys=
X-Google-Smtp-Source: ABdhPJyW1Hn8/+WILJOuqYqyJ5CLVM24iYW0UuQMWdQDjBILwA/duIWSAqlVhXYTXUvoYpVXjKUvTQ==
X-Received: by 2002:a17:902:d50a:b0:15e:9528:72ad with SMTP id
 b10-20020a170902d50a00b0015e952872admr17289252plg.83.1651649934521; 
 Wed, 04 May 2022 00:38:54 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a170902e48400b0015e8d4eb1edsm7557095ple.55.2022.05.04.00.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 00:38:54 -0700 (PDT)
Message-ID: <6b343fd7-96f9-b2de-8eb3-196ddf91b93c@gmail.com>
Date: Wed, 4 May 2022 16:38:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v14 8/8] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@microchip.com>, p.yadav@ti.com,
 michael@walle.cc
Cc: miquel.raynal@bootlin.com, richard@nod.at, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
 <20220503081627.341870-9-tudor.ambarus@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220503081627.341870-9-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_003856_858563_A181E597 
X-CRM114-Status: GOOD (  26.01  )
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

Hi Tudor,

On 5/3/2022 5:16 PM, Tudor Ambarus wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
> 
> These Infineon chips support volatile version of configuration registers
> and it is recommended to update volatile registers in the field application
> due to a risk of the non-volatile registers corruption by power interrupt.
> Add support for volatile QE bit.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 125 +++++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index e130f5398763..f78a15b985ea 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,6 +14,8 @@
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
>  #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
> @@ -113,6 +115,63 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +/**
> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
> + *                                      register.
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * It is recommended to update volatile registers in the field application due
> + * to a risk of the non-volatile registers corruption by power interrupt. This
> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
> + * also set during Flash power-up.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	u8 cfr1v_written;
> +	int ret;
> +
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_nbytes,
> +					  SPINOR_REG_CYPRESS_CFR1V,
> +					  nor->bouncebuf);
> +
The following lines are missing.

	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
	if (ret)
		return ret;

> +	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +		return 0;
> +
> +	/* Update the Quad Enable bit. */
> +	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_nbytes,
> +					  SPINOR_REG_CYPRESS_CFR1V, 1,
> +					  nor->bouncebuf);
> +	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	cfr1v_written = nor->bouncebuf[0];
> +
> +	/* Read back and check it. */
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_nbytes,
> +					  SPINOR_REG_CYPRESS_CFR1V,
> +					  nor->bouncebuf);
> +	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->bouncebuf[0] != cfr1v_written) {
> +		dev_err(nor->dev, "CFR1: Read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
