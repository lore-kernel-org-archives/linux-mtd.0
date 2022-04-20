Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5A9C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 05:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAa8vzERXMU4iT9zLJHdjD2UI3OHxYXeBVD1gEnnnj4=; b=oRRR0C7yd7h7LW
	M0EOe2l+XhkHty083p3jCTNkdfJDmGjwaKb1fdygGCdKOzHWYCbw/GJNcQK4TFye2Yt2plo+13Tzy
	6Yi4Pr9u5v+4+k0nYsQIz1WdJFB9jaY05Di355n6KZ8YlAXmnL5qp8laW3qb2UoyqspjrNQGeqkR7
	FFyFulNKmMyHFXlL02q5TSbo5Rmmat20owIkTghLUMvTJK4BaSXOWZidtHullmhKtiA4K1mK2AJvl
	uJUAu5BHGlSyBvbrsStuhAWBn7OUoQi4hKjJr0a+au5xy1UUQEmP30eEJSB2y1Rk3NPfEIFWAlw6P
	RTPapMrhBv2i9otCB+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh2z6-007Qqt-Bf; Wed, 20 Apr 2022 05:34:36 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh2z3-007QoW-62
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 05:34:34 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so1024023pjf.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 Apr 2022 22:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zTP62sMtntoRKadq9DuTq/QAWSCcC1lU5R/29tcZKU0=;
 b=DBd9e+jFZv8wjyS9BuZtKq5yoKJvpBaRKQguGnJiJBvOKwSLq89Lm9Y4NUVRMz5Apy
 7Tpfmby+U3wuZH6Oj0HfdCI209e9ZF47rs0hGxtDzkxVG+tmUvt28SS0HwKBAOFHu/L2
 4Kh4UfXEr3YgzPu2lPJyHaa0OUdmclBMw+qqLze6f/hEInYxs0uuaQPlYjI0lzzVWa1N
 EEGRoDwvQ3tuU+EGluvbk49bLmvKSB5fd2QsZCp39DUXuVmu0ubhz08qWtVLkoh4B7vE
 Nad7v4hm53qIQgG7rcGS9RqcKqFAIBFrIRzykcYYERYz4J9VqNcsW8FlfzrJ04y3BA+B
 6TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zTP62sMtntoRKadq9DuTq/QAWSCcC1lU5R/29tcZKU0=;
 b=WbCjVyyvGyxFoSL6cMmQuK6TvFx0PJtOIhLcJDCTbe42eMcH0LwkSxWvj35TT56y06
 ANWemHm4OYCpBC9D07BnW/S4wHwAr72ipJ1dPEtXBOm+R+gZywbj9oMEbSajU75lc6Gv
 4rBAGW0YdDnKcoejJgYuITrIXiTvdVrDf7NTxFOo6mpBMZw7jYOsCcOaGNlVwK+txtm7
 xPZuP+JAy2qF8wJpRPeQRrlNjk5b5c3JV43G9tiMlIWX7a9d8nMbQxjYdvJTmJyzUP5K
 021V2JjzsD1Kb3jAmH46RPVDX9rzJZv5D6NjL1i/FriBDbd+g5SmFpzMSFg4k1coKnKP
 oGaQ==
X-Gm-Message-State: AOAM533d5Z4im3y/jWnAeHAowEMryDoVFL5V9b7eQc+sbttwA0DjWBMl
 G7ylV6bn/7WLtj4iPsoZENs=
X-Google-Smtp-Source: ABdhPJysoXPAS7HeUNwEm+I8acKcZ1cQJ54F2tb/KXJbFr1GaC2nZty4kF1gBhFT2qIm9D6WGbyERw==
X-Received: by 2002:a17:902:6ac1:b0:158:a295:ba71 with SMTP id
 i1-20020a1709026ac100b00158a295ba71mr19306690plt.49.1650432868448; 
 Tue, 19 Apr 2022 22:34:28 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a17090a674f00b001cba1008a3csm17716605pjm.51.2022.04.19.22.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 22:34:28 -0700 (PDT)
Message-ID: <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
Date: Wed, 20 Apr 2022 14:34:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_223433_288083_A1047D7F 
X-CRM114-Status: GOOD (  32.65  )
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

Thank you for your feedback.

On 4/19/2022 6:32 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
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
>> Changes in v11:
>>   - Cleanup fixups based on other patches in this series
>>
>> Changes in v10:
>>   - Cleanup fixups and ID table based on other patches in this series
>>
>> Changes in v9:
>>   - Use late_init() hook to fix mode clocks and writesize
>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>   - Use MFR_FLAGS for USE_CLSR
>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>
>> Changes in v8:
>>   - Call write_disable in error case only
>>   - Use spi_nor_read_reg() helper
>>   - Use nor->bouncebuf instead of variable on stack
>>   - Update ID table to use FLAGS macro
>>
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
>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 493240ebfd70..dd37b829efbc 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>>         return 0;
>>  }
>>
>> +static int
>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>> +                        const struct sfdp_parameter_header *bfpt_header,
>> +                        const struct sfdp_bfpt *bfpt)
>> +{
>> +       int ret;
>> +
>> +       /*
>> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
>> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
>> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync
> 
> Hi, Takahiro,
> 
> I would like some details, please.
> 1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
> addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?
> 
If we are sure that the Flash is in 3-byte address mode, we can use the value 3
for reading CFR3V. However, the Flash's address mode may be changed prior to
Linux MTD probe in some use cases. Actually, in u-boot, it is set to 4-byte
address mode. We need to set the Flash's address mode in known state and update
nor->addr_width accordingly. Due to SMPT issue below, value of 4 would be better
choice.

> 2/ Where in SMPT parse? I looked through the code and couldn't find the Read Any
> Reg op used. Why do you need an addr_width of value 4 in SMPT parse?
> 
In the spi_nor_get_map_in_use(), the nor->read_opcode is set to 0x65 (=Read Any Reg).
The spi_nor_smpt_addr_width() returns the value of the nor->addr_width due to
SMPT_CMD_ADDRESS_LEN_USE_CURRENT. The nor->addr_width is set to 4 in the 
spi_nor_parse_4bait() before SMPT parse. Therefore, the host issues Read Any Reg
with 4-byte address. We need to set the Flash into 4-byte address mode in advance.

> 
>> +        * Flash's addr mode and nor->addr_width here.
>> +        */
>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>> +       if (ret)
>> +               return ret;
>> +       nor->addr_width = 4;
>> +
>> +       /* Replace Quad Enable with volatile version */
>> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>> +
>> +       return cypress_nor_set_page_size(nor, nor->addr_width);
>> +}
>> +
>> +void s25hx_t_late_init(struct spi_nor *nor)
>> +{
>> +       /* Fast Read 4B requires mode cycles */
>> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> 
> Isn't this info already handled in BFPT? What value of num_mode_clocks
> do you obtain from BFPT for the non-4B opcode?
> 
There is no parameter in BFPT that describes about Fast Read 1-1-1 op
(as we can see 'struct sfdp_bfpt_read' in sfdp.c).
The value of num_mode_clocks for Fast Read 1-1-1 is set to 0 in
spi_nor_init_default_params().

>> +
>> +       /* The writesize should be ECC data unit size */
>> +       nor->params->writesize = 16;
>> +}
>> +
>> +static struct spi_nor_fixups s25hx_t_fixups = {
>> +       .post_bfpt = s25hx_t_post_bfpt_fixups,
>> +       .late_init = s25hx_t_late_init,
>> +};
>> +
>>  /**
>>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>   * @nor:               pointer to a 'struct spi_nor'
>> @@ -384,6 +422,22 @@ static const struct flash_info spansion_nor_parts[] = {
>>         { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>> +       { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
>> +               PARSE_SFDP
>> +               MFR_FLAGS(USE_CLSR)
>> +               .fixups = &s25hx_t_fixups },
>> +       { "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
>> +               PARSE_SFDP
>> +               MFR_FLAGS(USE_CLSR)
>> +               .fixups = &s25hx_t_fixups },
>> +       { "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
>> +               PARSE_SFDP
>> +               MFR_FLAGS(USE_CLSR)
>> +               .fixups = &s25hx_t_fixups },
>> +       { "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
>> +               PARSE_SFDP
>> +               MFR_FLAGS(USE_CLSR)
>> +               .fixups = &s25hx_t_fixups },
> 
> After we establish the details from above, would you please run this test_qspi.sh
> script for all the flashes?
> 
> #!/bin/sh 
> dd if=/dev/urandom of=./qspi_test bs=1M count=6 
> mtd_debug write /dev/mtd0 0 6291456 qspi_test 
> mtd_debug erase /dev/mtd0 0 6291456 
> mtd_debug read /dev/mtd0 0 6291456 qspi_read 
> hexdump qspi_read 
> mtd_debug write /dev/mtd0 0 6291456 qspi_test 
> mtd_debug read /dev/mtd0 0 6291456 qspi_read 
> sha1sum qspi_test qspi_read 
> 
> The two SHA-1 sums must be the same to pass this test. Send us the output,
> please.
> 
OK.

> thanks,
> ta
> 
>>         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>>                 FLAGS(SPI_NOR_NO_ERASE) },
>>         { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
>> --
>> 2.25.1
>>
> 
Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
