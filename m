Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEADCC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BImMQTVl0TQhSSY8a7B0XPcIKg3+tciJ/ZGRLQ5PzA8=; b=XktQEtEpaIP1z6
	vjERt4/pAt8j2ZrdzAsOzh/5JSwj9ITIYJl4gkta813Wr2dJUTzlu8yLG0sliDdB33XKWnTRekua4
	/8cCEgSPMm23b8C2CYdJdFVsN4lYIhLM1cKYEK5+8hWEBadCaHaoINaJV083BWPfwayq6iTxkJJk9
	95gtyhI2maQKMe/b7nPeY2IGW4297PPnv96/l/DrS7eYlIgzlIH8n+fIU7MlQbQWdXhbJO+BQ12sJ
	N+Y6OV+574XSE3MNG6EMq2UO5d/5BMpeVQKzgmCyNazyJf42fdsWbhZU3zNokDh+WcfUPp62pO+HB
	ODknIotnHJkeelbn2jAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFCBf-00Enth-JG; Wed, 02 Feb 2022 09:44:27 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFCBc-00Ent3-6P
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 09:44:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so6266304pjt.5
 for <linux-mtd@lists.infradead.org>; Wed, 02 Feb 2022 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UDfmOMxv9TaP9qFwvxrugJujZygcmAeLepyYzu+QD5Y=;
 b=p2quqv7wv5Wy21WwNq70shqEtK2anjlmwA8ZVJf2e4WzEACpKoxFwKLq/dNUpOyfmg
 +PXq5UmjNpshpVoKto6bwTFxwM12zR3UCzWtYrLLa5mpQUkVkL7rHwVxnmcLyVYFLJeL
 muKCLOZvr681eN04fxOzAcG8ZVRK0HYW8Ok3Eyw4PGEDFE7df/BCnDulhs9qsa1Vv3yY
 cmTIfjUWnBcqWouImAzTUdkwe5dKzEO2rrs+tLMHN1JelmN8jvMP/728L0yMAA3R9soW
 URAWPDY0faYgm+3B95a0xMWsE9PXx0DbdkE6sNAXUhLbYFRrHrYjtUFsjpR353NFkmXv
 p9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UDfmOMxv9TaP9qFwvxrugJujZygcmAeLepyYzu+QD5Y=;
 b=upxaOyhw+EVj+cRFOW7vZ1zE2PGpLjJPZ5ng1Xx2ha5+pvJ4nh153B8y0hJmU2bdV5
 umt9CLgUFYu0JfCghlzauLGM9RrTo6LqL3rs+09oaupml0L10v2ack/00ZVEka7fARjF
 75r2+bUPfwMnkLOVSD9G16Ta3mdp+SW+pTFkm62Gk3tEjl9FxZcNCLK43up8AW8FxFxL
 fJSPweQ5an7Ng0fioLRx8ApT7Z7f/nD9SJD7NpxBBeKpKCUPs7+1dCbArQJBpVLxeTwc
 jmyL+0bF3P2cA4tkgqL8EqKNXn/1wXBY366cP4c+XA2nvHRK7o42KQI3R2tqqxCPHHW7
 9o7A==
X-Gm-Message-State: AOAM531TC7g0jNG1fAMhqu+cwbZ2G7QV90rq+w1b6tUOFboUHf5Mi0Xq
 NdovhK+WnPsWO9/Gi9NZ4QjCm0Lw/uI=
X-Google-Smtp-Source: ABdhPJxMr8r0i3Jme693h4lsdcZhH1Ot8zZFGVIfYtdwUzBOmxLhUvDJQ9hGR+u1rRskSJpBCz7hSQ==
X-Received: by 2002:a17:90b:3a90:: with SMTP id
 om16mr7112749pjb.111.1643795062252; 
 Wed, 02 Feb 2022 01:44:22 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 j6sm10075951pfu.18.2022.02.02.01.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 01:44:22 -0800 (PST)
Message-ID: <4fb35ef5-a308-cb5d-8f19-acb5d1254ee1@gmail.com>
Date: Wed, 2 Feb 2022 18:44:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <51eb0f45c2d03cc12ad5959410c88c69aa856df7.1626677855.git.Takahiro.Kuwano@infineon.com>
 <8244e2d8-9d45-79a0-e99b-584c033e194b@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <8244e2d8-9d45-79a0-e99b-584c033e194b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_014424_289926_1174D682 
X-CRM114-Status: GOOD (  30.67  )
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

On 1/28/2022 7:27 PM, Tudor.Ambarus@microchip.com wrote:
> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
>>
>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>> uniform sector sizes are supported. This is due to missing or incorrect
>> entries in SMPT. Fixup for other sector sizes configurations will be
>> followed up as needed.
>>
>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Changes in v7:
>>   - Add missing device info table in v6
>>
>> Changes in v6:
>>   - Remove 2Gb multi die pacakge support
>>
>> Changes in v5:
>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>
>> Changes in v4:
>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>
>> Changes in v3:
>>   - Remove S25HL256T and S25HS256T
>>   - Add S25HL02GT and S25HS02GT
>>   - Add support for multi-die package parts support
>>   - Remove erase_map fix for top/split sector layout
>>   - Set ECC data unit size (16B) to writesize
>>
>>  drivers/mtd/spi-nor/spansion.c | 90 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index ca50e77b4220..c7170477e706 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -220,6 +220,84 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
>>         return 0;
>>  }
>>
>> +static int s25hx_t_quad_enable(struct spi_nor *nor)
>> +{
>> +       int ret = spansion_quad_enable_volatile(nor, 0);
>> +
>> +       /* Reset WEL bit in any error cases */
> 
> the comment suggests an if (ret) then spi_nor_write_disable(nor);
> Should you call write disable in all cases or just in case of errors?
> 

I need the if (ret).

>> +       spi_nor_write_disable(nor);
>> +
>> +       return ret;
>> +}
>> +
>> +static int
>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>> +                        const struct sfdp_parameter_header *bfpt_header,
>> +                        const struct sfdp_bfpt *bfpt)
>> +{
>> +       int ret;
>> +       u32 addr;
>> +       u8 cfr3v;
>> +
>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
> 

The core does not handle this due to SNOR_F_4B_OPCODES flag set in the
spansion_late_init(). And... 

> why don't you let the core handle this for you? Why do you call it here?
>> +       if (ret)
>> +               return ret;
>> +       nor->addr_width = 4;
> 
> so SFDP gets the addr_width wrong?
> 

the BFPT parse gets addr_width = 3 (BFPT_DWORD1_ADDRESS_BYTES_3_OR_4).
Since  Read and Write Any Register rely on addr mode, I would like to sync
device's addr mode and addr_width here.

>> +
>> +       /* Replace Quad Enable with volatile version */
>> +       nor->params->quad_enable = s25hx_t_quad_enable;
>> +
>> +       /*
>> +        * The page_size is set to 512B from BFPT, but it actually depends on
>> +        * the configuration register. Look up the CFR3V and determine the
>> +        * page_size.
>> +        */
>> +       ret = spansion_read_any_reg(nor, addr + SPINOR_REG_CYPRESS_CFR3V,
>> +                                   nor->addr_width, 0, &cfr3v);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ))
>> +               nor->params->page_size = 256;
>> +       else
>> +               nor->params->page_size = 512;
> 
> isn't the else case already covered by BFPT?
> 

Yes, it is covered. I will remove the else case.

>> +
>> +       return 0;
>> +}
>> +
>> +void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
>> +{
>> +       /* Fast Read 4B requires mode cycles */
>> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> 
> Is the BFPT wrong? Why do you update the num_mode_clocks here?

There is no entry of Fast Read (1-1-1) params in the BFPT.
However, let me check this again.

>> +
>> +       /* The writesize should be ECC data unit size */
>> +       nor->params->writesize = 16;
>> +
>> +       /*
>> +        * For the single-die package parts (512Mb and 1Gb), bottom 4KB and
>> +        * uniform sector maps are correctly populated in the erase_map
>> +        * structure. The table below shows all possible combinations of related
>> +        * register bits and its availability in SMPT.
>> +        *
>> +        *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Available in SMPT?
>> +        *  -------------------------------------------------------------------
>> +        *      0    |    0    |    0    | Bottom     | YES
>> +        *      0    |    0    |    1    | Top        | NO (decoded as Split)
>> +        *      0    |    1    |    0    | Split      | NO
>> +        *      0    |    1    |    1    | Split      | NO (decoded as Top)
>> +        *      1    |    0    |    0    | Uniform    | YES
>> +        *      1    |    0    |    1    | Uniform    | NO
>> +        *      1    |    1    |    0    | Uniform    | NO
>> +        *      1    |    1    |    1    | Uniform    | NO
>> +        *  -------------------------------------------------------------------
>> +        */
> 
> did you miss to update erases here?

No. The table is just as info for users. I will move the table to function header.
The uniform (typically used) and bottom (factory default) are detected correctly.
So, I would like to leave this as it is. 

>> +}
>> +
>> +static struct spi_nor_fixups s25hx_t_fixups = {
>> +       .post_bfpt = s25hx_t_post_bfpt_fixups,
>> +       .post_sfdp = s25hx_t_post_sfdp_fixups
>> +};
>> +
>>  /**
>>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>   * @nor:               pointer to a 'struct spi_nor'
>> @@ -468,6 +546,18 @@ static const struct flash_info spansion_parts[] = {
>>         { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>                              SPI_NOR_4B_OPCODES) },
>> +       { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
>> +                            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +         .fixups = &s25hx_t_fixups },
>> +       { "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
>> +                            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +         .fixups = &s25hx_t_fixups },
>> +       { "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
>> +                            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +         .fixups = &s25hx_t_fixups },
>> +       { "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
>> +                            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +         .fixups = &s25hx_t_fixups },
>>         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>>                               SPI_NOR_NO_ERASE) },
>>         { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
>> --
>> 2.25.1
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
