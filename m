Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44424C77B73
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 07:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23n+Yfl3635gjzDMGFmvO9giQQOak0DmqKu0FqAs1II=; b=j7bTk7Z0HkYbfn
	DlA/PH3o/T7lTfF5NGsawe8SHkkDs1ZVK5xOilUlto5hEcu1mPwkajNurYpS0N3QAZhgl8oIN1cUl
	76CNgyw4Id5nvJyK8lLvrs/ifVoIQmEO49EqhsOzuo9dmkLS5wbClxgcrra9uNZGQdSbFE1uqUQqu
	2XJq8e/JTzKtDSXEyD4rsgPqTRt2FOqtZ43EqJW1h3O9FU3a+zSxDKQfcdfKq2FxwH7fI0RPINp2O
	DZ6mS3hd00eftDL72cs2v9q6vObkqnj1ux2Dnrs+5xq/IMUwRN+tm3K2mpxyW+rG0iG6Vs3UyFUrh
	tsOfV8S+1L+D1Uz/Cusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Fpl-00GN7q-1r;
	Wed, 31 May 2023 07:01:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Fph-00GN3v-2m
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 07:01:24 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f3bb395e69so6360963e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 31 May 2023 00:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685516474; x=1688108474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gugzw/ZDhVToGVEb0wC3/St7NtpJ5Cjx1IuUybeWuA0=;
        b=S2EAHmLNqWgUjK2TlPEND4ZmV7qdlytu2hedseQ/zs7R1VBaFyyVZwzUhFrI7FEO4H
         5B+upiEQK4QBOV1bIbBh2TwyuKdi+7XCgySJcqhZkM1ro/pdSR4a8JderVfk6Gv11fLt
         b1TL2u9QzVAuMFgYOIbfDtCKmTz9Ker2MSLfXplW1BTYX5BrF8hjBedAptBGcyAJmKkX
         xWdhdX/XY2+6Wt5J7RV+WOGan9FFgwIorbJO122p99QhCmnpVbk5hhbHUfv46yyJHpi0
         jSr54Y9sDQZSs69yeirP2wW9nfExjDw87wKplolbqMOBKDOOqbnDD7lMCvQ1XQq7nE6Y
         stvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685516474; x=1688108474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gugzw/ZDhVToGVEb0wC3/St7NtpJ5Cjx1IuUybeWuA0=;
        b=E4kUNaanOmsqy2fn+ubmPnxXGnobTeJQ4ImoRnN+rhW9xmLPNYBvnlTkuGhi2vwTXw
         2zqqK+tWROA/OVcxeEOd/hEv96ejjvIYlf6iTJ+uPfnyhAfA37gPWdW2MtxXXi0KWB+n
         WQgP6CoydkLB/ssJBtviQyr28/t9e0yN1Lir+DukkPXpD3lJ5uGdF6yfu2nbSVVSCgVu
         unvpqMHKoyvx5q+1FxH4/1Yro2IDKIwxel70DqGXuz7kidoJs9EHwcP144sIo6XdzqaK
         FdmW6VtLI23zlH5csIXnaisw4ep2dqkO1bK+Xkh4f69b6Zswpd4kjQKg6PpKkOL0Z0GV
         93Bg==
X-Gm-Message-State: AC+VfDw8gV5ZrBpuL25Ut1DpPYA0GOXg7S+RONMmwCGEOtzrnvCR1tYa
	1L5KCmfHF6SFWvqePNkddDULNw==
X-Google-Smtp-Source: ACHHUZ77G6Irh/j2MUHoe+ZtxAn87Qu5gUjnNAB/q3541+lFfODk7BxDYIm5+ELskaXbqrnyQNU3hw==
X-Received: by 2002:a19:750c:0:b0:4f4:b378:46a3 with SMTP id y12-20020a19750c000000b004f4b37846a3mr2282004lfe.36.1685516474665;
        Wed, 31 May 2023 00:01:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id r25-20020aa7da19000000b00510d8e43fe0sm5278648eds.7.2023.05.31.00.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:01:14 -0700 (PDT)
Message-ID: <518ce618-42c6-21f3-34ff-dd5a46fd5d3c@linaro.org>
Date: Wed, 31 May 2023 09:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "vadym.kochan@plvision.eu" <vadym.kochan@plvision.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "enachman@marvell.com" <enachman@marvell.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "richard@nod.at" <richard@nod.at>
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
 <20230530005337.3687938-2-chris.packham@alliedtelesis.co.nz>
 <20230530122625.7zu3ey5dnn6izeli@krzk-bin>
 <c030b2c5-2f44-72c7-f06f-9fa7b9247992@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c030b2c5-2f44-72c7-f06f-9fa7b9247992@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_000121_910802_73408C5B 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

On 30/05/2023 22:59, Chris Packham wrote:
>> nand-controller@43100000: Unevaluated properties are not allowed ('dma-names' was unexpected)
>> 	arch/arm/boot/dts/pxa300-raumfeld-connector.dtb
>> 	arch/arm/boot/dts/pxa300-raumfeld-controller.dtb
>> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dtb
>> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dtb
>> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dtb
>> 	arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dtb
> 
> I've been running `make ARCH=arm64 dtbs_check 
> DT_SCHEMA_FILES=marvell,nand-controller.yaml` (and similar for arm) but 
> didn't see these am I doing something wrong or did I just fail to look 
> properly.

It's fine. There were false positives in the report.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
