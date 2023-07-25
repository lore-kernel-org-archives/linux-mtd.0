Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC142C001E0
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFRc3yneTOqp8hJu0UfwisAANgHtUfuOTsdydpzI6AE=; b=Oi6EInINPyokdN
	fIApsXA6fumUUztMMQNcfP7Us0xTJuMj+sI2C7w80zNf6ilKe1IFAU+DOMDlyCRQpeWbmWA1x4+i/
	FJQQ9+M3A2/WuuKRsNGQr38VtdoFJV/W1DFrlBbVMcIjty1fW5dVv3cS0wuKntCgzdYAJcucR505c
	fS952vZa6R+4f94tAjGNhkNFmNGD8Z0XjA4UU6MwZvKRmnQ2Mb6i/8U2FjAq2N2YPvFsR0E4sGJSd
	yPxUmpj2G4Uxp6OgaWAHmGZFv1+Mqrf6s6yPewZeYiMomkiYFLBLkXHvNyazBwcer4bvi1ToT+/K/
	c840Q1b7MqmPdeouvBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODhL-006oD8-11;
	Tue, 25 Jul 2023 08:47:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qODhI-006oBy-0O
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 08:47:13 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5222bc916acso2574783a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 01:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690274828; x=1690879628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ubAk3L7yJWVPiDYn54fCQOeglUYihsmNMHKsZlHqjg=;
        b=WfKS7YLx3Wj6wUw6E8P9UbdvNZ76dQLWnHEh40lhWtn9cLb6eg9Gx5VRfmV0oZ48WU
         IZ2YlceHhUv5bL+SNcikPmiG/gh+dihd6IKtCupizVxU76Rnf70IG2UsjhiOeNDmLMD3
         LDatyDpZ6DFuahgl8IsJUYsE6Ex5xTQwpZKEK4MJMJkrp7xS7vW047OvbCvEv+xpXLWv
         Zgq9IKcwpjDE+Su86NvwT102ICgg14m2NowAf72dZgunGjSye1jwieDCuy63YeOBt0DW
         2xtuT+Sp6AAaylMmu5Vjl7QDJpFI8ECzvOERAw+wk33fpVoVQTRHfJnvJIa3Ck9E7Ki7
         Boqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690274828; x=1690879628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ubAk3L7yJWVPiDYn54fCQOeglUYihsmNMHKsZlHqjg=;
        b=RR6JJ1wxUfMRcCZD4y9KxLWV7/OPrw/z0x47BA8lsjdHOaX1HQl9Kwu4qwRQrucNbQ
         PJHUIWETWmSsU+MlNX1hkVteKvaF6iiu16jpSCsGHaJpJlKKIHkbiCP2Rp4IdzS2lnLh
         oA5KvTec9xZ7GSnHdVXSnPKH3S9qvqu21oS9NKw3ptmWqRUHG2dnEqyaRCcXvkWcmclh
         Z0EjrjwxIv9oghSpqf1UGZCz3YxMAqgGpWXxUt41nLe8Y+bhsegZjrxvJnsLJE/qelyu
         4DBvlV0Vt2OhgvQypR6EyZYSz/E2Sr3rwF+gUfudTXzoU6IaiGZ6RPByVoTcVsqP6mT8
         Ygrg==
X-Gm-Message-State: ABy/qLaQjgrKYfRLJTubP2KqPnQU60Ay0XjtCYP3p5Vuqbn9iF1+zP7k
	cQpQ83XGgGzInodlEqY0Nlsvtw==
X-Google-Smtp-Source: APBJJlF4uC7eUZNI/ROAObaxk5tRrG2swKvpgEEp4o+1qKxJZp6dWoMT2Yi9O88b+a1MZYvWHdmSKw==
X-Received: by 2002:a17:906:9bf6:b0:988:6e75:6b3d with SMTP id de54-20020a1709069bf600b009886e756b3dmr11424967ejc.33.1690274827889;
        Tue, 25 Jul 2023 01:47:07 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b0098242730348sm7966877ejb.72.2023.07.25.01.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 01:47:07 -0700 (PDT)
Message-ID: <be262828-b36b-1d2b-519c-c6951b063aac@linaro.org>
Date: Tue, 25 Jul 2023 09:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/2] Add octal DTR support for Macronix flash
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <15276c56-011c-1b55-d905-d0fbb822c4ef@linaro.org>
 <e2058fb379fb0b0d80b2b8c0d07c23ce@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e2058fb379fb0b0d80b2b8c0d07c23ce@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_014712_153772_3604D3AF 
X-CRM114-Status: GOOD (  11.85  )
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



On 7/25/23 09:28, Michael Walle wrote:
> Am 2023-07-25 10:01, schrieb Tudor Ambarus:
>> On 7/25/23 03:23, Jaime Liao wrote:
>>> From: JaimeLiao <jaimeliao.tw@gmail.com>
>>>
>>> This series add method for Macronix Octal DTR Eable/Disable
>>> and add Macronix Octal flash support.
>>
>> Do all these flashes swap the bytes in octal DTR mode? If yes,
>> you should add the infrastructure so that controllers can swap
>> the bytes back, otherwise you'll break bootloaders which work
>> in 1-1-1 mode, and breaking the boot chain is unacceptable.
> 
> It might also be the SPI controller. Was the zynq SPI controller
> used before with octal flashes?
> 

No, it's the macronix flashes that swap the bytes by default. At least
the one which I've worked with few years ago. Some controllers can
swap the bytes back, but they have to be informed from mtd.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
