Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6874EC76195
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zfv0WoP+3kH8qHTYuZjECbHaKwRV2l2Mmnhw4KNWKY=; b=4dfkOcCcS8LBN5
	bRGce5m+SEegX1y2RNK5Jt/nAxjK7GxUFsoRz4oTy3pL92LFy/8OfFZcOe1N2LJI5O+t/rwcBvGcc
	HgoaWBwIhFMDu+NZePWeq7U0pJjwtC5A5jnJOlp+IcISYQvWq4eyYsawg3LKz2XEd8paIKY2q/U+K
	sLxehAX3P6Xq9YKi/BFc3mlvrycyAmh5OkEIL64K2vacO8Ll9V7MeGzuRe8rbGkusUQs3ZTI2tlnY
	a4M3C5RHPJUc6QbNaksqWeW8QkT9WA/A5MQ/wvm/MLoMo9JRM7MdgrOqSiC3hEYWSRgTwke+zMGYx
	9rhNsunZWbcDP9M1qYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5sG-001aD4-2h;
	Fri, 17 Mar 2023 08:55:44 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5sE-001aAH-1F
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 08:55:43 +0000
Received: by mail-ed1-x52d.google.com with SMTP id y4so17626033edo.2
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679043337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gxSX5L1OmpXcthvfw5MjweyMCmUxCbeZZbdbWsawBJo=;
        b=p0Utw7dcfsntbaYjKuVKxmYZs3+AC1QfMw5BYSbjjjouaZFQspDdIKPeIoTm8fioZ5
         FJNjSowwffLVKHWnGjJzqgh61X90caxvTMXc3zwcoA4DtyTLaPhx/tRqb21BkVRM4PyZ
         ZB6H7vK0DvtpuI31/rUfeiUj6pLETPLZPmaYW+YUTul8WwqQBk26xMMGkHMZAasuNlRF
         BA7bD53oFpVrsB8G/2UMbA9N4uzWmQk12Ppbrh7Y3NjxjBTO0zpQQJT62YV99SOvf1n/
         fq5JVkhQ2G2bHPphW6hxWm0lNzPe/YSCE7WHQHJo3fyGFHCJghJbbgk6aoG7aJUu0Sxm
         tygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxSX5L1OmpXcthvfw5MjweyMCmUxCbeZZbdbWsawBJo=;
        b=VGdNSwZufpfQs1Rd7xZvt/X1n5tmtgJLveeCFWF64/OeCiRLGL58UnypDQBLD0XvfM
         CPT6FZtOej7pxmLbxF41BYCm9kJw98yYYTjvocLLW2/9xcrZn8oK81v0CwjGsIOzNjnr
         jE3QB6jzgwSyW6HsKLWaGSbBVp0X+XKc434XBU2qEfppIQkGdpr/IpVn4RSFK0bPaZ5l
         4HnISX2xW+CsmnXDI/hdP/yFaBpy4PmgfHCCcmZJuYVLhU9o6qWHlDmKWiabwG09bk7J
         aKOErlKM2kvmEZsTI7dfkd+u+V1oC45RD7mR0sZc/ARFMCbXpeGkcq1agDhvo3wbJLd0
         6UUQ==
X-Gm-Message-State: AO0yUKXIGSDmKc1Bta8HYSdyVNMs8fFZSawg9d/sXp7cpZGo/WbJXGHI
	ARCk61ICKWlocEU36gHF2sBf5A==
X-Google-Smtp-Source: AK7set/JcZYMegW4uUuY2gSACs5BA94ZRDAXXR6jpkDT8Iq97dpw13jDjyDiTrYpyN/imNVXwbwQPA==
X-Received: by 2002:a17:906:4d53:b0:926:e917:133c with SMTP id b19-20020a1709064d5300b00926e917133cmr13567040ejv.47.1679043337365;
        Fri, 17 Mar 2023 01:55:37 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id gz14-20020a170906f2ce00b00923221f4062sm714787ejb.112.2023.03.17.01.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:55:36 -0700 (PDT)
Message-ID: <5d712ab6-915f-75c2-45e6-dbe57ebf5fc6@linaro.org>
Date: Fri, 17 Mar 2023 10:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_015542_427247_B9842FAF 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel,

Would you please take this through mtd/fixes?

On 14.02.2023 16:26, Geert Uytterhoeven wrote:
> SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
> (CPOL=CPHA=1).  However, using the latter is currently flagged as an
> error by "make dtbs_check", e.g.:
> 
>     arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
> 	    From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> Fix this by documenting support for CPOL=CPHA=1.
>

Would be good if you can amend the commit message to Cc stable:
Cc: <stable@vger.kernel.org>

> Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL from common properties")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
