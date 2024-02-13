Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF694C4829A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7XCBs3/Rx+N67pmw1xAFznH1hBKNloX2UbXgyt72Y8=; b=gbnEbA7WPV6C07
	j9q6UZaoNY0sljsN8Ccoyk0bqlToxYMMq47I8sn8NxJX1g/orw8UmK3XOwgIhBCoYEYHLSPOQ88/g
	uwxOodOXgDqGFUt3zTekShy5TygiJWG8AEr3MLviiiQxjuLNkH/nV8pv9841zetbivz9DEatYeaLW
	NDA/XglDpMCo1lFZnfacGCqwO5SrJowms7n4VBjPVP941GYdkFIbLyPPfs6sC4/JaPcVx5WHO0dwA
	8Kg6UNWFJ+m+GjSzz5SKqzmZpGAapG14f1iRagOTAJFkOD3bCVjKj/ky6Y33fwUJ6t+9uQetsV+sg
	dICbRE4WsVb6mgK9b+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZnhA-00000008K1S-10TO;
	Tue, 13 Feb 2024 07:59:12 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZnh6-00000008K0n-3ail
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 07:59:10 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-511531f03f6so4815886e87.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2024 23:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707811147; x=1708415947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfF3IVUXxniEjHbnby7kRWIjy6GH373BUtwr2dP7B2M=;
        b=mLf3tT9hQVJRKnKUjEw7peXIIp0BWtbCfy7bOD/NJzQOwU71kTWIUvLymrEOGXLNW5
         sqT90PaVZHboLC073cJ5m1fGh5jv5IOR1ofpPehD4yU6H7uXRiU6/6EiueADq0c5ZrEN
         nBSKIn9iDsd1OwlZaPEx60KXnS2hZ4/HSgVixH18jpeatlHVtxcT7cVDl9UnIx0DX98x
         l1/wW46AF8YIoXTE8waAgBQmpmoj1f8d1QHvkIQKRbZnIRtKqS+3NrvAPEdKPlCaQfA3
         YKYQeuo8gWzgn5XRmE+z+pVGKkygyEUEE0j2y7znt+9UkQVbacA5KMI6VietYiGXZx5R
         Y7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707811147; x=1708415947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfF3IVUXxniEjHbnby7kRWIjy6GH373BUtwr2dP7B2M=;
        b=AeQn/knSbnThRBqrH781Ag0tzN1AQWpbehBLyWNoex5Jq5g4klfPfpFcJlkCE9o3HS
         DThOQTAtdlwddGU7b31VS1ck9T1+MC60VybGs7if7YKXBD4lTgCXSPYAakO9pZ1QPhZd
         nXTY0yOjuLXuhIs9BPXfu9VBizj3vWpbF1uHFYJhIXlO6Rgu0rvg9jhlqL+RJVFMqI+o
         JbSoyqdUKKE1MCnnFbHmhj8czq6Rhj/qhPOynaY5rF2L0FboYWXpy/Ctil06Xq39yYfD
         /9otR1AlusN1BTxHjFOYi0vS2OJCOQ/mjAEtd+h+ZyHJnS5VgA0nTt4gonmAnyCdyAn2
         ie9Q==
X-Gm-Message-State: AOJu0YxZxU5/hchPuDl3nf21qqc27OxfMkWGWrZv3I07PD11m91meLbF
	Xjm3xPljzXnfo0H8+8VSAptjtyqqqB7rA5foeSLDWq1OmMwI5JHb63EGlxWOED0=
X-Google-Smtp-Source: AGHT+IFPjHM1LVnafI2YFx974N1jHd7VTe2GONRXUF+JdGWt9/yLH6RoTUFIYi4TFKD9vMowvw6KpQ==
X-Received: by 2002:ac2:4e86:0:b0:511:7ee0:c690 with SMTP id o6-20020ac24e86000000b005117ee0c690mr4990147lfr.23.1707811146896;
        Mon, 12 Feb 2024 23:59:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrW4zNNiGdSwqoZX4HPo/qu1i9GES1UkQxrxhK6ow3qZijFj+llGGmX0HAX7fz5bibAPbFy12rtkvsVHTzpoxImG9dZP7rvKX8dbvQWwYHnizEPv8iCcqfVlFnBkiFJO8ev6hCGgWytECXLT6YcyQpW8j+lBheUpgCsXrA3mWZJG9jEiwg22/qWyvD4kd2vA7UtYvc8FB+zHQownEdsdb5SkSBkfdqvDQeST8ZZVq4wYU1IMbRz6NG0JG0+NiBvnvY92fkTJYtWmFT8yvLZQUxUl1GF4NjIi7azWakmDbl88biEK4Q2XWQGisjSG9L8M8R3FmwcUd+1h9RBsodYOJpxNRbGWlODLcvOGpkQW4lz8A0KLTpiL4nRcQ=
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600c199200b0040fc26183e8sm11015342wmq.8.2024.02.12.23.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 23:59:06 -0800 (PST)
Message-ID: <7cb51fed-66fc-4ab1-be09-85a00d94514b@linaro.org>
Date: Tue, 13 Feb 2024 08:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] memory: stm32-fmc2-ebi: add runtime PM support
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-8-christophe.kerello@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212174822.77734-8-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_235908_943232_3015A1BD 
X-CRM114-Status: GOOD (  13.86  )
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

On 12/02/2024 18:48, Christophe Kerello wrote:
> Add runtime PM support in FMC2 ebi driver to be able to manage GENPD
> support when it will be enabled.

You don't do any real runtime PM here (turning on PM domain on probe is
not real PM), so please explain what is the goal of it and say that it
is basic RPM for keeping domain on.

> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  drivers/memory/stm32-fmc2-ebi.c | 40 ++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
> index 04248c15832f..8c30e56be3b0 100644
> --- a/drivers/memory/stm32-fmc2-ebi.c
> +++ b/drivers/memory/stm32-fmc2-ebi.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  
> @@ -1381,6 +1382,7 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	ebi->dev = dev;
> +	platform_set_drvdata(pdev, ebi);

Does not look related.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
