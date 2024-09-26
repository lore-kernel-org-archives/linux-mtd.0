Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA19DCCFA13
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPfBNJZmMNowHi7dfXU2gm977BHX8c9A35o68ECjP28=; b=ZZ51KqGCNNvVld
	IpcB6s31oWtYaHk+4qdBhM5vwavZxSPki93tDmuSQE0xwt9Cqd2fMkk355SiadwJaSwcAEuK9fwuD
	l+zRAqzgPJcN6+b99dLM6/NXtml+M0Mp/NRAijoGodcXUhXkOVCmxYF46q9z8n6DoqHRanjKcOQQ2
	RNb8l57jvqpdp3ncBLjFOp4m11TL/hfl0FLPU8lvrKU7Yuu3x86XhyfHZkShP3Qd7i0XPtj2UPdxS
	C40hxbfjpwHwzN4UyShDi0ZluJYR9yG2JJUIAx0w1d7pb6WKdh0p9cS/clkTJ4BiX1a9YhFnt2LSD
	Bz28F31Nk9SFB+N8x2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stm71-000000088X6-05fz;
	Thu, 26 Sep 2024 10:52:43 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stm25-000000087Uz-3qV0
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 10:47:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5389917ef34so747744e87.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 03:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727347656; x=1727952456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pi8pEfIaEynAv552dYQhGkc5l0hAhf3yAx8dODUgo8=;
        b=S4M+eW2qAJrpkFP2AJHBMWnEK5T6VXFJycAuo14S+p2bA/0RupWAz1Ib6Hj69awgPL
         sMeOUrZ8NdhU/6shUEzrZWtamSlDQxPHDO1P9ysCwV2TYrLcdM6jf3k2idYjrQpMUXE0
         8jzMz+aMY5mfPg7GdTB4+VpShog2K3yZX20mn9ZQjx6gBrUiZOxONt9iR484yREFXKwT
         HOGeAtkvwoIcVPWvUY4PRmsh6ykmx7LIkwGnp+8j/+Cc3M75RZ4dZa0/Vx7Vko+y8BG/
         MDm/jIBwSorAax9uvdx+qY8uYqsy9UjkWhiBjUglBofZcByP5MBBQKtcjecYSjNE1xRz
         Lbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347656; x=1727952456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pi8pEfIaEynAv552dYQhGkc5l0hAhf3yAx8dODUgo8=;
        b=CucC8745ILVvW0JCGhTI6jsVQnF1YB76fZKbCd6j4kcoJaT9fxb5RSPKCs7J4/opms
         9L0a7HsJRGkj20ZoZLkGd5I+13MeZzFHWpFFK1nITI8QC4gVgv0/0KyptOAxGuB8Isnl
         Ru9oIovCYPxN8Q+kRfjepY3y9P31/a+5CHjt3TevLno6Y48SDjpX2PVZOaiqphWP8WaK
         TVJe1TxQbiMQAEGa5D8CYZiyTjFw+0ghrZlVZ290a+4UZaWqbmZGS8U8cADT7wOvJEyT
         ZP20rfbOtP8DtfoApPzXbj0Pzcq2cm4Df9gYmrfXakuIAg7PmBzv5sYbMQh8T3+2n0U9
         jjcg==
X-Forwarded-Encrypted: i=1; AJvYcCUqWDraUZwnPw1cT+0p3v9e5XKVR8dNh6qGFtN57Vpz+djcs18s4SuaAmy2Fp9LbFeS4gzAvePBQ/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNZBzpAa/06n+ISgrJqWJOuxjhnMZ0BUuu3GfP+h9YkAwlX6U3
	tVEml0HDDOIXU7cmtXUEVvJfhYPbpXoL1Qw0TQT7kzXXpeWP5acRb+yOMBDvxag=
X-Google-Smtp-Source: AGHT+IEK/a97LCRTky6jikRpzB8dR3FiDVcnDCgWZC0RyedO6kP9Y3WatCkhxuOrHdfc0H5cUYCzog==
X-Received: by 2002:a05:6512:2355:b0:52c:c9ce:be8d with SMTP id 2adb3069b0e04-53877568ffemr3924628e87.57.1727347655839;
        Thu, 26 Sep 2024 03:47:35 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c80d239c38sm1320639a12.72.2024.09.26.03.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:47:35 -0700 (PDT)
Message-ID: <2196b4e8-2c93-4a73-a717-28448d4668ab@linaro.org>
Date: Thu, 26 Sep 2024 11:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mtd: spi-nor: macronix: workaround for device id
 re-use
To: Esben Haabendal <esben@geanix.com>, Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
 <D2NGXHZ2VTK0.M0AOB4CM7MHM@kernel.org> <87tte2hmq0.fsf@geanix.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87tte2hmq0.fsf@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_034738_027552_E137AD3A 
X-CRM114-Status: GOOD (  21.53  )
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

Hi, Esben,

Thank you for the perseverance :D

On 9/26/24 8:56 AM, Esben Haabendal wrote:
> "Michael Walle" <mwalle@kernel.org> writes:
> 
>> Hi,
>>
>> On Thu Jul 11, 2024 at 3:00 PM CEST, Esben Haabendal wrote:
>>> As a consequence, the SPI_NOR_SKIP_SFDP flag is no more, and all
>>> drivers that have been doing optional SFDP is now marked explicitly to
>>> do that using the SPI_NOR_TRY_SFDP.
>>
>> First, I haven't looked at your patchset at the moment. But I'd like
>> to take the opportunity to discuss the following (and excuse me that
>> I didn't had this idea before all your work on this).
>>
>> First, I'd like to see it the other way around, that is, doing SFDP
>> by default and let the driver opt-out instead of opt-in. This will
>> also align with the current "SFDP only driver", i.e. if a flash is
>> not known we try SFDP anyway. Going forward, I'd say this is also
>> the sane behavior and we don't have to add any flags if someone want
>> to add support for an (older) flash with the same ID but without
>> SFDP. With the current approach, we'd have to add the TRY_SFDP flag.
>>
>> Now we might play it safe and add that SPI_NOR_SKIP_SFDP to any
>> flash which doesn't do the SFDP parsing (because it has size != 0
>> and not any of the magic flags set) - or we might just go ahead and
>> do the probing first for *any* flashes. Yes we might issue an
>> unsupported opcode, but we already do that with the generic SFDP
>> flash driver. So no big deal maybe (?). Vendors where we know for a
>> fact that they don't have any SFDP (Everspin I'm looking at you),
>> would of course set the SKIP_SFDP flag.

Issuing RDSFDP for flashes that don't support it shouldn't be too bad
indeed, it's not recommended, but it shall be fine. What I'm worried
about is flashes with wrong SFDP data (see all the SFDP fixup hooks that
we have). So my suggestion is to play it safe unless one of you guys
step up and commit that will fix or help fix each bug that results from
this.

I'd like you to also consider the SFDP versions and how many parameters
they are exposing. I can't tell exactly, but if I remember correctly,
rev A had 9 dwords for BFPT, revB 16, and revC and other more. If we
consider static init folowed by SFDP with rollback option, point 3/ in
your cover letter, are we sure that all the parameters that are
initialized before parsing SFDP are overwritten at SFDP parsing time? If
yes, we shall be fine.

Esben, to speed up the things on both ends, I recommend you for v4 to
draft just a core patch if you care, then you can handle the vendor
drivers. Or send us some pseudocode and we can talk on that.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
