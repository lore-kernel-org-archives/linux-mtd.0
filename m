Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F93ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8Zrf89+9FOZrLw1sw2FfgbW/fcgHMvffH1sc2+OVHI=; b=gvrKr78vny7Qiu
	QF0Bn4KDyD0kqeMYflrM6iahLnLkIOnCWiTLxhtx0QiArG9y3BhnqmtAJyK4samRod67qFoACwEKz
	eDbnNU0dhfPnVWfEI38QvGQLlanzGvE770gUm7xBK7FQ0/JqFcHuWRvvovKzwVRCcXawVN7WrwIQF
	sLu9p8FegkhcpZc0J3iRqnVnjdbt02Q06+dpvYHcTFXs0x+FUtaRAEoALNmiG0IygoylT1ybayEKn
	QxcRNdiOIOR9Afz4DrZh3BWG0p4lImfbJthbMXRZ2luXqVmlcTWTQUui2RbVavjMMIxfc75jyM4MG
	9kBBIXMPflJioKKrMZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwXB-001Nvn-IY; Mon, 24 Oct 2022 12:26:25 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwWw-001Nmb-Pr
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2022 12:26:12 +0000
Received: by mail-qv1-xf36.google.com with SMTP id ml12so5349044qvb.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2022 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jh8UQ4JmTZN9hL0/8CXAkNYRnuwMy/n4/v6mITjc4KY=;
        b=y0W+zUyiBftSd0JgAGoPOqPtmV13guRpqzbMHskUNvLCEuQ6pihIc7oGP6TuC3oQt5
         NjC6zT2GBgFpwt3TaO3sCktoTg2zHU1fTtWzfcwSmh6ykgmIp95Eot8a0sqsecpFyW7x
         1HT6dR9s6lU9w8AQMYPhYLXd1Gu3x1edoP1WhBwFF/jIaERMSCG6bAABteTZbOS+Taz8
         m7SCCh9de8RQXNTOTCxekuN5wUYGpUE+af/pdLsiLsH9H7ozUi1IJplIrGjD7sC4Tf7t
         s+A+OHtLvPIWSHgE+4xzSs5FzW53+pzJ7Liv/i1SA0R2VvOs5lkPyZK2zhrwcwhQeqwz
         cUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh8UQ4JmTZN9hL0/8CXAkNYRnuwMy/n4/v6mITjc4KY=;
        b=hGzRV5eCMX7tZtMwac3+TX6FbQ6iz6L/BcNMlYY1NMsgL5srrGOF7DgTMGJ5a/rie2
         4WNYVM7zp4gTC7M3QM9MpP8qzG5aayjLxGCgoNKm8bCYnA2yvjCMO2YCdmh37JJZijlB
         19i5iHM79PwaDlp77XOUzYm4t78E6r6FP0wdlljZTzn8n2MuBcJDrGSHiLU+vEfLkV9b
         s6rS7ZWovX9Na9kjfj+aaKB6QQF0U4XnK7oHCuXzELSHvvl+XLIeYcqp9oz8sFKPdPk4
         2DoDHwzTy4RVrPRCepsYi/J+ZWbLv1vtBX3SAPtOkX41ILLDLgorpzYt6s+vi5JNxqeX
         3P8Q==
X-Gm-Message-State: ACrzQf2K4kFVfakdM70dG1P7mFvFMQiYs3baVuTwE/eSJARJLxVhiGBT
	0qgr3sR3lIW58fikuVvBf4jPHQ==
X-Google-Smtp-Source: AMsMyM64HS96JA+t5NegWTBhGoXrPmUTvN8S9j1oIuC6j5JnhVzd28Edhbio8VxlddWIvdR7T0/thQ==
X-Received: by 2002:a0c:8ccc:0:b0:4b2:382e:ddaa with SMTP id q12-20020a0c8ccc000000b004b2382eddaamr27200510qvb.33.1666614368794;
        Mon, 24 Oct 2022 05:26:08 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id u30-20020a37ab1e000000b006ef0350db8asm9109052qke.128.2022.10.24.05.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:26:08 -0700 (PDT)
Message-ID: <a354c24d-0355-7c9d-ad05-4c21561af4dc@linaro.org>
Date: Mon, 24 Oct 2022 08:26:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
 Simtec Linux Team <linux@simtec.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-2-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_052610_925454_18BE5E97 
X-CRM114-Status: GOOD (  13.06  )
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

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
