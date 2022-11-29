Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A198C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Nov 2022 04:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up+FCYDt7+ZhLmlm9yZwgi0xWQYfSZjIC6Ctudfw6wU=; b=ziD9Q5AqEkWU1e
	tvH21hg+gVdb54iFirR0ibRVFst4okqc4QaW2Y1ymezqaqL+TXqzVqLNsx0cAHCJr0+bsub7Yazfd
	BaQh/7LMYzSV08wrRsNrY4uy3QafWTn9do/L2MAjrNhZcKYbD6WOi44YAvAWTpT5GGU5DJmagKc2M
	KmYnxL8C2PLW2Y+6s6FaQVKo5Lg0T+xO7GPXbtfCAEgRRoyw98+r3S8AwrKTwdY15pFbQbBrZP/3L
	DbwcEvjoJHv11FX120zWGKXM5I/6VqpzQ0NzJIqm4pSXEVBUumoXt3Y3s4tZuK3CU3BmulZa8qYof
	ECggJ9iiZjwovufS/omw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozsbt-006CuY-0r; Tue, 29 Nov 2022 04:52:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozsbp-006CrK-9U
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2022 04:52:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id p24so8549746plw.1
        for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2022 20:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1+5tfRuqWTVsOgukn5eT735qWcREEDtuwFhVAis2ns=;
        b=SKhJ7IFWPCWvn97G1esf5ryu41DTYHaQj+LN784zZSyaN8xddxJJHH2hp55QSaWwbW
         6WVRTSGesO+2DOHanQ/NhXFZ4VG5cxnq3la4UF/tDAd7qyRIk4y5oIsD84tdxuHKWDE4
         rSuYvy8AUA50rd8nCdR7YK41k8KKijalrVoQy9+Bt1iU+UaIRv42ZQqVTTbhSzTDec7/
         xV1hPpkBOdG4xmiVUrVGPiJhpMVDbLsCnvdmsvbHL5ZD3DxSGbqTEtHE48sbuTkP1vei
         NzEMgl3B7EJiKC2M0/2SbvMO9DZwvjJqcwFVSWJWDrJRnQBZbMkvrOZBjAoswqUPwcrW
         aGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N1+5tfRuqWTVsOgukn5eT735qWcREEDtuwFhVAis2ns=;
        b=6nLrBxgTyUtwFsJpJcLaZ0u452vXsriyhT9AkHMb6+JpXMepH5FiKOgGpDI5scBmvD
         ugUZrkvdlhehEuv9saqduxPDpYT3TV4Sz8iTi+7S8zRji8b/i4oh4mZd/7YD8dK/MItU
         4Tj/uB9Zru1gtVfyNF2GOA4lAqDW4y9+EE1NHrEsAgEwC768Npyn6jqresA1YpeSk1p+
         suK4Glc1qKfhjAlnnnjP/y2LmE+vKkElDzQbw5oThqa8KldmVJ+UmY+5Tah2z7ulWUgk
         vGqbej4CN8S4f7kQHksRhiAeMCsyholIrGyiz0IhkqM1yKtLGXvVoFM+1MdFksM/jfT/
         tv2w==
X-Gm-Message-State: ANoB5pn25+qGJlSHu/Ow1v3133XlwGGiV9FskQHosqBy4BI1GoCTI/yp
	Zgkdi4A06majQObDc16LXUA=
X-Google-Smtp-Source: AA0mqf5c+p5dL6zUqx5qZ25QlpNx4UfNiAV/8qXIhTXchmw0FVcF6a6gE72GedLWPA1IiVJNVj4HsQ==
X-Received: by 2002:a17:902:db0c:b0:189:1963:d0d7 with SMTP id m12-20020a170902db0c00b001891963d0d7mr36119934plx.100.1669697558416;
        Mon, 28 Nov 2022 20:52:38 -0800 (PST)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902dace00b001895d87225csm9584719plx.182.2022.11.28.20.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 20:52:37 -0800 (PST)
Message-ID: <7b191ded-068f-0dc7-25fa-e35cd1ac5bcf@gmail.com>
Date: Tue, 29 Nov 2022 13:52:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] mtd: spi-nor: spansion: add clear sr fixup for s25fl-l
 family
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, yaliang.wang@windriver.com,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Takahiro.Kuwano@infineon.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221018095732.251299-1-yaliang.wang@windriver.com>
 <58b39090-d26f-271f-4832-8fb41c624a9c@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <58b39090-d26f-271f-4832-8fb41c624a9c@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_205241_401802_E4313093 
X-CRM114-Status: GOOD (  31.15  )
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

Hi Yaliang and Tudor,

On 11/22/2022 7:28 PM, Tudor.Ambarus@microchip.com wrote:
> + Takahiro
> 
> Hi, Takahiro,
> 
> Would you please review/test this spansion patch?
> 
> Thanks,
> ta
> 
> On 10/18/22 12:57, yaliang.wang@windriver.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Yaliang Wang <Yaliang.Wang@windriver.com>
>>
>> Spansion S25FL-L family flashes s25fl064l/s25fl128l/s25fl256l can't
>> automatically recover from programming/erase errors, the Status Register
>> error bits inflecting the errors will not change until a Clear Status
>> Register command be executed.
>>
>> Same thing also happens on other Spansion flash families, they've
>> properly handled it, USE_CLSR manufacturer flag was introduced for this
>> purpose, but S25FL-L cannot simply reuse their work, because S25FL-L has
>> the different error bit settings. S25FL-L defines programming/erase
>> error bits in Status Register 2, whereas the other families define the
>> same error bits in Status Register 1, causing S25FL-L needs a different
>> method to handle this problem.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 0074a8f3b303 ("mtd: spi-nor: Add support for s25fl128l and s25fl256l")
>> Fixes: d8b494a32889 ("mtd: spi-nor: Add support for Spansion S25FL064L")
>> Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
>> ---
>>  drivers/mtd/spi-nor/spansion.c | 119 ++++++++++++++++++++++++++-------
>>  1 file changed, 93 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 0150049007be..8f353ddda5f5 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -14,6 +14,7 @@
>>  #define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
>>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
>> +#define SPINOR_REG_CYPRESS_SR2V                        0x00800001
>>  #define SPINOR_REG_CYPRESS_CFR1V               0x00800002
>>  #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */
>>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
>> @@ -25,6 +26,10 @@
>>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
>>  #define SPINOR_OP_CYPRESS_RD_FAST              0xee
>>
>> +/* s25fl-l family specific */
>> +#define S25FL_L_SR2V_P_ERR                     BIT(5)  /* Programming Error Occurred */
>> +#define S25FL_L_SR2V_E_ERR                     BIT(6)  /* Erase Error Occurred */
>> +
>>  /* Cypress SPI NOR flash operations. */
>>  #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)             \
>>         SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),             \
>> @@ -44,6 +49,29 @@
>>                    SPI_MEM_OP_NO_DUMMY,                                 \
>>                    SPI_MEM_OP_NO_DATA)
>>
>> +/**
>> + * spansion_nor_clear_sr() - Clear the Status Register.
>> + * @nor:       pointer to 'struct spi_nor'.
>> + */
>> +static void spansion_nor_clear_sr(struct spi_nor *nor)
>> +{
>> +       int ret;
>> +
>> +       if (nor->spimem) {
>> +               struct spi_mem_op op = SPANSION_CLSR_OP;
>> +
>> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> +
>> +               ret = spi_mem_exec_op(nor->spimem, &op);
>> +       } else {
>> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
>> +                                                      NULL, 0);
>> +       }
>> +
>> +       if (ret)
>> +               dev_dbg(nor->dev, "error %d clearing SR\n", ret);
>> +}
>> +
>>  static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>>  {
>>         struct spi_mem_op op;
>> @@ -342,6 +370,65 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>         .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>  };
>>
>> +/**
>> + * s25fl_l_sr_ready_and_clear() - S25FL_L family flashes need to query
>> + * Status Register 1 to check if the flash is ready and clear it if
>> + * there are Programming/Erase errors in Status Register 2.
>> + * @nor:       pointer to 'struct spi_nor'.
>> + *
>> + * Return: 1 if ready, 0 if not ready, -errno on errors.
>> + */
>> +static int s25fl_l_sr_ready_and_clear(struct spi_nor *nor)
>> +{
>> +       int ret;
>> +       u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
>> +       struct spi_mem_op op =
>> +               CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
>> +                                         SPINOR_REG_CYPRESS_SR2V,
>> +                                         &nor->bouncebuf[1]);
>> +
RDAR in S25FL-L family requires 8 dummy cycles by default. This is one of
discrepancies in Spansion/Cypress/Infineon SPI NOR families.

In S25FL-L and S25FS-S families, number of dummy cycles in RDAR is same
as read ops (Fast read, Quad output read, etc) latency regardless of
register type, volatile or non-volatile. It is 8 by default.

In SEMPER family (S25HL/HS-T and S28HL/HS-T), number of dummy cycles in
RDAR for Non-volatile registers is same as read ops latency. For volatile
registers, it depends on CFR3[7:6] and is 0 by default.

So, we may want to let CYPRESS_NOR_RD_ANY_REG_OP macro take 'ndummy' param
to handle this...

>> +       /* Read Status Register 1 */
>> +       ret = spi_nor_read_sr(nor, nor->bouncebuf);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* RDSR2 command isn't available in QPI mode, use RDAR instead  */
Or use RDSR2 instead. QPI (4-4-4) mode is not supported in this driver.

>> +       ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (nor->bouncebuf[1] & (S25FL_L_SR2V_P_ERR | S25FL_L_SR2V_E_ERR)) {
>> +               if (nor->bouncebuf[1] & S25FL_L_SR2V_E_ERR)
>> +                       dev_err(nor->dev, "Erase Error occurred\n");
>> +               else
>> +                       dev_err(nor->dev, "Programming Error occurred\n");
>> +
>> +               spansion_nor_clear_sr(nor);
>> +
>> +               /*
>> +                * WEL bit remains set to one when an erase or page program
>> +                * error occurs. Issue a Write Disable command to protect
>> +                * against inadvertent writes that can possibly corrupt the
>> +                * contents of the memory.
>> +                */
>> +               ret = spi_nor_write_disable(nor);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               return -EIO;
>> +       }
>> +
>> +       return !(nor->bouncebuf[0] & SR_WIP);
>> +}
>> +
>> +static void s25fl_l_late_init(struct spi_nor *nor)
>> +{
>> +       nor->params->ready = s25fl_l_sr_ready_and_clear;
>> +}
>> +
>> +static const struct spi_nor_fixups s25fl_l_fixups = {
>> +       .late_init = s25fl_l_late_init,
>> +};
>>  static const struct flash_info spansion_nor_parts[] = {
>>         /* Spansion/Cypress -- single (large) sector size only, at least
>>          * for the chips listed here (without boot sectors).
>> @@ -428,13 +515,16 @@ static const struct flash_info spansion_nor_parts[] = {
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>>         { "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>> +               .fixups = &s25fl_l_fixups },
>>         { "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>> +               .fixups = &s25fl_l_fixups },
>>         { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>> +               .fixups = &s25fl_l_fixups },
How about merging SR2V check into existing spansion_nor_sr_ready_and_clear()?

Introduce new MFR flag like USE_SR2V then

MFR_FLAGS(USE_CLSR|USE_SR2V)

static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
{
	int ret;

	ret = spi_nor_read_sr(nor, nor->bouncebuf);
	if (ret)
		return ret;

	if (nor->info->mfr_flags & USE_SR2V) {
		/* check SR2V */
	} else {
		/* check SR */
	}

	...
}

This is just my preference. What do you think?

>>         { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
>>                 PARSE_SFDP
>>                 MFR_FLAGS(USE_CLSR)
>> @@ -460,29 +550,6 @@ static const struct flash_info spansion_nor_parts[] = {
>>         },
>>  };
>>
>> -/**
>> - * spansion_nor_clear_sr() - Clear the Status Register.
>> - * @nor:       pointer to 'struct spi_nor'.
>> - */
>> -static void spansion_nor_clear_sr(struct spi_nor *nor)
>> -{
>> -       int ret;
>> -
>> -       if (nor->spimem) {
>> -               struct spi_mem_op op = SPANSION_CLSR_OP;
>> -
>> -               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> -
>> -               ret = spi_mem_exec_op(nor->spimem, &op);
>> -       } else {
>> -               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
>> -                                                      NULL, 0);
>> -       }
>> -
>> -       if (ret)
>> -               dev_dbg(nor->dev, "error %d clearing SR\n", ret);
>> -}
>> -
>>  /**
>>   * spansion_nor_sr_ready_and_clear() - Query the Status Register to see if the
>>   * flash is ready for new commands and clear it if there are any errors.
>> --
>> 2.34.1
>>
> 

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
