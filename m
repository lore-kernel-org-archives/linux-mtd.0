Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C739AC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsSLPOlgeA1agITWuc6tiO+S8lGN5L+Djs+0yT7mQek=; b=oagz48/IISKAIa
	8bu0zQVZf6orhWjKaWab8tnTrmg5yD15Ofb5h4wEVZfF8WlWL7/ETeXOdqMQqZxvVcQ29Qu4pEJcM
	Qjik1Xz91K5dC3i3S/kNMEA8eufquH6+PWq9XO+DyX8vaedMjw8Kp9c/GT0JR4l2LfC7JiDhpc7SS
	RtB4nr61/4NjCdMb7z5Hd8QrlYHjuT6iLzQ4jVIdGtsR+Yoayl4qccy7B2K6PRhL/GCQeQDrSYHkj
	BbJE4UeOWEGA2nPA8Roklmhwfa+qCX/+Veyw/EczGsS+WirQi20SkQxoJ3gNyZCJCo3jeE+4YWGYm
	NPX+E5oz8s2qxBS3F74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cOP-00DUtC-Lv; Wed, 29 Jun 2022 18:26:25 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cO1-00DUib-Ce
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 18:26:02 +0000
Received: by mail-ed1-x532.google.com with SMTP id e2so23406577edv.3
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PGvQA2q5EDiJWHvDGLlQjqNXSoePOx5RlZoa/jDsGIM=;
        b=mUk3MLjXZe8xmtFA+A7Ur0A03lsDuLYDkYFueLi/WrSTxjNMaaZY8ivwseG40TOw3n
         x+t7Nhwennih/jhdTdBH3jY7hcCQeLUN3JP7ApfsPjEwH92padppPKdLCPSfowz4U4cT
         0HMNo0ScyiYVeUnxHnmd7xu4Xm2lbnvsrI50o6PlBVuulg979nME96h5oiNIGjW0ATeZ
         GnuN/2yT4TndbD1AWak8mPNNDOrFr3AxSfYWNCU2PVkG/xaWdkYeUFwYk2iLthV/WWvm
         0MZcBnJRiBDOUmBENasr9ACWeVCcHF3moAQiGRkL2geau/rDsa9UV7TMBhw9rwbS1d4V
         KUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PGvQA2q5EDiJWHvDGLlQjqNXSoePOx5RlZoa/jDsGIM=;
        b=u0DIxSHyvWlJo3Uz4Y3U4mhwz89b2y3e3egFMNsadcZj2xZr3mOT+wLS7mAjPsfmz6
         gKU+ebMOdonMmc7xY9QKbB9/erVdkIaisIJt4UW77fotcVoaZs6iwnff2as4CfkoGoJi
         uvpOsPVGAVUnmqM6BiV8Y7BSL6TdWth1To02mZraQ3Sb6BWlHKdM5DSYhOVljzTIX7xi
         ZCn98J0c2YVUpkAAx8jWaxZ3Zi0JamHiJWy+/+Rh3LM885UpzBftMCEYe/LUrjBC2ZOj
         2pTiHKv9+fKLl6FefRxCsFhlcoUiH0WHaQp2V1v0x2IE+HUv0ltKYcWaRz7BsGbDAtCW
         3SnA==
X-Gm-Message-State: AJIora8GPRzuYKwMBfvwTxKHX6UJG26iHPdW6A3YJH7B1yVFW41fV9eE
	841kUbwfF3oCFfgJO4aScfh54hkZ1QqfGg==
X-Google-Smtp-Source: AGRyM1tf2ghr3a7w3ALY1YaMDY+R25x1r3NtjQHZAjz3pI7PXJjhK4dHNadSye6O1W9nW3KMbNK/OQ==
X-Received: by 2002:aa7:d484:0:b0:435:65b0:e2d8 with SMTP id b4-20020aa7d484000000b0043565b0e2d8mr6071090edr.373.1656527159829;
        Wed, 29 Jun 2022 11:25:59 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906078200b006fe89cafc42sm8127516ejc.172.2022.06.29.11.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:25:58 -0700 (PDT)
Message-ID: <bab4d845-330e-c7f0-5dac-a96caa93a39e@linaro.org>
Date: Wed, 29 Jun 2022 20:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] memory: renesas-rpc-if: Move resource acquisition to
 .probe()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1656341824.git.geert+renesas@glider.be>
 <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
 <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org>
 <CAMuHMdW=s42sfFwimizTsNjyKue+W9NasTOG0jgjkgkoKv3wfw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdW=s42sfFwimizTsNjyKue+W9NasTOG0jgjkgkoKv3wfw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_112601_483075_B1C2961B 
X-CRM114-Status: GOOD (  19.02  )
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

On 29/06/2022 19:55, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, Jun 29, 2022 at 7:44 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 27/06/2022 17:31, Geert Uytterhoeven wrote:
>>> While the acquired resources are tied to the lifetime of the RPC-IF core
>>> device (through the use of managed resource functions), the actual
>>> resource acquisition is triggered from the HyperBus and SPI child
>>> drivers.  Due to this mismatch, unbinding and rebinding the child
>>> drivers manually fails with -EBUSY:
>>>
>>>     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/unbind
>>>     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/bind
>>>     rpc-if ee200000.spi: can't request region for resource [mem 0xee200000-0xee2001ff]
>>>     rpc-if-hyperflash: probe of rpc-if-hyperflash failed with error -16
>>>
>>> Fix this by moving all resource acquisition to the core driver's probe
>>> routine.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> This looks like a fix, so how about putting it as first in the series,
>> so backporting is easy/automatic?
> 
> Unfortunately that is not as simple as it sounds, as this really
> depends on patch 4.

You sure? Except rebasing I don't see that. rpcif_sw_init() received the
rpcif so it had access to all fields.


> I agree patches 1-3 could be moved later, if you think it is worthwhile.

This would not be enough, it has to be first patch to be backportable.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
