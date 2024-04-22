Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DE2C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jefBgA+UlVzFgWaCY9SogozysddJYLghKY9Ud51KvHY=; b=F31z44oK7hJr8F
	4eaU8xrEJ5XkGhj57jDoVIZQ9jgj7CEdS681Po2gM1inIqtmtZfcavWKqNf3wtirpyTWhgFskOyjI
	KvGV5W9OF7OKMQaS1NSuxlzLOZl8lc02+mf9hQ3CRoohBLlHr6/ivsD2GNSwUL84IijRi46mEHqxK
	qJ0rVD01nfBrewE9dMAsYZzKgHwgTNUo1djKDekzSeFfsvnGP8PH1D+jrirzY54DjjCqxgWEE6wLc
	4krRpmpL4xgLuSwdKAkzXuXdzp1OcQBxLlI2KnZ3ihsSTvhfhitAnAW279qYGvWm4TaA8cE6V4g/E
	03/ywVw9DcuBgKSXhjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqhF-0000000D6h9-0ikp;
	Mon, 22 Apr 2024 10:14:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqhB-0000000D6gi-3LHQ
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 10:14:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4155819f710so34781825e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2024 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780883; x=1714385683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/jZRj0ApPmqFTPbrQgdn6ghlIFuc/SPp6X8dQcLFs8=;
        b=BF50CdM08Vb24JSJF7YnWOwSi+nd8KrN72XZ4nyK2gQ6bxBY55NbnVeEPxTK0LMgg6
         N1Id3qiCf9Dbe9mEF8ZLD9aS9F/su9zJPBLezG01dTWPLOtv5ZpTuKmF+sc6Df7aFEMU
         mRDl9flrSSYy82NchUnjt8jpxPgG+PcEI9uKLk/UcOzAvVgw0We5VLbKcRs5RJ4PFPp5
         72AR5BflTUJeLY2Xv9ShEEZelid3Xg/tK0Nj4hXkto8bgzQvVXSqocR6Vnci6Q1IPCqM
         DjNilqPUaw9JtgyzcVlCMAW3b2CLygKdCHa6g5lQcp7p+eXjNHmfIVVYB5pSWKh2NvxQ
         xeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780883; x=1714385683;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/jZRj0ApPmqFTPbrQgdn6ghlIFuc/SPp6X8dQcLFs8=;
        b=Kz2CUlkcaXQYu+6417P1nBJRG4XLUg8s8c9eh7CnqsHdG6dtuBlg7GxlZgai7+QBgv
         yPEKaN1r+ybC9ChcXvkNiBQJX7Wq4jq+4O7tThnHKKK/sn7oqIXXsb8k2nL3kvqN9O6g
         kkGhOcbQf4X43GoyijZqysaDN0nuJ6jgxCob00l295qYkP+cxa8QgxQhbmI76u56uJnM
         oBQMTgOAmP8qADpoYy915DD8Js4bs/WG0PNXZsYe/cYOyCXc5vWv39nJpJWD6uqep7vl
         NlFf9I/e7p0Us2WdZ7h4QDvjEO+IBbNcjAr2cJDJg/ZNBS7IfVfQKYO0WJlLswe5nykX
         hUoA==
X-Forwarded-Encrypted: i=1; AJvYcCVR7sML4ROYPpXc0Iuy8jNWH1XHMUfcf5Wsa4xzv/YS2jd0wPugVF/8qsf1IzL6qe0aclN46lGK/WCRjxHBx9SXum58Mps8CoasRZ3t5A==
X-Gm-Message-State: AOJu0Yzaw4/wXItDRRHq/Hye6cEt+6jr9Aop9asLvPb+0fZ7Q9/xkRRj
	DUPXBML8icbFd1E8/Hl0Y6EW6wSFiOsNFr2TUiZu4SA32I5S60Qn02d3fXFRvuc=
X-Google-Smtp-Source: AGHT+IHetYw7932B5YL7ed8rYTbB4etGEW6Iq5lMrmBoLE8jUlzBGcgBZ9v5QparsTsNqbK8iQ1/ng==
X-Received: by 2002:a05:600c:c0e:b0:41a:7fc8:a650 with SMTP id fm14-20020a05600c0c0e00b0041a7fc8a650mr823046wmb.0.1713780882859;
        Mon, 22 Apr 2024 03:14:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0041a1fee2854sm5577618wmq.17.2024.04.22.03.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 03:14:42 -0700 (PDT)
Message-ID: <2ef19e86-d93b-4b3b-8f41-f96fb230d594@linaro.org>
Date: Mon, 22 Apr 2024 11:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mtd: spi-nor: simplify spi_nor_get_flash_info()
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-6-mwalle@kernel.org>
 <ea3b32a8-7a1c-4a32-beb5-acc6f6435954@linaro.org>
 <D0QK66M6GGD7.2ESAAEDMDOUUO@kernel.org>
 <f3e8b15f-bc39-4fc9-81d4-fbebef74c145@linaro.org>
Content-Language: en-US
In-Reply-To: <f3e8b15f-bc39-4fc9-81d4-fbebef74c145@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_031445_944274_ECB22FA8 
X-CRM114-Status: UNSURE (   8.07  )
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



On 4/22/24 11:12, Tudor Ambarus wrote:
> 
> 
> On 4/22/24 10:53, Michael Walle wrote:
>> Hi,
>>
>>> 	if (name)
>>> 		info = spi_nor_match_name(nor, name);
>>>
>>> 	if (!info || info->id) {
> 
> here
> 
>>> 		jinfo = spi_nor_detect(nor);
>>> 		if (IS_ERR(jinfo))
>>> 			return jinfo;
>>> 		
>>> 		if (jinfo != info)
>>
>> info could be NULL here. So "info &&", apart from that looks good.
> 
> it can't be NULL, the parent if indicated above assures info isn't NULL

ah, I read it wrong it's if (!info), you're right!

> 
>>
>>> 			dev_warn(();
>>> 		info = jinfo;
>>> 	}
>>
>> Pratyush, should I'll drop your Rb tag then.
>>
>> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
