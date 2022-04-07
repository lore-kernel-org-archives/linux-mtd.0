Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8984AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvE0lqst6AjW0HQGGSYWja4RWGq9/cOkfxa2G8tvAWM=; b=vhvZrSxh01Qla+
	DtwxXcDgYRIU0VtjpoBPA5rjdriE3LAclGHKU/lsW32ZLFmyhnh6BsLo2x/BEdt0mVl0iTtNrDuEV
	eWRBHaE4paIHbGPUHZOmFHc/x2YuRyN9ZzhK1PRSUqBcAaH6h+FMK7g0uOvhAZQpAOI0VEPyoJOZc
	RR8KQ6GuGKHUBTs1VdJYGwjvzXQ/h0n5pu5DBxkN8X/f0wkc450eim6XOdboljiV29p4XoFTaZ07X
	EPfAOfpkOOJ9WEbdi/TiX2NEl5nYU5tosKOoVtxWYTc2A0SXOlVk57nJFnSYAKHAHaSudIL/MGXFF
	/BLFQ3OEG/zlCSFIt2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncU2O-00CgXh-UC; Thu, 07 Apr 2022 15:27:09 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTz5-00Cf1U-VH
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 15:23:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id w18so6775752edi.13
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SRJLkMyHvzi95y55Vn5Iq6WvE2FMbtq9vylE1+a7zq4=;
 b=FUhf0Yz9rc3d4pIj7ttd/N6bOFguOSqX0iP2Dj3sEZHZM8bY7Vn/J9Am/GtNHIdv0p
 HOormLf5sdc/+pw28UHba8FOquWhPSDcoiOENy6xWdRqk2D6gcr/x3DaRN3cKLcIUTEp
 qL5OA2o3TQHIlbMjx7Saqa4+WRlko39bz8RoIyrGVwtqKFrviQnw5pB8K7q1Ph+QeaDO
 zR1A8m/jTaYCG4NGdMyRmjnUFFGwyM+tBsjYeb7UfWRMKCZ0UhZ1Vzey86C48XeECYK2
 yNxMK03PJ9b9GguOpi4FtgXwrAsmMDpxpY+GkL4WiQBuYRuASHbQrsWzR2mes0EJ8fbY
 ywqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SRJLkMyHvzi95y55Vn5Iq6WvE2FMbtq9vylE1+a7zq4=;
 b=l5nAz7Rrpk2EqtHIQG0LkC0zXuJrK91MFimZqxc80vi7O62iJIfA2E9g82SDtBnR/m
 e3c0iShh6JCnhgFmekUNXK9eSzwTpQPgshB6jjYlgf0HmHB2Et6KMtlifwDWed2vlMRu
 NJQxVmP7xJ/0iXKcPQ3baJfjuSmT2mjMxyp5LbG5BA1aCaoOYRGhyLBMTTzoMtEj57Pm
 y7gRFuUs1Fp+ylBlL5FZIaA5FIKyf62sO/FMx3Js9xa/C5wWAQhDRgcNLe+BF+IpG1d/
 XFWceWNyHQKNrdcwBpxiTnYWYfmVxzw0wMdUzKATem2tLw5zkvbXNRVmHPoCoG9TVnhK
 BEAw==
X-Gm-Message-State: AOAM532XvK/a24BhBPB5Teu3dE9XsuQbfVbWpkTvJBqQ6aYA3fSpanEK
 oPz+i2kUtw3cDLu8yrEbWLGXuA==
X-Google-Smtp-Source: ABdhPJxpe8sU19S4ZyP0NmK+CtJZABE3mnsomrt0BfI1Ai2vqC4WVJcaC76McVCKILcMcHQzBik/0g==
X-Received: by 2002:a05:6402:207a:b0:41d:80c:45 with SMTP id
 bd26-20020a056402207a00b0041d080c0045mr3671422edb.248.1649345021527; 
 Thu, 07 Apr 2022 08:23:41 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 k22-20020a170906971600b006e840b36f5asm375813ejx.91.2022.04.07.08.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 08:23:41 -0700 (PDT)
Message-ID: <67f75e49-e0c1-463f-da39-4a2efe7cce3c@linaro.org>
Date: Thu, 7 Apr 2022 17:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: align SPI NOR node name with dtschema
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220407143405.295907-1-krzysztof.kozlowski@linaro.org>
 <Yk8AJcFRmYEryqra@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yk8AJcFRmYEryqra@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_082344_093291_CC448384 
X-CRM114-Status: GOOD (  12.47  )
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

On 07/04/2022 17:15, Mark Brown wrote:
> On Thu, Apr 07, 2022 at 04:34:05PM +0200, Krzysztof Kozlowski wrote:
>> The node names should be generic and SPI NOR dtschema expects "flash".
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt | 2 +-
>>  Documentation/devicetree/bindings/spi/spi-davinci.txt           | 2 +-
>>  Documentation/devicetree/bindings/spi/spi-pl022.yaml            | 2 +-
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> but it would be easier to split this into per subsystem stuff.

With DTS changes I had 22 patches, so splitting is a trade-off. If
that's preferred (actually can reduce conflicts), I'll split it and send
a v2.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
