Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F74C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 05:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Biz5oegoYYMzaK00zzOwUOZrT+jJ1b618A480ViwZ9U=; b=B4uCU3xU1cBO8l
	ydp5hzzTUU8/LgORdHqlNV6EUPoyG0dGELz2644HDsHiwKWTUm1Ew4g7G5u2/VyvUupbrD7Hphd8h
	JkM24ePUgOncP0fba4ISmgbnGrVVxQSZjWJG61t9arblQKwaZGfeWGlMJSpnwH7lWOw1TzK+OokxE
	E5kGs8wBvB5PpyKhooU7vjwCyD4Y2eESyRmUUe7zD0CsI5vWmAowA6tNaVGb6DwwMxkqmLQx+ZoSn
	HohjKpinHpYNEOvvWQP6HanCAjM3eorWOHUIz/izZlg/FpiDzunU6Cxy9LJtuGr0Gfo+K4N1QlSMp
	fHhE89bAwLqyNsgn0HhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9nk-00000001lfa-1IXx;
	Mon, 01 Jul 2024 05:42:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9ng-00000001ldq-3XHy
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 05:42:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-362bc731810so2129938f8f.1
        for <linux-mtd@lists.infradead.org>; Sun, 30 Jun 2024 22:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719812523; x=1720417323; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K1RP7Fpk8x/fLqAOvJCm2fvlERvfv14/xhETHMn8PzY=;
        b=f4dl9IChLNfruYRY5PLHl8b91fPT/YUmSsSTtdJM4mA0Kc2aVQIu+PSSj0uP1Vi4zX
         VLf3RI8zN63Sl+NYIPt1ccAziGe+26jkN8XmO2XJgXj5MvH7IIaBMvsVQ7i8g5MCqq3I
         gr5Va5n/W7XK9R2Q2sHVLL/CaU2mNOzZ5rFaESoweD00ffIcXcUNGjpokF5hqtnmUaif
         iexvZbCJ8B/Jzj9Ve9Qoyn+kiOsQUk/SHu9K92k8tLjlYuolxYlf4/adSqPbs31V3iG4
         6yxPCeFQRdLt0D3w23v+9ubh1jpB3fhO/+mh9/O2SAR3+mjryZj2YYCUkKfOhLTTS3BP
         b6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719812523; x=1720417323;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1RP7Fpk8x/fLqAOvJCm2fvlERvfv14/xhETHMn8PzY=;
        b=RDSbx2VJoqGUkWONty1hE5sWTQ3Hw+4dN3CGQGd/UZeHQ0ti6DHFcrPd6vwhZuoUph
         vhGgVSgDudSXYWAMd6mGR+SmXvQZmVB8mFOyJ7l2J+3FhMsJIzhZKN4vmTX1uoCRIvg+
         /f89UwMdlr0GWjSyXBVvPbHvzrFT22V0BInj7SzZP5VFvh470+Zz10+jtTSLIKDtVKex
         0GIvobjWhMBnFdec0zOmADqn+WcDAnri6AwIbX1ONWI+BRPm34rzZSR9gRLGonEVvIh2
         RJ+P2cjrwIqjvMhnj86K2g/725M8YeyGgkAC2w66Y6wY4H401gQF/XiFLiVEhNRIwmod
         CJ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRXAO3a7w/hhAq/CQikprlECEl54S9jsm5i1SkbNl+CPOg2MR7lfCzVfOVInwcJ9ktSunVweIWRWU8TfHI+Mdzj6WyzWw9xWWtrrbi6g==
X-Gm-Message-State: AOJu0YzmYELrHE0vfx41dlNqOMBUKkNHBXLZZ8CJBUdfD6CnHeAfi/qf
	dBpiL/FVTcDXUeUdw3DbJ2bkBBz3Z5aIH6KJvD9LzrM8jBC7JWVPf1ipRdszcBI=
X-Google-Smtp-Source: AGHT+IHSKBmHrhw/AYhWM82y6sx7nEDDCK+Cj+oGMZFjhX97MXohzQV+8dJGlqZohNNB2+Ja+HNgaA==
X-Received: by 2002:a5d:47c6:0:b0:367:2d2f:e634 with SMTP id ffacd0b85a97d-367757249a4mr5411546f8f.55.1719812522948;
        Sun, 30 Jun 2024 22:42:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd687sm9063218f8f.14.2024.06.30.22.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jun 2024 22:42:02 -0700 (PDT)
Message-ID: <9f1fa742-28c1-428a-9f85-2d3b352abb44@linaro.org>
Date: Mon, 1 Jul 2024 07:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: intel,lgm: drop inactive maintainers from
 intel
To: Rob Herring <robh@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rahul Tanwar <rtanwar@maxlinear.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
 <20240628215350.GA267712-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240628215350.GA267712-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_224204_923344_CD77766A 
X-CRM114-Status: GOOD (  13.83  )
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

On 28/06/2024 23:53, Rob Herring wrote:
> On Wed, Jun 26, 2024 at 12:18:09PM +0200, Krzysztof Kozlowski wrote:
>> Emails to chuanhua.lei@intel.com, mallikarjunax.reddy@intel.com,
>> yixin.zhu@intel.com and vadivel.muruganx.ramuthevar@linux.intel.com
>> bounce with the same message:
>>
>>   Your message wasn't delivered to Yixin.zhu@intel.com because the
>>   address couldn't be found or is unable to receive email.
>>
>> The Intel LGM SoC was apparently part of Home Gateway division which was
>> acquired by Maxlinear, so switch maintenance of affected bindings to the
>> only known non-bouncing Maxlinear address: Rahul Tanwar.
>>
>> I do not know if Rahul Tanwar or Maxlinear want to maintain the
>> bindings, so regardless of this change we should consider bindings
>> abandoned and probably drop soon.
> 
> No bounces on this? According to this[1], Rahul is not with Maxlinear 
> any more. Maybe an address in that thread will work. But seems like it 
> is abandoned.

I did not get any bounces, maybe there is some sort of redirection
within Maxlinear. I can change the maintainer to Chuanhua Lei.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
