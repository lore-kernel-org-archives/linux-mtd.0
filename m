Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D7EC001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 04:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaQH79mF4/NvHxkRuDLgkDAA6VjTmZ50m9LIePKpbzQ=; b=wyBM46mT4m78Eb
	nL/qCNcLcMtbUgJJjJSmn384ffqYOXoVymI3tbe+dG9zcDCuwr/53C5Iea5eV5nWTslBswJGbooHM
	U5PoVYttpKpXJBADlJhBQkXaxg62bybSpKNwmkh/k0Gk3+t1V0MXz16ERByj1dT5rOYE2JEL5lNhS
	Mmid/icKfloYlB2EZVZX7YXItWZxkJ12D17V1KK5V9SNugZ4m5NcXcLsZVFIH7Yw9y2w64Kic6xPO
	WI4GpWJMGF7BK9zgw3ECafUd0ZYWBcTl2T+PcO5FNLlMOojhia7e7KO2as/38fg4mA92VQSffMMDY
	XEn1mdKUuj53CLeoywuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOW54-0097J8-1C;
	Wed, 26 Jul 2023 04:24:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOW50-0097Ht-2P
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 04:24:56 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6686ef86110so3607268b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 21:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690345489; x=1690950289;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JBsjn7IAtl65JYqpeQVuvsYTITezpT1qqhywYt9S/60=;
        b=kUQEPnEgRJLn1PsR3vugPwzGEqb8mvyRjBS4M6xXzsRiq0LX+cGJafkNoJ8dd02sgq
         72Qfng/ibA8gwswwblc9Iau9mXO+rHJH2vmFOLGbbvKI1033RhLCaj8o8qRkEqIlacyX
         0OiVB9FPsb7JXN55/nvgTfVuVcou1ESOQjzxU7kvPuNoVfdhhPbrb4f03aZDJswUqLp3
         2XQP1De8xs6gpazqfzqC7kV+6Ai6QgjS6ZE5bGHn5KlMx6zgyEYaNghOprzeF/S+AkR9
         H091odPrWNQiOOhXHTy9o0ssqIKMsLruXbvM2dKgKLEhG0A3QyGz2YkCGKuwZJ3j2ao5
         wN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690345489; x=1690950289;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBsjn7IAtl65JYqpeQVuvsYTITezpT1qqhywYt9S/60=;
        b=QKaIYXIhuOa/Pm0R+uK+Dm5KBoinjDkYPxESQRTx2G2bsDirpwDNIQmLU/mUP0pquf
         LNCKA53GrfDCM4I/Gzig5lqo2cZynyfyT6/xsYFVKHJUtqGa0CKF3z6fcZGk1EmfqiFC
         K4I/bLm/+D2d4eLvpFe8RzZExw7fpK3YlYamUoM4H0QvWkdEwX8YA2h6FVKSKGFRBEhc
         GIrMJ2KpXBv7HjThTC6tWWZxmJ4sksdGpMw9rE2VVj9A7JUfz5p14wqSHWIbrV5kzlHB
         A5TAUusPSgxyPZbi7qK4DaB+CVSfIPVpMNmLhjtXj4Yo8xIN7L/R6JZtxaxPxCOlRoUe
         q3Zw==
X-Gm-Message-State: ABy/qLYBmJnzJYTZj14oPzKWS/NBd9ym+fOyO+nZ3usCZeD4aoE/ujkK
	NEX3QF8Hu2WgzG+djbDostNT1syPXbI=
X-Google-Smtp-Source: APBJJlF54y+sCDnuj7XpR57EhQ6gNuZgEcH0a/IyX0jSETVLecPgw++iE7IKR8P+++/hd8w/8VEl1w==
X-Received: by 2002:a05:6a20:9144:b0:122:ff52:7331 with SMTP id x4-20020a056a20914400b00122ff527331mr730046pzc.52.1690345489021;
        Tue, 25 Jul 2023 21:24:49 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902700a00b001bbb598b8bbsm3203294plk.41.2023.07.25.21.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 21:24:48 -0700 (PDT)
Message-ID: <a73b2f3e-bdad-1c88-c06f-101ec5db3092@gmail.com>
Date: Wed, 26 Jul 2023 13:24:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Takahiro Kuwano <tkuw584924@gmail.com>
Subject: Re: [RESEND PATCH v3 00/11] mtd: spi-nor: spansion: Add support for
 Infineon S28HS02GT
To: Tudor Ambarus <tudor.ambarus@linaro.org>, takahiro.kuwano@infineon.com,
 michael@walle.cc
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_212454_787276_6BABF087 
X-CRM114-Status: GOOD (  20.17  )
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

Hi Tudor,

I tested all SEMPER flash devices below.
  S25FS256T
  S25HS512T, S25HL512T, S25HS01GT, S25HL01GT
  S25HS02GT, S25HL02GT
  S28HS512T, S28HL512T, S28HS01GT, S28HL01GT
  S28HS02GT

As I sent another email, S25FS256T failed due to SCCR map.
All other devices are OK.


Now we can remove these macros as we use vreg_offset.

#define SPINOR_REG_CYPRESS_CFR1V					\
	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR1)

#define SPINOR_REG_CYPRESS_CFR3V					\
	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR3)

#define SPINOR_REG_CYPRESS_CFR5V					\
	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR5)

Thanks,
Takahiro


On 7/24/2023 5:12 PM, Tudor Ambarus wrote:
> Resending as patch 10/11 and 11/11 were not sent.
> 
> Takahiro, since you already have to test all these flashes, I took the
> liberty and added some other changes that would be good to have. The
> first one lets SFDP determine the flash size and sector size. Michael is
> in the process of changing how INFO is handled, we'd like to get rid of
> these params when SFDP tables are defined. The other 2 patches
> consolidates a bit the spansion code with the idea that we should use
> the same code paths for both single (SCP) and multi chip package (MCP)
> flashes were possible. We avoid this way code duplication and have
> better test coverage on the code. On your patches I modified how/where
> "if (!params->n_dice || !params->vreg_offset)" is handled. Please review
> all and if you agree with the changes, retest on all flashes. Everything
> looks good to me, if the tests pass, I'll queue all.
> 
> Cheers,
> ta
> 
> 
> Takahiro Kuwano (8):
>   mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
>   mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
>   mtd: spi-nor: spansion: prepare octal dtr methods for multi chip
>     support
>   mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
>   mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
>   mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
>   mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
>   mtd: spi-nor: spansion: add support for S28HS02GT
> 
> Tudor Ambarus (3):
>   mtd: spi-nor: spansion: let SFDP determine the flash and sector size
>   mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset for
>     quad_enable()
>   mtd: spi-nor: spansion: switch cypress_nor_get_page_size() to use
>     vreg_offset
> 
>  drivers/mtd/spi-nor/atmel.c     |   8 +-
>  drivers/mtd/spi-nor/core.c      |  23 ++-
>  drivers/mtd/spi-nor/core.h      |   4 +-
>  drivers/mtd/spi-nor/issi.c      |   4 +-
>  drivers/mtd/spi-nor/macronix.c  |   4 +-
>  drivers/mtd/spi-nor/micron-st.c |   4 +-
>  drivers/mtd/spi-nor/spansion.c  | 294 +++++++++++++++++++++-----------
>  drivers/mtd/spi-nor/sst.c       |   8 +-
>  drivers/mtd/spi-nor/winbond.c   |   4 +-
>  drivers/mtd/spi-nor/xilinx.c    |   4 +-
>  10 files changed, 239 insertions(+), 118 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
