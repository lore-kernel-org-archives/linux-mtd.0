Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEEFC4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkGwoDixtLXenIW9oJCAH3Yqg2wJozrVqbaosTx2Yi8=; b=W/CBmroIiPSaBk
	NR/zDggQqXAWtoG6oo9cfpAC44brGv5K2Gyt7U9LPr4mD95jTs+kC4dUTxk+dlgtu4MazQa1qkdhq
	ZEQvIqEbCihxvGZHU0o7JwGV1eeocuB5S/uB82fD5pY4b0/bPXygQOIJfD3ZDkUCQiAWv9WPp3RUp
	2qoEO2wqo1lHy7vKq6XzHz4L7SehvSqhJ1e0rGwckSfm76eQS+eM88rJKnfFFAtvRhpTYpl/oy8EN
	+7HpNLWqX3cGTL6RbFPRhL3Q+WfXt/P3tz48Et6OYaaVMfILjtdbt414OJGFfk51J2jfYinJGsYg9
	VNbm+IMZvzLz3XB/8a1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tET-004VIB-2i;
	Tue, 28 Nov 2023 08:14:13 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tER-004VHU-0Q
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 08:14:12 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507a3b8b113so6689008e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 00:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701159249; x=1701764049; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SB88Phe8Cfzd+i16UVy0kM0pj0uuscbZuQ2NaLA0dCI=;
        b=F+8vvfMcrSlkzHn9MJNgTfkW8ghMbAeGeRviWvnO3xLa6gCbbR1+qe61NW7zCqiDhw
         d3EpF4r50NYoLV/CRcmbji9V5aj77kTxNv4LFU8PhdBIENtqRb7QFnD/ihoc3i5KQmOu
         uIJ596eSdviwJR96yXt97iDGdaLYZs2KgX5k+OwelMoEbBCIPPIWuOcQ4iBe4sKhwwWT
         CXSU4XBu7j4rlm3IPv2zyMkIT79G2Mh08aDk1GS/W+CZ3UbuWpcd39kb/2aWvINPKLKa
         QAtKet+TWvZvl0DVKVPTIFquwjCucX1qWRY6pQ5LZu2GJPxoLy76+2e4QhqufdbnTdHp
         aCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701159249; x=1701764049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SB88Phe8Cfzd+i16UVy0kM0pj0uuscbZuQ2NaLA0dCI=;
        b=kP3cCLDmMd5He4mDZ5HnBjbHa9/+TLX+sQdRIlaZdXunSElvPAkKQkADPQIeeduhx8
         fUaPJz0DU9N18jKAFti2ahtbO/IQkj4GhagldNifwOtmM9fDqusWTLcF56bi4iAuDQSa
         uV+WiKaS5mrfzKMgZaBKcB0Gn5WBxs6fetqkC12M3IXxLtiTsR09LhFRnNu910O7HlYl
         tCB6lFIkVXsk/Ly6tieU3ci0RxbXlBAHspJ1Yofwcma6S4DAxxnNfNu45i4xH+A3DUzX
         ZJr25nwoTQu991hv7zFR1ZzM3xWOy2A8uMtFHJXXaW+MaKf1q9S63hjDsIFP5+ZhJ5fk
         +z7g==
X-Gm-Message-State: AOJu0YwRdqcAouhdsp16ch+t4SOamcN9om8M/4E4P0zMEYJu6eqtA7XH
	aKwlP0oAO1YtLZHK1ndOMlRnVA==
X-Google-Smtp-Source: AGHT+IH54uXWkp+cTxiraNfMZKe0PZ/sj6esGVZEivbZ9wC4TftDlJKcFMCOpGUyLXPhgNkrvGTE/A==
X-Received: by 2002:ac2:428a:0:b0:50b:aa88:c54e with SMTP id m10-20020ac2428a000000b0050baa88c54emr5531985lfh.16.1701159249425;
        Tue, 28 Nov 2023 00:14:09 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id ay12-20020a05600c1e0c00b0040588d85b3asm17299412wmb.15.2023.11.28.00.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:14:09 -0800 (PST)
Message-ID: <e9bbd6a7-3802-4236-9957-6147eb4fd644@linaro.org>
Date: Tue, 28 Nov 2023 08:14:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: michael@walle.cc, jaimeliao.tw@gmail.com, jaimeliao@mxic.com.tw,
 pratyush@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
 <20231127181514.19b99d2e@xps-13>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231127181514.19b99d2e@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_001411_177550_DABDFD96 
X-CRM114-Status: GOOD (  17.02  )
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



On 11/27/23 17:15, Miquel Raynal wrote:
> Hi Tudor,
> 

Hi!

> tudor.ambarus@linaro.org wrote on Mon, 27 Nov 2023 16:59:08 +0000:
> 
>> The mtd data can be obtain with the mtd ioctls and the SPI NOR
>> flash name can be determined interrogating the sysfs entries.
>> Stop polluting the kernel log.
> 
> Actually I like these prints when developing/fixing stuff, it's a clear
> indication of what's been discovered that is available even if for some
> reason my rootfs is not available (which is common when the rootfs is
> on a spi-nor).
> 
> So I would not trash all these lines personally... I believe the

What do you find useful about these prints? Maybe you mean that you'd
like some indicator that the SPI NOR probed successfully? How abut
adding a debug message at the end of mtd_device_register(), or otherwise
after mtd_device_register() is called?

> dev_info can be lowered if you prefer, but dev_dbg is already meant for
> debugging purposes and will anyway be discarded by default.

Yes, if we're going to keep these sort of prints I think we should
definitely lower them from info to dbg. It will speed the boot time and
stop polluting the kernel log.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
