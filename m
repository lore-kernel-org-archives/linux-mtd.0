Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E978AC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 06:45:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDD164F04
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 06:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDD164F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ujOGwRjIl31USqcB+3sqBEzUAvlX05zJQdeZvxTVduw=; b=nVX+TKpDfJJob4wx4nk47h3Mk
	Bp+NNKRtCw1arbvcaxD/qtaUnOGY+JYtXzGjV6QL4goZ4qVwcp8Fw2opzJh+goacp4wgn+b/eCAlP
	toLWiwYnpyGlPUCGsyCZURTq3pcWqwOIJXAxk+LZn2qg+NU+sgP/E1DFSTZJW3KLClp2TUMMQULyN
	exG2m0rvwXosRUs4X7TpOxSVQTmEWeo4dKOJzPFfUNHQwm6Sc+aF07UwexQB7t3zHFen+UddmHa2n
	vQ2cpNHJrQj3tEojIxqFjI754uSVjsnG1dXRv8AT3I9IY1Ijp1YyeUs6aSTqeCpe6wRFW1ecu4dhm
	685tXx9eA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMmNj-004dWE-EM; Thu, 18 Mar 2021 06:43:43 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMmNf-004dVs-Ci
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 06:43:41 +0000
Received: by mail-lj1-x231.google.com with SMTP id 184so6136630ljf.9
 for <linux-mtd@lists.infradead.org>; Wed, 17 Mar 2021 23:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RI301Q0wsWbsKciSpIG5QiBmIdSS3JhRWZ7BpdKW3Dg=;
 b=vL11IzG6zlyQtHUXEgmUzLLcYLysrdWzgGOwgE2vqiHqtAEZqgi/RERboCIuWxQP0D
 KJ4itexUe2roOplSUrI92+6W5ZrghGhXt+0jNV3pt6Y/e0mYRYe5DcprIwXxa/pSvO1S
 HrV3SNvvJQuJLmdLKL/wBylP4DYtJsjybcCngSinbDzUr05elQiq+DwLzUNCKm96Fkf+
 P91H90Qh6u/ltwUYYk7tyRCpHip3+gC5MA/SVrvavcDmzL0W/bnP3QjSPDPtWFABQhTX
 5ipbuG+LdyLxSQWbuuBzHmchWaGioGenk5ABFrIt1gtBAMXhTmr3W8nCc9+cXLCKXkS9
 vAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RI301Q0wsWbsKciSpIG5QiBmIdSS3JhRWZ7BpdKW3Dg=;
 b=qylpwt1YPSyrv6pxO1rdkGB7NXljHwBRFegfkPFlRTM3TeXUgTrGn2Vm2t+OIBwxOd
 Y9cZZzDGkVvABg/i0Kxc38jNU2+i5dFXL/oWmZUqCerGS7U75MALUx6hsiz1X9kluCCe
 VqFm0M8FaA/5wbEhHsIz+diKEJBHDxR7YPvgXkAAdVnp+bhswlhaCPSF+O6PoUwUQP5w
 JdnwKIyxbJy+mWVOqJwEwrNHBazXN+R2wEtfHqBfyRAdIgwpzIFrIFXgIHLCUVs1pIFu
 bfQMaL6JXElj+UftSYIESALRwP9/C8kaRvnDYgAIuBgcoSz3byLsSQb+f+oO0nx2IPvZ
 wiMg==
X-Gm-Message-State: AOAM530OrrPbYENG9i/cn5HgucEEei27z21RkdROX7Zo0Wgw6YWUcrV7
 1kHVTO7YwgFWXcYXehd9UQQ=
X-Google-Smtp-Source: ABdhPJzmpoXD7zFPb74+DEY6omuCFymT0/E5PJAlH5DSuN+MwLQxPuhlDoxZVNpVOZ7tJSzU+fyrxA==
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr4578899ljk.169.1616049816121; 
 Wed, 17 Mar 2021 23:43:36 -0700 (PDT)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id v11sm122050ljp.63.2021.03.17.23.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 23:43:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: parsers: trx: Allow to specify trx-magic in DT
To: Hauke Mehrtens <hauke@hauke-m.de>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com
References: <20210315170711.567358-1-hauke@hauke-m.de>
 <20210315170711.567358-2-hauke@hauke-m.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <c596dbe2-a948-81c4-1e4e-e2d6c1b58b44@gmail.com>
Date: Thu, 18 Mar 2021 07:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210315170711.567358-2-hauke@hauke-m.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_064339_647585_5D4FB3BE 
X-CRM114-Status: GOOD (  25.30  )
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
> Buffalo uses a different TRX magic for every device, to be able to use
> this trx parser, make it possible to specify the TRX magic in device
> tree. If no TRX magic is specified in device tree, the standard value
> will be used. This value should only be specified if a vendor chooses to
> use a non standard TRX magic.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>   .../bindings/mtd/partitions/brcm,trx.txt      |  5 +++++
>   drivers/mtd/parsers/parser_trx.c              | 21 ++++++++++++++++++-
>   2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> index b677147ca4e1..715a18ca36bd 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> +++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> @@ -28,6 +28,11 @@ detected by a software parsing TRX header.
>   Required properties:
>   - compatible : (required) must be "brcm,trx"
>   
> +Optional properties:
> +
> +- trx-magic: TRX magic, if it is different from the default magic
> +	     0x30524448 as a u32.

It may need to be brcm,trx-magic and ack for sending a separated bt-bindings patch.


> diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
> index 8541182134d4..fd424587caa4 100644
> --- a/drivers/mtd/parsers/parser_trx.c
> +++ b/drivers/mtd/parsers/parser_trx.c
> @@ -47,6 +47,24 @@ static const char *parser_trx_data_part_name(struct mtd_info *master,
>   	return "rootfs";
>   }
>   
> +static uint32_t parser_trx_get_magic(struct mtd_info *mtd)
> +{
> +	uint32_t trx_magic = TRX_MAGIC;
> +	struct device_node *np;
> +	int err;
> +
> +	np = mtd_get_of_node(mtd);
> +	if (!np)
> +		return trx_magic;

This check seems redundant, of_ returns -EINVAL also for NULL node.


> +	/* Get different magic from device tree if specified */
> +	err = of_property_read_u32(np, "trx-magic", &trx_magic);
> +	if (err != 0 && err != -EINVAL)
> +		pr_err("failed to parse \"trx-magic\" DT attribute, use default: %d\n", err);

I'm not native, but shouldn't that be s/use/using/ ?


> +
> +	return trx_magic;
> +}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
