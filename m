Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D19C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Nov 2022 21:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvGI6ebMUVl0xhIs1eCJjKx66NlaZJ8zzkkr9HoCEm4=; b=Yr0vk/AZU0/gDl
	fsd9ECFCw665rCOTVGnhdGAsse/nhTkJIGIJyu+SBRI3+XShfMTIeFlV2mrboJSrnm41J3DWQZSc6
	Y1A36gXJOQ4iIv86zL0MaB2S4pph9YWwQAY7WjQmyeUtBEO5bZAY00Y7DlwoRVPWnNAqyWAQnmIC5
	Cxc2FMtRinc0748Tu4EA7FzrUdUCg/vcQxEzV9NZLLqLpuN/DYFoFSJnLUCLmEHI5CXXQuwkVjac/
	uuA7Su/dKTb/FjSl+3+UlIq1QizBcs46UgH8KhDS1uEkjF0XmuwxsuRaD8fTS5Rf2ULLOlIAJSjjT
	zJy54f8kAbJNyRZNhU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozPIV-00Dlo8-QU; Sun, 27 Nov 2022 21:34:47 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozPIT-00Dlmj-Du
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2022 21:34:46 +0000
Received: by mail-lj1-x22c.google.com with SMTP id y5so2392880lji.0
        for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2022 13:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCU9BCLUUaECqX+PIeXUH6Htfb80scvZnidybbOysXQ=;
        b=uHNBMIP/zYAVzMPTB1lRizMM4XQ0yrES90O2uOSez+0j/g0Nbhq2FReybTyYILjefd
         FOBEqCo1dxf3oKzMScCCvCe/MrI1/ZYqUMHldv7PKXsiXmpFZnXqx/LpD3SCE71iVnjS
         0uQy7Fe+RpoFIhuZGaEiTilW8KQDtqbnWDizB8YxgyACssOjx/j+yZs/gdPkJLfWGQUI
         H6t38/dfyZFqQUMW1Z0EBr9r/p4Is3XuI+89uWUWZhAYhEGWn9fcnChXqRyvhAchgAUv
         XeQyvggKrAluy6vO//0dD8SJSHftdloxNKsuD4oOWRUrTC0BEc8pR7Cj9ClYXSswFg61
         LjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCU9BCLUUaECqX+PIeXUH6Htfb80scvZnidybbOysXQ=;
        b=KVOQ7In4qShk0dzUcXlMPXmpZ4EW78txU2QHutX2OUU59xPQQ84G/viNXyV5iDB4vz
         c85D1QjUNdUDFNHN3bv6DX0EF9+7u3RWvQJmg0XyDVxeL4oXyj1bVLQJqCJ+XNY1PEPW
         UgKiRqZBshAfY7YoZVp4sOGa6c6Hygim+ijC4TiiuzIT3+qtoTx2gSkJ8Vcch8ttq4pI
         WgUZj1HCgn94RUDSFI9aK/1Wh8hlnpfiALM0p2NSwhnk/urMJq41nXeyfUgqax6i+yrA
         fc8rJICWQ4B+HuOYnj3BIWqQFWS9wNjYwZBGnDyzKVW4SPzz47GlY7YaZIDNCzRUFLee
         KXiQ==
X-Gm-Message-State: ANoB5pmxJ38SR9A1Wy+PpbNC6yMnOhA1keeNdD+LwQi6prxA0kYOK8CB
	AdqH7nnseoR8lrxlgSUIeHq1BPjOpicdPuv0
X-Google-Smtp-Source: AA0mqf7aev59tmIt/2yL9DLH7XUeWxuyVD2nSDqFjvIEXdBc0sQ2S0AEaYnOn1Ur8GpRvzmap7OtVQ==
X-Received: by 2002:a2e:bf09:0:b0:279:6c82:3e9a with SMTP id c9-20020a2ebf09000000b002796c823e9amr8477502ljr.97.1669584883536;
        Sun, 27 Nov 2022 13:34:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d26-20020a19385a000000b00498f3ebffb2sm1419537lfj.25.2022.11.27.13.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:34:43 -0800 (PST)
Message-ID: <a75b604c-a671-d2c5-7160-74dcb8a4fa2e@linaro.org>
Date: Sun, 27 Nov 2022 22:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc
 cleanups
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1669213027.git.geert+renesas@glider.be>
 <b500e42c-f782-79c6-70ce-650e4ea32c54@linaro.org>
In-Reply-To: <b500e42c-f782-79c6-70ce-650e4ea32c54@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_133445_527646_60D248F2 
X-CRM114-Status: GOOD (  11.55  )
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

On 27/11/2022 22:31, Krzysztof Kozlowski wrote:
> On 23/11/2022 15:41, Geert Uytterhoeven wrote:
>> 	Hi all,
>>
>> The Renesas RPC-IF provides either HyperFlash or SPI host access.
>> To handle this, three drivers are used:
>>   1. The RPC-IF core diver,
>>   2. An HyperFlash child driver,
>>   3. An SPI child driver.
>>
> 
> Thank you for the patch.
> It is too late in the cycle for me to pick it up. I will take it after
> the merge window.

Optionally, if you want to push it via Renesas SoC tree and there are no
conflicts with existing two patches, then these look good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Otherwise, I'll pick them up after the merge window.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
