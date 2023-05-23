Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDBEC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 04:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiRhB5z/u0LEeE5xY5dwhDTZJg5i9aP14Ipp8BdabYU=; b=12TFsmkoQI1i72
	FgHL0puvGH+WRLWgOK8nese2CnIMkG5jzpvwpu+3Lvq86kheRu5uates5/jHSPMxlpWVBrpqGQE6B
	A2qHYcnSYLZtoKqF8vAn91VofxKXtBNolsqIYJQvZL3ml8JZ4+9e9apXXzjYJlRv3bb5QYCXxE52p
	4njarbiIkmp1+YoA4t+xFawMV9Bil0mpaDidh/QPSxRriaPdxvLdP57gfZdQr+cyjDKjDgkuTpRbF
	Q3oV1eRxVURS6u8H9Hc0K7+wnNiZJqtm6uNA8DKjBkHw5ft3EdJ/hY6J+8ArpR6qcW2rAtUjcQgI3
	HsDAN2nwfr0kzXaZK5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1JXj-008riE-0e;
	Tue, 23 May 2023 04:22:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1JXf-008rhi-24
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 04:22:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96fb45a5258so507431866b.2
        for <linux-mtd@lists.infradead.org>; Mon, 22 May 2023 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684815753; x=1687407753;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IrUwwvu919gFP5mZyuKZkqfibi1Ub0emjbO3GDgEJ5k=;
        b=wey5i96L22t6q4ETH0gZwPDEXeZHoOATcTAUW8VSrqyCWiUPNXMKwclpsQK36asKjA
         FyOcl+j2rHInRekBSM+v0mG4l6KzdruXGIZwsi1fPwLYxppwaKHR8YHTKGXzKGtN4pWb
         BD3DVolXWLGxR/ZNjXJ8qqlGQOKvNoGYIwJjJKUab7J08gNxXCL48PKF7M2j2WxBxbpc
         67IUcuNY3U3sGJOrMhTuwLCNIq81YFCtmlXB30zlshzRTK+CSl1vkN5W2A5JlXol6cEP
         I8lwbcGrtRf0cuURi4o7ErQ5uensX/r64JWOUcklnIfauNh+8u4w2dKY8bhtcuKct+Fw
         6XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684815753; x=1687407753;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IrUwwvu919gFP5mZyuKZkqfibi1Ub0emjbO3GDgEJ5k=;
        b=NdDgEyxNydIeBoR8OhrSVgZv5KcbvL2j56PYgdjwEmFdtM0swpbxvJLxcUuvvdaCSE
         Tg3uB4c39XbpWaPLYRwwJvzOrRWE2mezEACRYTKuuGqz3x+uqlb7rZ5TzQPit6aQwI4A
         5j5AWb9r6RTaesBmCfQghfXu9wWDIPL4phKcAVh43xEfFWp/pDnClHUVPla1Nlovk2Q6
         7o543iOarFAxFA93AhmDHHvK/fnvb3yvtBD7TP6EIrRNSXxgyt4ArV3eWKc4FaAr+AMG
         SR3p+YRounEPLPTLaHV6yYsXFWQYqbY4sAOU++kPXQwfV3HcDM8wAD7EGqD6trPU/TQm
         dsJw==
X-Gm-Message-State: AC+VfDzg14oxrbIzux5j5Z/mJnlqCN4dm6MQbzzM15+bwk+SOxuhcVAe
	3xTcO1VAD9jwsU3ek97YW5D4lg==
X-Google-Smtp-Source: ACHHUZ7+jh/ypXTVJKhUuEfO0CIAfE/7O7UA6E884oyvycLEIjBP2cJX2xN+yYSO4c7gxzO0pSTzRA==
X-Received: by 2002:a17:907:78da:b0:96b:559e:7f2f with SMTP id kv26-20020a17090778da00b0096b559e7f2fmr11294056ejc.38.1684815753258;
        Mon, 22 May 2023 21:22:33 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id h12-20020a1709063b4c00b0096f694609f3sm3916181ejf.31.2023.05.22.21.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 21:22:32 -0700 (PDT)
Message-ID: <d94273b2-9516-2b80-308f-9fd1fdd2b4d5@linaro.org>
Date: Tue, 23 May 2023 07:22:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] mtd: hyperbus: Add support for Infineon S26Hx-T
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_212235_776291_2FDEE1CC 
X-CRM114-Status: GOOD (  12.62  )
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

Hi, Takahiro, Vignesh,


On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
> https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91
> 
> This family supports two interface modes, SPI mode and Hyperbus mode. The mode
> can be switched at rutime. The default mode is selected by ordering option
> and non-volatile user configuration. In hyperbus mode, the device is compatible
> with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
> use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
> set focuses on particular usage that the device is pre-configured as hyperbus
> mode for compatibility with S26Kx-S.

I'm questioning the overall hyperbus software architecture, not your
patches per se. IMO hyperbus framework should have been written on top
of SPIMEM and the controllers be placed in drivers/spi/. So I'd first
address the SPIMEM adoption before adding/accepting new support. Would
love to hear more from Vignesh.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
