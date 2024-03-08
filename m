Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C7DC5475B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 06:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0hBJ3UzRdrCUDTUqfNS54B4gHhVIb1bEofLFyTd6Xc=; b=N4VT9h/RJa/2Ds
	LV6lr3/C36Y1D2/p01jl+mDjGdPU3/66myXwGnPKfLF6S80Z1pf0HNsGyl3eU5bTuOojh8aKcN7O+
	rmQOhkPMsV/s6P5z/MV784Xa2XyTVXCLItNDA8zouhPTqIDcuUw0PYWisHIX9P/CnttTTesUFejHE
	+80eC0XwFwZZywyTCNtMdpVJd4w92UfOdilfhNPm6bZpSg0U30g5Zqg3EPPZoXt0/GYwkUqySXxbq
	unlYl80w368ZXui3oF6Ok2vvcuK/lDx2iOKj44t8JTkhMd8iMERmez/sr82BEjpWpbyjbVptVRPyF
	rZUH5D6Lnyfw9uCYvdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riU7j-000000082ms-3eEm;
	Fri, 08 Mar 2024 06:54:31 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riU7g-000000082mE-3M2g
	for linux-mtd@lists.infradead.org;
	Fri, 08 Mar 2024 06:54:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33e570ef661so960947f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2024 22:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709880866; x=1710485666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xg9o7t3Ebv+zxtudxRnM9Smq9wdfZ3YeuUYvk/fFXCo=;
        b=dsw/H8hT4uSgexa4tlZl3rA+cGjbO/haSJLqx5ENnRP5IkosjQKlucgfO4VBhtjMyE
         RETZKMNtWE/sknIkSss6EXMDiornLJHivxxFvqJJ7FmqUgSwl/Nw0Va+9qmA44l2szYH
         y62xQDS4JdY+pMrPuvkCn7NGmytF8CQ2+NqdbhPEP+fkKX636cwe3qCnx5laLq4mZS80
         MedSYDU3ykyCj9+pjivR6FmDN+4CsIrFOJySuKIRpyS/vk/Yp0KchfCk5If85Ot4lZ6m
         Lj1JyLoOvRTwtKOWhE654SxQjok7525jcgEbfbQkurj2dDdWWAUHnbloa3MLMnh0Nn7H
         mqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709880866; x=1710485666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xg9o7t3Ebv+zxtudxRnM9Smq9wdfZ3YeuUYvk/fFXCo=;
        b=FeZgLQX89shKU+UVd08dNqOb+SVTDrcl49V8oxoAswK6vqnwIXYj5BZasQ7L8+pKEa
         6VkX6i6JA1YuA0upmH1dU9Ofemc0BGXuQlQswVDvOodmLWheeHy/Tgzzx4EYi4TPKBDI
         EMVZ6axrZLuHAJ3o1UXVj+AAjEVK1L++OBKX4guH6HFHyxRgIn4Un85zOzIAhIMttkq2
         NAH6Qchx5pN7gwT7H/U1Q+7zCQV4K2ZyBItAYlg83b4DSyq1qiEP/np5aWhSfRfEfvwD
         F+SU7+3K5uMNNp6w89OX2yPhW01pU2kYM6/gk6vCqKWeQGqTPu8BhtsGBJhZj0PixTTC
         bqOA==
X-Forwarded-Encrypted: i=1; AJvYcCUSg2sjXfKlFesKGXK7/uoiGB7XD85uYx+phxauumwYynX81la59bsRGFlr4AceeN/Tztho3VP6TZ6L4sNODRJgG6uPXw5EZwouldgucA==
X-Gm-Message-State: AOJu0YxrfgAZUg5p842+RcbEV4JaKSu2id248p1MDdy5Dnk/9KaISo1G
	LSPPtPdLr+CuUKQIOw/stnO92IeWM3ExjlXI4LjtloWVvJxJaPlFEyWmZBzbBIo=
X-Google-Smtp-Source: AGHT+IEjnqBT8vx+qgX5HTIGU4NIG6bk1qUuB38x8nz8yMUAtJuaG9pnrH8KNFZ5gzWc6xLFjQVz+g==
X-Received: by 2002:adf:b60c:0:b0:33e:44da:827 with SMTP id f12-20020adfb60c000000b0033e44da0827mr8499161wre.57.1709880866373;
        Thu, 07 Mar 2024 22:54:26 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id n8-20020a056000170800b0033e2291fbc0sm18825136wrc.68.2024.03.07.22.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 22:54:25 -0800 (PST)
Message-ID: <ad696669-0326-47ea-bb3d-33ff35923825@linaro.org>
Date: Fri, 8 Mar 2024 06:54:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.9
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <mwalle@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <7d391df2-09e4-4166-9116-312bfa74e738@linaro.org>
 <20240307180919.4cb7a4cb@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240307180919.4cb7a4cb@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_225428_945481_AD6CDA14 
X-CRM114-Status: GOOD (  10.60  )
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



On 3/7/24 17:09, Miquel Raynal wrote:
> Hi Tudor,

Hi!

> 
> tudor.ambarus@linaro.org wrote on Thu, 29 Feb 2024 16:15:34 +0200:
> 
>> Hi!
>>
>> Here is the SPI NOR PR for v6.9.
> 
> Thanks for the PR. Just to let you know, I will merge it early next week

ok
> as I don't have enough time now. I will also apply as hinted:
> 
> 	[PATCH v2] mtd: spi-nor: core: correct type of i
> 

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
