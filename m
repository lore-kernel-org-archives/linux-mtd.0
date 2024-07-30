Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3C6C3DA49
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2024 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1F+sgfZ7/X9OAW9V6v2QUZwRSLBk9APkF38AupauIrY=; b=tQJlupAkBgwGl1
	XE5OKhG5Mnc7NL10W7NCDBL0XqWaGkAeBUhsBvzPHNzp3RCfyuWCklm2kuH0hWLhjMh9Q7e1+mLI/
	LZnEY66pln2wjVT5xt/jCOW/tm1cY6C6sjwDMm3k45+kPC4cTDlAsoJ98CSnr8attu81f75kVoGyA
	4YGHEpymsOhoH+SUmoDEwW9K8B4DSPRu8DZcGOvBsCAjeJFiGOgb24HEL3mp/IjUBQ/IPF2DcDIXk
	sv3KfoSMErwVjEtijmvysT2A9Fpdlf1ab7fDiEF/L1Zq739hQylYhRm2Tk9QkthXRYUdO+PjLLo67
	YeC3edFi1D470ySUwoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYl6K-0000000EupH-0hbm;
	Tue, 30 Jul 2024 11:33:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYl6H-0000000Euoc-0GN5
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jul 2024 11:33:06 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so488123966b.3
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2024 04:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722339183; x=1722943983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGrqCdIbJB4kLBzVc6vEIIcN2LnpLgEe9LoSmjtXu+0=;
        b=Nq3P404n0zdLx1T4M2ULMO7N9AVjjp/Pr8VV8pBo/57bW6QL5Xpbk2Aj1YSDIVCL+p
         LVoQO+ZpOr+ouwp7AxHu/A4o7efSgOHgfIvHwqjyNEN4rL2FQzLqEG/C1lc5FXxv+ZwY
         jZqJ+1cag7Xf9yPNOxBF0OkZBh50urjXq/UW2/cZMzjkCfYwBbKaUTezr2dyyRqCaMGy
         008rj6bGcyTPj64lWNUXBLdZPEr07mkrAVD+U3drjol44sCWloym8T3CuHR612FoREu4
         X68rCoTZSzKyOnW1c0e1oWJAYEn8XGTsfVuJMv4N6p00u0AINVX/eALT5uFpwxEx1HIk
         K+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722339183; x=1722943983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGrqCdIbJB4kLBzVc6vEIIcN2LnpLgEe9LoSmjtXu+0=;
        b=PUITMB4cSWvNKWTiUjToZbwZh23FaSM4UC3ek6W0PyBamXEKfAihlU+diwIxvBp9FB
         PcITWxKpcGuvQmE91RcqtQon1GBrJoHCjW+HeBRuEUFpWvRImRav+68jgRZ3DPtP6SAG
         qRp6A3wxLcY33hf3/TiTyDuT+hHnvt/m1XoJD+OvA2vQWBx6mM2sn4la0Xu2FbptFcC/
         E8Nm3w2bxVk7VzbQvFqAYXZZ3UPoeDWNUbVVIqICH0uK33pIfAjIffEtdtZhZ/sDLWrQ
         WFP7/ooMVD/U8so7FW3GnopcsMDCkTIPc3AskYU8kyV8mICqKTsGLXPynBnqEfzOfBCP
         F6aw==
X-Forwarded-Encrypted: i=1; AJvYcCW1hKNrQ8AoD2lTthlBYnv4zJq5ulLPevVwnWaAEdyd9yZVHek1nvurQ1JjfGHC4cUOddHBtOgHY4Uog0VvSA2WTBc9BSILouBOIeCMLQ==
X-Gm-Message-State: AOJu0YycP24qV1TjVzda/w1qLTU2qUhAQ4yfJeffdpw3LGtJIi+KZqa7
	Hx3Ou+srXYZMNCzlghLoy/BkBIo9tMNZJTawvgBBnB38NgWdhzqJDY93cWMweDo=
X-Google-Smtp-Source: AGHT+IFMbs1ZTtf8Vsd7RnM1UPZIBl9v3hNGf7hvVfcYCgMKV5fTKWqhNUt5peDUHpXqJAPKMYSdCA==
X-Received: by 2002:a17:906:c145:b0:a77:c364:c4eb with SMTP id a640c23a62f3a-a7d4004f339mr721159866b.20.1722339182686;
        Tue, 30 Jul 2024 04:33:02 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab2311asm643341366b.18.2024.07.30.04.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 04:33:02 -0700 (PDT)
Message-ID: <454deacb-88cc-4ab0-80b4-006d863a56d2@linaro.org>
Date: Tue, 30 Jul 2024 12:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
To: Michael Walle <mwalle@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20240726185825.142733-1-computersforpeace@gmail.com>
 <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_043305_306828_065CF3DF 
X-CRM114-Status: GOOD (  17.70  )
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

Hi, Brian,

On 7/30/24 7:51 AM, Michael Walle wrote:
> Hi,
> 
> On Fri Jul 26, 2024 at 8:58 PM CEST, Brian Norris wrote:
>> These flash chips are used on Google / TP-Link / ASUS OnHub devices, and
>> OnHub devices are write-protected by default (same as any other
>> ChromeOS/Chromebook system). I've referred to datasheets, and tested on
>> OnHub devices.
> 
> Out of curiosity, there is also a hardware write protect switch
> somehow, right? At least that's my understanding how verify boot
> works.
> 
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> This looks good:
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> 
> But could you have a look whether this flash supports SFDP.
> According to the datasheet it looks like it does. In that case,
> could you please dump it according to:
> https://docs.kernel.org/driver-api/mtd/spi-nor.html

This would help getting rid of the no_sfdp_flags and size from the flash
definition. Another reason is that the SFDP dump can help us
differentiate between flavors of the same flash, if it'll ever be the
case, and help us keep backward compatibility.

Also, if you care, would be good to extend the SPI NOR documentation on
how one shall test the Block Protection.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
