Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB33C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGUMfuWclKpkFxE/4DTJZs1+jHZHwT4hpk903ZnNuAE=; b=BzhPbATEkv6wup
	J0j380fcjURk55NseOfLBCg1qzi4OFJ5OzGmzyw6ciRNoKjc/h+lwIDws7NSOMOmuu5iUJCUp8hCM
	ky53Jcn63aijzSiUPEWqv9kNiIFzRZJ5c55rBXqMhpahqqDC5cyv/CGWG18dY9pWXCYiZc4WUbyFd
	oM48kAXaQNeEbPhMaER2zi8gtF3FAiysuwnkexf7LRvWyD/2RBR3vCqrklQ4sxe6lHn3AR+yLp/o9
	qajUpGOLXXMjqY2Y5pUugQYy0Unt41Ddl3wPhGiuxs25aN20AYonA0UlJInrhnZ19qCCGBIlmZI0w
	UacKjqpYkAlphM/TSJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxQm-002YMg-Rm; Fri, 03 Feb 2023 14:52:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxQj-002YMJ-Nl
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 14:52:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h16so4848333wrz.12
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltwYJraDGOw3xJJWw2ZgRTh3wV27yN0rkRHwVT68lHc=;
        b=zp7wXfSixeF9dCrLv0Dvqg8HYJgR4FCkYR79P6pkT+bx/7PhDsXyRjN5BP/vaLhrLl
         yksnBQ5WPqb9td9Mvrg21pZZWC5T5Q/yGF26fON2Vs323sA/eVgTa0FDk1nGKLZZIEaE
         gV/lh5lSmi+KQ0YmGh+hX66M4BBLts7b7Zl3fUvzTN4JW7IMuLaNPcQrFPuRYpqMxKIw
         vfvCkCOhrUQvvU6eagyKIB/AMAx/5bLGTmWKO9gW5rPWW6L2aonm7FE5HCQg1L4Y4ZcG
         nrSyK+i+OKrwhP5VsC4lHbHPCcRryVcj/ytK/47I/n4mCmKa/g0azPHgIhy84i3urUih
         bpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltwYJraDGOw3xJJWw2ZgRTh3wV27yN0rkRHwVT68lHc=;
        b=q6bdkf+zLRQs/GI8Tj3ypSNmn2AsDFLgdXoxyiFG2qHVOTQiPdkck4cJeJnDj9t1Sh
         1Jt+gF4DGUb7ZJPeupXnezQiZPfV+/P3SjzM90rroaY9Lfdhtrh25l5EIbwU7ycazWXM
         mt3CS9Ju0gDq2Ez664jNjxjKGUSd3FCtaEyVnYXWYncjp7jf9UN4G3Fg3LVI+A8slV35
         wt/xOWJf9m9LoHpGyZs2hPfptOILpe3rdJOxBPP5xi7UwV39ruZMIwZGt7ST+sAUCW3W
         QsB7go72gvYzCx1AZtisxz9qI/lpDftb8FQ5vZOIRszEb3t5uUJ5R1C7xMUnd+I3eKiN
         Rvag==
X-Gm-Message-State: AO0yUKViHjUx/J4xr1qaFlLY4m3Lm9UImibV5rMQkd3WAQtZrpacvITE
	VcBs5obCaWECBhPYMaDDlIJRrg==
X-Google-Smtp-Source: AK7set8wZRxI1h1T+oa4MePP3zzp2B2mJrkeXhuLlSS7xkHMvz+aCEKBWIYorZPm6HmgGAySdNR+jg==
X-Received: by 2002:adf:f452:0:b0:2bf:b217:e365 with SMTP id f18-20020adff452000000b002bfb217e365mr9322357wrp.11.1675435962563;
        Fri, 03 Feb 2023 06:52:42 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id o10-20020adfa10a000000b002bfcc9d9607sm2226488wro.68.2023.02.03.06.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:52:42 -0800 (PST)
Message-ID: <1daa1b9d-21b6-5c44-0500-bd4ec4766161@linaro.org>
Date: Fri, 3 Feb 2023 14:52:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] mtd: s/a SPI/an SPI
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: pratyush@kernel.org, michael@walle.cc, richard@nod.at,
 broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230203080136.68505-1-tudor.ambarus@linaro.org>
 <dac961df-c43a-03a1-2d85-33075f75589b@linaro.org>
 <20230203152203.55f584a9@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230203152203.55f584a9@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_065245_803288_5E2E9F80 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2/3/23 14:22, Miquel Raynal wrote:
> Hi Tudor,

hey,

> 
> tudor.ambarus@linaro.org wrote on Fri, 3 Feb 2023 12:18:25 +0200:
> 
>> Sent a tree wide patch instead, feel free to comment at:
>> https://lore.kernel.org/all/20230203101624.474611-1-tudor.ambarus@linaro.org/T/#u
> 
> I'm wondering how relevant this change is, because I ear a lot of
> people (including me) saying both:
> - "an ess P. I. controller"
> and
> - "a [spi] controller"
> 

Right, I already agreed to drop the tree wide patch. We can choose the
article that suits our own pronunciation. I find the following useful:
https://www.merriam-webster.com/words-at-play/is-it-a-or-an


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
