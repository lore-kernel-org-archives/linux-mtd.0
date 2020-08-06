Return-Path: <SRS0=9pp2=BQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13E9C433DF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2020 12:18:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C969922DBF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2020 12:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tUJ8HiP8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3qdAKaR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C969922DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J5kSLL55msG83aUfsahAA70IOHFWQ4zkDCfMNJOI4iU=; b=tUJ8HiP8Ay9gdxD5cHFK6U4yd
	yUl1h7HcAQ8WhThuxDmEq6SaqD1APEKrFkA7uHSfr2eE3asZZZTou2vaQEBQFF1vu1FfrupCetEPN
	pTE+J209s1TjIvvBuPrQg55Ik8Z8C3Ha125Qq5YqPgWSO+aEHPLmKRazh+kWBgN4/xkRpNaUt2tE4
	P8Yu5M2u/0PCosr8WEYHZnIYxY91qxV21xvMKYeVB7ZCitRIqNJTrBZr5/nAuuWTYcjLXEozkxaFU
	MTWWJW8+4WqKE+czNxSBr3/ADw6dEAT96YgIKwfIXGDKDbMj08xFsHkagBnKnFW3GGwoxoTdstDYx
	vyfR1HVRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3ZHw-0005Nb-8d; Thu, 06 Aug 2020 06:22:04 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3ZHu-0005Mp-8F
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2020 06:22:02 +0000
Received: by mail-pg1-x541.google.com with SMTP id o13so26161541pgf.0
 for <linux-mtd@lists.infradead.org>; Wed, 05 Aug 2020 23:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dmbjWSKAb1103blQzrr1mGSc5SEQke43B0rmr6q28nI=;
 b=D3qdAKaR1lI4w5GETN7qqQiaEzhvXFeKg8gRKt5mWJIHhCC2EjaAnNPlDf48tpkJm1
 PAAw80zYRCQP5wgpPSUdcDxZPn6zh81Z+ieE5Uxap9ZolHVROazP5Y1w3SKXe1ddXLxF
 EcfblTWuiwaPBcpHD8J9bBpohVU/OPOYyGa01ILFSKCoqkyB4y3dso6Kj1n1n2fAGrO8
 KQemLH3usv3GH+eYI28+UHwfPP8iWr1Tav0NJ9jszTyetrjzOiUiYh0b3njs4j8UTEdR
 V1P4pTEjBTrwja1GxW/IgbIi/8yrGL1qJnNT3JuFOvEe5FtnyI0inn7QrIrZiehPCByI
 In5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dmbjWSKAb1103blQzrr1mGSc5SEQke43B0rmr6q28nI=;
 b=NLA5/HwL3Br1wSKevITLnvlvw8EwDI1igqRUmxHxbUsJlGwK6EJlsbeQLwki/CbOsb
 jrxkveewqICK93gdj1Awwd/48BRIBENN0qIrz6ILA8R3IdxHiK91KBhj3Q8UQq7UAl2s
 ovvIzHuUsfzdGNMk9gUCaVvbPRy9OucNrfvNGfG/+vHcXwL2ESR9jDmtF+prgYTWxZ8u
 UZMQaD6QgSThkGKaNdQZGbglpsqN9dgiZrdb/xIRBLMFiNpdKR6cU7E6exugF08Nwxv8
 zufPlE/z07XJevsM5lwmTpKe05grAsEixhM91GTcNq00ESbVY6iV96gZ9PSydddwgMNj
 nxJw==
X-Gm-Message-State: AOAM530zW8uhk9oHdxnGVY1TVFbZSuFRPgN8u/EPfSgHQlUGkEn3ons6
 IJVjttzR0us7+Rv3XpVFvYA=
X-Google-Smtp-Source: ABdhPJw14p4ZiIR6RNaAPVas9x4Ef9wMvVBOCSOa1Ffj4cw0RyItN1zEbFgLycIxNGb7KGMd9B4SHQ==
X-Received: by 2002:a63:531e:: with SMTP id h30mr5785413pgb.165.1596694913345; 
 Wed, 05 Aug 2020 23:21:53 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id p1sm5526835pjp.10.2020.08.05.23.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 23:21:52 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for s25hl-t/s25hs-t
To: Pratyush Yadav <p.yadav@ti.com>
References: <20200804084837.1014-1-Takahiro.Kuwano@cypress.com>
 <20200804184452.7adjlf6xwxij2emk@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <2392cae8-1ca3-97b9-62de-93de2ffd1a85@gmail.com>
Date: Thu, 6 Aug 2020 15:21:48 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <20200804184452.7adjlf6xwxij2emk@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_022202_316700_479AFCD0 
X-CRM114-Status: GOOD (  21.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Takahiro Kuwano <Takahiro.Kuwano@cypress.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, Bacem.Daassi@cypress.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

On 8/5/2020 3:44 AM, Pratyush Yadav wrote:
> 
>> +	 * S25HL/HS-T (Semper Flash with Quad SPI) Family
>> +	 *
>> +	 *   For the faster clock speed than 133MHz (max 166MHz), the Flash
>> +	 *   requires 2 dummy cycles before data output in RDID(9fh) and
>> +	 *   RDSR(05h) operations. As complex fixups are needed to handle that,
>> +	 *   this driver supports up to 133MHz clock speed at this point.
>> +	 *
>> +	 *   The Read SFDP operation is supported up to 50MHz. Since most of the
>> +	 *   modern QSPI controllers are assumed to run at faster clock speed
>> +	 *   than 50MHz, SFDP parsing is skiped then equivalent setup and some
>> +	 *   optimization are done by spi_nor_fixups hooks.
> 
> Are those modern controllers capable of running at lower speeds if told 
> to do so? For example, if during SFDP reads we tell the controller to 
> run at a maximum of 50MHz, will most controllers be able to do that?
> 
> If yes, I think we should tell controllers the speed they should run at 
> otherwise we just ignore the entire SFDP table for all the modern 
> controllers and platforms, shifting all the burden to the software. That 
> defeats the purpose of having SFDP.
> 
> I was recently experimenting with this, and managed to make the Cadence 
> QSPI controller run at lower speeds for SFDP commands, but I'm not sure 
> if other controllers will be able to do that.

I just thought about the controllers which can run at fixed speed, but as you
pointed, most controllers are able to change the speed per command.
I will remove the SPI_NOR_SKIP_SFDP flag.

> 
> I took a quick look through the patch. Most of it looks good to me, but 
> I am not convinced that simply skipping SFDP is a good idea.

Thanks a lot for your feedback! I will revise the patch addressing all your
comments.

Best Regards,
Takahiro Kuwano

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
