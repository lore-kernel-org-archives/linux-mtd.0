Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC25C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hH+qM2Qqh3pPDvUyWEmWwCg5MkV4mtsis4ZukrL/5T8=; b=dCs+QFQWoidD1z
	cbFwSXJyqsSm/fpleIrSA3QQBl/f9+KnA/sMxGYb7wPmIJtXfCE6goFPOQ/F45Icjyns5kHFiq4Fu
	YGU4uq8/dk98+b/DnbduiqpG/GnpQ2UkDLsB7WnuYWBsTiEsq9Ydxy2Fjha3dvIZlIrsG4hn3IYM8
	AqQtlBz3S3SLDh9B7W+fe56pgBeThif+NtkJlq+L6xtG/bNJflloBnMnPj3K33sYV3rUz4e0nzkP+
	repZ1hPiWxxS0+Z4TUnnaL0kpuYDzYCInP+qyiBWexZiOc3Wvjlcu3PVgiul4fO2Rao7S1KFUILrD
	s0V0I3+2yB3vLoBb4y7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okYRG-00F8Wp-Sf; Mon, 17 Oct 2022 22:18:26 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okYRE-00F8Vg-NX
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2022 22:18:25 +0000
Received: by mail-qk1-x735.google.com with SMTP id s17so6426373qkj.12
        for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2022 15:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NNPTzTExKfVeYKuX19id//Bh5RnUv3wjQJoav4t3r4=;
        b=ET3Ix4RRHH3HXOerUnOWZhZg+8Eef2C7A0P358kULhDmDjA5bp2T0fhNp32Z3gyu2c
         l5/GqKf1bJCkJiYO8iaXucrkkbmL5MEKQ1BsIS93qqxj6wS0QN0SldAHcsg8+Zw+MCms
         eIMZuc/pEEZ98jBjAhbOyoMUHRTAH1CCdyOGpLPekXtMYxFZXnxNXxJ9FHKi/RUb79ux
         qEHXZFoSpTQq2ma/gUwvyDW2MC0i+Soo7u1sE/0vz7IycswnBma6OdtiIF9swRKfSjuZ
         lS9W4jo/BmhtDkNuxOVY9zO36HZdqjWrM1UD6Q6HW1ixYLiNYR/9Z1JWEQyjUpaH7ez/
         TNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NNPTzTExKfVeYKuX19id//Bh5RnUv3wjQJoav4t3r4=;
        b=0Q1YvzrIshX+c7IOhvCDo0E7He1gyfsjjUsX+3EIegPclw0rATDJS6t0phx+TdCWMv
         Ac24xKyY3VJKIcwgKzQ+v0M6GVpDyJJOmL7x+pTGVb9sunGZu6FeiDos9RopfnmmcPDA
         wRWwynKcZ8whdvlNG0+28CX4WikgM3P1BQccgFglUPU4tOl7gyHFnqqBbnCs/dlsVInt
         5VUK2mcLKCa/xjWx5pso/Z36VdiosOlThpRl0EQROdUBBrHVn570Ts4BvECXI2QHBMWr
         NzFybodS07foBztQGVtThGeXqFIq9DKl07YlQHSZtDAjPckTrA7wZAe98lqQIcDohefY
         Hafw==
X-Gm-Message-State: ACrzQf2gmdhKLDL6tQFnO5xKaQ+iyCODFQ4QpXhdZfww+zx6+fBzdyMP
	4lPcYL7Pofvn7sccKY6Zafo=
X-Google-Smtp-Source: AMsMyM4RCfEI6MGr2LisIgm64U3tl7nOYw9YGGhNwEBQSNDdSYsD8vgnfEBzwxmhBBo7afUkb59cdg==
X-Received: by 2002:a05:620a:4054:b0:6ec:5735:2e20 with SMTP id i20-20020a05620a405400b006ec57352e20mr9235373qko.321.1666045103458;
        Mon, 17 Oct 2022 15:18:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id l20-20020a05620a28d400b006b8e8c657ccsm799599qkp.117.2022.10.17.15.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 15:18:23 -0700 (PDT)
Message-ID: <85d81d4d-cdc5-2cd6-3cfd-5cf8e15d6a10@gmail.com>
Date: Mon, 17 Oct 2022 15:18:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: parsers: bcm47xxpart: Fix halfblock reads
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
References: <20221013222855.2384881-1-linus.walleij@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221013222855.2384881-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_151824_808949_2C27C928 
X-CRM114-Status: GOOD (  12.22  )
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

On 10/13/22 15:28, Linus Walleij wrote:
> There is some code in the parser that tries to read 0x8000
> bytes into a block to "read in the middle" of the block. Well
> that only works if the block is also 0x10000 bytes all the time,
> else we get these parse errors as we reach the end of the flash:
> 
> spi-nor spi0.0: mx25l1606e (2048 Kbytes)
> mtd_read error while parsing (offset: 0x200000): -22

Is it worth a Fixes: tag so it reaches stable eventually and we have 
this reach OpenWrt directly where it is presumably the most useful?
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
