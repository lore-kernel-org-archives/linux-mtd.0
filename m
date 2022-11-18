Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC532C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hqBb3JGpzZcHQqMWfYBWrPlAK5CL6F2lkz8NilJ+Jo=; b=A4GavNyIJv7goE
	ZzKoV1TiQLih4+vtFafPtmPlGtuJqQUCjqtbn8pjMS/b0wktdNen4MrtJPn3/cq3gicyLr/K53GbB
	PBkZe5IaWQQRoD64OIA58LixPkgVE1XxBXQciNf7u0d5ooORMiYAoaW39XFyxlRylOfT4R1nuIT6J
	//cwKHiTNH4ZxLMABtPj/v04AsoggMF0G1o/q4gByxpxVd5L8cmo1BHVlqwbohn3ya8ppdbzWAwyA
	9GUiNxwOQidrdqGwFyWv5Jr55mgcIj010Y3Pa9dd/ngvX1GUCkaMBsiLWteV1A7ysu8tirmxKPTvA
	lGoK/JJaiAf1HtbjRlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwj3-002lkE-Np; Fri, 18 Nov 2022 08:27:53 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwj1-002lj1-Ge
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 08:27:53 +0000
Received: by mail-lj1-x22c.google.com with SMTP id d3so5927024ljl.1
        for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2022 00:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrA5CDs46lQZm6VaAVmPmV1Nyk9XIySNq9lvhXdo7k8=;
        b=yIT6wd8Tn/4EigMdSev3RTx1dShvONUZ1o2LJic5y3UzW8LgMuG7uFp80Y8Mw7p+2i
         u+Hx+MWiciMmXSYnrFx98cxa4sbmSAURAUt99p8E3r2tMmF0ygoLGxcFQPJrif3jPMLj
         y0DxRVohO6j383Jju+uqZkJFVPAKCT7G1d+SNz0aRrDl59ec+iH3SvLunNJnRAN3fFHp
         uj/yuz8SV/cGRRKi6lGP5BHU+Y9YeVlbn5zwGo+B4clkg1nQfYqsfFdJXz60NiVE7C5x
         xoWYk/DHjlYtipany3Ms311spap+ZgR86DO9tnSirVslPkUYj7drcMZpd/Ds56w7qUSX
         eO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MrA5CDs46lQZm6VaAVmPmV1Nyk9XIySNq9lvhXdo7k8=;
        b=3v/+QmdoEwRHmg52pw+OwNPxyWFXnNHuSe3YhFw+nnQI+QLUlanEIHDLTYftqzHGTC
         RxrFumkNFAYeC6ByUJeRosgKNDDV+5dLMQytg+hd5zJ7V9G4fkSOhKImaUZXTTNxFmuL
         zZriC8Ze8/UZWAWog1o5a8+p/Yr/widFAlmYi8+synQ65AjDMMhzWmZLAlDKCXayOhZ4
         pMYDAurP78oZIcdQXCJkh8egwRZBlaxrLb0smKcoTV6mRH3XV1CN/egc4TTrI1UkQlS5
         7+iEpk8QoKWK1FO6r5QvPKi5klXUqna3+aSL1GA1CWyo5UpwQdrirDbs/qximR70roz3
         KcKw==
X-Gm-Message-State: ANoB5plHjXdtL0oaexNBf6ClM749oit16tc9mYVrEF3FJ9RCG7WX0oDt
	fw3OnvKjxZRqLdJewFPPsyMmWQ==
X-Google-Smtp-Source: AA0mqf4FSTsj7jWLGFDuUM1KolU0pAAAlYx7n+VRF6tfHUnjgf3Tz4kJo9qfndGCbN01BGn3foVCSQ==
X-Received: by 2002:a2e:9052:0:b0:26e:eeb:f9cf with SMTP id n18-20020a2e9052000000b0026e0eebf9cfmr2211769ljg.480.1668760070041;
        Fri, 18 Nov 2022 00:27:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g27-20020a2eb0db000000b0026bf0d71b1esm573326ljl.93.2022.11.18.00.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:27:49 -0800 (PST)
Message-ID: <06ac1c86-22f7-97ff-bf59-6fb0994dfcc5@linaro.org>
Date: Fri, 18 Nov 2022 09:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-watchdog@vger.kernel.org
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
 <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
 <Y3Z0w6JH1f5zgwvW@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3Z0w6JH1f5zgwvW@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_002751_617286_9C582C14 
X-CRM114-Status: GOOD (  15.42  )
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

On 17/11/2022 18:52, Conor Dooley wrote:
> On Thu, Nov 17, 2022 at 01:38:42PM +0100, Krzysztof Kozlowski wrote:
>> The Devicetree bindings document does not have to say in the title that
>> it is a "binding", but instead just describe the hardware.  For shared
>> (re-usable) schemas, name them all as "common properties".
> 
> 
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> index 1ab416c83c8d..d2de3d128b73 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Qualcomm Global Clock & Reset Controller Common Bindings
>> +title: Qualcomm Global Clock & Reset Controller common parts
>>  
>>  maintainers:
>>    - Stephen Boyd <sboyd@kernel.org>
> 
> 
>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> index cf9c2f7bddc2..20ac432dc683 100644
>> --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Generic OPP (Operating Performance Points) Common Binding
>> +title: Generic OPP (Operating Performance Points) common parts
>>  
>>  maintainers:
>>    - Viresh Kumar <viresh.kumar@linaro.org>
> 
> Hey Krzysztof,
> 
> Hopefully I've not overlooked something obvious, but it wasnt noted in
> the commit message - how come these two are "parts" rather than
> "properties"? The opp one at least don't seem to have much more than
> properties and patterProperties in it.

They should be properties, will fix in v2.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
