Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9502C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 12:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A1866101B
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 12:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A1866101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rPaUgqRRuEYH96MhAe32V7HSjO/bxj50KWunpTGQKV0=; b=eDi5dUdWj3PtMll0FitQT0aHnX
	VvGRGr1KqGxb+paO37639uH/8rwWtK0dvpz45G7GeJsZ87/UAO37P+lYq6zuEQio9qWmcbEwCGkPA
	HO+LJv97pTGDUDSujm4Oikds4nyPVWhdVcLw9oy/UilngNe0LJIdo9Z0sEdQKtwLcwCwXlUVZwqKE
	cATnASwMdoj0DMp8iBvHO8zokydo07ON+a5A0rHLsC+bUW1LTxngngVGJ4eBXjvxTWFjPgJZN+fsI
	fFXbbiHHdA0ao5nsJwxkF+lzhlFW5L8lbH5LJz4Muzb51nLuEzhc0jAmWvTzKpc4e3cTZuCglrJZB
	wP5lgFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNaLQ-003hCL-B6; Tue, 07 Sep 2021 12:36:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNaLK-003hBb-1d
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 12:36:52 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CB1834015D
 for <linux-mtd@lists.infradead.org>; Tue,  7 Sep 2021 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631018208;
 bh=kUQBNqvLjn5SJ3y1jqXZ48A4UtyVFge6gK8Eh6dxOP4=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=LhFyW1orG9sUBsUlQqQLgCXncSVeCFKbW+wEOo8VX5C2JmflRsPqA0KzPgruoU17M
 8C+mWgLS2kbBCeIDCSSR5hw7p7s2c31XVG5gQsNhXxar3UMHi61IAyHxwz1AkQ90h+
 HGF+VRVOSGv2beVFwTdGJdnp/VqhCyQ7fWUZsqlhzXME80ykKKQy05GkDOU7fJGOv/
 e+2N8pJMXNZjxa9JkfvDH7cYtvwaRECwU0hJiW2vKvx6r6Wz3tVzOaI6VJq8DtMAEA
 eSNE7Ekh/9qbzms/cunJt8j/+r4RjacBGxnM5jrqXfAfpd1UsXftTWHtT5dW8ZwH11
 6JgMHOGFNaz6g==
Received: by mail-wr1-f72.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so2051520wrn.21
 for <linux-mtd@lists.infradead.org>; Tue, 07 Sep 2021 05:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kUQBNqvLjn5SJ3y1jqXZ48A4UtyVFge6gK8Eh6dxOP4=;
 b=f5oKjrndyXQ81YNl/YODEcmuzbl1gjbRO4m5vy45OTfcZk9OWlpNEYtk6uYGP3V62i
 Dh+cnDIaqGSBQLY0bzh//69uvj4nH1Quw9KMvV07nxePOyHCBzAAN8KIymnrY0X+9oOY
 RwDYAE/9TRq5xScHEmGQ+qIDkzHjveSvEdon4ND1jE8SKlWjsCcv1MCLgwq6rVcVysVj
 qHriJYtK95N4/0zZ0M/9wNcApVjwHWFCS4tdjYhHWfRpObaOY5TnhaZah7+BDIoGP74F
 8JKI1QQOnd7N5cDsZyfzmBsk6O0ZLQYuq4IFX2V81blOUlpMmjkPexsXcjr4rn0Z6vcP
 Grbw==
X-Gm-Message-State: AOAM532aJm7k46Qfy2t3dfWJsTr7AJiriKw6w0TgrT7uGF7c+6VenlL+
 j1BFfZK9OArMmwEp+rzYasfM+3Q1p30L4nvWt9GoRZxN5MsEMd3YRUYaKFe5uI/BS5xx9WDmiSB
 9EjM0ExCfD9KbWgxcUlvzCR7p0lS6Y0aXrJVc6vsu+Kg=
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr17958054wrx.40.1631018208539; 
 Tue, 07 Sep 2021 05:36:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyinpXYU71XtwrZ3JCIxVV95srjFG3YvDI9n19gDYcDpDB5gs1mVCHI2a/OvPBFynEGh2zVEg==
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr17958032wrx.40.1631018208383; 
 Tue, 07 Sep 2021 05:36:48 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.233])
 by smtp.gmail.com with ESMTPSA id i9sm753657wmi.44.2021.09.07.05.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 05:36:47 -0700 (PDT)
Subject: Re: [PATCH v3 8/8] memory: gpmc-omap: "gpmc, device-width" DT property
 is optional
To: Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-9-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <aa465bd9-b3d5-8d75-3e59-e86c2cd093cd@canonical.com>
Date: Tue, 7 Sep 2021 14:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907113226.31876-9-rogerq@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_053650_286164_5CCE824A 
X-CRM114-Status: GOOD (  25.74  )
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

On 07/09/2021 13:32, Roger Quadros wrote:
> Check for valid gpmc,device-width, nand-bus-width and bank-width
> at one place. Default to 8-bit width if none present.

I don't understand the message in the context of the patch. The title
says one property is optional - that's it. The message says you
consolidate checks. How is this related to the title?

The patch itself moves around checking of properties and reads
nand-bus-width *always*. It does not "check at one place" but rather
"check always". In the same time, the patch does not remove
gpmc,device-width check in other place.

All three elements - the title, message and patch - do different things.
What did you want to achieve here? Can you help in clarifying it?


Best regards,
Krzysztof


> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index f80c2ea39ca4..32d7c665f33c 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -2171,10 +2171,8 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  		}
>  	}
>  
> -	if (of_device_is_compatible(child, "ti,omap2-nand")) {
> -		/* NAND specific setup */
> -		val = 8;
> -		of_property_read_u32(child, "nand-bus-width", &val);
> +	/* DT node can have "nand-bus-width" or "bank-width" or "gpmc,device-width" */
> +	if (!of_property_read_u32(child, "nand-bus-width", &val)) {
>  		switch (val) {
>  		case 8:
>  			gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
> @@ -2183,24 +2181,37 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  			gpmc_s.device_width = GPMC_DEVWIDTH_16BIT;
>  			break;
>  		default:
> -			dev_err(&pdev->dev, "%pOFn: invalid 'nand-bus-width'\n",
> -				child);
> +			dev_err(&pdev->dev,
> +				"%pOFn: invalid 'nand-bus-width':%d\n", child, val);
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +	} else if (!of_property_read_u32(child, "bank-width", &val)) {
> +		if (val != 1 && val != 2) {
> +			dev_err(&pdev->dev,
> +				"%pOFn: invalid 'bank-width':%d\n", child, val);
>  			ret = -EINVAL;
>  			goto err;
>  		}
> +		gpmc_s.device_width = val;
> +	} else if (!of_property_read_u32(child, "gpmc,device-width", &val)) {
> +		if (val != 1 && val != 2) {
> +			dev_err(&pdev->dev,
> +				"%pOFn: invalid 'gpmc,device-width':%d\n", child, val);
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		gpmc_s.device_width = val;
> +	} else {
> +		/* default to 8-bit */
> +		gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
> +	}
>  
> +	if (of_device_is_compatible(child, "ti,omap2-nand")) {
> +		/* NAND specific setup */
>  		/* disable write protect */
>  		gpmc_configure(GPMC_CONFIG_WP, 0);
>  		gpmc_s.device_nand = true;
> -	} else {
> -		ret = of_property_read_u32(child, "bank-width",
> -					   &gpmc_s.device_width);
> -		if (ret < 0 && !gpmc_s.device_width) {
> -			dev_err(&pdev->dev,
> -				"%pOF has no 'gpmc,device-width' property\n",
> -				child);
> -			goto err;
> -		}
>  	}
>  
>  	/* Reserve wait pin if it is required and valid */
> 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
