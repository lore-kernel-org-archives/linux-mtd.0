Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5094C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFolJJccACq3qtg7Foa5Fc0Li7Qe6KAKDq9/Nb7+VHA=; b=L0I6yQbO0p/qzu
	gi8mAN1YXlEOlsPclDGBvYoy/DfR66CTf8wFyPJLosRPaDgddvzTDqQx3+rESIMB7/whABQBxt0R2
	bxtzqOco41BeOnyqJPsSpaVfsNaviYeEbba319jQZ+GA/AuBOb2tGDYiSMH+1Ku/R268KPe+RVjVx
	4w0SXC9dk5CaVnkVlLuTauow763NG5sdNseMhMwKQTc2MPyLNz+GVv3c0NJ69Eoe6jijkYvLFJc8H
	qQepSUNRoLAPmUNCFcch/8OlxQowc9hHnjLWXIBGtQ58HT+J49nVVnoNC744/rph8Vlr/bFygd5Jy
	20/Dme5elPe7zAnX8x4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZ95-00000000Kh4-10fr;
	Mon, 26 Feb 2024 11:27:43 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZ92-00000000KgZ-0Srv
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 11:27:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so51164631fa.0
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 03:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708946858; x=1709551658; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAxSkOK9ZXCTs9spnvc7mJoLFhrQH9Ul2jRGH6W0hCY=;
        b=N92HTpk5U5u1jrPipOsVszKLHQv2LACTH91Ty7TG0TPlu1WyTO/OPuFNAIXghwidAf
         ceIJl3kx6MZSArgguFJ18Dq5+GQkT58P6tCxLBLimeTHUz5OtQiAnL6z25cI8LDYbxdo
         xTeoRPBSo8hFY17Yz+bapZmrMrGabyumklk8rvGzZOXB215lFergRBzG80/EyKZe3OGc
         fV6oq3d3dPVMUOer68XwhFbvQQJai/n+VLr7nq7guS0hntf3m9FerDGEk5h3KUF6oJDM
         O5FDRT9IbiuJW0LUDmcqCEK/IqC57Zelq8UjXIn4bd2bbJtofdlHVq1Ch70SxiqnWRVB
         jluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708946858; x=1709551658;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAxSkOK9ZXCTs9spnvc7mJoLFhrQH9Ul2jRGH6W0hCY=;
        b=KfWt8IIePdzi7zzTByNse/I9pl/NczDwNnoopUxQzqkGKVDoADzwF6s6CvDA28TjXw
         z1xK+cFcc1J/8aBGaA1hFuGMlbR81Pe6fV2M4xx7N+yiHCXa27USo5FaJp5OeEaieugk
         kuKO7SiaAdvUeJCgQol8RApVd12HLHYsDRvAA7f2XU7xonRIIoFNPumZu5fC32E4VovZ
         cOFPIvXdAwU8nBpStO0sGOnZTSB2kDouyOrSVBY5GZjo6WA7QCMrLfrN/FsRRdj6GOIh
         b26IJyhvCfHhBbOMG23PP/F0GyMRUh/BjJegy7ErPevavhRZMibP/ya2+q7uRQg92mhU
         1bAw==
X-Forwarded-Encrypted: i=1; AJvYcCW3emSx7jA53Hw4aEDYfaWEEvnPpT5qE3beSVhUattviR6o3cOEesJPC4KjgqN36bOuCkJgxk7mT8AKT2WRO6CR7AoEGwkyOsbNcYa3lg==
X-Gm-Message-State: AOJu0YzdLnWfjg50V03+JkybohJVo1PjTfjJxfVJDRnr/6RQFifazea+
	gcW9EZmCg20aPDiL9yvE+ISuim9aVYF04tUlRbB60AeVOf5Avqcv5tlZ1GFwRuuD8qzTnD77/XP
	9
X-Google-Smtp-Source: AGHT+IEi7LpE7urG+YhCtsSgSezgSAsWcDmg7FjsmhuZTa/Y0Hn4Qb/6gZsKD26wCVM/Ek1yCXfDnw==
X-Received: by 2002:ac2:4909:0:b0:512:ce6c:1906 with SMTP id n9-20020ac24909000000b00512ce6c1906mr3913277lfi.50.1708946858015;
        Mon, 26 Feb 2024 03:27:38 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id d6-20020a50ea86000000b005661badcccesm77127edo.87.2024.02.26.03.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:27:37 -0800 (PST)
Message-ID: <cb237d49-6f0b-4f3b-8f84-7b23495a61be@linaro.org>
Date: Mon, 26 Feb 2024 13:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Add Puya Semiconductor chips driver
Content-Language: en-US
To: Dmitry Dunaev <dunaev@tecon.ru>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <9ebf9cdf-eeba-417a-8410-3f87a0973136@linaro.org>
 <20240226104101.1848855-1-dunaev@tecon.ru>
 <33c0c516-1f5f-4cf5-bd3b-70b61372a53c@linaro.org> <ZdxxZb+fbzXv7ZNk@tm38l>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ZdxxZb+fbzXv7ZNk@tm38l>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_032740_203225_4FC00776 
X-CRM114-Status: GOOD (  15.19  )
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

+ linux-mtd

Please do not send private emails on matters that are not private.

On 26.02.2024 13:09, Dmitry Dunaev wrote:
> On Mon, Feb 26, 2024 at 12:43:58PM +0200, Tudor Ambarus wrote:
>>
>>
>> On 26.02.2024 12:40, Dmitry Dunaev wrote:
>>> Add a SPI NOR manufacturer driver for Puya Semiconductor chips
>>>
>>> Signed-off-by: Dmitry Dunaev <dunaev@tecon.ru>
>>> ---
>>>  drivers/mtd/spi-nor/Makefile |  1 +
>>>  drivers/mtd/spi-nor/core.c   |  1 +
>>>  drivers/mtd/spi-nor/core.h   |  1 +
>>>  drivers/mtd/spi-nor/puya.c   | 64 ++++++++++++++++++++++++++++++++++++
>>>  4 files changed, 67 insertions(+)
>>>  create mode 100644 drivers/mtd/spi-nor/puya.c
>>
>> what changed in v2? why do you need these entries? Can you rely instead
>> on SFDP to initialize these flashes?
> 
> In first patch I missed core.{c,h} with Puya flashes structures.
> 
> And about SFDP on Puya flashes. We try to call DP command on p25q16uc

what's DP command? SFDP read?

> flash and got no answer. It may be a bad chip pack or other matter but
> now we need a manual description for this chips.
> 
> If this issue occured only in my case we can skip this patch.

It's first time I hear about puya semiconductor. Please follow the
documentation that I've sent in the previous email and dump all the
required data.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
