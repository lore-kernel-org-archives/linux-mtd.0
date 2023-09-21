Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB52EE7107E
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpVwwCKUmp6MQygcdehgd+ecKsJzmIZXR94iACF6kMg=; b=bhleQkNL4Rc/2s
	3TUkyDqwjjH2SQBoO1Dc+DwbExlpHsOd1L55OxTcjvHWd8JeDIbLM0ICuwIqjG96sKUZMIWzTQV/E
	isZvpbAv0hIEBnrKiflfQQ0b1jQhu+1B1sTQLASaDV1jan3mtIQxlMoVMKWVcp67DTZPBwKZjxs39
	26s29KOH308xzZGDff2LCJ//uaHErwdeqJDQtmD0x4jynyCbE/wH/d+QaYLbCbxna+krb7IMwReDB
	OKlp5Dd3MVUE1R2mexRJOSFXmq6nyrRnXqXirHUwUCK5fslxHgw07u3f1P7OL0mBA4ubrV8i98sAi
	kWdCu0LH2QQgnURXH1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKwJ-006JuX-2z;
	Thu, 21 Sep 2023 14:45:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKwH-006Jth-02
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 14:45:58 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-502b1bbe5c3so1780199e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695307553; x=1695912353; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WE8LH19pPsCxh8naHG8n/k7q/gLXUPSjuv+tzgJMdcg=;
        b=KL2r5wJ0FInK1C7OqFNV5g4LUlDpgsXGrrX8AnMAwijeslP6sYntMSygtRbLIotv/Q
         PjThbsyKa9dS166TfOfe+KjxDen+lptXRpADgjwUDbgfV9x8m3J7Ql/VuRoOjv5pX1rq
         1GwkK4A2ZguVDgwlZ62M4ARt1AdLzX2lNirCJzrxVp7YDboSBbCuDZH7s6NJQdzeqeMr
         U4JCb4RaKHDEfYFOe31DbLfq4MCLUOledoFfszv50yEdpBP8xLBSaR57gp7o4UuStnlJ
         QHKPC+unyZQ1S2W45s759P2JJFh+04omXs5eS5Gw1DN/MURnP3yngPHUis8YcaRV2PIn
         ZMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307553; x=1695912353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE8LH19pPsCxh8naHG8n/k7q/gLXUPSjuv+tzgJMdcg=;
        b=wquCAGe2kGCTqNIaPkYeAIJhMlaWgSMBiP0Dk7Gm821F/a07MzVWQi4jFckCjLCI6O
         Tpu9Zka1D5VC5OWYtjLbIH8ERg4QAfIaYE/GDbWxJVHhL+DiK+64dQYnoFTv35IjAfmU
         CL2CkwbEEFWQwg9Caxh6DRA8zhoSZxenaTD2VfSDoNZVwE5AtnRFVLEz9YW1ly8MJn5W
         FCIsYocBlYN4BhK4ADOnF6YR3MCEWOweodGXrf6LFoaDmB2zE1nF7ALdL2kfecMV7V22
         VYLYCfnX239KBJjrW8LNKiM8lzntLtP3ITfAW1HYd4aoPPN6I0lUnLnIf0oSiVqOz4fO
         Csow==
X-Gm-Message-State: AOJu0Yx+DlgCh74YTm255eWdghDzNS+UIchxCvWdLEijyPkwUsgUHyXV
	NXu2sJDmZmPosRmfxY6YFYz2DQ==
X-Google-Smtp-Source: AGHT+IF+ICUJJWSZmNyofI+iEUUXe8X6vnYcAKgG6IrHyBC4yFSz0Cb6KzUEVL7HuLUkgj98UgC9fw==
X-Received: by 2002:a05:6512:281b:b0:503:256a:80cc with SMTP id cf27-20020a056512281b00b00503256a80ccmr6519101lfb.42.1695307553102;
        Thu, 21 Sep 2023 07:45:53 -0700 (PDT)
Received: from [172.20.34.61] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id g4-20020aa7c584000000b0052e2472f884sm930316edq.21.2023.09.21.07.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 07:45:52 -0700 (PDT)
Message-ID: <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
Date: Thu, 21 Sep 2023 15:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
 <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org>
 <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_074557_109412_FBD1A5C2 
X-CRM114-Status: GOOD (  20.18  )
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

Hi, Geert,

Sorry for the delay, I just noticed this while cleaning the patchwork log.

On 12/6/22 08:32, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Mon, Dec 5, 2022 at 5:33 PM Rob Herring <robh@kernel.org> wrote:
>> On Fri, Dec 02, 2022 at 02:56:01PM +0100, Geert Uytterhoeven wrote:
>>> On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
>>>> Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
>>>>> Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
>>>>> FLASHes.
>>>>>
>>>>> Merge the new entries with the existing entry for MT25QU02G.
>>>>>
>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> ---
>>>>> mt25qu512a is already in active use, causing "make dtbs_check" errors.
>>>>> mt25qu256a is supported by the Linux spi-nor driver, but there are no
>>>>> upstream users yet.
>>>>
>>>> Is it encouraged to use the specific compatible with SPI-NOR flashes?
>>>> As far as I know it isn't. The spi-nor subsys tries hard to identify
>>>> any flashes at runtime and any additional information in the device tree
>>>> is used as a last resort (just for flashes which doesn't support the
>>>> read jedec id command yet). And usually boards have different sources
>>>> for flash chips, so hardcoding a particular part in the device tree
>>>> doesn't make sense.
>>>
>>> Thanks, I am aware there have been pushbacks when trying to
>>> document more compatible values.
>>>
>>> IMHO either all or none of them should be documented.
>>> If device-specific compatible values are discouraged, the bindings
>>> should be updated to reflect that, and document a single compatible
>>> value ("jedec,spi-nor") only.
>>
>> That's already allowed, so there's your answer.
> 
> It's indeed allowed, but the alternative is documented, too (for some
> values).
> 
>> The caveat is don't be adding them later to your DT when you find an
>> issue and new quirk properties will probably be rejected.
> 
> Adding them later to your DT when you find an issue makes no sense,
> as that breaks compatibility with older DTBs.
> 

We won't break compatibility with older DTBs if we use a list of
compatibles. First the vendor specific one which will use some quirks,
and if that's not available, have as second the generic jedec,spi-nor to
fallback to.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
