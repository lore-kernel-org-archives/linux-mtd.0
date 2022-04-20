Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9469BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 01:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REZhuNixuHtvAft5SBduyAUm9LCK2Y1fbzIqc+ViMPM=; b=pUxX+JpMh/Nc/x
	gSYy/vSIRPZuF6xdq1cWYMzp9LK6qsQyd2xQ5p6JH230kNHmccfUAlXCs0wsyabePak3hBIamDxUY
	IaZb1I9jxStEIEeLjXkstcNxa8LMLQpyNUbdOVTDdr9IHKdZpkz+jK+VqOxmthFhJ/git8mRq3JTs
	ENNRgNcgTFMQGGSAkHyS7cdjz9/QdD28j5TuLhZOzUMTHk0P4aCCQnjKX1OQaSejc4zWL51kdT4bb
	T8SsQRm3cTAddH/MKBbPS2o2EtnCVt6iY6jU7PtUNvjPP1U6fKM+HnBAAEvw8oIgbKGuUqaYi5iR6
	fEjGewvYUHPsnPVXGRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngykT-006lHP-9u; Wed, 20 Apr 2022 01:03:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngykQ-006lH3-3z
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 01:03:11 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso456041pjj.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Apr 2022 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KozJ8y1N7LJaqtW59PY72s3DtOeMM08RxBriW6pM7Lw=;
 b=GCo4bodK2Ws9qILAIHBr7F7QdpzgMtsd+89x1HrESDbBykFzLBeSfX0LMuagnf49cT
 /Nzr7tgcLYvjY/Id1b1MEHPYVDo1ndyFTmqLVdz1LYmEgnDY/8MD3TCpD/VdEAUya4Gg
 9WKkPBYiZvRPoY3m03KyA7X/JcqMNiBdCfNd8ulFT834DFme0LhIhc3IGgjq6k125EOb
 J0ZjGCqcfCwsyZugeOlxpYJ3X7M328n5JUNyy6nwHVpnTMbi0txckRtAzV/kBSxDhOtp
 5d6oUasomEf7i5XsWnT8Pj0Pr6b2PSUXMbAR3u2GtflRe3JyCA5n8BXM0OFwngs56eFj
 ZhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KozJ8y1N7LJaqtW59PY72s3DtOeMM08RxBriW6pM7Lw=;
 b=dJtgF2tDTnOqiIRKuEIyW4fWhsSucu7eHXjivyQ5IPsNH9IICq5cJNwsYyiNQDHss1
 pNQRl3EWZxOtvSnPpLndmuzYGtGWEv86LjUB5Hx9VvDwLf7AN0WRYLEI5Tvk1mF7s6FA
 4eHtPXzyNs2Yv1Pfe7gWT3TD9R7/exl20kjs6OXIpujuu6PUdgV4rM9BWoug2Uk/scXO
 j88eskWiyJJqNonaS9f969NCgyn060OkazE3j9Phy640qh0voU9hT+cM9FQappAMIshi
 EoBt3sAV8ZROn0uRr9uI6Zk8EKrpuo3+wxzQY0XAuha2kJNMkDxNa3VboDUdpJXSL7Js
 e3yA==
X-Gm-Message-State: AOAM531pqMn+LoWXhrauQnxEIYJ2e1c9sVmSx4nlkv2M5j387MNJbpBT
 qE2dsJQkyUi3Ytrav8J6i3M=
X-Google-Smtp-Source: ABdhPJxRe5IUcC5g63eYeIw2Ytt3lMF7Bh5Smk7zzyyLgWvGhilnrXPS7kUN4wlF/JoBJ6HfqhvBVA==
X-Received: by 2002:a17:90b:248c:b0:1cb:8764:c1f8 with SMTP id
 nt12-20020a17090b248c00b001cb8764c1f8mr1532368pjb.34.1650416587365; 
 Tue, 19 Apr 2022 18:03:07 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a637d10000000b00381268f2c6fsm17908170pgc.4.2022.04.19.18.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 18:03:06 -0700 (PDT)
Message-ID: <3692dcb8-dddd-2d36-708c-beb3cc52c037@gmail.com>
Date: Wed, 20 Apr 2022 10:03:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v11 1/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <92241a7f523474d477a17437c8b6c926b29da4ab.1650259501.git.Takahiro.Kuwano@infineon.com>
 <37da8217-da36-1649-f764-cd9e6dd7ed8c@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <37da8217-da36-1649-f764-cd9e6dd7ed8c@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_180310_233145_DCA5A1FD 
X-CRM114-Status: GOOD (  23.01  )
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

On 4/19/2022 5:01 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Some of Infineon chips support volatile version of configuration registers
>> and it is recommended to update volatile registers in the field application
>> due to a risk of the non-volatile registers corruption by power interrupt.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Changes in v11:
>>   - Rebase on top of Tudor's series
>>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
>>
>> Changes in v10:
>>   - Remove dependencies on other series
>>
>> Changes in v9:
>>   - Rename function per mwalle's series
>>
>> Changes in v8:
>>   - Use spi_nor_read/write_reg() functions
>>   - Use nor->bouncebuf instead of a variable on stack
>>
>> Changes in v7:
>>   - Add missing macro definitions in v6
>>
>> Changes in v6:
>>   - Remove multi die package support
>>
>> Changes in v5:
>>   - No change
>>
>> Changes in v4:
>>   - No change
>>
>> Changes in v3:
>>   - Add multi-die package parts support
>>
>>  drivers/mtd/spi-nor/spansion.c | 60 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 952db7af6932..6bcd25180af4 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -14,6 +14,8 @@
>>  #define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
>>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
>> +#define SPINOR_REG_CYPRESS_CFR1V               0x00800002
>> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */
>>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
>>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
>>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
>> @@ -117,6 +119,64 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>>         return 0;
>>  }
>>
>> +/**
>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
>> + *                                      register.
>> + * @nor:       pointer to a 'struct spi_nor'
>> + *
>> + * It is recommended to update volatile registers in the field application due
>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>> + * also set during Flash power-up.
>> + *
> 
> cool
> 
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>> +{
>> +       struct spi_mem_op op;
>> +       u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
> 
> no need for this local variable, use the define directly
> 
OK.

>> +       u8 cfr1v_written;
>> +       int ret;
>> +
>> +       op = (struct spi_mem_op)
>> +               CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr,
>> +                                         nor->bouncebuf);
>> +       ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
> 
> can we use nor->reg_proto instead of SNOR_PROTO_1_1_1?
> 
Yes, I will replace it.

>> +       if (ret)
>> +               return ret;
>> +
>> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
>> +               return 0;
>> +
>> +       /* Update the Quad Enable bit. */
>> +       nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
>> +       op = (struct spi_mem_op)
>> +               CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_width, reg_addr, 1,
>> +                                         nor->bouncebuf);
>> +       ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_1_1_1);
> 
> same
> 
> With these addressed:
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
>> +       if (ret)
>> +               return ret;
>> +
>> +       cfr1v_written = nor->bouncebuf[0];
>> +
>> +       /* Read back and check it. */
>> +       op = (struct spi_mem_op)
>> +               CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr,
>> +                                         nor->bouncebuf);
>> +       ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (nor->bouncebuf[0] != cfr1v_written) {
>> +               dev_err(nor->dev, "CFR1: Read back test failed\n");
>> +               return -EIO;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  /**
>>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>   * @nor:               pointer to a 'struct spi_nor'
>> --
>> 2.25.1
>>
> 
Thank you!
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
