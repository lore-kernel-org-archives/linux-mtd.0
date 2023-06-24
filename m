Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D8DEB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxKDZDddxdwu/Dwqh9ZwRgT1ZQ/j/eLuFpaep2lHNAQ=; b=VvwaiE73ZbjXf9
	Bn0pGnrU1L4r6mcPhJeYyvh4H6oZR5t//5KcIGJ6LfT773C5Rt7kTuAlOB3IYgDaaU26T/i6bciOq
	xovGqbbwkiI9HAP32Bo5Muq1qJ4rDfxWeLFEUWpi+/j/IjBBPOQFzNjY/t2+0x9++u1E2zBEO3zej
	S5sMyyZHeNOqiuHXRIIbdPORLukojMlTTy+pk0PIBCmgpv1A+ZxTh7DnEyYqtUSczLTzb73EqvoWR
	Q/nb0C5Qja1kK0S7d3O6U/mr/XK8zZVrTUONfY1GrqfIuhhnWyXY7fKqKqlewi69o4275+FVnUcmB
	4kiJTfdf3sSoT+o3wTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy58-005Sem-2m;
	Sat, 24 Jun 2023 07:53:18 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy55-005Se3-0J
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 07:53:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51bec86b9c9so1499737a12.2
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593192; x=1690185192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hr9nrGlYrxN00jEwRxs6PYBUQxgnGyvMLv6d+S+IyFk=;
        b=LQEc0yoJm0GslpUZYCjcHtwoTCvu+59CHRYP/sGpmh7IIEWYyKbcmwOTWkHIAk5amo
         GW/7Gpe870PqzwscCvwhvS2tRdD4lIO92N5a+9t0YvyTUExmCh3G/ey+cNZCCGzcBTPJ
         6yPMwkjqsKsodsXDqWTZBNezjTKe+7X8fdEpM8mYCN9NPvWn/peXOWQ5kyvKsBiKcO44
         1nn5gapVl7Ro8gQLfw1L+9piaUTX+p6FPVZZ1/ijnscvD92eH3mJCbstLfuZt0gY2UUX
         +QldvphwJQ8glfg3JyKVOgSk3y2EQry5UIdVnMeV03t88wxPGoe0khhNc6S3VhqB4zja
         Bt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593192; x=1690185192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hr9nrGlYrxN00jEwRxs6PYBUQxgnGyvMLv6d+S+IyFk=;
        b=jtxj3RnSOo66RlbQsFC6GyRv+NcEdLkgkR9C7Z04QdkPLmvkvquUI0P50Tn+xrYVNa
         SDsFUmWHad6mX3unwFoP2jeytTUajAwUTmugzN/NjHoxoih8JYyuQrM2wlNDoF+erpNi
         9V6wjgyIngTeIHzP/Meu4egA3ysQ4pThbrkyxhGGpD5bjQ/cUOYKWt+tEqn1NMQjDE3r
         QWAzoPOkHXElGxXv/mlEfz3Q0tj1CySXnVsyMaHCYNIhny445xjzrraOxQlXYlSzcFoq
         3QTJH0ZfX99gzILPwECnVEzJlaPDJVGFGvkkFc1E72qmypmH8NRFW8pRBeEUA2GjrIdH
         xXnA==
X-Gm-Message-State: AC+VfDx0hhAGa5ON5Zh83vYq45TM7B+0kmedJ4TbR3R1Gxa9liR3Bnig
	esXdznyZxPRArDTnykRn753wCg==
X-Google-Smtp-Source: ACHHUZ522CJYVOfO8kVotsUuEt+wtHkNFHrIi0PS6ACNcKvYFOPHzOCYWLySAcxpXgHfsNodLNJqrA==
X-Received: by 2002:a50:ef12:0:b0:51a:f6de:bb81 with SMTP id m18-20020a50ef12000000b0051af6debb81mr10804337eds.28.1687593192613;
        Sat, 24 Jun 2023 00:53:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m5-20020aa7d345000000b0051495ce23absm404938edr.10.2023.06.24.00.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:53:12 -0700 (PDT)
Message-ID: <074048a2-5153-e013-3562-b5cad2ba0954@linaro.org>
Date: Sat, 24 Jun 2023 09:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/45] dt-bindings: microchip: atmel,at91rm9200-tcb:
 add sam9x60, sam9x7 compatible
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, sre@kernel.org,
 jerry.ray@microchip.com, horatiu.vultur@microchip.com,
 durai.manickamkr@microchip.com, andrew@lunn.ch, alain.volmat@foss.st.com,
 neil.armstrong@linaro.org, mihai.sain@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-2-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-2-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_005315_168758_F99905CD 
X-CRM114-Status: UNSURE (   6.96  )
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

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add sam9x60, sam9x7 compatible string support in the schema file.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml | 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
