Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B1C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 20:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ci1ecCHNkDX8qQeywT3jwiqdbRlQY2rqUzZXRZB21Ms=; b=Ev2tONrPUjDomd
	xAtViRLlx6sYK4CV0dJpuQH3hv7ucPdPoGUqGUBOaq4YjPbU+4PR7niLQQF62dlnM7M9Bqy6e0YTW
	7BPWRcsz/WnKQWgboVGbgc87sHpTWXklcHZ8xUZDxW+0Sasns3a0YQY6NjFM82N2o1bjny1b69vT8
	8cKV2Ej70v2uDt9hObXUSCrAeTk+mQqigQKRiJiNXXeYRbnxhEo5otkEt1qiJ6voPeT7C8yfnWgJj
	usBDzadfYrOQzWjEABDrmNsrV/lM05qW6GL61RZXNIjdOI/hPi8C9xxzcU8M1LgKjCyw7iIGRp6ec
	cMh3tY0aaN7mtsNRpVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLPl-006vPY-IU; Sat, 23 Jul 2022 20:07:53 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLPi-006vMy-10
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 20:07:51 +0000
Received: by mail-lf1-x12d.google.com with SMTP id a23so10157904lfm.10
        for <linux-mtd@lists.infradead.org>; Sat, 23 Jul 2022 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=j9VSWHIcv9hhynHCEzG7vb8lC7yvj8c0Ge1sWGzb0Cs=;
        b=BFaBJJnTqnds8wT4Lm0ea+UJNv30fjjrETs1d3sQR8RD5GDbX8icemqJReUqfLAET1
         4VxArjhAGLYDgAydEGMo5JQmRn9cGRwD1FgJhu2x0yQ4++aAVqlf00d3d9Z0qtPFSjKy
         wdJIna6eX6Re7pPSL8EWctIg/JlBx+FQqX64r1308VaRvHTIHBWk4bZmuZiGRg0tv1xV
         CsbPTSwBakTHcVTuXSS6uJcyKVBeZuuDpZWsENp7wMdEZmVOyZ7RCOwf5CMxBOWqiz+O
         CsnxXRnLC4Lq8427wp+khfjM/3q++9NhMG9ot7VYY0WLPcr6aNVVyDBt261lXfx4BnKW
         QL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j9VSWHIcv9hhynHCEzG7vb8lC7yvj8c0Ge1sWGzb0Cs=;
        b=74UrNjkJ4uAacqmQR3fUgnIAr5KoAFkdzB3x1FWB02hOXgDSg6vPb5ouzvKT7lQS8Z
         DeWCP7CtplxKgvEF8cHLYvyRPy8xXuym4R5V3ZeRlRXpr8Mr36QbozZrzV1TbpnQiFPG
         wF3c/9L+7ox0ntEqsx/tKMdqrcKMViO2Zjh4gd3gGHoX3YMTBKpnmp2CMAQbnl4FSJ4C
         PtzrTQqTAJGQUmmGdCUX/9AdjT6v7fRRWqZ1clCC5hgP22m2IQXu6066IqEiq/VmK+l2
         wWjyWHD8mhFCEYgCl8f1KAgERQBkLZW4RgAW+F9KG4VavNPdAl1jIrQayvAG93UrwVfm
         Imhg==
X-Gm-Message-State: AJIora8+JCPvld+TwBeVG9NJSQiLWZsB92W2VlTAJfkmzlVK1dAs+BJR
	nqNFJ6ZETSaP7wvLMemiUr16rg==
X-Google-Smtp-Source: AGRyM1tg37vPm/+++7hhfX7YF+j0Jl/N0B+x7rATGaGq7vW/TmyEIxSRISYZCg1/DUrwSNEjiVxIOg==
X-Received: by 2002:a05:6512:1328:b0:489:e2c1:f309 with SMTP id x40-20020a056512132800b00489e2c1f309mr2386525lfu.555.1658606867552;
        Sat, 23 Jul 2022 13:07:47 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id 15-20020ac2482f000000b0048a7b50e301sm841375lft.297.2022.07.23.13.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 13:07:47 -0700 (PDT)
Message-ID: <f05045fa-9ecd-d312-0eaa-5d19498453fc@linaro.org>
Date: Sat, 23 Jul 2022 22:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Mike Yang <reimu@sudomaker.com>
Cc: Zhou Yanjie <zhouyanjie@wanyeetech.com>, tudor.ambarus@microchip.com,
 p.yadav@ti.com, michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
 <487a93c4-3301-aefd-abba-aabf4cb8ec90@linaro.org>
 <37062a5d-9da3-fbaf-89bd-776f32be36d9@wanyeetech.com>
 <d1a0dd15-3621-14e9-b931-417cefaab017@linaro.org>
 <b5505a46-ce76-d0aa-009e-81d9ba16e1d5@sudomaker.com>
 <YtxLoPOykLDTzTn9@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YtxLoPOykLDTzTn9@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_130750_115782_D616F9AF 
X-CRM114-Status: GOOD (  12.69  )
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

On 23/07/2022 21:27, Mark Brown wrote:
> On Sun, Jul 24, 2022 at 02:47:14AM +0800, Mike Yang wrote:
>> On 7/24/22 01:43, Krzysztof Kozlowski wrote:
>>> On 23/07/2022 18:50, Zhou Yanjie wrote:
> 
>>>> No offense, does it really need to be named that way?
>>>> I can't seem to find documentation with instructions on this :(
> 
> ...
> 
>>> All bindings are to follow this rule, so I don't understand why you
>>> think it is an exception for you?
> 
>> Zhou didn't ask you to make an exception. They have a valid
>> point and they're asking why.
> 
>> You may want to avoid further incidents of this kind by stop
>> being bossy and actually writing a guideline of naming these
>> .yaml files and publish it somewhere online.
> 
> Yeah, I do have to say that I was also completely unaware that
> there was any enforced convention here.

Indeed, it's not a enforced pattern. But there are many other
insignificant ones which we also tend to forget during review, like
using words "Device Tree bindings" in title or using unnecessary quotes
around "refs" (also in ID of schema). It's not a big deal, but I ask
when I notice it.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
