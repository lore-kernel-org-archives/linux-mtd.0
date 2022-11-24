Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD2CC4321E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xv2g5A/r8ZZah3nCffYljYJGe/VNgFeZ1V94F+6coCI=; b=LaWoGnLOn8jI4V
	yjmK/B1YXYYr3F530ZxlCPLnnSFojqysX+h16X0TRO4DxwiZzZ0vp1bk4OF95Oi6hjvsS28H5AQMD
	zTMg6SlWC4czIx1d+wDOzjq62CgqpR8CT29SJq+1YnEm8z7O+N3fbRsXCrlxVPW7isB9zfEQwcuhi
	sj3i/QvfH3mn1+4CrHRFpg4Er42TfRSosVfc6EKYKFytNAq3Xd+a9GBl7udbCYYG0UO0Ckat8VlZT
	iZeeCPiaMr8R50ZX/B5YkOeuyOIH51Z3T2wAvuiSPTKoiCrVEB/RLXjyt91n02jk7CvocK/udyxqk
	1qDbHeglxg68lGCV92Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyA0O-007sC1-3F; Thu, 24 Nov 2022 11:02:56 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyA0C-007s68-4f
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 11:02:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id b3so2029450lfv.2
        for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2022 03:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nu6pjkXIBFfjqNqFnOUYgw7nMcsD0pE0OGpEOCK7UF8=;
        b=g18UXMLu+HaZr5Vma7hCKLNfw8vE5DtyJQQ/h0wELeQztKUsZinIOYD0Emd571Ttaz
         G8gKTl4Gjfv1qddAZVO3V5bexes47auyNSgRTXKOFA86NLV4OWBnG9IySg8lw/SBqNR2
         6PnX/oZdvF05r2urpn9cDwRFY4lTHRC9NUOphPu+GJomqjVeCR67oNZPdO6U6XYaFViv
         cSLl3JDzwhR0gYG+PpVdE8ZNwH+pw2fU52yOyyPiANnlSXP5ypDsEtRIcm6t9u4lM4mm
         2qK/nbsG3QfaEEb8Qrp6NUkLU/PLhyZ5sjNo2AWS7bXDpvtI76RbrJIFzcVc0Y9wceiN
         bngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu6pjkXIBFfjqNqFnOUYgw7nMcsD0pE0OGpEOCK7UF8=;
        b=HCQfl/EbV5ln7C89PA4dASU6jKfMRov0DB730NvYBiTi1w3Nzd2BDRwt2Ms4cuw/2H
         RsVLzRZkac/q3PLRde4fQFi9ggK33r8ODLZyi1x8xxGZp5im3yPvFd+ewJC/y3ty9Hnz
         6un7ogllasaGf+oKmfzSFVQx6HKukg05dBbDtmQqAzZ1cuPYumDJEd8Vs6UaT5w5Jb3Y
         xtBCA7e6JMldS1ADLM8KFsaFujKXJbtKA0d1C2yTssIDyW4IG5IsxR7dF8QrOmS37ajj
         vwIcM626o2qYps34erba38pHVgX/mQORFBuHlpiKLGiZrb9a5srP5wsZwaoU84q7p2c8
         C7yg==
X-Gm-Message-State: ANoB5pkWge7E18PQHDIXDJeRZPjbrBUrF5KXTiDi0xTWSE+Qu2rr6eZt
	JabVaC3zDWZUzRJJ29c++A3CxQ==
X-Google-Smtp-Source: AA0mqf467/nJeQnupvv/69oKsa3gmbQrSZGWwkEVDwG8CorBpsO5lNOGph3XKFrZdmNiiKGZ18jCjg==
X-Received: by 2002:a19:7b0f:0:b0:4a2:3bed:2008 with SMTP id w15-20020a197b0f000000b004a23bed2008mr11520699lfc.88.1669287761901;
        Thu, 24 Nov 2022 03:02:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f18-20020a05651c161200b00278e9c0d3a2sm73435ljq.33.2022.11.24.03.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:02:41 -0800 (PST)
Message-ID: <69540766-4fe8-cc21-f2bc-4ad04643e4b6@linaro.org>
Date: Thu, 24 Nov 2022 12:02:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] MAINTAINERS: Update email of Tudor Ambarus
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Mark Brown <broonie@kernel.org>, qyousef@layalina.io,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 tkhai@ya.ru, quic_abhinavk@quicinc.com, vasily.averin@linux.dev,
 baolin.wang@linux.alibaba.com, colin.i.king@gmail.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
References: <20221122125244.175295-1-tudor.ambarus@microchip.com>
 <024e0a68-bb79-4e2e-84f8-f44afb759cdd@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <024e0a68-bb79-4e2e-84f8-f44afb759cdd@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_030244_194291_1EC1511C 
X-CRM114-Status: GOOD (  14.90  )
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

On 22/11/2022 14:15, Arnd Bergmann wrote:
> On Tue, Nov 22, 2022, at 13:52, Tudor Ambarus wrote:
>> My professional email will change and the microchip one will bounce after
>> mid-november of 2022.
>>
>> Update the MAINTAINERS file, the YAML bindings, MODULE_AUTHOR entries and
>> author mentions, and add an entry in the .mailmap file.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> I can take this through the fixes branch of the SoC tree if that
> works for everyone. Alternatively, I can take only the MAINTAINERS
> and .mailmap bits and expect the other changes to get merged
> by the devicetree and crypto maintainers for 6.2.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
