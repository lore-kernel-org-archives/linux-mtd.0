Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA0CC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 06:45:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C64764E81
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 06:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C64764E81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GHIpOpl2HXwjEdy4jRtz1jC3+Nimg3Jhsh2mM9duFMo=; b=RuIhly4EjIZtXjMn5vd8Sdrgx
	t+Bsb4Cqwrhnrnnxp49aB/NaI0SBk1bPA2JE0w6AEugrRYf4Tan0iOoiHrSWg/+r9gjkRpYjkTmkQ
	ZwDe3lmsG7BcgaN0YYiFQo6aTi7D/V3JDmq60rX7IjPgbyuLvzYSf0dRjs1TfnDs8L7h87DTOR8VF
	dKw61rOZdPqvgN1CSv0KQiit3NNuG0duJsycyWvuhx4jRj4zjbqVMQ7vgFouGK73ldSc8/kp7382B
	gEslV29JJHCjFqIwssZobeJ7EkSzOZJZYFVfUaoPx/wfbWJer+SIfWhh1dMnM14OPZIV4ASl317vd
	FwsRjJuPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMmP9-004dcN-8Z; Thu, 18 Mar 2021 06:45:13 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMmP4-004dbe-Mo
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 06:45:08 +0000
Received: by mail-lj1-x235.google.com with SMTP id z8so6113714ljm.12
 for <linux-mtd@lists.infradead.org>; Wed, 17 Mar 2021 23:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uA6Wlf2FXstqzVdHBN1T/8kikCpOM7WnYKlS60erKGg=;
 b=uTEWplV18gm4Z2dhcjB3Pm2iZbMHc3oJQC3YtTz2bgdh0iIizmh9Wf7uxiO4t+gYbw
 2RBByXwHsJPABHgbgRaJyqHUVC8PXEMkeUFthPdE8o2LZAvVLq4jzayLcFGab4ql1Cze
 FN/o8qCZIva8eq6PQ2f3W/LnH/KvOP/8IGONC/k2BU4KIVJAV8M16IJVXAR3l1XAtjMa
 62ohuQx2jNaLZQ6yJjFxFmHcNZ7OSrnAs0NKccheaRgLDDPiqt0jFVuUux/Xy1jSr1SL
 ja08dMyh2zZoT9Gd9p9Q2aMXGxOnv6f2DyGvFQXHizCdLPNKSBuzqzBxyYud4MQVoehL
 U2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uA6Wlf2FXstqzVdHBN1T/8kikCpOM7WnYKlS60erKGg=;
 b=lRyaEiXPOpopxJljRyc9vKIBtkrDb4z3Oc11q/xIWqfYErOxMfVxDrBX+EtWrIQq3t
 IW+xMAbpfmmvcbD6OR7iZVDoiVwOP54AigKa94ymbZNufxkBSq15KqlCk47omvYh2kLZ
 6QIjm+wHOm0ioUbMM0bYBOG+jhA5t/d5ifBDkfiB0+mmpaaeyU7/4ra4ZFHmmihQqnrz
 wjy0YuXYsx1a5l6slOJDO6mV6rMUCFPXKevewymifmZCaxkB0RKZP9le1kysJ/5YlsV/
 wrbxPwBXqG/CvfFA/Tm80flF/0aJJ7M6mQNZxaorfMPuGlJC+CFblDm6wm8KJfvih6U7
 dC7Q==
X-Gm-Message-State: AOAM530rdvG8g6sWUTobd8T2ByWT9FmjaH38X68Soiv95GUqoivC+rxR
 5b4jAngl45exCAuX/ies86s=
X-Google-Smtp-Source: ABdhPJwsefl6HbgDK/uginm1N3eeV+FZJHW6xxpDbhKhApjNTPW8/uqJtrIEhA2qcThU0dxRY77OBw==
X-Received: by 2002:a05:651c:1214:: with SMTP id
 i20mr4426977lja.423.1616049905900; 
 Wed, 17 Mar 2021 23:45:05 -0700 (PDT)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id u10sm111125lfl.111.2021.03.17.23.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 23:45:05 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: parsers: trx: Remove dependency to BRCM
 architectures
To: Hauke Mehrtens <hauke@hauke-m.de>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com
References: <20210315170711.567358-1-hauke@hauke-m.de>
 <20210315170711.567358-3-hauke@hauke-m.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <16aba7dd-63ca-e68c-469f-f21cff75b32e@gmail.com>
Date: Thu, 18 Mar 2021 07:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210315170711.567358-3-hauke@hauke-m.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_064506_972403_3115DDF6 
X-CRM114-Status: GOOD (  20.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 15.03.2021 18:07, Hauke Mehrtens wrote:
> Buffalo uses the TRX partition format also on Mediatek SoCs.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>   drivers/mtd/parsers/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> index d90c30229052..6242903d8844 100644
> --- a/drivers/mtd/parsers/Kconfig
> +++ b/drivers/mtd/parsers/Kconfig
> @@ -96,7 +96,7 @@ config MTD_AFS_PARTS
>   
>   config MTD_PARSER_TRX
>   	tristate "Parser for TRX format partitions"
> -	depends on MTD && (BCM47XX || ARCH_BCM_5301X || COMPILE_TEST)
> +	depends on MTD
>   	help
>   	  TRX is a firmware format used by Broadcom on their devices. It
>   	  may contain up to 3/4 partitions (depending on the version).
> 

Please check Documentation/kbuild/kconfig-language.rst and commit
18084e435ff6 ("Documentation/kbuild: Document platform dependency
practises")

I think you should rather add platform to DEPENDS.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
