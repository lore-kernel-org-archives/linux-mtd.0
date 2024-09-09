Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD05E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHrTF4/p3kk454P1Yx6t6y7h57tBE+m9yKbpIWCYVmo=; b=ATQGJKGALdf2Kh
	qws19592M0wZEtsKoBWrlxfe8axseESURLmziwJBGts1vLC2l5ZnbVeWSgBCPs8MUkUwSGo0wn/Xy
	ZHdiv7RjfOwOSiXKlkMBjdKnaG+lXUDyLR3vc2B+wewnOeR76Q1PrbTGOEO+FSj/K7FzNQTOBgDQj
	HeqE3+Puu2I25qpFWyfjhYbXE+WV10oqzRAH50Sz4D8LiU/6IwCHWRssBHynQRIXGnlo8JSdcA3BE
	ZAmOZhg5e04F56GQJsx80Y/IHs/W4QACg0eS0RoqaScMs6JNTWVIbE8P7h1q4VM++M6dcbzi2cVAC
	waKDfVLJrfMNz/ItAZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZTw-00000001094-0WOU;
	Mon, 09 Sep 2024 08:10:44 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZRy-00000000ziQ-43Id
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 08:08:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53660856a21so1659720e87.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725869321; x=1726474121; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ZysygBP90xw0YfFSeVMvs3w7t7+9x3p5n611CD5diY=;
        b=ifhcGAcgZgoJ+2AmQVLmLcVXlp7PQRw/b82exxa+eyMjU5840Tv481AtXo4WysRCZo
         Ra5x+eif6CrTSylIO23tNEQh2kVIDAi+pCVOZDHoTGLpc/N0A7rQulPHL7JWIKwADunH
         eRpqvziiMA/ha1y61fe4LGBKX2Ne9A4yEW36Y+7cw6lKdo07wa1AbGsOVqzfXJHUHADp
         6up5bRb4mYNjYypoUZs1k15wDxvVC/NUYDoS6PaIs12UxlCgS3JlH4eTXxdcvsSXrmjx
         mXhTLb+CUAxxnV5Gh5AVHBbyXYfTQF5qAAawcWIWP5M8Lhnj8KveHrDZZ85l1LZtWwgs
         d0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869321; x=1726474121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZysygBP90xw0YfFSeVMvs3w7t7+9x3p5n611CD5diY=;
        b=w02G/hxa70nI09PuZCl9WG55YCT4kLxx8JAy1FLNlXYS608YqtqVL8IHBGO9YDAutp
         eset1aAz56YfGiRuWVKmov1mpkz6/nvjK/BQORSqrRhDeAMoiCAQ//9hggQaNVwtltAz
         hCru99+Bj0X3DemcBqfTWdfD1rqyna/btIJrZzMFrGGZ6K2zffZ9aDCO53cdr16SoZV2
         VFTr+kkm48XgcNeSdK7qmxR1V3Z2ObniQydI+gk6+cWasppDUhKq8sdRyuX2PEQq4OzY
         EtB2ZywG2YFKvYVeHUJlrhzyU8YCgzOqFpOJqIpyE7h1dw9sJbcvPxxunyG2xMXQomC8
         20/g==
X-Forwarded-Encrypted: i=1; AJvYcCXbECdx0RjshZg/sfiFZ6rHTvVfcvu1SwWT+KIUvpqTJjDbgIKUq9kik/fIMHN3y8wWIBkFB4J1wDg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8DBf7p9e6ClBoin5NKtKaBJKIhY3GrU7qInOmlBScx40OZRPU
	gNXMsnoQTw7JH9yx9qbxLraXbubE5NX/xogFET/Uz+lmW/2/J4SzbcrQduByJUE=
X-Google-Smtp-Source: AGHT+IHcztwzp161pPkPxTg7Phfzj6aXh7Pftd14Z/cF9YHM4WDvI+mXDQKsiB5iZO7tWa85Ie9iJg==
X-Received: by 2002:a05:6512:220c:b0:535:66ff:c681 with SMTP id 2adb3069b0e04-5365881042emr5201914e87.48.1725869320025;
        Mon, 09 Sep 2024 01:08:40 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c6117asm304572766b.98.2024.09.09.01.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:08:39 -0700 (PDT)
Message-ID: <b2d0ce1d-fa46-43e9-bb29-c98d1161aae7@linaro.org>
Date: Mon, 9 Sep 2024 09:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: fix flash probing
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
References: <20240909072854.812206-1-mwalle@kernel.org>
 <ad9ee29c-b96a-4861-a7cd-b8649a3d1f3a@linaro.org>
 <20240909095247.48358afa@xps-13>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240909095247.48358afa@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_010843_067281_25FF650E 
X-CRM114-Status: GOOD (  13.92  )
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



On 9/9/24 8:52 AM, Miquel Raynal wrote:
> Hey,
> 
Hiya

> tudor.ambarus@linaro.org wrote on Mon, 9 Sep 2024 08:35:23 +0100:
> 
>> On 9/9/24 8:28 AM, Michael Walle wrote:
>>> Fix flash probing by name. Flash entries without a name are allowed
>>> since commit 15eb8303bb42 ("mtd: spi-nor: mark the flash name as
>>> obsolete"). But it was just until recently that a flash entry without a
>>> name was actually introduced. This triggers a bug in the legacy probe by
>>> name path. Skip entries without a name to fix it.
>>>
>>> Fixes: 2095e7da8049 ("mtd: spi-nor: spansion: Add support for S28HS256T")
>>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>>> Closes: https://lore.kernel.org/r/66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com/
>>> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>  
>>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> This patch will only apply on top of spi-nor/next. It would spend more
> time in -next if one of you applied it to this branch before sending
> the MR?
> 

The patch is intended for spi-nor/next indeed, as the blamed commit was
just recently queued. No need to take it through mtd/fixes. Pratyush
will take it via spi-nor/next.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
