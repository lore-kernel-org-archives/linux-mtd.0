Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919FBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fy23Y92IhGXFW4bixz4/xYfeQM7RUI+nfayATnymFQ=; b=dohy3ozNvAlzjz
	vLKB8dYmVj1RT5kQePN5ImTU+uT5YuuA5BWyyWdjpLwj7D9SDQ9LSzeKPqW8amW0NbEdBaduK1aCZ
	OCJBlmT/3EBuAYMqaqgLSHCoSrLW514r6oJiLSqBO8cGPRqfO+J27lrpuJeITqBkkqTiDDB4mwE9s
	hkVXOVHUHoXIAr9mdlnD0vvTc0Z5fW+riVzJbSr9V4PHeVEGcOTn7iBRDq4kxnwBos/Lk/s7ouHBC
	Tn6JuAVPyeDpTPYrXdiOllJJclogFHratTDUUpePmwMNJNmk96hoQSc2qdMSqXLDdmIMF5jrj52Cx
	WRXZx6bb6hokg7VklJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9vQ-009OXJ-Vf; Wed, 04 May 2022 07:59:57 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9vN-009OVt-Rs
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 07:59:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id n8so766803plh.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 00:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eCM2BeIZOqkJXIXSjLZ7lXRXKY734IItsmjFBjhLZhY=;
 b=XseeVHBRlDyQXpwQHELVMthIEX58h2EU8dVQlOU8mM/cT0q1E8sudtQCIm2unmfCjA
 R+EgNQCbGJZT8mzu1bTccOEAi0BGCDpPJV85KDOvVTN0m92N67nnW6P8zGpp4Xr/0pui
 7jDdJadPEzeaF89a5duShsNoiyiguvwi40+kh0oOmgYeGZMISUS3jQAau3xNbhQ3zHbg
 9AHm+7VV7AoLOTuvr1qIQlH3DFiryxn7xFqd/RPd8Y9Pjc+GfrXGXYgH3Sw2AvSDYXbe
 UpptHERK71npYoOfe3KkFcXAruEkj9u2OpFJMDyqoJnQnOVVqisO3EyTgdl+r9kNTu2A
 c6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eCM2BeIZOqkJXIXSjLZ7lXRXKY734IItsmjFBjhLZhY=;
 b=OOKbjCy4B9N7sNql82uTQm5VrMOetke5lCTcJ7HK9j4vAYLm5N3Lr9i0Ht/XSjUIna
 KFss+urQF77gqdzyrNY0x5fI67pQiAgW+WBcDLSxCj2iMA6eSgdfP4EGMdVO6a7+vsr/
 l1mAE4KdQCBGzH99jY0ODw8je/7YgkyAUR43dpiGDIFUwHk4h41sIiWLLbkwW38kMzGs
 y41/F8JKcH2nHrbLmJhEgINPsIjB6JULvsWfWU41SweKR/VBUOA9xLaYHhu/6wR8Rfwl
 ovz+WOk3LlhErOjHr4GugBmQA/HM6k9JJmXv0rNbH3MbRnZN018RXcUJsl8FEckF6Ll7
 Bifg==
X-Gm-Message-State: AOAM530bomXK0c52Kj9o98ry51Rfy1vuh156exAb1HwJzr8MIZkrZhg3
 PiiHHgPVQALKNirqX2eEo7I=
X-Google-Smtp-Source: ABdhPJxioBTp1fV8p0iKXxE1OiCDc354P/fhi4j/6Owwaq+UmfTjVoPyTyngQtLMTY+tY0k4tHCEEQ==
X-Received: by 2002:a17:903:32c4:b0:15e:9f30:75e9 with SMTP id
 i4-20020a17090332c400b0015e9f3075e9mr15430734plr.123.1651651191549; 
 Wed, 04 May 2022 00:59:51 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a778800b001cd4989ff3fsm2592576pjk.6.2022.05.04.00.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 00:59:51 -0700 (PDT)
Message-ID: <0d2d0001-78f8-32d1-78eb-0559f8865363@gmail.com>
Date: Wed, 4 May 2022 16:59:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v14 8/8] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc
Cc: miquel.raynal@bootlin.com, richard@nod.at, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
 <20220503081627.341870-9-tudor.ambarus@microchip.com>
 <6b343fd7-96f9-b2de-8eb3-196ddf91b93c@gmail.com>
 <39161526-fc95-63fc-8b43-83c2e539ae36@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <39161526-fc95-63fc-8b43-83c2e539ae36@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_005953_949518_410BC91D 
X-CRM114-Status: GOOD (  16.90  )
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

On 5/4/2022 4:47 PM, Tudor.Ambarus@microchip.com wrote:
> On 5/4/22 10:38, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi Tudor,
> 
> Hi!
> 
>>
>> On 5/3/2022 5:16 PM, Tudor Ambarus wrote:
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>
>>> These Infineon chips support volatile version of configuration registers
>>> and it is recommended to update volatile registers in the field application
>>> due to a risk of the non-volatile registers corruption by power interrupt.
>>> Add support for volatile QE bit.
>>>
>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>> uniform sector sizes are supported. This is due to missing or incorrect
>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>> followed up as needed.
>>>
>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
>>>  drivers/mtd/spi-nor/spansion.c | 125 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 125 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>> index e130f5398763..f78a15b985ea 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -14,6 +14,8 @@
>>>  #define SPINOR_OP_CLSR               0x30    /* Clear status register 1 */
>>>  #define SPINOR_OP_RD_ANY_REG                 0x65    /* Read any register */
>>>  #define SPINOR_OP_WR_ANY_REG                 0x71    /* Write any register */
>>> +#define SPINOR_REG_CYPRESS_CFR1V             0x00800002
>>> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN     BIT(1)  /* Quad Enable */
>>>  #define SPINOR_REG_CYPRESS_CFR2V             0x00800003
>>>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24        0xb
>>>  #define SPINOR_REG_CYPRESS_CFR3V             0x00800004
>>> @@ -113,6 +115,63 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>>>       return 0;
>>>  }
>>>
>>> +/**
>>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
>>> + *                                      register.
>>> + * @nor:     pointer to a 'struct spi_nor'
>>> + *
>>> + * It is recommended to update volatile registers in the field application due
>>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>>> + * also set during Flash power-up.
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>> +{
>>> +     struct spi_mem_op op;
>>> +     u8 cfr1v_written;
>>> +     int ret;
>>> +
>>> +     op = (struct spi_mem_op)
>>> +             CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_nbytes,
>>> +                                       SPINOR_REG_CYPRESS_CFR1V,
>>> +                                       nor->bouncebuf);
>>> +
>> The following lines are missing.
>>
>>         ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>>         if (ret)
>>                 return ret;
> 
> Sorry, I'll add them in the next version, seems that I handled the conflicts
> badly :). Does it work with the read? Have you tested the patch set?
> 
No problem. Yes, I tested and it's working.

Thanks again,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
