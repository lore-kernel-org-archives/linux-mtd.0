Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F02E77188
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrQPp+LkUuyEjbqynWZIS5vd7h2518byiwRP8dFrHqc=; b=sElnpbiYtBcRq4
	aEsm4Voj+rvqP+KOV0lh7KF5KnmFMBSDunCe+eVx2gJ0Co3LbE9xIifQq2sk81YAxBCCRKLqbA7JT
	HA1XAw/8E+g2JYEmP6xZM/Nj7fEc1WojGt2C7evP+shez23OmDdvXyC7VQg4e5SdFv3u/9mMMAWg9
	shQ26Tf+MafgwQMWY3ZxP7y955j66KPnw89PUcwnVAf8pushF+E8CqEKeL1TOmpeVpv/5isKXK4b8
	qJ8YQVwBAp4NwZs/NC97hgXW9EjyaVQha6TVA681CovesoCZ2ki344FwgzXOTDsSvw6HJEWDYArdQ
	B0/07QUDw83VthQkmGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWExT-0000000FSA5-2EdI;
	Fri, 10 Jan 2025 13:21:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEpk-0000000FQc2-2KeB
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jan 2025 13:13:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43618283dedso20388235e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2025 05:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736514830; x=1737119630; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFfH9Q5EE8c3RfBsjK2pn8DV6aL5nY2ntxh8fB6jzqA=;
        b=JemiW2YbnapKW/4ycmnBv57U4bgMJdE+VrOiS1daT+bW80i+EtT/8Oa7msnxallzxE
         qR1lpBeHIBSUJyqThTCsXaLNSF8G6YUHhMhXXFIA2IFgLyyJFu2ZUj9NozBRlr+CkFPs
         fSDLFeWJ2/eohiz7lfrowIDi4gI7y7EpZMbOdPb+DUFI5WNd5vq10y1yL1pRz93QUbX2
         z3ydkES6UtGOs3DR4WDQ0MSbio25hSZrSx+U5sa1fl+gX4zFofXHL5oY/VzNs8JBff35
         d4IDf7CQdi9L8TyGtgmWF433/DK+QEQdp3V8V1rwxYrZrMw0PN4ujQysWzIiaZV7+LD1
         0L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736514830; x=1737119630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFfH9Q5EE8c3RfBsjK2pn8DV6aL5nY2ntxh8fB6jzqA=;
        b=jsWTgNq5dsDWaQE5UY2KA0iiUBSFWf5eFH2CW4PM8FELDUTwBWNaT38ULNT0ujX2tK
         9QJzxgKZ/ZZvTIq1ibW31rqQcs52R+BVUWlifozPtfV5ifYSmyZPM97kizOJa2EZ4/4V
         MZwJm0aHICW+2LUO8c1IrWyfcZ2K7iLkP6Swec84ZWCA9IehfIZlDkrtNlDB45SYjUEy
         paYHKzqFbIz/G4P/NB2ULIrHdOd6Ccf7rQfEwnZfayxdStCp/JYOWxfA8DKpNPWzc3mW
         rYchJisgI+0B9DpQ9g7jPsU2vdrVM8AVR6cK8eLOVMQY5NNxJzAQcA4lqT72MrPE/Rx8
         DrTw==
X-Gm-Message-State: AOJu0YwMMh5g5ZYzx2HPJWFR/3yBegVWNKfi24WlpTobJ5IveIYMwMIB
	adnvZBIfQnd/JIGLMsH5LuuBtehT4Gcj0eB08Cp5YBetufD49l7VU9C8A0BZYMM=
X-Gm-Gg: ASbGncukmBnA6i0ZiUe13kvBtx/6geeFk7XAxyUCD/TbuetkMzymCw5EuLbGIGZKTUS
	SIOXs9zzMXDKPaXFT71N8MZA2eYZDS9AMdQdLBshOY5mXFjBHUm9Fh0U7//Ifdmd6IX6m3P8kod
	qm9lKjJmczBXyXeeqWkNVtrv4YMOStxbso1SLUkPjUpMWys/QrV0Pm1HOHgtDWy0bFvwmYyAWY0
	BvIqY1jEsWlE4hAqdE8V0UkkHEUnem+mi3LkvpYcSz5pCdJby1YlFB+Gqlc05qb
X-Google-Smtp-Source: AGHT+IFPY7LYVaU/NFtGYtHnEtC1C46XbRj0+Fz0t3wTzJ28BGznX22dLNFAeQAo0VeMF/DlgwdxxA==
X-Received: by 2002:a05:600c:5117:b0:434:fe62:28c1 with SMTP id 5b1f17b1804b1-436e26cfe5bmr98232285e9.18.1736514830568;
        Fri, 10 Jan 2025 05:13:50 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8180sm4514946f8f.76.2025.01.10.05.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 05:13:50 -0800 (PST)
Message-ID: <ba62ddea-c905-4969-997d-545b3adc186b@linaro.org>
Date: Fri, 10 Jan 2025 13:13:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: hyperbus: Use of_property_present() for non-boolean
 properties
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109182149.3971698-1-robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250109182149.3971698-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_051352_628134_F39E44E8 
X-CRM114-Status: GOOD (  15.30  )
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



On 1/9/25 6:21 PM, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/hyperbus/hbmc-am654.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
> index 217f4e69233f..60bdce4391cd 100644
> --- a/drivers/mtd/hyperbus/hbmc-am654.c
> +++ b/drivers/mtd/hyperbus/hbmc-am654.c
> @@ -176,7 +176,7 @@ static int am654_hbmc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	if (of_property_read_bool(dev->of_node, "mux-controls")) {
> +	if (of_property_present(dev->of_node, "mux-controls")) {
>  		struct mux_control *control = devm_mux_control_get(dev, NULL);
>  
>  		if (IS_ERR(control))

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
