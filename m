Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DD6C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JE8MonjgzRR3LMFRRvPRxMIs8Ym9kuiKKE8C1wGux40=; b=AKtxGx8fRJWyay
	AP/MXaEt3u2kibdPX3jJLTzDam7mbcsfdsDYgrjjSem2xDw1Zh6ADcv/yL47lJmMWXvFjOYzhpCeG
	fP3TVkdhhAQ2fGFZ+GndRXIUsd1ChR2eieFwn0Ly9SautM9zjwhGzPn3ZDNc+1e29lR7rTsRZ/5D2
	atgprG3V0cCU9/0DvK03QQcRCtG9vyHXzDkXuLhQ37BevViViLz8oAYlM4O7Zit92kfesYzszmEcw
	L4h4cQoI4gP7aRXJkjWbd/7/3TvHqVrRRgE+vrr8tBQtiLvMhUyrTK+ZicIWGp21BsEkmI+6ErD/6
	JoyKuy/2ukf6M0t7r5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUMm-00D5J0-HP; Thu, 21 Apr 2022 10:48:52 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUMj-00D5HU-9M
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 10:48:50 +0000
Received: by mail-pg1-x52d.google.com with SMTP id s137so4319221pgs.5
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 03:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MJGgxlBuLS1VohWFH+8Mvu/ktfG4hX0l1I49nObugHY=;
 b=pGBVhgmB8MUn0YROHWvRwgNnAClwIzKda/P/CJqMdzhHc507Y9+vXeLRe6TXnPaxCW
 bvC9n/s513jdVTiuiEt/QEnXCk7HTeBax16RV185yQlekKayDPVKoNGHCJy/sgXGlNMs
 zbdOucjYXvcrQ+A13ePi3cmL6fYf7fdFyobaLZkrJ6H0Z4OXvSRSv+0Zyow5iSJEkj1F
 D9arhCcG/TaPFevxZaNrPe1pgejspMeLqabZfeQC0OcSP3YEWhYpCpE8KDJW6XXkqNEr
 C5cl/MljYNOjpPxkAYW3kHuVXIE19UB/qQIyuBSIgjrctKr2N/GPUPCn+ybxkDPwjlpp
 f/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MJGgxlBuLS1VohWFH+8Mvu/ktfG4hX0l1I49nObugHY=;
 b=1cDo6jwUSfczqwrZ9SVXc85sHt4dl5Hw30zH7Q9Ie6XX+AVnNk2T7Q0j+ftVwiQ05V
 YAXwqMRC791F8auZWXKF9pxvWxWQZHdScM1hj7Lv6daMwdpsuFE7zFWCH+0qC+sKsW8P
 OZFHUkXgB90NbYK47GW7SaAJwFOb68JypjcsZPo+tIjz8tLjshUXWv9uAye9j3YxCe6R
 S4HpQI2n22k14eluRoa3ACoIm7AOK/23B9MOuh1Lj04eYxETJ7MLTMQ7ztyxa+47lUpg
 5MmHb4dCgcl6nCR623yr0RJPmJmXKwdxXhQRrpbDSDGpOxzePduKJPwFCW+w+uV/I1mw
 oWFw==
X-Gm-Message-State: AOAM533QiVHIy1wkbMsFY6Rb+7AU4jAaPTlf2v4orHDsURQLgiRCgdQg
 PsBq7hkwwaWek71idSYGIb0=
X-Google-Smtp-Source: ABdhPJwf8DX0VzSiClEYSZ6KHQ5DDmmxoIq+JqXLDluUR854HB0i+3KeJbEK0Aa6atoOywfp+v5NMg==
X-Received: by 2002:a63:798b:0:b0:3aa:1ad6:4713 with SMTP id
 u133-20020a63798b000000b003aa1ad64713mr14880715pgc.239.1650538128463; 
 Thu, 21 Apr 2022 03:48:48 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa79af4000000b0050832e3caadsm22939269pfp.216.2022.04.21.03.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 03:48:48 -0700 (PDT)
Message-ID: <955416e1-f139-fea2-f956-40d0c98e7698@gmail.com>
Date: Thu, 21 Apr 2022 19:48:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <d705a2c1fc8d0a59c93454aa05642aafe4fc960b.1650532121.git.Takahiro.Kuwano@infineon.com>
 <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_034849_378326_69064F19 
X-CRM114-Status: GOOD (  21.61  )
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

On 4/21/2022 7:38 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> In 4BAIT parse, keep nor->addr_width because it may be used as
>> current address mode in SMPT parse later on.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 7 ++++++-
>>  drivers/mtd/spi-nor/sfdp.c | 1 -
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 40ba45328975..87603a99938f 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2210,7 +2210,12 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>>  static int spi_nor_set_addr_width(struct spi_nor *nor)
>>  {
>>         if (nor->addr_width) {
>> -               /* already configured from SFDP */
>> +               /*
>> +                * Already configured from SFDP. Use an address width of 4 in
>> +                * case the device has 4byte opcodes.
>> +                */
>> +               if (nor->addr_width == 3 && nor->flags & SNOR_F_HAS_4BAIT)
>> +                       nor->addr_width = 4;
>>         } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
> 
> Can we have this instead?
> 
> commit 61d73dea7e63db4c7a3ffaa7f2b5068fb71c2d8b
> Author: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Date:   Thu Apr 21 18:40:21 2022 +0900
> 
>     mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
>     
>     In 4BAIT parse, keep nor->addr_width because it may be used as
>     current address mode in SMPT parse later on.
>     
>     Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>     Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 2bfa84100d38..7095bf897318 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2272,6 +2272,9 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>  
>  static int spi_nor_set_addr_width(struct spi_nor *nor)
>  {
> +       if (nor->flags & SNOR_F_HAS_4BAIT)
> +               nor->addr_width = 4;
> +
>         if (nor->addr_width) {
>                 /* already configured from SFDP */
>         } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index a5211543d30d..b2cc3bfe0d5c 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1098,7 +1098,6 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>          * Spansion memory. However this quirk is no longer needed with new
>          * SFDP compliant memories.
>          */
> -       nor->addr_width = 4;
>         nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
>  
>         /* fall through */
> 
Yes, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
