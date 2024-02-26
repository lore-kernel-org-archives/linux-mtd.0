Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312CFC54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bzq3Pjj2TMIRTJ4airZtD50XIdrLnUnffANkiDuDLvM=; b=s2HR1Cq26IALxd
	O9jZg/o+dttai0KrkyddfGsL825AWx5K58+JU3KRNBUKjsEcCclAxVkc/SHeu3CwYDFB0+aWujUyw
	nRex/N/orpjEvYcxScz2VDQ+OaMGJIt+e6K5dLZlOTjRlQcwX3lgjQXDD5BXxuy6ObsWocAFFbuAg
	BvFnHtE6csytelHPks3NcjNNjuv28aEDcIONod+5f9zoK1PzPUy3cWj2EMYRn9Z+sCWddQXkmDh2/
	ELoiGGtPH+ZLi+QHu4ncKJf7sf0dW3Z6MrgG+p0Np5kLQvqlzDQv7mqV/FWwAOq/T3C++cKcaAiRD
	/vo/UmBQjxQXK6fV+XoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWkb-0000000H9Ww-1hBH;
	Mon, 26 Feb 2024 08:54:17 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWjy-0000000H94B-3bEJ
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 08:53:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a3f5808b0dfso377264766b.1
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 00:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708937615; x=1709542415; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHQ7jHKdG+MDwmW7kS/5z1xq3VefC7Loe1slCKwf0q8=;
        b=vaV8sL3QpQOUXv+2h717rty4UnK/D/afEGfAwe3ajcVN4oLQH5YX0vAwh4NT0IYI53
         ImIzrAH7wo1zoSXhf+7aLHR+rkS70TTuYNIUJlp+2m9aqf5ls3CBJFK8/4Dl7U4Emswf
         SshY9kz+fCgiNOEwlnkJ+mWcoMr3g7hZ8N79Kxosppqp6uRnvRUR8ML0L1mK2/xmwLU1
         bVCPo7YoGRDwSRJNqsYOvrfFBmTNdFs/T6ZrinCx6wiNrO3IHsK7qk9UrgQywusfaGqH
         2CL+IDUY8jcOK5MU95byhEc0lIJoc+H9m6p6LW5FwG5Eogn3ea0hi3dn2FHMRdHGKszH
         2sYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708937615; x=1709542415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHQ7jHKdG+MDwmW7kS/5z1xq3VefC7Loe1slCKwf0q8=;
        b=CcvaFdvEol6YkA+yMD6apgvXl6G8sO6eUQlTy9kvCPoM1GQd3tZW5X9jV8s07vznGH
         /BeEWH/PoVOKrLT8dlQU1KtWJL7xfIKiRlyKso4C/b3EHP5P+LW9TToH0igHLoHZ8tNN
         hxS2wXABIM4AmeOTat+f3DHNYG9SYF8IN5j0943tVzQ0UZNTbU6PGwJ/lZRhwZ7dCxzL
         vkRj0Ti7sEeVXgVMlYkb7r6l1pfk5ZEjeClShXTM4ToQcXNZKYoDAQOtUSp+YQsltYOv
         tMu4nYcPJTJ23TnZBhBnusu/vayI7wF+y3fu0SpIL5qJenQj4rsxD16+7KT3sCPhXJuV
         DxsA==
X-Forwarded-Encrypted: i=1; AJvYcCUuMl3sekuGTUOWI1EqxgC+4Sijz68m6uDrnqewNoMBGcMfN7jqw8rirIylv/VeY0LbbyvE+diDg32yla1iD6CokHlEwkIDZo3OOyfrXQ==
X-Gm-Message-State: AOJu0YywmYPo4UzKjdCNDE6MHdtxyZVdCsgcF35iOKHZV/AC0g3gcYmH
	GgeN9a+9tzYrOjJ2PVJ0rzGoXsIqou2vGn7X0pqAHMx/7iCZP5rxaajPh1OLQ4A=
X-Google-Smtp-Source: AGHT+IFy+cfEp+0Vwzv3Xmk4x476cj5LMncuXFcuxpkchPSoWaMXxiVwBZRPr9hLyqRy+3Xybx3Kjg==
X-Received: by 2002:a17:907:9902:b0:a3e:5726:c12 with SMTP id ka2-20020a170907990200b00a3e57260c12mr4363389ejc.37.1708937615031;
        Mon, 26 Feb 2024 00:53:35 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id qo3-20020a170907874300b00a3fcbd4eb2esm2204489ejc.1.2024.02.26.00.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 00:53:34 -0800 (PST)
Message-ID: <4d117770-6e0c-412f-ac1a-d9ba84b5b4ba@linaro.org>
Date: Mon, 26 Feb 2024 10:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for BoHong bh25q128as
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Bauer <mail@david-bauer.net>
References: <20240220200325.19089-1-ansuelsmth@gmail.com>
 <f7c45e7b-993c-444b-8710-042da7512bbf@linaro.org>
 <65d9d08f.df0a0220.988bb.3177@mx.google.com>
 <CZEVS9033HET.1NPH0K6PQLR87@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CZEVS9033HET.1NPH0K6PQLR87@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_005339_219910_942A9DC3 
X-CRM114-Status: GOOD (  12.31  )
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



On 26.02.2024 10:51, Michael Walle wrote:
> Hi,
> 
> On Sat Feb 24, 2024 at 12:18 PM CET, Christian Marangi wrote:
>> The user just tested this and It seems there is a problem in JEDEC id?
>>
>> [    0.726451] spi spi0.0: setup: ignoring unsupported mode bits a00
> 
> What SPI controller is used in this case?
> 
>> [    0.732850] spi-nor spi0.0: unrecognized JEDEC id bytes: 68 40 18 68 40 18
>> [    0.739725] spi-nor: probe of spi0.0 failed with error -2
> 
> And what kernel version is this? This should only happen if the SFDP
> header is wrong, but according to your dump, it is correct.
> 

I assume the test was done on an older kernel, where the identification
of the flash based on SFDP is not yet available.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
