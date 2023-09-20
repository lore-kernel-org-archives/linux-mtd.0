Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D371CE79CE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhSwxBAzBgp2RbTBV1N5cPxo7bRT0K0SBGjw9g4NhQ8=; b=P85diettyKufjc
	UygVG5qDDYhThMvwFFN8kl5XZJiwvnA4xWwBxGf232XWh+oETkPy13k74OWUPfUUHDDB32vrV7rlD
	uGhUI8WUufgQD+4kaQV9/rbTvNh4RLIbPuDJFMg8yA5LqOLg185CfLmt0gHAXgE40YX9pQ9YYR+Mh
	el537B02yO1nIFx4zPmoObhIMcTNw1AdLJI9lPmGDnDkr16MEWRxEA55GWxBDJb42dQZJ2BcXaGsj
	VJyiEeDQl2ngOxv/p8twJDkT6eJvpeIMS6rooqc6cj5Z4WiXV6zgZFBnf6D2b+09+hlCLySzu8W+7
	2BiWOPit+qRE/Leew+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwcV-003594-0G;
	Wed, 20 Sep 2023 12:47:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwcR-00358Z-2e
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 12:47:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bdcade7fbso880306866b.1
        for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2023 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695214068; x=1695818868; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uRr3JXyL9s22kon0Uac7wqWymwTeAG9z/GQzxzNFU8=;
        b=onzbfvgjGRu2YnQK0oRx6LHLK1OpiEClGaWOUchdzs/d5rrqnydB1PeGuM9jn1/Sjw
         q67vZxu449yjMQB/3LktPMrQYuZED7NY9v38okU7agUx2F+ebJCvu7hEoarWYCny3rtq
         TclGxt1s6ysuCmXqHKwaIUuQ3rZmcoHF6CsRvPo3H5r18gTaF52/qYqpOqr4i6Nco4LE
         NMI/3u8x2VGKJggRixlBvCBLxhyXG+eO7DCw/rIKw/ZgHHxJxpNKyHReHjU+Q6U/PWSt
         oOSZiYobDMI42qj7POtfISBPk5+V57O8xBEPtMl6XoO9ZUPEvApUSAuy/g24fKvVTmO/
         m7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214068; x=1695818868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+uRr3JXyL9s22kon0Uac7wqWymwTeAG9z/GQzxzNFU8=;
        b=GjOZNfoqNGCdlpoEpQsYQIpJWD1dooGaBbN6sseVOG8I0QPnndxdhG89CuDlC8e31k
         OMxXhRRRMlK1sC0qpcOwHNHkBaPrj5x84o6Qh+6231p7iQ6ilFEgT/B6y+HVJtCmKa9u
         e51DSiaBS60aGnedxYHDJ36g77iD0UbnCBF5C4qxE1JonX2ZhpSwhTyACd+DlfLbOWuo
         Lg1kJVogLJE/SaamPb1ESZAICcwuu/JqxSmXJecSKs1NM1UhoEW4KMPtj9DPBojnqwIs
         9ofgaMcfnyMRvHbwg3slduMQ9FTo7/uCW9dOF/NsgKi7Go0TZDMLABRD2eelaMuVQNXj
         /i2A==
X-Gm-Message-State: AOJu0YxfXsDEAntReQwND5uF8aipip+rOve9ouiaG5VIe15z38rF/Fhy
	Es9Kl6dFtnMK1sEYGdkqsxMGGg==
X-Google-Smtp-Source: AGHT+IExo5ufA+wAxd43Jlseyai3XhbKJQSRw+ulpw1qjZL+SexY3HNFf3jUDiNM7QUqZmgHFffypg==
X-Received: by 2002:a17:907:7714:b0:9ad:e2c5:7f73 with SMTP id kw20-20020a170907771400b009ade2c57f73mr2129915ejc.27.1695214068015;
        Wed, 20 Sep 2023 05:47:48 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id kt26-20020a170906aada00b0098f99048053sm9518105ejb.148.2023.09.20.05.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:47:47 -0700 (PDT)
Message-ID: <c5f7072e-d723-7c02-c37f-51ad0ace59e5@linaro.org>
Date: Wed, 20 Sep 2023 15:47:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 4/6] spi: spi-mem: Allow specifying the byte order in
 DTR mode
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-5-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230908064304.27757-5-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_054751_868246_86450562 
X-CRM114-Status: GOOD (  16.97  )
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



On 08.09.2023 09:43, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> There are NOR flashes (Macronix) that swap the bytes on a 16-bit
> boundary when configured in Octal DTR mode. The byte order of
> 16-bit words is swapped when read or written in Octal Double
> Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
> modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
> 8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
> Swapping the bytes may introduce some endianness problems. It can
> affect the boot sequence if the entire boot sequence is not handled
> in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
> back to have the same byte order as in STR modes. Fortunately there
> are controllers that could swap the bytes back at runtime,
> addressing the flash's endiannesses requirements. Provide a way for
> the upper layers to specify the byte order in Octal DTR mode.
> 

Jaime,

would you please remind me how this works? Does these flashes always
swap the bytes? Is there a flash configuration register where you can
specify whether to swap the bytes or not?

If it's not configurable I'm thinking of introducing a hook that allows
flashes to program the spi controller to swap the bytes and if the spi
controller does not support byte swapping, to just return an error and
fallback to 8-8-8/1-1-1 mode. We can't break the bootchain.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
