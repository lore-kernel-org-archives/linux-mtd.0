Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D81C00140
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 01:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wD15oa3XrfqnatbHZEsHshulSZqIRAmxRmNqm258S0M=; b=TlQGZQwUM/qT/Q
	VSSxjMz4E5Wz53Ecz2JWT/NNWulKQhwsrcYye/p20APY2ovzjeI6hUfPITKi3O6R/f8NO+32uzTHG
	TzJ2KYNYd4eX8P3Sx6YFjk2DAQn5BsGblSl1wlBOHIzOxKG91S8oNmX7gJ1UrtDQSCjgVHF4A1Lu2
	73C9auGyAR7nWUbpE6zYTiDHI+gE3X1r/bb25Zc+ImkwoRGqICepBqa5RPq3hqvyGk7lBIO6S0ZtR
	WyY2Hdu+jkAflBoNjKhLW0kPVmRLdnGTIV6uJb4JLdta2oL6YNgw/4wy/bJsD6CP8Y00eLKjcttyL
	IPl3XBoeEkm2iSd0d3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHEkp-00Ght2-7W; Fri, 29 Jul 2022 01:25:27 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHEkm-00Ghrv-M8
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 01:25:25 +0000
Received: by mail-pg1-x535.google.com with SMTP id 72so2903026pge.0
        for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2022 18:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=OTK/VfscBXhFYYH3sJs44KtWrEvEi3UROFtYkeRJntE=;
        b=MaKszq2Wm0TDmzZdUOPeg9aA9+08vDYr3phRb3VLxC9EgDm+PhpgagX93nHTeUSsYK
         zpWSiurxcnK2nm/rJq3MUut8XjIR5/KQANlJx6QYdJy6J6LADTwZJ4UXfGMD83AUn/Qx
         cBfxL/O+2376PzG57oBOFC1QIqe+LpkUrM2c2YGfpOrxHffPpcsQdL62GitujYha/ngP
         BgTCL2gVk0JrmYyOSJvl4cy5Vsl0CD9rymCOjBJSkH4cdAOeq2dRuGXqPL6ASxkN6a7A
         wuSZ8DvNzIeZwPOmbP+Klu806JPb6HFVlew8tBeBoyzEvcQx7VtBZaKxLTXg1H4XtfR/
         DMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=OTK/VfscBXhFYYH3sJs44KtWrEvEi3UROFtYkeRJntE=;
        b=YtR0hKOtNl3fvORoGGbrSuL9QaeUi2xEjl25RqUY4pODWg3R8AMe0dMOXK4cAYm4mD
         0TLxdLTSr26rpfoPv4fuUiMlQucs1A8u2RLD4nK9pihpb/Vlatb2TfpfcJxhD2LgiBiG
         ZR+qV3L6KfadQTF337JZl2fJQPZFXJ2a6R1vq0l4INZph7MukQj3PISul5R1Bjn7kMUw
         zGnKUrQqBakC4xMEKyYscA1zOqQy1UBhaq/ofhiL+Fu2/t1BYSAc2Rve6eSvoJe7GUQM
         LggHuRqrupH0wG2HQrga82x1acnxy15OHeqsIHQT6YP7qt1QSSsGcyocaEEQLinVgGzI
         S2OQ==
X-Gm-Message-State: AJIora9ddUvBOSqkeCe23W4G008RuUfnsEfEebM8xKNz6r71aiwbxZvE
	KmxSGms4sgEyjq+9c1EHVvM=
X-Google-Smtp-Source: AGRyM1voyCt7VjAOfjVOeHY/3xJlVXe/F/8AEucWr3BxbdggRUMgyNl2ENa2CHABKqKrRlDn/LVEyg==
X-Received: by 2002:a05:6a00:1a8b:b0:52c:9daa:ff65 with SMTP id e11-20020a056a001a8b00b0052c9daaff65mr1130577pfv.71.1659057923440;
        Thu, 28 Jul 2022 18:25:23 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id x134-20020a62868c000000b0050dc7628178sm1446314pfd.82.2022.07.28.18.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 18:25:22 -0700 (PDT)
Message-ID: <12b9347e-4ce4-6248-659e-5abe3c1dfcd2@gmail.com>
Date: Fri, 29 Jul 2022 10:25:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] mtd: spi-nor: sysfs: print JEDEC ID for generic flash
 driver
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220513133520.3945820-1-michael@walle.cc>
 <20220513133520.3945820-7-michael@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220513133520.3945820-7-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_182524_774551_1DAF81BD 
X-CRM114-Status: GOOD (  15.23  )
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

On 5/13/2022 10:35 PM, Michael Walle wrote:
> We don't have a database entry for the generic SPI-NOR flash driver and
> thus we don't have a JEDEC ID to print. Print the (cached) JEDEC ID
> instead.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/sysfs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
> index 20563c1926f4..c09bb832b3b9 100644
> --- a/drivers/mtd/spi-nor/sysfs.c
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -35,8 +35,10 @@ static ssize_t jedec_id_show(struct device *dev,
>  	struct spi_device *spi = to_spi_device(dev);
>  	struct spi_mem *spimem = spi_get_drvdata(spi);
>  	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
> +	const u8 *id = nor->info->id_len ? nor->info->id : nor->id;
> +	u8 id_len = nor->info->id_len ?: SPI_NOR_MAX_ID_LEN;
>  
> -	return sysfs_emit(buf, "%*phN\n", nor->info->id_len, nor->info->id);
> +	return sysfs_emit(buf, "%*phN\n", id_len, id);
>  }
>  static DEVICE_ATTR_RO(jedec_id);
>  
> @@ -76,7 +78,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
>  
>  	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
>  		return 0;
> -	if (attr == &dev_attr_jedec_id.attr && !nor->info->id_len)
> +	if (attr == &dev_attr_jedec_id.attr && !nor->info->id_len && !nor->id)
>  		return 0;
>  
>  	return 0444;

Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
