Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21400C04A95
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJtZO9+msPlTCsuMzsU99iq7xNangys1+iTjXGuCjis=; b=VXxuae9gq2n82F
	VZwtug5T7Cd7n1JeFgInTiwTYDQ3HL51XT9Adwk+U37WCM6pEqcthkm36h1yBJ6wBoSnc31yByuVf
	WCxjUkRdMgzQi7b/2c1S3NSvHN1hxul13jBEBITKMuEdU9s5yi1b3AaGAMZaFjiZdkD8dyhlTQyL0
	Vp6PurTOI6i+LlkLdcTDYmCrrxGptooDBEerT9HKRzj3M02MvWiLycLHACBkIOZgEZY07UiQ6+gbw
	IH6qTEkaFUTAy9zFhCjv+/xTAhfuUEGQjhhS8fJLMu12O1EclKo0eg0iAKNYl1eJ+EiS7v89zBy7H
	6fdOibZZZu3ZhIyt41tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omGH7-00D3so-8x; Sat, 22 Oct 2022 15:19:01 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omGH3-00D3rM-J2
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2022 15:18:59 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13aeccf12fbso7059772fac.11
        for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2022 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gz0LxUsOUlJDcIAW5bPu+WDjpQGro2FyWxGKpu7r8bo=;
        b=gWrs34NeTJPV2fQ1MVoQY+zpFojHR3D/A6fVxaEOoPyaG1lz86TK/RINtSik3ihs6m
         epr6PhFlnoD33CCeTfWoNQCRee99kzlwRupaR937A3VU5HU4OTIvs/zluF82SMnywl6D
         HdEJ7m7PbwxapFaNOFa9ppWW4y91iGtKkwoLpnocgDPBTYKE8ItremNKc8YrHhceRIZp
         h3VMtehI1AqTwZwEWQcTgFOjDVRQQngjmAnbv2gz4Ef/Bbck+zcB6GCOTs8PKUKrqPeL
         49sPdfcCEYUyqTEphtRdJczJc984b2NmTshEFvs/XiFALWDOPilFuaMHYm7NR6Fhz+qX
         X9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz0LxUsOUlJDcIAW5bPu+WDjpQGro2FyWxGKpu7r8bo=;
        b=hGuJQLL1TsrFgeQMer7UpnQJL08kVqni7ZZqE/d9RvV9cJuca0ix3JWMaWhJx0sbtQ
         E8NSmzXn0fFlPYcyRoZdB1RXY30lC8BEB6QCfmzObFZh7CAX7aieGb3dS50LAjj6+9FO
         cw5CDtIgKQXNstnjRI96VHC6CmSc7pTWbZvpWEI+yRlq9wkS98RTAyi1ZPFM5b/DIdDy
         V/BjRdVI+jWZfX1qQQlGw/Agn8AiIoICUcGw8Vk1y/qm6Z66u8O4Q67SzsxHQ62LWb5O
         1q28/C08Xc/aamkS0kHD3Uhk6a62iwnaUWDDVCR0SFgFmUR7XB8MNHIrH+fhI3it6DuS
         ftWg==
X-Gm-Message-State: ACrzQf0zunpT5WJp9D9GmPpfhLNj5nrRtt4/8JkpCGr3OXcuElQjG2KI
	Lefr6YHFox0daPv3XPLY0ZlHsg==
X-Google-Smtp-Source: AMsMyM4Ums0et6AQMZox+xdB7Wz2plUu78klbaMd0EOzV1OnnwGbhhl8/BymyNDqbBFL+Y+cBT/t0g==
X-Received: by 2002:a05:6870:f288:b0:131:de71:3eb6 with SMTP id u8-20020a056870f28800b00131de713eb6mr31239483oap.63.1666451935002;
        Sat, 22 Oct 2022 08:18:55 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id v5-20020a056870310500b00136c20b1c59sm11538284oaa.43.2022.10.22.08.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 08:18:54 -0700 (PDT)
Message-ID: <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
Date: Sat, 22 Oct 2022 11:18:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
 Simtec Linux Team <linux@simtec.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pwm@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_081857_633525_43AC20A4 
X-CRM114-Status: GOOD (  14.17  )
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

On 21/10/2022 16:22, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was marked as deprecated a while ago,
> and for the s3c64xx platform, we marked all except one legacy
> board file as unused.
> 
> This series removes all of those, leaving only s3c64xx support
> for DT based boots as well as the cragg6410 board file.
> 
> About half of the s3c specific drivers were only used on
> the now removed machines, so these drivers can be retired
> as well. I can either merge the driver removal patches through
> the soc tree along with the board file patches, or subsystem
> maintainers can pick them up into their own trees, whichever
> they prefer.

Just to be sure - do you expect me to ack the series, or rather as usual
pick them up?


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
