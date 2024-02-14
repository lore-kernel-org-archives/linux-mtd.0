Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F63C48BEB
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Feb 2024 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skzOBtOJ1K6rmA0Sl0YMt8aQ0JhJSRnWbtVuQAVBilY=; b=TG4etEkc66/YM5
	kRK/Qv8t4rkwQRlAOgGsIsGGbCK/HYVv6xxSzkik+0y3w+HJ3GwEZA9vaiONdP9npg2SvTjquesJs
	6tdomVwE6Vq4uYY8H0Uiy+g3lc7jD4NaKRIfYvCod/PAZWCxQdI/wAsrpqJRe7i8IthtqEYJY/fvK
	PuiuTrPGXUYJ+f/36kOHtvXdiqMGK9v+uTNUlJ4m0vJXMuV4eqQ1kMus3d4uw7rpLuUFmQqkXy3eb
	KC+mwUKT8e+YiluuVWR3JGC2ZW+RmFYSOmrgrDR/AqNL/m2Zjz+BW5Gm3wF4Zn20XtvTcR5AXB/rc
	Pp99JCPzn5JUytsXY9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCBC-0000000CTq2-3a88;
	Wed, 14 Feb 2024 10:07:50 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCBA-0000000CToT-23OY
	for linux-mtd@lists.infradead.org;
	Wed, 14 Feb 2024 10:07:49 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso2674893a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Feb 2024 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707905266; x=1708510066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4S+dmutnJlsc7Y02Zch4RpMAq9Ld2olVAZFnN/YBZNw=;
        b=MVzgvg8cJ45M3S2mFIJB/52tLJXbvRv4Wih1HYILJgc8Kq6jXlLY5c5YLGIE4EDQS9
         S965RLWuSAp5Iumb3iFEm0Bc0IkxH3tIKnQBPjqGdFY+1b7nQU7DKHVqrXNiS0YMQKSM
         q6VYyDRY0tnbPOmuQ8fF67PD6oCCzfQ2mT47LS/cyL8EPg6ZsnPCa7tbCM7di+vFrGSu
         Y24OoPd6EqHzAj+mI0zzCfDo8LbB3v6a2/gBV+9Jtpbg883u3z7d7FstSwmgUlqj9rAK
         XPFtgSkB5/1gy4ENQQl0bYtDa8oz1cr03rMI7iiqSn0p3jmaYzTo6ed/gb/WBYibJ0Su
         RsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707905266; x=1708510066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4S+dmutnJlsc7Y02Zch4RpMAq9Ld2olVAZFnN/YBZNw=;
        b=iQqT2SSBTrwAEtFsld2AftDb2GPM94R2vbag7yfZAkEBD9+0LMylwno4iMM4WAPSL6
         6amaP+Ym/Yx5a8EnPnsy/NlE8RU5/ymdJeRMiwzMTh7WIfPZPhJocawRJxwUO82DwyYk
         pSF7wfpo+29oFNydOft/bNxs/OWlnl2biwx0QmY2F8ipFY+aLj6hFm8QGamyhQgPJAbl
         UJFrt8RtZ+6E1mL6iKCjgsr1IyvWKisztAq++IeuieycxCvkH+Bd1LN9RjTgr8oiG4I1
         7bRw95RBpt7z42AA8s9F9u93sNQxbwg+TqQwg80yIr/oFuJaP/f2YGmxGDtp/4L8Ujqm
         T0CA==
X-Forwarded-Encrypted: i=1; AJvYcCW5QA/j2fHKIDF3grSF/LS1FxaeWERZH39DKpZ6h+TxKXYpSUtixslAxs9ejEieyypxdSJDCzlY1gRnIaXwE+XYRa8gOH4szw4GBBhhmQ==
X-Gm-Message-State: AOJu0Yyo5c88PIWvXNLGkOts2qqp19O/LQI5u8mwNxLOpOpdnp3+++cO
	p3lNGPgHLjO4nRe0k2CuptgxaDw1h9dv+gMx6FeP/JJnz8hCvH7ycbXvbquFmQw=
X-Google-Smtp-Source: AGHT+IG16aCKvGqfGMvVqfd7HunSzBT1WwMQM6uxLmD7hXEU5em2A7Pi2aDEbxoiWobhCdQETRUgvg==
X-Received: by 2002:a17:906:e248:b0:a3c:63ee:ad82 with SMTP id gq8-20020a170906e24800b00a3c63eead82mr1319676ejb.19.1707905263735;
        Wed, 14 Feb 2024 02:07:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUv+vnzooSrKna4gOeIJgsQfvJUwjMcVVAIqhSfSiiv3nAleghG7SZi8yO/1pLRC5J2hnsueIPpuwSvyTvWWk2YdN07Zr2OoZpZNGqPggnfA8/BsVJCLGfyWDN7NQKCdIt6+hRe1PfOCEFjOfuwHv64iOLfWQApyPK5ldW09bVSzSTdl9BYM8Fc1rW9EPqS/pdpjBdWt3NxnS24RtYTIw8Y3vB22LAKmYCrOdWh0lbfi3TfYxWsSzLZGZ6Qwz3gbaeznv4mqRKFliKbOrtKVtzJD7AxKj5XioKUk2EuREOiUJ01Nyhwz/kZ/mZf/nyS13ixJ44Skondp7nMgCgoQZfOhKAks7GOejSyqbEQH6tOv/qVbNWXDQ4HFJz0gFfPdlprChw/Q6ZF5F+Fwsu59xHPeISYaEUO58hp7KRyW0mJ0iRpoNboGn37yHjnL6n+
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id o7-20020a1709061d4700b00a3d6395156esm53769ejh.168.2024.02.14.02.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 02:07:43 -0800 (PST)
Message-ID: <e2bcc8e4-e73f-4e31-b725-aecc51145cef@linaro.org>
Date: Wed, 14 Feb 2024 11:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] dt-bindings: memory-controller: st,stm32: add
 'power-domains' property
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 Conor Dooley <conor@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-3-christophe.kerello@foss.st.com>
 <20240212-chemicals-skinny-18eda1cfe781@spud>
 <c57b8094-be08-4ae4-ba85-f48522e5d2a8@foss.st.com>
 <52be1d88-51a1-4ec7-8aaf-6046f5a469f4@linaro.org>
 <44f24885-eb62-4730-86fd-f42b3a3cca34@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <44f24885-eb62-4730-86fd-f42b3a3cca34@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_020748_565590_3691FFBA 
X-CRM114-Status: GOOD (  13.23  )
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

On 13/02/2024 16:57, Christophe Kerello wrote:
> 
> 
> On 2/13/24 12:57, Krzysztof Kozlowski wrote:
>> On 13/02/2024 11:57, Christophe Kerello wrote:
>>>
>>>
>>> On 2/12/24 19:33, Conor Dooley wrote:
>>>> On Mon, Feb 12, 2024 at 06:48:12PM +0100, Christophe Kerello wrote:
>>>>> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>>>>
>>>>> On STM32MP25 SOC, STM32 FMC2 memory controller is in a power domain.
>>>>> Allow a single 'power-domains' entry for STM32 FMC2.
>>>>
>>>> This should be squashed with patch 1, since they both modify the same
>>>> file and this power-domain is part of the addition of mp25 support.
>>>
>>> Hi Conor,
>>>
>>> Ok, I will squash this patch with patch 1.
>>>
>>>>
>>>> If the mp1 doesn't have power domains, shouldn't you constrain the
>>>> property to mp25 only?
>>>>
>>>
>>> As this property is optional, I do not see the need to constrain the
>>> property to MP25 only, but if you think that it should be the case, I
>>> will do it.
>>
>> The question is: is this property valid for the old/existing variant?
>>
> 
> Hi Krzysztof,
> 
> It is not currently valid but there is a plan to move MP1 on PSCI 
> OS-initiated.

OK

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
