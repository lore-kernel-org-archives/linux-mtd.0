Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F72C7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yggrT2Fw85FCtnxBoI7nEtbEqOhtKcWW5uV/aS3ESjw=; b=DHdkSk5KeJmn8F
	NZ1gzptrs7xscFUE7MAGw0VKizkW1rX4jfM1J03TLj4UPvJNTWAIMY/riYiWRhkSUq34jDxqsWTZJ
	a2hpstt7ld7Q9nIlLPcZbMsn/u4aVB7k6wj7bGY7IttWVYeMCSDdVlbuGM9q/s5lsK5nJqqH+u+gM
	C14gUcojJNFCZh7qwrB2UU+DguSrT3ICu6XCJCB4xuYYxooUTR3xxnbf3fAK76PLQK0a+hOeGFjpb
	ZEaLXebKlYLbi4Ge945kfsElYqDEmaqW1Yq7O4f4VkG/cjVD5AcIz/z280DAORExvC2ijP9wLmmUs
	doqRSRJOFhmsI1UUURQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIwF-009vJ2-2b;
	Mon, 20 Mar 2023 17:04:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIwC-009vHI-0m
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 17:04:49 +0000
Received: by mail-ed1-x534.google.com with SMTP id ek18so49506276edb.6
        for <linux-mtd@lists.infradead.org>; Mon, 20 Mar 2023 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679331886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxAMY3nizWvmEM95cg4R6Wfdn2zdVJgYEOfRPSqXtRI=;
        b=r4JhAHhfafhmyI4TU0nAUQtxvk41RQN4oAb1orcyfMNfTXWhkK1ajC8BMUUeqdom16
         ODr8q9/WyUBLcRPk61YMNVSNJM4Qamn0DhyuxK6Ki1kftGU23qOc9vm5cOYl4crd5EBv
         dVql06uAOVIpOEAzAgAAt2M7J5pv+oVGAzDVlqoaDdHuF/G7gs9/plV6idCXdWO/fJO5
         pkZd7uNBIjkWODsrzzfCEGvI5gVbTMUa3OEJcBwZ4wez5T4C6OrNP9CK8pupqJjspjAZ
         olFafLsOpnFvijEQCblR6MytBLqO23+o/O51AQLEurFdtY/CzZkSz/dh6rEzBSfpuMFM
         wZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679331886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxAMY3nizWvmEM95cg4R6Wfdn2zdVJgYEOfRPSqXtRI=;
        b=pvwOq7wm/BK1fRqfc6oFFHCNU2HZ4yrM0Tc4Sh2Nh3HdFH8orLcceFpYwb6fq80GSD
         MlHMobPKLdNYH0nV/XIyjE8lcM9/A4yFRtnhDSffI1K5KMRHVSlB9vSz5nbeTQBBv01M
         P2feo72V3sw6uj4jQJ8wfJSdjW3vTt7rN2tVGhw5pywJo0a/s5HQlmM8nmGqRgyne/f+
         lAIhcLlEW6iZpJLYOXVDZnZpGucZ0Pp3P9dE6mcDfbCOcQ2RTIlEk0rZWHsU46F4MwaG
         3OoaE/994AoZd87k0YW+RVJMvSMrR44JnxGcy142wC9zA2H8edWJB6IsOe8KhSZmsQBr
         lhmw==
X-Gm-Message-State: AO0yUKUVrJ34B5AQ9+8lqtbXm+S6gX4M1qrG9KxpHD6NODV6fh1mZAe+
	5Rcqf0KkN18wkEGrKUHVvkM+ng==
X-Google-Smtp-Source: AK7set8XL9XScqbcQ4aPIKdObxT2yw+c0UNuVjrlEkoaV28Y6/AuWRgmT52/uNzmDhi4kmEisZV8CA==
X-Received: by 2002:a17:906:7c57:b0:930:fded:5bf2 with SMTP id g23-20020a1709067c5700b00930fded5bf2mr8895750ejp.52.1679331886164;
        Mon, 20 Mar 2023 10:04:46 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id lc13-20020a170906f90d00b00927341bf69dsm4671842ejb.88.2023.03.20.10.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:04:45 -0700 (PDT)
Message-ID: <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org>
Date: Mon, 20 Mar 2023 17:04:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_100448_286144_7BBA5A34 
X-CRM114-Status: GOOD (  16.42  )
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

Hi, Geert!

Vignesh used to review CFI code, maybe he can intervene. I've never
worked with CFI, but I can try to help. I'll need more debug data though.

On 3/20/23 16:43, Geert Uytterhoeven wrote:
> Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
> development board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
> "mtd-rom" does not work:
>   1. Probing fails with "physmap-flash 0.flash: map_probe failed",

I would first try to understand why the probe fails.

>   2. The kernel crashes later in a spectacular way, cfr. the logs below.
> 
> U-Boot flinfo says:
> 
>     Bank # 1: CFI conformant flash (16 x 16)  Size: 64 MB in 512 Sectors
>       AMD Standard command set, Manufacturer ID: 0x01, Device ID: 0x227E
>       Erase timeout: 4096 ms, write timeout: 1 ms
>       Buffer write timeout: 3 ms, buffer size: 64 bytes
>       Sector Start Addresses:
>       00000000   RO   00020000        00040000   RO   00060000   RO   00080000
>       000A0000        000C0000        000E0000        00100000        00120000
>       00140000        00160000        00180000        001A0000        001C0000
>       ...
>       03FC0000        03FE0000
> 
>     Bank # 2: missing or unknown FLASH type
> 

Do you use "cfi-flash" compatible in u-boot and it works just fine? If
yes, I would try to understand what are the differences between the
probe paths from u-boot and linux. I know it doesn't help much, but we
should start from somewhere if we don't have any other feedback.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
