Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1394EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6QsfvRZF2OMTQcH7RSRk9lFb7HsBoJWS+YaqGoMDZs=; b=Ek0msglg+smYMp
	pQC7jcjA8KPsoDDT97H4JAjo9azYfg/7k09Zgy3wsFpUcUynxfSk8mSKczls4reLrwjbmVOqSHsDH
	Fov+6AfJB7xNbFFIhbBWkNsX9fKxg+OUU+YIEYrO9U7NJ8UlXMkE9NbmwMnkS9glHGEIgMK+hxBGK
	MRM3NP5KVy+491W8Bpu2elL2MWQl0Y/hSEAKGijRvShZYpg1n3V52oBcq3v/uEExB3vFYdo05Qd5o
	0OL1/yvNTWBuZReDq2v5ASNX3Zkpm6Mkyfsh6wUZOvbsm91CX5D8AIl+3tELNVHeEA8zJLphKJken
	dLMQmYElL+hMBOXdUhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNUm-00A0AS-1z;
	Thu, 20 Jul 2023 06:50:40 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNUj-00A09F-3D
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 06:50:39 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-521dc8ae899so186426a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 23:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689835836; x=1692427836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0g/IBsPZGY5PxZfIKc7/6gIDE3jbSDKqZLxVCtbNmM=;
        b=Oie91okDf4TmQaL1csHvGo+xD5lYbjqxP+Y/+z633ZjSv+gZcB9UuUtkVx48D2RSKW
         IgISxlpeI2YmFSX8NauVibHdDy9iX4npnCgThkBlcEjqvjYX1/lRDXT4pvYnBxFtpQ8J
         ko5Z4m6YgZ729LTBXrAru3IXv4D13BpEiEQbjrx8ig1l9m/qTGqCwDB7enDhHsOTurBf
         mzLfr34aLHxiuytOFDb/LGWeBnGk07kvoyZAa57IOqpW5L2d9pkCIvsARkakeyWVXhmI
         x1sM8YYJKGf+eAPBzgEiQMB3J36zBRXXWhOMSr/vXpNT5vGTErpFOpOE28bjOouV6wH5
         gx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689835836; x=1692427836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0g/IBsPZGY5PxZfIKc7/6gIDE3jbSDKqZLxVCtbNmM=;
        b=VemKb40FCVVIpjLZmp/kM54CEtTeAFgsMNPW5Lws8qBsJ4a5Wt2YWSTPXqGzb4xZis
         v8HiZ/7LHo3RMYLOS+gIkaBygwrHyXFe+bRxCcO4uJhu2YJhdbxHukAorxETqr2nra6F
         tM617bxWiVrUC75fb0kjG7oj2XW+dISnHqCOQjL805eX2vt5850KQHFvHCJLE/fI3nSL
         iJaTfEXM8JrM3FozrCw1WASGwDvvPNcbgJpbWA/Xc9OlG2TJ8vKNyYh8d958wBNrH8Bg
         iaTcb8D9ChrMZRj2039EhqccfyVGkoMdrfdhD94xL1kdNj4dV8j/vqgAQeAU9yD6pVns
         Z3hQ==
X-Gm-Message-State: ABy/qLY5jrukoaitb3ugsENel14bvHtn6uYmU0F5D/8arUt/dKEJuthD
	HL4xQ8bPyK7to7iBOcVGGA8xhA==
X-Google-Smtp-Source: APBJJlG4RR2sqWSSMq1ocs/VfVSVQ/+Fb3rMHZ5K+E5BQzoA0+73UAaCItdftmgHvay9ZoHLh1P6lw==
X-Received: by 2002:a17:907:779a:b0:99b:5689:1331 with SMTP id ky26-20020a170907779a00b0099b56891331mr575512ejc.59.1689835836589;
        Wed, 19 Jul 2023 23:50:36 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id o23-20020a1709062e9700b009935aba3a9dsm225434eji.48.2023.07.19.23.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 23:50:36 -0700 (PDT)
Message-ID: <598bd9d8-249e-125c-bde3-7a63ba6dc5f7@linaro.org>
Date: Thu, 20 Jul 2023 07:50:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mtd: spi-nor: avoid holes in struct spi_mem_op
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Foley <pefoley2@pefoley.com>,
 Pedro Falcato <pedro.falcato@gmail.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, Dhruva Gole <d-gole@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
References: <20230719190045.4007391-1-arnd@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230719190045.4007391-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_235038_059056_D7C3CAE8 
X-CRM114-Status: GOOD (  19.93  )
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



On 7/19/23 20:00, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc gets confused when -ftrivial-auto-var-init=pattern is used on sparse
> bit fields such as 'struct spi_mem_op', which caused the previous false
> positive warning about an uninitialized variable:
> 
> drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]
> 
> In fact, the variable is fully initialized and gcc does not see it being
> used, so the warning is entirely bogus. The problem appears to be
> a misoptimization in the initialization of single bit fields when the
> rest of the bytes are not initialized.
> 
> A previous workaround added another initialization, which ended up
> shutting up the warning in spansion.c, though it apparently still happens
> in other files as reported by Peter Foley in the gcc bugzilla. The
> workaround of adding a fake initialization seems particularly bad
> because it would set values that can never be correct but prevent the
> compiler from warning about actually missing initializations.
> 
> Revert the broken workaround and instead pad the structure to only
> have bitfields that add up to full bytes, which should avoid this
> behavior in all drivers.
> 
> I also filed a new bug against gcc with what I found, so this can
> hopefully be addressed in future gcc releases. At the moment, only
> gcc-12 and gcc-13 are affected.
> 
> Cc: Peter Foley <pefoley2@pefoley.com>
> Cc: Pedro Falcato <pedro.falcato@gmail.com>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110743
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108402
> Link: https://godbolt.org/z/efMMsG1Kx
> Fixes: 420c4495b5e56 ("mtd: spi-nor: spansion: make sure local struct does not contain garbage")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Miquel, would you please take this through mtd/fixes?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
