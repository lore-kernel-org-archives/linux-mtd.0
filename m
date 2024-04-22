Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E0BC4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 06:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lk4CYA/hP8YNWLHJpXkU3FY+YOAgMGw/tmGgIntOWVs=; b=VfGLSFEpvnFL0f
	u7QVXzdFEnRs9AQqG1xxzjH1aLrFRkoeYBf7bHCQTxbyxhONT331MTbUiHumCMv25CMCKm1WaGyq4
	rfXlDbMaBRZnWentKmDh1vYz0kQJKCc/yG1Ys9JkkGUuFOLTQxVaH1R1sLVqWhRkYeT2m8qEXt3P8
	Jva0zLDsCsXICfdLdCXd2q7uifixBFVOOkmvq50N58XmWMNi5HbiOwkRmjHokn0xNdmIx4W6Yru+D
	AmMj+s6cXMJyiKUaYTSTz162TnqI+2P5FfKAz5MXalI8gMBxE2V7KXF2vmnXxiVo0mvmlxmVuqSL+
	+BqWqbQPIK/fW1BqR/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rympS-0000000CCvy-3YhQ;
	Mon, 22 Apr 2024 06:07:02 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rympP-0000000CCt7-3SOT
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 06:07:01 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a556d22fa93so451248066b.3
        for <linux-mtd@lists.infradead.org>; Sun, 21 Apr 2024 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713766017; x=1714370817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/dC3aqszW4WBRqrIUZqM6bgnMZxMjwSBSzDUmPYeq8=;
        b=DMvfJkvhWVWpBFRkgKvPJnyrWg7Ezq5Nvkb7EyxoQstZgbjleg9J83MFpctdgxPVWP
         RqM+tmVHQkD2C+o1Nh8fziqbgzbQ+3LIG7pCipBbPgjI0dZH5FDHfr1ndx42coHHnbq6
         IX/3gpUm8mwtra8D5+6YGM/ZJTHj2aNGuEM4pw3i10Nv6hXx5RKL7Q1kg4jkvBd2T6S4
         nzddtZcS82RpQfAw9rWqQzFanvmwYLOuqE8ItyoNcS3I/b+6OMeLqhH/xuaQFzaKnkNi
         9A3Rxg25FWrIbQwLD3VM5QA4ondCpKyHzZKE2AKv5wzmolNJIbn4hm3zqOEt3AImx0rA
         y7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713766017; x=1714370817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/dC3aqszW4WBRqrIUZqM6bgnMZxMjwSBSzDUmPYeq8=;
        b=OHAv7DQ/cEoR4WDnYY5wzl3nrYcjmxtvWZHlEMp83gWB3erBpj1CkTBz38JutKcz12
         mrzCjnx+yJW1+bBj0iDf+DunstgsnsI5X56GcAmM/xEswskfeeBl40KeV+H0Lt99+/Qt
         km3Bb4OGmi9nd9souBxRg03/GN1/ighMfBOyyg4wyfQ5yxzrqhva3ON3IuBZi+7V8a2/
         3MlSxKRTRncGpGcio1PFBQVS/zkzTQ82GGo9ToXclU0MtGhjj9YIJO1rbufq3ZEyUXta
         wV82DELuZviJnHdsdwfzOhfjm0KLEkYAv6FsvHBKvh2gFoI2nPVKlpfrRphQ0fcihO9g
         hFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY9yJ7mbhX2od1LOfjHxqDGjRIhqNJZ3Yqx0ctuEoqW6msHrm0BQhtiz3hopbFyP0eT2IO/jXXULJKu3LlUyx7teBDSebi5S3xzAIBlg==
X-Gm-Message-State: AOJu0YwSNJCZn5SCcUXDiSE5nHBq2OZ+cMDMzLdBBTmUOQ2jVtuUjjoC
	Yt9bXgK/do0Vts6EJYo3Q/Tr3O9ySTT34OkW0ddMzUek1JteV8dl2hvH/RK5bzQ=
X-Google-Smtp-Source: AGHT+IHSmA22k8/6J8gpztZttq8B3EuHe5yI/0R1vw1tNMB4yAnqjGAza5P9adcpQYd0ijVbD6FkJQ==
X-Received: by 2002:a17:907:9715:b0:a55:b42d:e499 with SMTP id jg21-20020a170907971500b00a55b42de499mr1614968ejc.45.1713766016645;
        Sun, 21 Apr 2024 23:06:56 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id qu20-20020a170907111400b00a5242ec4573sm5294075ejb.29.2024.04.21.23.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:06:56 -0700 (PDT)
Message-ID: <33e23cbb-4e52-471c-929f-65316e668ae9@linaro.org>
Date: Mon, 22 Apr 2024 07:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: introduce support for displaying
 deprecation message
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-7-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240419141249.609534-7-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_230659_904079_9B737A1A 
X-CRM114-Status: UNSURE (   7.83  )
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



On 4/19/24 15:12, Michael Walle wrote:
> SPI-NOR will automatically detect the attached flash device most of the

SPI NOR. Looks good. Please follow up with a patch in the same patch set
to use deprecation_version, otherwise we introduce code that's not used
and we risk to get patches removing it.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
