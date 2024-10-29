Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C3D2AB00
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPoItOvgnCNisxQglaoQyzYGi5Cv7PzeipVmiy4k7Is=; b=jHiM3XQltZlkIX
	Bklecw8q7B6KUQ/7oqTJkQDrcbLbpFXUq0ne54VxGDE1RKnVaU0+TxvLd5UXNkUKj2ALbEGrUrR8O
	gAwPb5fLZDVTcmqy/iy+keQhteqjQ0zQt2PE+0ww9zYNkONaxRjfcEbSrgpvcXG12+OBpMLj6XF8g
	Lm9vyY97JlMFAMDp6TmmDf3Wsr6mqHS27ScKm4DUZxlQUd/KbAG+S+Y3A5nXjBA5GNE2qu3/o/BPd
	VEL+LooRf3iY8AGXZQyO49UXJwas2vIRbLus6NvrAd5Jkr40gdMJGpGEIMlGWyep67A6ZXOeHizeR
	l2+goJ56rPFlFZz2wTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iI8-0000000DqOm-0ZtT;
	Tue, 29 Oct 2024 09:13:32 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iCH-0000000Dp5V-04Xv
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 09:07:30 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb51f39394so51176151fa.2
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730192847; x=1730797647; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYqK7MgB2hUqbn+JD+0wFx3U0hO8t0zf70oPmP44e9A=;
        b=ZA+sr6aQpFbsrKTaXE3jy8gXOQKcaD5yNRSbFVBg6mVd4iV9Zz8WUWv8QUpH1v4bVY
         G7yNVtI1PTIlG1tkmEJcIMhv9wRw8C+yrOZT3gHMTY/Pen2IORJvslOOOOpPXnz7TSeO
         VriCVa1RQDK+CTKulqcGlbvcTyNFcm2z17xm7zFMVC1dB+pkPF2hE4M026zyK0JS+uNL
         GQwenOY7+T+Wm/Y2vyXGG4I1yqHn7B8pASFU8T+p51llUxtR6Zd06R1pDC36x1+0hyua
         nLa0BaOcvWZzn9SXhP75COdBCl+C0XQSg9RW3e1qgtHaHLncmD/Eoce9Z+Oe8RruUOx5
         qmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730192847; x=1730797647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYqK7MgB2hUqbn+JD+0wFx3U0hO8t0zf70oPmP44e9A=;
        b=qN7d30wjfGcVn6l9Dx66Jh5I8C2kMTWKHsI2E4fi7CwActGHngxtI27XQY4MUZUuzU
         CKl+eTFBxGWEk9pVrjAodg0so7Kv2QTD6bLCWkcMLXJ103+AT7CYm5TvX+lpMH7HUYHw
         b+XnrjuiDW7Pe42X7Sf6w9d9OaKwSoDzKjLKKf+EJ3EQy1x6VafNasKe2kFc+dxps/tm
         v0lDB78H+HzSIwJ/8OFXYRziPYnX1NYA2pb0jJFwvaJra58LYfmXjsFsaSP1Fz3/+OFF
         jj9aNkgW2SoJJZyFn/dDuew7U+fifwNC17GYzJQM4dDllGVjM5xONhHhWL2q9HFPf7ux
         Mchw==
X-Forwarded-Encrypted: i=1; AJvYcCWPqjP4vmaXFCFB83QRxQdyzFsy1yObPzlQxl0OpDaJyqWOOC88sjXcHXRnaj9UEPwLCH4jhuFZm0Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr5zzT86+F2k5N3RIVrl7OOkRbvMNv01sCCFPKdLyHERvKmaxr
	s4sCKjnk4BQg+r3t2X9/jfVrhclF4mGMWPLU9spsDZEHGeAKG+YmBb/rMIrlqnA=
X-Google-Smtp-Source: AGHT+IE3Kfc2QKyRXQkLanAfLGW+GKoM5FPYKz3wvRO3LVxeSyxR3cNX5M1xX8bds53NULsdqU26Hg==
X-Received: by 2002:a2e:bc26:0:b0:2fb:50ce:ce94 with SMTP id 38308e7fff4ca-2fcbde05177mr50053981fa.0.1730192846924;
        Tue, 29 Oct 2024 02:07:26 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f74f9sm139897995e9.31.2024.10.29.02.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 02:07:26 -0700 (PDT)
Message-ID: <ddad0aa3-df80-45e4-882b-6134c87c544e@linaro.org>
Date: Tue, 29 Oct 2024 09:07:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Use nor->addr_nbytes in octal DTR
 mode in RD_ANY_REG_OP
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20241016000837.17951-1-Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241016000837.17951-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_020729_626474_99D5409F 
X-CRM114-Status: UNSURE (   6.98  )
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



On 10/16/24 1:08 AM, tkuw584924@gmail.com wrote:
> In octal DTR mode, RD_ANY_REG_OP needs to use 4-byte address regardless
> of flash's internal address mode. Use nor->addr_nbytes which is set to 4
> during setup.

Applied, thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
