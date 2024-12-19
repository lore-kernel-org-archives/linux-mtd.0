Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6DCE77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sn55C3MEvncfHt9WppabyB6WaMoNZNrq86tqtDAk090=; b=JUcnIlSAiSAslB
	+oiaedntaI7BgGXxJiowwdyGiGqgSJkjc0zaS++ECH/XM5kjzyIqqdNrC7u3nGuwo6ZQiRVoibnyF
	TSn7iNMlwKiK5S8Jdb4PS9Y9rzyl2mGwR6Vu3uyVcV7LciCYWFNAEq1HNUL/Gq0cjFoPDqPagxxJo
	pC30mlu41D8YjVMYEbpTSJaJpnuJQflXDZRmJMJf6rUGdi00EbrsRTOnnFRWaSrU27s2HeqZoBkb6
	/XtdssIWRKlQaL8yDwfBP5E7yjreOKZod2+JFZxmnqcmSMP+pgaYVNwVxU6S1NiRRcZt1Ecc82ZOZ
	SdRCJ0u6uXSvTH0sERlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tODM3-00000001UDf-3t9z;
	Thu, 19 Dec 2024 10:02:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tODLk-00000001UAg-2Y1V
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 10:01:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361f796586so5973015e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 02:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734602503; x=1735207303; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sOz53FSX6YjdJKc3tV6Pg7C4qqSPSTPmj6M8d9fLjQ=;
        b=OQ1I3hJjWcuPUqgT4DRe5Ra76QEhJ2DLii+0TfdTzrBNrwLBnMuLv2BhHstk5D1qtJ
         NW6xI8zJ6O7WNJi2d/gN7KqLmqN9L22BKGWCwGLWU4+bkvxh/QYYVvd4PRrKqdEujDU0
         gZUv+6MIYJneVea/CuSfGiUH0TgBTPhHPN1xKX6tKH7hvp8ZHhP+/Xca+765ayu/g2x/
         MiEBSxjK9vR3neQyfs5kG8RSjWBur+Ncb6pkJ5nlkQBeMlKSz65AxV5TothmDAZbv1QD
         Koz8+1y7W3yiuIYC2o9uUDLleWo8+yNjfIEHukMYQ0pYrZihZ/iwifxliNKdwOIjq6rE
         9Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734602503; x=1735207303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sOz53FSX6YjdJKc3tV6Pg7C4qqSPSTPmj6M8d9fLjQ=;
        b=R4M+PoldO+TfvlYyM+Hooh5zdZdWi6RqMtoO+ukZcf9tjvQHe+7A+NPowVNC/qtD0T
         +n8O6z8nK6IyFmGhAIM2R6sJi6pF13hKC8aCuEVf2/3IYEYvc4Levv/Nu7ULmmqdSHD2
         jNuC1k78D3iwryXseKgQm6PCVfYa64i86aa5Zo6tkJmikhMNGt/KSLJFD5txltJls5UU
         GPKWJu0RtodP5xRwXpek1F8HL08pMIXzOMQrbeQvjg5lt9HNch7M/IYqqjHbypkzNTR1
         Ag5sJhllu54elhYRUAUzqil5JUTFzSYBWeESOhzOkYY5T306eJpbwDbz+Vyu3cvm3OdC
         ceqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg1BQm9t/l6pIbfvYgOSwkYjcxnlkEZfOZqCld23SV9Ve3lGvLC8lJuZIJ5xJy+kVnl3n7sbzlWkY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSAYUJTYTUmeA3zXQj2Aq3gjKXnBJdt3CQcS0zAiNTv7umEbrl
	tY2aQ8/+kQ9ydNePPTuRRCj9Sj7JAtCVnarEBJY7MMNZsA17KkQ+kwmtNSCkZlY=
X-Gm-Gg: ASbGncuzH7Yvs6GVQYgnnAmbaBDwoMablTJk0dGHFmvb7xS1ctWj6e3+txwaJHLOIRW
	X7/cUEepuyPz6xx8kxN7vGfkH1MZIR6KX2BWQawPGK++8dyTPv8HfGYcep/v3jymI1KcrMcuG/k
	RD6KB1g3zkee2KbfyiLTs0G5arD1vpFltoqMjb3ZsIIeTDs/0/lJ0M4uBuSp0b3cmJBiLkxDfQs
	n7NTwFACDOd5NVLjmz5Buu/H5CryE6YrIEaX1k3GjDLO8zQyFYpKMTb1vn/51Z4
X-Google-Smtp-Source: AGHT+IHs2Gvw5AVCoudWceeZOOoXTP5NIzK6gACv6j+ZfS9K0abLDVbde+kFM64W/fXJSX1k45ISVw==
X-Received: by 2002:a05:6000:401e:b0:385:df59:1158 with SMTP id ffacd0b85a97d-38a19b3cc57mr2866519f8f.53.1734602502951;
        Thu, 19 Dec 2024 02:01:42 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832a90sm1162456f8f.28.2024.12.19.02.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 02:01:42 -0800 (PST)
Message-ID: <4660f0ea-b1d1-46c3-b5ea-efe549c9adf6@linaro.org>
Date: Thu, 19 Dec 2024 10:01:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: extend description of size member of struct
 flash_info
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Renjun Wang <renjunw0@foxmail.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org>
 <87r064c8r3.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87r064c8r3.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_020144_658618_9BC30C55 
X-CRM114-Status: GOOD (  13.39  )
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



On 12/19/24 9:38 AM, Miquel Raynal wrote:
> On 19/12/2024 at 09:20:04 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> We use the size as an indicator whether to parse SFDP or not. We don't
>> introduce a dedicated member for SFDP parsing because we'd like to keep
>> the struct size at a minimum, as it's used for every flash declaration.
>> Ideally we won't have flash entries at all, but there are still flash
>> parameters that aren't defined by SFDP, thus we need to statically
>> specify them.
> 
> TBH I'd be perfectly fine (and prefer) a dedicated member, because
> code clarity is IMO more important than memory footprint today.
> 
> However for now I am totally agreeing with changes clarifying what we
> currently do, so:
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> One minor nit below though:
> 
>> + * @size:           the size of the flash in bytes. The flash size is one
>> + *                  property parsed by the SFDP. We use it as an indicator
>> + *                  whether we need SFDP parsing for a particular flash.
>> + *                  I.e. non-legacy flash entries in flash_info will have
>> + *                  a size of zero iff SFDP should be used.
> 
> typo, 'if'                            ^^^
> 

iff is a conjunction: if and only if.

I think Michael used it to emphasize that we don't allow size > 0 when
we want SFDP parsing. Using if allows it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
