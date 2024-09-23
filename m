Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB5CCF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSqUiK6jeUNXpUIaSQJo4Gs17i//+G2a2WRFRaS9aT4=; b=dBbsLs8hsJdcI3
	cDRTu43PLs5WoLv/kedBawUJMRiE2DrQNfTjuVEotZ5/R8POpYhbLDcGAv4fXoDRtb+91Kgy1pti+
	KlG8oBQLKoZ84nJhUrL1bZ1bkVyKoQlnmaRxhPwPCi/yxiyYKzMxQpS5p8TVxIcRVleYcrjrdqaBD
	tocieu9O4kNCHfvNCbeHG1qqH4VBL5L64+yT+FUl6p47I+1OfiVQQjQT1DMYtClLJE6BvGDxl94xo
	aBxlJkKS+OE/5N5UK1x/SLLLkFkZeAoGtLzSi1zYpgtH6YDrR6Oabge9O8XJVUQDlt5ckFREIlray
	8QoRHZ98IadKlf3B5zwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sscBT-0000000GO9h-1cDp;
	Mon, 23 Sep 2024 06:04:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sscBQ-0000000GO9E-2WSe
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 06:04:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-374ca65cafdso2071527f8f.2
        for <linux-mtd@lists.infradead.org>; Sun, 22 Sep 2024 23:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727071466; x=1727676266; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0RNmrHmblvHO2guL4VXF8jdLa/bnTwxzeoY4QaRaHx8=;
        b=p78LHbDMOujVSl8wAWkBdCoC1FkzP91TEyRXYHha5tX59bcddeQzcutQHdzqON4qQU
         RvYX+RtAU4i63z0lCbJPP4kAUwO4FMLyK0y9PHFYf77DvZ9tU/9t9cpc0AqmaJbEN0kP
         l8xyxU0gIpHJ63bTkE5mL2rYqZWMVFJJO9nfuw+SzQza7v6v+JRJc2eqGiDUptVOADpC
         2MJCEYoEdoodOriK1aU+TyWfkUjLAZtBk5uWAOuxwJvsA1yIOp9s0Va679pzDoZw/gfL
         VBr4hJ1QUsFrzXOCC5bV3qPKcFzkF238KJi+X+B9An1lNQyl3SD4KaDB/GL92uAnsahk
         /kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727071466; x=1727676266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RNmrHmblvHO2guL4VXF8jdLa/bnTwxzeoY4QaRaHx8=;
        b=wPY/QW7RMHVr0Rpla+qayINemTXL2Z1/tCcuhc2vtxsFbcBtMbELvxxDyNlvbsCefe
         45+LyZeO4at50vIcm92UOj0MA52u9pHoBGEoaKUu4fwvyl8h4yc4HV0ErsDavBtDyCdH
         LoGGmhzFgXlGllhvOE6R2tbekSx05yvIWmouDyI3ZjYKrdtWEu3biyif3NoN8TJ50V/b
         8fQvONCmcC8P9sbaRTbD+o8eIK63d8Ek9gTJ1yg1SSd1Ygbvb5PXZA425+5S57ah5QhV
         WpKBvE5nH01ayfugNBt50g5fBGyeLezYw/mZHfAXd7HwlbSDJ+oJo7SEQMn0COTbsdOf
         FJhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpsL0aswzOadW4qXq81YKzvOX8PJDgml+srAOErTydkhlIFU1lUbu8brgSec8Zc7z+LeHWJCaCiHg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzW8EKGT5S+htIu/sVDEavEXZsVcNfectcsHcEq2Oko7VGCtN3i
	txNfi0rnErJRl7aO8cw5e0Pjqrtf6lyDLhw0JOmYgHzO6ZXM/qw0dcOZ9e7QAHs=
X-Google-Smtp-Source: AGHT+IH1eCn5MZAMQDZuDWL0pLjlXPrn6Z677C5pwlLNhKPM9d7744cqjDFZzGFS65Nkq1OxkrDYuQ==
X-Received: by 2002:a5d:58d9:0:b0:374:bd48:fae9 with SMTP id ffacd0b85a97d-37a422658aamr4808393f8f.20.1727071465802;
        Sun, 22 Sep 2024 23:04:25 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71f060bsm23742088f8f.1.2024.09.22.23.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 23:04:25 -0700 (PDT)
Message-ID: <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
Date: Mon, 23 Sep 2024 07:04:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Erez Geva <ErezGeva2@gmail.com>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-2-erezgeva@nwtime.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240920181231.20542-2-erezgeva@nwtime.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_230428_677524_E23CD286 
X-CRM114-Status: GOOD (  14.16  )
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

Hi,

On 9/20/24 7:12 PM, Erez Geva wrote:
> From: Erez Geva <ErezGeva2@gmail.com>
> 
> Add flag for always trying reading SFDP:
> Some vendors reuse all JEDEC IDs on manufacture table
>  with new chips that support SFDP.
> 
> Add flag for reading OTP parameters from device tree.
> Some vendors reuse JEDEC IDs
>  with several chips with different OTP parameters.
> Alternatively we read parameters from SFDP.
> But the OTP parameters are absent from the SFDP.

Do you have some specific flashes that you try to identify? Why can't
they be differentiated at runtime?

> So there is not other way but to add the OTP parameters in the device tree.
> 

If there isn't any way to distinguish the flashes at runtime (which I
doubt/challenge btw), then as a last resort we introduce a dedicated
compatible for the flash in cause and specify all needed parameters in a
dedicated flash entry. This shall be more generic as further flash
parameters can be statically specified in the dedicated flash entry,
less invasive for dt, and less confusing for people when they decide
whether to use OTP or not. OTP params in device tree is a no-go.

But again, you have to prove why you can't distinguish the flash at
runtime before introducing a new flash compatible. So don't go this path
before sharing with us what you're trying to achieve.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
