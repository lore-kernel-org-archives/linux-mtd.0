Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739EBC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaLG1IIvOI3WiUu0QOovdgiNaaGNS0WMfIA8Jl8fxFk=; b=tMPHil47nQ35M/
	Ql6rXt0KPLgFPYZ6jJD+XSww6bYclM0ytxPxGAg8RQkdx7rCSKDuN/Qy7OQVYcg2Wjl9de15n9PK8
	KzUawGlLdzWYgvME8DqXhaThp3ObCUhrZVlXbP4QeEcWOt/8tgipe/tOt/0mw/wLtl3DKsTwTxjSp
	0Iow9Jh86+fQv2lrJiblwhkaZyKl1xryJDV0euVElcKBQl4mXgZiFduat3PHe4bl7s9ShvGUHWU1c
	LtVeahX0sTpCjLkV2N2Tii/6MXtPU9ij+ynD6nOg1dV439IaYzMMwkE3X7UnUbkgMnaEROHC05dVT
	bXUvnatehOAP8e9Ebldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhpMf-00HMru-DS; Fri, 22 Apr 2022 09:14:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhpMb-00HMpW-Rn
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2022 09:14:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id s14so9532426plk.8
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2022 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ng7PaMXIBGweRBN2th/T56ha1W2mLkAemGRgDy0M7po=;
 b=P2ayleN7mutx1wz5O+tASXZlA6U+QqQj2M/kRWTcmt4kvxRGTCmxVdVgkgcnUP50UM
 ewIZjyUdgTXxiuhrw5tB0aRAxGfVFmQIIUmOICwfOq7p0SW8XhajkE4s+HyQnZxm/upL
 TxZQ52eIhTxnagRgbLD33EX3SGxm24m3HqTL+56tMdlpH0pX0OxmqU280uIko2X1HgIf
 VbwuhzY3lehCj9YwXnDJK3ADYM8z8RWMN09nnR67u7Zmww9C1Lj94z6HBihG2DWYuzO9
 BdHsrlIzgtN/HHm89tqeSVAXNmcjhwIxQ3KrMZNTJYDpmHAY4m5PNTXO6aPgliihUoWm
 kmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ng7PaMXIBGweRBN2th/T56ha1W2mLkAemGRgDy0M7po=;
 b=DJf/86A74JuwWXnjPMDk5sjasg9V7BtwEpa67NsN5bZfWyEA3NdHHG8GHf0JV+hR02
 4mmNh2ooprwikqlOu5Y312sdQSIwJ45nBRxyF7Rcc1MRg5tN1JX+S1ODCb2OeCEaSSpL
 JGOwT8Rgd/xxr3IlLtpqOnmuFonXUA9C+Z/AUNYmAi9dgYk5vDSyGBP9n5ohWXu85hK3
 2O12UNZinawK40S0PCzUzku33LeGTebwa56Fg7ljA8ybjXtoV40+lqxiygdfSJXYrw9X
 8XjAbjiOuOybQ/gg61isvlum/8O/DXplrVMAHG5pLoD4KjroM6j9Tp9w0Yx0FouLN3pT
 TePQ==
X-Gm-Message-State: AOAM5300Pl5LLXlr3oGFljXGREVaFY7c0vVnkUNi9J+TpnjHJXWbPghK
 WWW+k0pEsjcTiiXC0BswH98=
X-Google-Smtp-Source: ABdhPJw5u67bpnB4T/iWBtqBcqmPEhm7a3n3zZhXh3K/gcKAgXeciZuIBKk907LEh5lGc9Yle2LS/g==
X-Received: by 2002:a17:902:eb86:b0:158:93aa:e92c with SMTP id
 q6-20020a170902eb8600b0015893aae92cmr3726018plg.14.1650618844437; 
 Fri, 22 Apr 2022 02:14:04 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a17090a531100b001cd4989feccsm5378164pjh.24.2022.04.22.02.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 02:14:04 -0700 (PDT)
Message-ID: <c293adf3-e325-7eab-ebcd-bd704122e06c@gmail.com>
Date: Fri, 22 Apr 2022 18:14:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v13 3/4] mtd: spi-nor: spansion: Add local function to
 discover page size
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <228838a08ce42b886869cc8d59a4029193afe0d8.1650532121.git.Takahiro.Kuwano@infineon.com>
 <35eaf3b8-d602-592f-7a9a-865baba14a3f@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <35eaf3b8-d602-592f-7a9a-865baba14a3f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_021405_936143_96D7EB23 
X-CRM114-Status: GOOD (  20.99  )
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

On 4/21/2022 7:43 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The page size check in s28hs512t fixup can be used for s25hs/hl-t as well.
>> Move that to a newly created local function.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>> Changes in v13:
>>   - (no change)
>>
>> Changes in v12:
>>   - Rebase on top of Tudor's series
>>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=295933
>>   - Remove addr_width param. Use nor->addr_width instead.
>>
>> Changes in v11:
>>   - Rebase on top of Tudor's series
>>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
>>   - Add addr_width param
>>
>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++--------------
>>  1 file changed, 32 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 65ae3ade0b95..952d4383f9da 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -172,6 +172,37 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>         return 0;
>>  }
>>
>> +/**
>> + * cypress_nor_set_page_size() - Set page size which corresponds to the flash
>> + *                               configuration.
>> + * @nor:       pointer to a 'struct spi_nor'
>> + *
>> + * The BFPT table advertises a 512B or 256B page size depending on part but the
>> + * page size is actually configurable (with the default being 256B). Read from
>> + * CFR3V[4] and set the correct size.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int cypress_nor_set_page_size(struct spi_nor *nor)
>> +{
>> +       struct spi_mem_op op =
>> +               CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width,
>> +                                         SPINOR_REG_CYPRESS_CFR3V,
>> +                                         nor->bouncebuf);
>> +       int ret;
>> +
>> +       ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
>> +               nor->params->page_size = 512;
>> +       else
>> +               nor->params->page_size = 256;
>> +
>> +       return 0;
>> +}
>> +
>>  /**
>>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>   * @nor:               pointer to a 'struct spi_nor'
>> @@ -226,28 +257,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
>>                                      const struct sfdp_parameter_header *bfpt_header,
>>                                      const struct sfdp_bfpt *bfpt)
>>  {
>> -       /*
>> -        * The BFPT table advertises a 512B page size but the page size is
>> -        * actually configurable (with the default being 256B). Read from
>> -        * CFR3V[4] and set the correct size.
>> -        */
>> -       struct spi_mem_op op =
>> -               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,
> 
> here you substitute 3 with nor->addr_width behind the doors. It would have
> worth to have a dedicated patch for this and then come with a patch for
> the local function. Or at least add a comment in the commit's description.
> 
I will update commit description.

>> -                                         nor->bouncebuf);
>> -       int ret;
>> -
>> -       spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> -
>> -       ret = spi_mem_exec_op(nor->spimem, &op);
These are replaced with spi_nor_read_any_reg().
I will also add a comment about this.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
