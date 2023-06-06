Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C329C77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gg2ctKT/sRjAFzMfuAnD+0oVTILmdwfuFfssZvF9i4=; b=FcMioOHWMH6X+r
	3+6uy3JWx7YxnfFyl/Mdroin7siMsU4ROQ06X8VE8lmkCc4/EVUJxGdJbfRHCqDBBXLfAegtTpLz6
	VPkOIFeMHo6XpZDyR38iDis2DGRptGK7anMALyLW4CanU0umC4URBv5XFrv70g31ArNr04XeRx+hU
	9AmqaqxFjG6NQQaIgQia0kWzZa9zqlxtb2RZO1BRixeTAnhH8OvF2bfSVQcY5sxAo6fm55Is9SaP7
	BI9L7J4p4nBAiVAGCfZb3/Yk7e9uDx6/KY7q3Ld0vbr+RoYULJR+pKONRCYl3cG1qhEsamvWmIEAV
	p3MeMIQgtJyVGv4Z9Mwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UYs-001OfE-0P;
	Tue, 06 Jun 2023 11:09:14 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UYp-001Oe2-17
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 11:09:12 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977d0ee1736so378512866b.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 04:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686049749; x=1688641749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHk4lqJIMcJBU3trXI4CY2TRCxArO5+ul5qmG1V8eqo=;
        b=G15eD3KJMo3aFVqvegLN3NDwVxTxKL++spzhKVfGJ83neywWRLBRRNVPJZhl291VRQ
         svnJLFZalIbHpcw47QVCUjguT3fC9zvyAW7UGl6b5hzg/8ZpftPlg/TjY1wVjqg3kRaK
         uKVqnsiw3aDHP3h8PZaARSp9hJe5zQwNbn5/txstfPi1TiZYSk/CwZyk9MdIjIqy3Qso
         iO7J4tcc4fBPTHTMSPMmC89gepIeWJ3bL245t4L78Z0cWx3ozw+eHO5jiJteKTRuBn9X
         pQ/IJDwrEcM4B9Iv7+taNYv0pxpJUm+5IGE6P00CatGu+9jiI+8yOvXTSyoz5auwaYd/
         kfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049749; x=1688641749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHk4lqJIMcJBU3trXI4CY2TRCxArO5+ul5qmG1V8eqo=;
        b=UYqheLIDIEE5pmKdrU67UPGN0aIvEYrSt3MaAtGCb1HbMCUR+mqOylEe+7Hbg265UC
         ZUzHPWv8h3XCtmb9H+LbnfKnwkJltGXssNhYORlYFVNvatJSeviGP8WqQj7K4M3z9Ja/
         J0wu9CIAKdI0ezSGVMZcDQoXQ7oMjXHIvkQPiQXM1XFhxocqOVCRi423mfNvXKSBdlrN
         AJ+oDU/+UO4fTZoZJDwYxqRqAxcgsaRy2BwiqGDIm3BAjxdCHO9tWPBshbmj8DLRbyUT
         g/NjYwaT3Zicntxm069o5E7DjyKwwINKPR6K0V0k/IjG70xoM+C07nBnb1LpMrfC3IH3
         EEmw==
X-Gm-Message-State: AC+VfDzyvsbTEI/0tKQryPbYaz1qmdpOjXeItaPybv9Tjy6pho8qyJYg
	xS7JClCvTl2albZQcpQDUUDQQQ==
X-Google-Smtp-Source: ACHHUZ6Td/Zq2iecy9zyqO0qmTu5v5uoKcssxEATLV/trUubfg0NXZMg4drbubb11J+fBRgW9tHqwA==
X-Received: by 2002:a17:907:60d5:b0:962:582d:89d7 with SMTP id hv21-20020a17090760d500b00962582d89d7mr1784234ejc.38.1686049749621;
        Tue, 06 Jun 2023 04:09:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d21-20020a056402517500b0050bc6c04a66sm4952793ede.40.2023.06.06.04.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 04:09:09 -0700 (PDT)
Message-ID: <5bfb5573-2de4-887b-0f10-e4dd6f084c39@linaro.org>
Date: Tue, 6 Jun 2023 13:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@lunn.ch"
 <andrew@lunn.ch>, "gregory.clement@bootlin.com"
 <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "conor@kernel.org" <conor@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "enachman@marvell.com" <enachman@marvell.com>,
 Vadym Kochan <vadym.kochan@plvision.eu>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
 <20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
 <a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
 <785368df-1881-e62e-6172-d902cee814a8@alliedtelesis.co.nz>
 <eaf9d7cf-c9f5-a5d5-67af-c43761c3c6cf@linaro.org>
 <4ea0b16e-0cec-00db-c598-e0364a7edef8@alliedtelesis.co.nz>
 <9fc57052-5049-ed50-ca95-cfd1d0420dd9@alliedtelesis.co.nz>
 <20230606094855.1ab005eb@xps-13>
 <845924ba-d9bf-d0ec-e1f2-f721366f43c0@linaro.org>
 <20230606122812.411b223a@xps-13>
 <e0d14527-8147-5e8b-6a43-ee043e0d0f8b@linaro.org>
 <d0b2cdc5-12fd-9a19-b38c-0653b4147c2b@linaro.org>
 <20230606125724.126a4685@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606125724.126a4685@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_040911_389270_23B35ED3 
X-CRM114-Status: GOOD (  14.99  )
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

On 06/06/2023 12:57, Miquel Raynal wrote:
> 
>>
>> Now for actual paragraph:
>>
>> "If yes, then it means we would need to list *all* the nand chip
>> properties in each schema,"
>>
>> No, why? I don't understand. Use the same pattern as all other bindings,
>> this is not special. Absolutely all have the same behavior, e.g.
>> mentioned leds. You finish with unevaluatedProps and you're done, which
>> is what I wrote here long, long time ago.
> 
> Maybe because so far we did not bother referencing another schema in
> the NAND chip nodes? For your hint to work I guess we should have, in
> each controller binding, something along:
> 
>  patternProperties:
>    "^nand@[a-f0-9]$":
>      type: object
> +    $ref: nand-chip.yaml#
>      properties:
> 
> If yes, please ignore the series sent aside, I will work on it again
> and send a v2.

nand-controller.yaml has it, so ideally each device binding should not
need it, because it already references nand-controller.yaml. However if
it doesn't work, then you need nand-chip in each device binding.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
