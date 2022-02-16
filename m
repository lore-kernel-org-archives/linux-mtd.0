Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B466C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Feb 2022 08:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbN6h1xE1wOyr/LTaa5wYJEkXlWffEnX51UwJM6lpT0=; b=cirBfYhozUFQH2
	eJRa7ItNpvcgCI0Sk8hQu/yviC3ieRKHSXHLyjw790asqRMmxEOhPgJtWcdf9h3G4gInY2BggBwqM
	FeEmWCr9yd0v2Wx5Nw99BeZaP5KDSBZHdsmRFA0Hc6giO8oGsHUI0HRZ94CfVBGTNAvY3fufsP9cv
	aFxwQ8aa6eAaW9JkoDOZZGaboHX7JV6PSp2iKGuwcbeCMMKdz0+lkjzkOnZtoLb5gqbxkPJkJL/YX
	KJv8/TqWcqAFA6oGPWapzAhoW1S29hsr6/Jl/OTu1zDA1O9JeiiZkg0YshfYTx9NU0/1//0iakIGE
	qwfIaCcqDsyGIlfISqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKFLG-0060ij-2G; Wed, 16 Feb 2022 08:07:14 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKFJz-0060GH-NS
 for linux-mtd@lists.infradead.org; Wed, 16 Feb 2022 08:06:01 +0000
Received: by mail-pf1-x42a.google.com with SMTP id g1so1553066pfv.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Feb 2022 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NRGxouRlBjrCBbS/tacf0vowbGm1adp5dIYL1iDtezw=;
 b=cJdgJj8tgN36IC1RgO+JGWm+SNnca2/zHxR6fe2SN+U2QSlo7xZApgd/9TCYIJeCOy
 g3/ShQXf+zGgPF/GCE4f2P2TZy9m2oKhetPr/wnvX1ZXkYihxIU1UMGzXcW+2XdanN04
 R7UmuFf5ucoEtX6AJTrikIurCNCwWPa/mqJt8edyT/UsgnW3WpmyOW5v3ItGvAsRxObw
 ItubOnFbIE6WhyBguAol2nMbppPHh0jkDQLLLxBb3GVZOxE97mP5vjJUlZg5R21Gr7wa
 tYAJoz+CW2q5Z+vgIOJKcf/zwx1/Om7h+W6j4kiGYUT0ThTmwuOAQ0dUtJp60URspKoK
 /4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NRGxouRlBjrCBbS/tacf0vowbGm1adp5dIYL1iDtezw=;
 b=GWsErzDZfODGxhYKH5tSurvu0GNekMjimqxiFEPAmTUvxbZCnPWIoHb7rGz5huU23L
 eY2Giva/JYpkUN0AkXuGnxkn4LDgKvo7+0Oikukl8jTBPgfBUVvV1Bvv/TDOKPoSX41u
 RmAUKenTmxB4vx1JZewehOOcj5VQKdC0AsZ6B93fma3adaHN1CAz4I1EZ534cld/wpK0
 tn5Sy9eh0BWTfzBkP7fevXxAVClhyvEGHNz5I3ozqexXXDkoDPFImbsSLLwJzlRPwQdu
 ZKquzzZ7I5zhMWlxzPOxYWbNGvclL1TAyccoY8b4HTbLzSnkPFPBmDUwPBYk2G+9aVK9
 KEog==
X-Gm-Message-State: AOAM5335mHjHYSrhgIpRa5Tq2HkoPHkkdc4aFwmfMXsFQKOQea1beMXv
 vUvBSud6N1ZmwaTe1snPSGV/V+0fRNg=
X-Google-Smtp-Source: ABdhPJzAPS0TPvaAbwUlRlahyDT6AwTZdkOZ0+IcwjhfAPv5Nib1zbbD5vQ1jx18Xb/hCr9FZZwB4Q==
X-Received: by 2002:a63:584d:0:b0:370:14d9:8238 with SMTP id
 i13-20020a63584d000000b0037014d98238mr1328841pgm.166.1644998753413; 
 Wed, 16 Feb 2022 00:05:53 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 8sm6850123pfl.164.2022.02.16.00.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 00:05:52 -0800 (PST)
Message-ID: <5be075b9-0a8b-548b-0a63-fb13bc47e336@gmail.com>
Date: Wed, 16 Feb 2022 17:05:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v7 2/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>, Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <26f6a4d7e1d3c4dfdf7bf161a72f140c3364a3da.1626677855.git.Takahiro.Kuwano@infineon.com>
 <67f7901b-a3a3-ae4e-78f1-ef54de3ff1b7@microchip.com>
 <20220128163817.mxu2pkbyuf27gdy6@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220128163817.mxu2pkbyuf27gdy6@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_000555_870062_6A7B452A 
X-CRM114-Status: GOOD (  19.75  )
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

On 1/29/2022 1:38 AM, Pratyush Yadav wrote:
> On 28/01/22 10:12AM, Tudor.Ambarus@microchip.com wrote:
>> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> Some of Spansion/Cypress chips support volatile version of configuration
>>> registers and it is recommended to update volatile registers in the field
>>> application due to a risk of the non-volatile registers corruption by
>>> power interrupt.
>>>
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> ---
>>> Changes in v7:
>>>   - Add missing macro definitions in v6
>>>
>>> Changes in v6:
>>>   - Remove multi die package support
>>>
>>> Changes in v5:
>>>   - No change
>>>
>>> Changes in v4:
>>>   - No change
>>>
>>> Changes in v3:
>>>   - Add multi-die package parts support
>>>
>>>  drivers/mtd/spi-nor/spansion.c | 59 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 59 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>> index 5e7e62704e11..ca50e77b4220 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -10,6 +10,8 @@
>>>
>>>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>>>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
>>> +#define SPINOR_REG_CYPRESS_CFR1V               0x00800002
>>> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */
> 
> I have the Cypress S28 flash and this bit is marked as "reserved" there. 
> Maybe we should have a flash family specific name? Dunno. But I guess it 
> does not matter so much since it will be very localised anyway.
> 
>>>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
>>>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
>>>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
>>> @@ -161,6 +163,63 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr,
>>>                                             reg_val);
>>>  }
>>>
>>> +/**
>>> + * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
>>> + * @nor:       pointer to a 'struct spi_nor'
>>> + * @reg_dummy: number of dummy cycles for register read
>>> + *
>>> + * It is recommended to update volatile registers in the field application due
>>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>>> + * also set during Flash power-up. This function supports multi-die package
>>
>> Why do you duplicate the setting of QE bit in CFR1V if QE bit is already set in
>> CFR1NV? Does the Volatile Register has a higher priority than the Non-Volatile one?
>> What happens when QE is zero in CFR1NV and QE is one in CFR1V?
> 
> I have the Cypress S28 flash family, and on there I see that the 
> volatile bit takes precedence over non-volatile bit*. At powerup data in 
> NV bits is transferred to V bits to set their default state.
> 
> What I am more worried about is if quad mode is enabled in a 
> non-volatile register (which should NEVER be done by Linux), will we be 
> able to properly detect and initialize the flash? We certainly can't do 
> it for 8D-8D-8D mode flashes.
> 
If quad mode is enabled, 1S-1S-4S/1S-4S-4S/1S-4D-4D ops are supported.
The 1S-1S-1S ops like read ID and registers used for initializationare still available.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
