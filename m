Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17ACC00528
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOVNGEgOaBT7p1M3nMVx8Ji0gx64vs810H+e2hD9HvI=; b=GKgcHTY0o9vKoB
	Pn+8rNs6RC+nyg5TmE3AGDwFliJ9CD7oDs3pzbLsdrJNHNf+5pGSSV6WLjvgSPRlNho+1mFuRxSL3
	f18S1Tza9yTJuF2S1tEGuI7vWqlc06dfOQkYyJYhIVPx1W/YiyNzbMasyu9dkO1cQQOE27Z+0wL/s
	2Tu3+K6extUdWDlj25H1iM2n6JDpVi26Qc6rKbaK6GrXbUmEpgaQJ4Vxgm0Op3loySeGTC5XBVzyg
	VeI63cRo5o2l0Sl5zujiDc6W4iEE7gBUOtugCb8/XlqGMbrpMp/ZkX41i/Aiopea0xSnzmwVI0UwX
	riAt8zwDKIZibQL4UibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPM3e-003Bqp-13;
	Fri, 28 Jul 2023 11:54:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPM3b-003Bpm-0Q
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 11:54:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bcd6c0282so284915966b.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 04:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690545293; x=1691150093;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NVf6A5Nx/q2EKildiIxmLxp4cNtMGz7mdoFctSivjyI=;
        b=LR31EufuoXoa7rKRSNSLbrJqbocfirFDNEtrn/c0yCJgcSRTuSTd/Jf9rWoxoHXg7w
         jm3S5Bq8x5XDvAiKJM0j5lX+Bubbf5vs5E+tgGYPyJFkcAw6VJx1LCRWTlaP7gTTgUGI
         ygex/DHLX3aPhna09kJ3YogvasS9Y70LHA4hVPwThSI5GhIoFgz1Z9KWnAoynFJotCvr
         EZekZIAI+w7a55VQLw+CvOgK1lDCMsWdqxR47Zs7UpMpWmzUu4leOeB5NhalpJmpfk8B
         sXj2sdFih0OLDjwUXjOEbUzQ3uSmhitGN0b3xZfvOUkEIVchnRdS713eIjlWQAJg+Sle
         vD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690545293; x=1691150093;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVf6A5Nx/q2EKildiIxmLxp4cNtMGz7mdoFctSivjyI=;
        b=RxLX4gY8lWwQH3LYeTv72mhBbVfe3X9End4pTLT3gL9dB4mkMy+s37vuHz4S1TBKW9
         htLV74qh6uFyBaIWvLRL7B0tLffNbWPC+/XjOQERpN/rSBfAbaRo2kN2UmaBfWSln5kV
         NK4XMe9GPrQeGSoiCtUrbN35A2OyZfrcod1TNFlnAcWb++cwgroi6rdiWvZwaDsFI9f/
         YuB0LXgqSS7Tjl48m39AlQUeIY9nrRm8vn88hs2KilZA2+5J8Ns5xCOUG0JB5N58UNCV
         +YqdSdlFGMoFuR4sL1zIa9hO74luFcdXBK0OjCi7qRQWcfXI5K8eNfqstva2RtMI/0Vs
         sV3w==
X-Gm-Message-State: ABy/qLYwGS6qy8p/4y5G0bLr+udmMI8cyYx8mQWITUFwrcelx9sFw+E5
	lRBF3faHknN6UloJpc4QAJDVag==
X-Google-Smtp-Source: APBJJlF+TDV989GeRya5ntP90XQlmOC2pH2oR2BwNAwssUBTcz0yINP/cvwEbcwWvUbd+oceXt1npg==
X-Received: by 2002:a17:906:7a4e:b0:99b:ca24:ce42 with SMTP id i14-20020a1709067a4e00b0099bca24ce42mr1688763ejo.44.1690545292912;
        Fri, 28 Jul 2023 04:54:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u27-20020a1709063b9b00b0098e42bef732sm1932762ejf.183.2023.07.28.04.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:54:52 -0700 (PDT)
Message-ID: <db2703c0-b7f0-bc73-aa08-bfe4489bd999@linaro.org>
Date: Fri, 28 Jul 2023 13:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 20/50] dt-bindings: atmel-nand: add
 microchip,sam9x7-pmecc
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230728102636.266309-1-varshini.rajendran@microchip.com>
 <b5c44fc5-005d-6268-af68-85eda9c330ba@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b5c44fc5-005d-6268-af68-85eda9c330ba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_045455_167597_11783E49 
X-CRM114-Status: UNSURE (   9.64  )
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

On 28/07/2023 13:06, Tudor Ambarus wrote:
> 
> 
> On 7/28/23 11:26, Varshini Rajendran wrote:
>> Add microchip,sam9x7-pmecc to DT bindings documentation.
>>
> 
> Why? What's the underlying problem that motivated you do this patch?

Isn't the problem already described in commit msg, although shortly:
There is a new SoC sam9x7, where the model name is sam9x7 and it is not
a wild-card nor family name of SoCs, and we add compatible for it, as
expected by writing-bindings guideline.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
