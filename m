Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977CC4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zz9SUMEz590s+HLm1VpqPWn+fWJN9s3NSRY+XfhNtK0=; b=DgI8DbdpZ2jHAz
	jlTjIt2YXwr1+j1UmqrFpZS6BsVD1e7y+x9d4Nzqb3vCDVCFf0BbC5d90UpdS3LzIHrw2SEzALoqo
	Q85dLY5dGHZNHg+JT3HLCBI9hqR/uWzzZZHZ9HlhXO4D5UGYm4YlsMKsCInazaTFHWX9oN0F9mCrG
	0ZPIDkcaxAFzA3GJLHuL0UAwLlxnWIqPvinBWXletZCjb66DkDxeb3+48WiEHsvk3q/U1XOkqip79
	yqh3+o37vRKlCuDB4WJ8EHUR+rcnDMf2ZmHfKtybPT5U7uRdboahVNSE3BNv1QZYeSKoRY+qGpZK6
	+dO49oivL4dFDBUGvvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOD81-002E8m-1m;
	Fri, 12 Jan 2024 08:43:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOD7z-002E8E-10
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 08:43:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40e63bc90f2so6279045e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 00:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705048975; x=1705653775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vVB+1AXF4fNqmz+1N+5wHVXaIi67VJOxIqFrZ4+Zds=;
        b=YnlR7/o5RhEZYFk9b2+ZNJiq5b6W9X8FtTLgH3BLM+OMrzc5CNW47qbtdRC/s30Cr4
         CrWni+pdBHRkHtOLM5zzbslGrKlTxiWnRhJW9Gahae61yEgooT+791Y7/mN8n91J8GNl
         HCAi8DJTespuk9X6BYqBeSNbfe3AKQKGuFZHE2vIJJexSZoIk6zNG/Nf+tea66aNmoA+
         62kuR8wC4OQ6ILVU0LHd3qjbTsprlk6RHFqpEFjvxAZJRTOUvuyZ0o5oufXE0s+3RrWF
         NrNSzezO2IqrEkQsHqBttcOp8Tty8B2jWbDYgtz6S/kmoFfxvXG4NzX/6WDXW/X2RoZl
         3UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705048975; x=1705653775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vVB+1AXF4fNqmz+1N+5wHVXaIi67VJOxIqFrZ4+Zds=;
        b=FOpSu7DfR1kozOmcaZwQ/Ka6YeSXGLCs8Kk3hgyhlWH/UAXoB/Lj+p3PuioWzYH4sY
         PZhe0IgYsO38Ro0DiGFbepTdZWqCVDV5+bXv71xa9pOEWp3+EfKZ323zqkk21IbWzvO1
         1m3kyDuCgEr3tJ1bKnMSOWQ4yvGBvZZ/2SuNPunrn78ogK4PZZPJXapDGA0KfkCXXfIF
         dWS63ckDAyGtReEoHVVbw5YCS+ccnUv76V8f4XGzv5QnwEYSBOFjXAh4YH/E43jU60Jl
         eUPPHQ0ZRFzgg/6DNFK9AvXywuTxfqVed4XXlM2SRguFps8NnLb9SuQDXy+lKvN0/MS2
         9TZw==
X-Gm-Message-State: AOJu0YwOJfQfLFRXHkhDKeR28QgUcHYdKN+HqT7ixKM7q4TBX2SyRLzb
	H7VaWwUQa0wnVNbvdCBONSG6ccmrlqRw8A4e9q2JGlBMPLk=
X-Google-Smtp-Source: AGHT+IEf+vm9kz2+Rco0ADgl1G/HXroOh7+JR8Q80u6Btio/MRKk7lpDbCGajy5ms4imMYUPOm/NBQ==
X-Received: by 2002:a05:600c:474e:b0:40e:5ed3:ccf4 with SMTP id w14-20020a05600c474e00b0040e5ed3ccf4mr533193wmo.16.1705048974811;
        Fri, 12 Jan 2024 00:42:54 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b0040c6d559490sm4910142wmq.3.2024.01.12.00.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 00:42:54 -0800 (PST)
Message-ID: <50258aa1-3b62-480c-89c7-c9a686e2d237@linaro.org>
Date: Fri, 12 Jan 2024 08:42:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] mtd: spi-nor: add support for Macronix Octal flash
 with RWW feature
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-7-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231221090702.103027-7-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_004259_370644_8A89A25E 
X-CRM114-Status: UNSURE (   8.15  )
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



On 12/21/23 09:07, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Adding Macronix Octal flash for Octal DTR support.
> 
> The octaflash series can be divided into the following types:
> 
> MX25 series : Serial NOR Flash.
> MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
> LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
> LW/UW series : Support simultaneous Read-while-Write operation in multiple
>                bank architecture. Read-while-write feature which means read
>                data one bank while another bank is programing or erasing.
> 
> MX25LM : 3.0V Octal I/O
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8729/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf

Link: https://blabla just above your S-o-b tag
> 
> MX25UM : 1.8V Octal I/O
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf

Please split in 2 patches, one adding MX25{LM, UM} and the other adding
MX66{LM, UM}

Please read
https://www.kernel.org/doc/html/next/driver-api/mtd/spi-nor.html before
re-submitting, you missed the sanity mtd-utils tests.

ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
