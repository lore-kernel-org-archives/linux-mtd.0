Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52767C4167D
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 17:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mM4bdy9lYriQaJDpCzYSxE6+9/9x5P+GYv9QCbIPN8=; b=a02XEueaXH8qYB
	M7VjxI79lLxrbxS+fGB1IWrxuzXOXGWfgC4lzFrBzA+fU35D13dTVrqWWCpNBpCEQ7+QKA4Fj6YRP
	NEdVub9TW070H5PnGaR1baLrk+q5m0xrOuH4SMcGkbTW4jnwPsVAn7tLztRfHO+DqVG7b6gBKuFQo
	LojjJYN8V7pi1CDLw8L1Lvp2XGYtSniy1k9znsdsRMYgcCYDiWLQDlpGfHNRfISkGe4OH+ACAZCwj
	stC6K0K3hTMK/yLE+z/AaKDfoTGFLmaBaXiqMD4hFZyo4sfc4GU6HwfrLKcmyHIFrJXhfdqhUyfTb
	EYOkh0N5DSdMeOFJrb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qybcL-009zFe-1q;
	Thu, 02 Nov 2023 17:36:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qybcF-009zEf-1S
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 17:36:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9cf83c044b7so179874766b.1
        for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2023 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698946578; x=1699551378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAzSBZRGcx+yJgUisNsjNux6eYk5/mGGKZouPPlzhAg=;
        b=RS/4eBnBgULWSm42qaGCl8ZoZYHcaqnML8SAOtXZFpLG9SWY1k1wMgjDqYKLTb2Ij5
         /XXKdSrefJ9cnjlWZIh+OVUwjtBCOZEWL+RLEa3kLMxPYzKnNWCjohBYitQ7NVP5T3ac
         2C4a+m+56zEVoByrFFEs4H7frAbHl4amx8sKEb+EBEi+rj+u8gvjT0kEmCMMnELnGMqp
         G6UJerKKAtGjnrDsywsL2vOGsKRRizMUZuG2p2iol0/UL1IpWEyi+fNeuMP+ow3VWpJg
         akgeerPSyrko9zQxveHcPCiMWsrkUB22rT1ME/ViwyDBJe6HZWj9n3z11E2M0XYRs2SH
         4v3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698946578; x=1699551378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xAzSBZRGcx+yJgUisNsjNux6eYk5/mGGKZouPPlzhAg=;
        b=WTweAeLH6JEWgAT8aJ0wumKH3xd7sc3FQV46YwhipOKlUkEr3wYwxEHRrdLRZ3ec5j
         iZZLQDkXBBiLhiIoB39KY6b/3t8GVxvhHgyhckSSLVpUMShrnJdzbZeJfX87NohSs3Td
         Lk/yukG40g74tfoGLICTgZtOeZ08EKWrrYQP6Qyc5mEuRPj5AkAbuJ65CZk0uK+CvoYV
         LOHfH5OE4cyLQCn5HOYQIB54zUZBHUSEzcltfdg1UodY9AzVU5HDSRh7s4C+AU9zxQa4
         m2gPi6sznuFlqIfR9RDm0vLTYfF/bZ/d/lHslqhrUDpBl4w8yCe6sfswAE0doWGrD36i
         K19Q==
X-Gm-Message-State: AOJu0YyMWzxfqBtyhfX/fJrVpqHAMal1CqiRdnOAqsej5kpYmR+NVdG9
	lo2sPPJcJuhPCXr8MpRe53pasQ==
X-Google-Smtp-Source: AGHT+IEQ3UF7/RHYMTb7CQS1NuAxCgZz4wsDJeJrmpi41w+vmfWq/Lr2sqIOzYXpZ1KSMwvbAAU87A==
X-Received: by 2002:a17:907:8b8f:b0:9db:caac:2995 with SMTP id tb15-20020a1709078b8f00b009dbcaac2995mr1812978ejc.41.1698946578452;
        Thu, 02 Nov 2023 10:36:18 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id j20-20020a170906051400b009b947f81c4asm1383733eja.155.2023.11.02.10.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 10:36:18 -0700 (PDT)
Message-ID: <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
Date: Thu, 2 Nov 2023 17:36:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
To: Fabio Estevam <festevam@denx.de>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_103623_488022_0DB8DBD6 
X-CRM114-Status: GOOD (  18.67  )
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



On 11/2/23 16:43, Fabio Estevam wrote:
> Hi Tudor,

Hi, Fabio,

> 
> On 01/11/2023 14:27, Tudor Ambarus wrote:
> 
>> Thanks, Fabio. I can't tell what's happening and it's getting late here.
>> Die erase does not execute if either of the status register BP bits are
>> set to 1 (some sectors are locked), but that shouldn't be the case I
>> guess as you could erase the entire flash before. So maybe dump SR/FSR
> 
> Correct, I could erase the entire flash before.
> 
>> before and after the chip erase op. Other idea is to dump the spi_mem_op
> 
> SR is the same before and after the chip erase operation.

what value did it have?

> 
> I haven't dumped FSR as I didn't find an easy way to do it from the core.
> 
>> fields, after spi_nor_spimem_setup_op() is called, maybe I got something
>> wrong there, but on a short look it seems fine.
>>
>> I'll re-read this tomorrow. Cheers,
> 
> Not sure if it helps to give some ideas, but there was an old submission
> for die erase support:
> > http://www.infradead.org/pipermail/linux-mtd/2016-October/069960.html
> 
> http://www.infradead.org/pipermail/linux-mtd/2016-October/069961.html
> 
> http://www.infradead.org/pipermail/linux-mtd/2016-October/069959.html
> 

yeah, nothing special here. It reminds me that I could have updated the
uniform and non-uniform erases to use the die erase when possible, but I
was too lazy to do it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
