Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EA3D2F7E5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2024 04:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fD0LD2JBRQNcEQjcbyi7scqW/kL07dr6stgkzpLaAc=; b=DbEvEGSuun7XMQ
	f0VlK20PGulcpjXF1YRPPUMxR4Y4et1AAhH1klhr1a61mBBNb7O6tq7We+e88FxQstwCBBHpgxvUp
	muOUL3beNRs9vEAxTaDokgmYd+PvPUQRaFwrozQVpNHHa+VyZG3hEK3+urD6XwA22nhUqP7+rzpDB
	aaMr2VnYUFkJxTPGgmBS9QzrXhyf5EIh1Hp7+KTZQr+sTZKSWbnUB0+DSxOSiPa7R/FsexIi0VbKH
	ZqFfwq+i3LVLEwSQ4otzFmERNgjxf3C03Tt8EdRve29YrH9CbK9JjZ7SRD0wyRKZyh9uPmVk66rWO
	ONOaILcrrtoDSc8rAL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ICI-0000000Dj5O-2ChR;
	Thu, 17 Oct 2024 04:33:14 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ICF-0000000Dj4w-31Im
	for linux-mtd@lists.infradead.org;
	Thu, 17 Oct 2024 04:33:12 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e483c83dbso385023b3a.3
        for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2024 21:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729139590; x=1729744390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igWUH4+zFZyTVY+s03eo1LIH3mhnE39F45/f44DU7Ws=;
        b=Do/X9mNpGVj8HZrtwAnsirupbSNfPyIG0AuXfugR8sQ9Yp9xQvOHc7aaJLue+ddGri
         iIPn7EPYx4BhZZ1hLhttVNIO7iZGmYExQOn9iwX1Y/HjoSlLr2aQAkgsrSPcMIXvNjd+
         AAhsPCXZ8ib9Sb2CIWQpJ5hag+6aTfFsfyjz2rHrDpXwlr/JZZMTKxsvv7ss9l0nAZWA
         0LTl6df84w5atGqrskjcSOsSOGTvtFmEo7MTa+7sa4JIaqFGlfP0pKjGEjlwLuR2eEm3
         S2JpF7tJM0fN9xiNW1a58hzB4W8FtTKaSsAjb1wCK2PCbsA9estWqlxyhH50MDqT92zd
         NmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729139590; x=1729744390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igWUH4+zFZyTVY+s03eo1LIH3mhnE39F45/f44DU7Ws=;
        b=cgyLrW38Lja2rukq8n0FAJE90jGY8bP7QouSY66O8+NgQgbzpUNA/PHder8jKfIJHF
         L3B8fmr7RwDC5NeHxkBySgOZasc7yMcg5HbOiQi/zMTx3xj2j+mr2syfckcksRQG8+gr
         Q0PTpoJMCdgZvX99wrhbn6tncTtA1IuwtxP7DSZmy1wYRGY5c5BXsr9+FGDWo6nmIOoU
         CKENbyIgNHvHEY+7SR9l+wTfpVvmqZTgIjEEy/H55nkPczIFm8TNpGYJQQmcphHCQuHz
         mK4Z9LVXE/EzRV7kg9sF2iuV6/3EmkqLpj/QLSFvKdh4PJ53VIdlUELgdduyUK8oiHwV
         sjBw==
X-Gm-Message-State: AOJu0YyiAzsWR+HoOC9jU0jhV6ERMaeX080pti2I8OQWCcwWwLx8r+1a
	VHy4vV8FHasCtQRI1snrdV0ceptYGOQox4OL4AyGnvi6U+vECY9L
X-Google-Smtp-Source: AGHT+IHnJbMrTmDYaEy8rkOJkZYS/bFtEHgxCGz4vhyGqOKmPStZr3Eop5Tn72B33FohEK5FfN5DqQ==
X-Received: by 2002:a05:6a00:1782:b0:71e:55e2:2c48 with SMTP id d2e1a72fcca58-71e7da8c0a3mr9185032b3a.16.1729139589999;
        Wed, 16 Oct 2024 21:33:09 -0700 (PDT)
Received: from [192.168.0.9] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e7750a74csm3864533b3a.212.2024.10.16.21.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 21:33:09 -0700 (PDT)
Message-ID: <909a6720-188c-4261-8411-a7d87c746f5b@gmail.com>
Date: Thu, 17 Oct 2024 13:33:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Use nor->addr_nbytes in octal DTR
 mode in RD_ANY_REG_OP
To: Pratyush Yadav <pratyush@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20241016000837.17951-1-Takahiro.Kuwano@infineon.com>
 <mafs0y12ocl7n.fsf@kernel.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <mafs0y12ocl7n.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_213311_797775_41773185 
X-CRM114-Status: GOOD (  19.00  )
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

Hi Pratyush,

On 10/16/2024 8:59 PM, Pratyush Yadav wrote:
> On Wed, Oct 16 2024, tkuw584924@gmail.com wrote:
> 
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> In octal DTR mode, RD_ANY_REG_OP needs to use 4-byte address regardless
>> of flash's internal address mode. Use nor->addr_nbytes which is set to 4
>> during setup.
> 
> If the flash is in Octal DTR mode, shouldn't addr_mode_nbytes also be 4?
> IIUC addr_mode_nbytes is supposed to track the flash's internal address
> mode. If the flash goes into Octal DTR mode then its internal address
> mode switches to 4, and we should update params->addr_mode_nbytes as
> well. We do that in spi_nor_set_4byte_addr_mode() for example.
> 
The flash's internal address mode is represented by CFR2[7] (ADRBYT) and
addr_mode_nbytes tracks the state of this bit. If the flash goes into Octal
DTR mode, this configuration bit is unchanged and referred after exit from
Octal DTR mode. We need to remember addr_mode_nbytes for MTD suspend/resume
event that exits/enter Octal DTR mode.

> I suppose the best place to do it for Octal DTR would be
> spi_nor_set_octal_dtr().
> 
> Side note: honestly, this whole thing with params->addr_nbytes,
> params->addr_mode_nbytes, and nor->addr_nbytes is quite confusing. I
> hope to find some time to clean it up some day.
> 
Agree. This is because flash's behavior itself is confusing:(

>>
>> Fixes: eff9604390d6 ("mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP")
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>>  drivers/mtd/spi-nor/spansion.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index d6c92595f6bc..5a88a6096ca8 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -106,6 +106,7 @@ static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
>>  	int ret;
>>  
>>  	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
>> +		op.addr.nbytes = nor->addr_nbytes;
>>  		op.dummy.nbytes = params->rdsr_dummy;
>>  		op.data.nbytes = 2;
>>  	}
> 

Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
