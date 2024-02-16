Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EBBC48260
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Feb 2024 08:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqvdeBf9qaRJwR/Y2w2E6m2I6D2tX7kRS07ZklV6814=; b=meZCLEl1RY00vE
	PSD4nONlH/LwxL6bph7wmOETtQ44vgx7OSMJH0HtFoTDMPp4S3m0BrLWHtf3NPiPtpEJFt3hMmxyB
	aSoTPH2ZRo8nc67oNa0DEBFtExKpDoZ6S8YQoOOp5rHc8TEAdwhnz6sMHgRrSyTNavPylGRFB6sqA
	5PDVGZMdbMhFgY2QcEqreTWCLr3pFIfdsnnVhCIrPa4Oa7DO0IPC7Jjowb8TgssShX+MMme14pv8y
	yj6/cO6DnCvSDh2awAfFmn/IlfuA6kqmevk+PPjOpUnwyEJFrDT22vNThtTsTa0jZOItAfqBa/afC
	wbAgcV6sg00L1pisoQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ratje-00000001YRJ-3Sfh;
	Fri, 16 Feb 2024 08:38:18 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ratjb-00000001YQk-45WN
	for linux-mtd@lists.infradead.org;
	Fri, 16 Feb 2024 08:38:17 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3bbbc6bcc78so1238247b6e.1
        for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2024 00:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708072694; x=1708677494; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxGjiroUwMHSO73WxI2od6A/pkwN5Dz9Y7BE0IRwELU=;
        b=hFXcfN4tu3MJyM5HwVzmqFrby1wRtGRwDCLwBagf37kgDht5IBQeS1vkmRoNLzsHAJ
         MOQhKcNj/VC365bMlBIyjW7ETCd7RTtIgS1/F4Q/xXVcd8mlqZ4j934Auy5Ye0Jj9agA
         rNzVxBlaCh2zfq9HqLvObUouKSHSR6aV/FH+sh4PpVnO5fNQCJ96VP5vYMA1qOOs+aJ4
         0KGl2OUJIkQv1939BEBVEi6g72X8H6oeGTudhE0TaegG/CXAVK6m2eyqkSfopPd/0X/q
         /wn22vIB5K+RX4xa75lt/oU3mYSxMeAL1OwmYNpie7nNdVCqV2zKFsjeQyQiVQ9CVH4t
         S47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708072694; x=1708677494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxGjiroUwMHSO73WxI2od6A/pkwN5Dz9Y7BE0IRwELU=;
        b=ezXqsYxL6pti2e26yKPPUYVrsGcfI+QlF54fFYNtevfSyCp4d4AJ6XsAjURchjrk0q
         IpPMxYJggvlwGiaR6/+fGDGCmRpE5deANNjD7KTBgt7aMrFrIkkuqKYslhTR+SyXCZaB
         EcM4IHoVd2TC75qXtNKzY4RzIRNdE+yK0bOYb/naHE4QW2oP6XsfNZlBqtp1D0TSuACk
         zv4JTo9aw0pHqCQKg9W5Gg95Q4VFusSMF1OCgVFeLJDKPVRgkzsyIgahNY8l8/xlm4rz
         NMeCOJE86IbQ2f8nEzqMvzj9ixr+QkalmIDnZDBvatXaottHtf331OlDpd6JqqVLhd2y
         H4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiHihqaoZ+jjfkl9rExPiWG/sJDjRWBEBz2AxrAGee4wdJWd++rYScjBF81NQFfVBfDbIkdS7C0oJOg8aoFFJYwdNUmnPK6JprP2aeDw==
X-Gm-Message-State: AOJu0YxtsHH9npNfKKtqHx3zQn08qiFLDKSowpnyySLV/eC9VQTU/9mD
	FrJizWppKTRq+fQsFrfqGTXnvYYTwJngcHZhQEn8yxOSvH+C5CCx
X-Google-Smtp-Source: AGHT+IGrGwNXW/M/mX53YodRNMyx0SPpif4eaeqShKXJAY7+MJwR1Qjn1jL2KoPbllUzHtX8Ptw6tg==
X-Received: by 2002:a05:6808:140d:b0:3c0:3d52:1d74 with SMTP id w13-20020a056808140d00b003c03d521d74mr4845202oiv.0.1708072694540;
        Fri, 16 Feb 2024 00:38:14 -0800 (PST)
Received: from [192.168.0.9] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w6-20020a626206000000b006e025e1fa61sm2787457pfb.14.2024.02.16.00.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 00:38:14 -0800 (PST)
Message-ID: <593de427-3011-431d-a51f-9c5211b47126@gmail.com>
Date: Fri, 16 Feb 2024 17:38:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: core: rework erase map and erase
 region structures
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1707193538.git.Takahiro.Kuwano@infineon.com>
 <028070a1a02fe6db3c9bc0c2e0ac93116ecb0c0d.1707193539.git.Takahiro.Kuwano@infineon.com>
 <CZ33TC3K8N3R.1PZHTE7ERTQB8@walle.cc>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <CZ33TC3K8N3R.1PZHTE7ERTQB8@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_003816_048730_363200F6 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On 2/12/2024 9:37 PM, Michael Walle wrote:
> Hi,
> 
> On Tue Feb 6, 2024 at 5:37 AM CET,  wrote:
>> -spi_nor_region_next(struct spi_nor_erase_region *region)
>> +spi_nor_region_next(const struct spi_nor_erase_map *map,
>> +		    struct spi_nor_erase_region *region)
>>  {
>> -	if (spi_nor_region_is_last(region))
>> +	unsigned int region_idx =egion - map->regions;
> 
> I really don't like this pointer arithmetic. Also it implicitly
> assumes that region is part of the array map->regions.
> 
> Can we drop spi_nor_region_next() altogether and let the outer loop
> just use an index into map->regions? We have n_regions now, so that
> should be possible.
> 
I hesitated to rework spi_nor_init_erase_cmd_list() that may degrade
readability, but I will try now.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
