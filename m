Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10499C636CC
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtbhMtCFQrTaKi7rrFFf8h5EBQioz9qiMl3S5ZUoa0Y=; b=X0l++p7HI+Gsmx
	BZa6SXa995Yim0PwgBGNJi4kBSz7d+J7T+TOEgFQt1Pb1z5vn+SFf0n9X04bZq8RFpJ+62Xk3FkFE
	i8nirZ5BiZ43D+k1Kxya6gb8lIyKjHMWDAzjUdf1LLbSLR1i1N4Zj+ZkKJobHKRfH+00NBCjYL0GD
	l0oj4UsPQ7zRIY2S0gjajpJg9J80554c6a0aYGUmVmRQm7LsDRwuWykiFdpaPuTFwEVGZWL3mzjMV
	/anVWYyYS1aYmaJr3fG+MW7iJ7CZLmd38D+P2o8ZYnUY3uCBP/nlkdibFYcdnjHcwaT53PJKbuYk+
	yga8SZV/TqmkBcGL+YqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmTw-006sNM-BJ; Tue, 31 Jan 2023 08:59:12 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmTt-006sLW-Dz
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 08:59:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id cw4so8550634edb.13
        for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2023 00:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPt41RSXqAxCKBmzSJxC29sn12Bxhg/i2r1+DtUK584=;
        b=qulLNpEYEScq0Jd/coJGO0Ugu7gTenJOgurMepPFAWeOb2ksQWhQjoO5EPLdXjo986
         BwvMKdjqaU8HhmnvQF4gKzj64tXhwyzm8we5so9jg2NyRe6SjvwBuTleqycadf98FdNv
         U8yF7a4j/OqJRFKqTYHGM4fUUASEhEbyBHyyEaAh0dVfNWyWo/yFr24aBtIt7RryvXjI
         u/F5IRekumUr9AiN/83F5hKyDcpd+eVKj9tOUL7A2Q1YARtbj0xj2eGCmJd3aXrV4BkA
         LTsJUfAm5VL5s5vI4MW5ntyQPGn4MWGcA0Yr0wagmjSBW6PLtaCgg3ugvz4W+xiQr1tT
         8NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPt41RSXqAxCKBmzSJxC29sn12Bxhg/i2r1+DtUK584=;
        b=vCs7oI3uZB68Hwr0T8YeowSCLQmKPI+zi0HQULf/abxxxg1VynNVENlOPfFKtbyRIf
         7aJtIa+C/Ab6IFQ9voqVnSyHzLQhqjD6aVsawoUIEYAjX1XiUgHub82ZVkxym/3XtG86
         X+3fRGoUQGh6Hpmh3aZZnFbQigYqbLbcoQUVh7ciJehC3IFEEH9+s0oKKY45FqvKpKOY
         Xx1V203p+hHnoAssZlpFOciX+71oKFarfcgsOZM+SpPhxYTmVPQJ7dFrn+av3Zk2VEJb
         qyae2r9OGydb0EvuW62eKlX3Ye0AF0knC39JEUy0MnK+nQdoitMbs1VuExizx6ntVMRp
         9qYQ==
X-Gm-Message-State: AO0yUKXgwahYgdEPGkuxm7XOSka7pN0W8hIWZSFBpq7lGiuRA3VCZ7bt
	5kaiDNhSHA/SV03dJIMo7JaJeA==
X-Google-Smtp-Source: AK7set9yliRCind0S3HgLNwz9u1YKJucnvRx4VfMrY+EXzafiRwwOJs9CFmwlobK7pzxgOCaxSsbVw==
X-Received: by 2002:aa7:df15:0:b0:4a2:2d5c:9b06 with SMTP id c21-20020aa7df15000000b004a22d5c9b06mr12824660edy.17.1675155544941;
        Tue, 31 Jan 2023 00:59:04 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id q11-20020aa7d44b000000b0046ac460da13sm8026715edr.53.2023.01.31.00.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 00:59:04 -0800 (PST)
Message-ID: <37d80e1e-9f6d-8e5f-ff3e-105343d4c681@linaro.org>
Date: Tue, 31 Jan 2023 10:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/9] mtd: spi-nor: Create macros to define chip IDs and
 geometries
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
 <20221215081241.407098-2-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221215081241.407098-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_005909_532100_454B9574 
X-CRM114-Status: GOOD (  11.57  )
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



On 15.12.2022 10:12, Miquel Raynal wrote:
> The INFO() macro defines an ID array and a couple of geometry
> properties. Right now all its lines are duplicated twice because of the
> INFO6() macro (for extended IDs) and soon as well we will need to add a
> geometry parameter to include the number of banks.
> 
> In order to limit the code duplication, let's create a number of
> intermediate macros which will facilitate defining high-level INFOX()
> macros.
> 
> There is not functional change.
s/not/no and applied to spi-nor/next.

Thanks!
> 
> Signed-off-by: Miquel Raynal<miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav<pratyush@kernel.org>
> ---
>   drivers/mtd/spi-nor/core.h | 43 ++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 23 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
