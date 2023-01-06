Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEF6C5479D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jan 2023 09:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wYKnki181E3WhmsIHWfk8lH2Fhk6X3vcIcAR0Zck28=; b=yh7ig0DBx7Ng4O
	8Mb92tmLtNoplyq0Rg7ptNip9Pf2536D5i3M1sjOApvhaLw75Pwft5e/mBCcI1+UETcu+9enyQ43J
	F4vfq550tWyLktn3WHEhH59B41FqqmeWZj55zqTLSTDWhADq2k7yhgOA1E3Cl+9Yy2ZqwRwbJVbyF
	wLie9ljyYlaBk3ZZhSUiMaQUN5drovuFoYQCI0CBTHywKj4VuEOR4vmooRU64OwmYqY78BOyt8RB0
	Ct1BVXg3PdvOa40UW6rBjf2XpVPj7dyvbEAsFkjgQQfjgh/O1B8JQ6CNdgKPiErbvEDIuhMzfccFj
	n5tnxI9x8qRShX5lbBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDjKb-007CU6-Vp; Fri, 06 Jan 2023 09:48:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDjKV-007CPY-Mz
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2023 09:48:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id jo4so2350320ejb.7
        for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2023 01:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77vHjeUHiCb66z/I743uh4gP4GpNQ4TQEZW0IuazaZY=;
        b=Mn1qK9ulnq8ImWay2BFBcXNDLq264mzCvmvq6AowQek49U5nYnVbayLOXnP4HwLJIV
         nSpt0a7h8jSPkuLiPG208Jt139i3iPgHUa+YzGZwR/hLDCqxqBrWu3lOof/yW/r45RiU
         iIj2FQY3Qa4Qsy7LeSPOt8J84+CCA8qxGjFy1bAvvpF3q2GLNwujHFR8JDnGZs6Ezwci
         M8U4d13moLskMm3M4IjXxFnJU0bdNheaVCJTbp6IyPGAAYGCjvbBUae5s4cJsZC4W8E2
         go/R8RMiLCj9FnKam+Bw6xcS+jVTkL9QBHeSd1JDjsKXMcV137YfV/5rq6kk/bz7DeSU
         AM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77vHjeUHiCb66z/I743uh4gP4GpNQ4TQEZW0IuazaZY=;
        b=qvyZU21Hjyi9kRt744iSZTUcfx233c+mJPCL3ziqjNR8Jv3PniU0DotRhCKMWk3KJk
         8HlMF4VM8wpICjsceDMpR/gFieqq/bZJPdg2ZqY90Gr0hG6+hdqbJ0w/sXywvWaOg4r1
         MNL/zR7Q8t4yheSpht/1iJruUA4BkE8H6ViXk0hLTcDvJCmc8dLVQlIsGpfyHJE2f7DY
         +N6JMTTH9bryn1mGs1Vz7f7vAgZNqFRfieG2P5LwoNpGwLDTBYljGxFuIsT4vzSEcJfK
         IwBZ1De3QIy4gvwxtSbhCicCxo1BddsS3eXdLAPDX+CAnwSJSOzE0kbMbR21T5g25soy
         FyCw==
X-Gm-Message-State: AFqh2kqxECmlh4/aOE0t15Edb3XbAnnRnDPZwokw0xfC5rIAmcYq1IE8
	e3DsABaI+B3Hiv1/FKc1oER8Kw==
X-Google-Smtp-Source: AMrXdXvIYu/IktKkvb5RYfd4aovy6Jrw35I2OrveWf1zeDYWyJafG0t6A/8TBkyL5Db0Nb3k+KEkjw==
X-Received: by 2002:a17:906:4f14:b0:7c1:98e:ed20 with SMTP id t20-20020a1709064f1400b007c1098eed20mr44270717eju.35.1672998479477;
        Fri, 06 Jan 2023 01:47:59 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.242])
        by smtp.gmail.com with ESMTPSA id lb19-20020a170907785300b0084d1efe9af6sm246287ejc.58.2023.01.06.01.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:47:59 -0800 (PST)
Message-ID: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
Date: Fri, 6 Jan 2023 11:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: spi-nor: spansion: Keep CFR5V[6] as 1 in Octal DTR
 enable/disable
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, stable@vger.kernel.org
References: <20230106030601.6530-1-Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230106030601.6530-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_014803_811100_E291210E 
X-CRM114-Status: GOOD (  15.35  )
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

Hey, Takahiro,

On 06.01.2023 05:06, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> CFR5V[6] is reserved bit and must always be 1.

have you seen some strange behavior?
> 
> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/mtd/spi-nor/spansion.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b621cdfd506f..4e094a432d29 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -21,8 +21,8 @@
>   #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
>   #define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
>   #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x43
> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0x40

No, this looks bad. Instead of overwriting CFR5V with whatever value, we
should instead first read it and then update only the bit that we're
interested in. If it happens to write CFR5V before octal enable/disable,
you'll overwrite the previous set values.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
