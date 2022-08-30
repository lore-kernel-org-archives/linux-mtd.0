Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEF9C0502A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpf0/mEonQDQhhA2J1TQItf0Qk2I0TEZAeZ/nc2P30g=; b=GuUjzpqzebWN6L
	jiNIKVJXg9lmpjoDL3tfsxqEDhE7Uyy6tZYlZkl+OmeWvBuYchJVUaJbhCc8LO++EqEOhB8pckw61
	T4WAQ0f25g5v3lE9LNoBStzOaLwMU7dYjf6SaXAeKE/o1qSDEgLaFTwrZeFWF8nO21Remtn3v0iV6
	RhybKE4bP/Yf/OYeILtrcKPNaRCGyrpqcNtRfdxNgfFH+766MMktAGKXh3/t2AOeniJjMOGtD4+16
	df5pqJShNebANfoqGjRTwOX6Kd41YwCUy09LVHH/lsS9Lyiap3EHXBHYGpn6fRycPbBTRn6kDfRZU
	gt+6u/zgkONidrnKRrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxqy-00FqAX-4U; Tue, 30 Aug 2022 09:48:16 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxqm-00Fq0g-Qt
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 09:48:06 +0000
Received: by mail-lj1-x233.google.com with SMTP id w19so7778467ljj.7
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1B8agEvOhcrbh7osNWZ4zacBSoqzKCRV4W/UdfB2Q0k=;
        b=y4kyND4MXnnB0qr7XrN0sOzUe3DRMFz5iSNi01kAX8eTChhO7dm8KjP6hYa/aDDSHG
         xyWMAnUAx0eQejmcLRxCzOQHGNXfRgShtmX5d1DTlYbmpDDiUp21q6GaaX87S0L+vcp2
         z84wRkPbATrjT91LtFZmk7SyyF4E20Vd+SAkswPEZvkmO3W9kBaEKG93ekjxwsydEGdE
         7f53yy9cfziruNxjuM0hHzXGedE1SGTlbMKnvn9aZr3AF5VadfmEoeAY58I6S4Ci94ZG
         B0ng1RFchW6v3ZfgJgfmyNyAkw4/tbv5ozbbuIgASMK66+jK9IjiqOotR3ur2biMp5mz
         TAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1B8agEvOhcrbh7osNWZ4zacBSoqzKCRV4W/UdfB2Q0k=;
        b=MmjBO8R49PryBzYotkmLzij3bTheW7Q6D3e/cRa8ph9o7yBatCoVXQwj+fpAyAC+IV
         bSs90909/DujUtnrpnCp2LU/VcHh5AWFHTCvZsgDuwM9DH2Uu43U6c4+Zi+ilcSLq0qX
         qGDp27oPPmP+2zFpSnMkzrE4BZyccIEUdBKrGSDORmKVDVJTpKgIHIRkmP7mXOwAC9I5
         wJwmGZblSqIZtz/KPcXRdOirIzpN0l0k5XDj8ILVx+83xambS9c2QDJN76Ihj+7KxkHm
         ybWdEOAwB+nMvEhyJ0mOV3xD4zbxRwwBUTkEyanRhQ2aBJQTe88nrod0qZVxvuF6uAg/
         Gu6g==
X-Gm-Message-State: ACgBeo0ZA7pcFg2BVSM/qAprIfD7bcaeezrsR6ECs1IdcRgsCVHksGVh
	qVfcA3mvbQrsa9sSqxvuRBIQDA==
X-Google-Smtp-Source: AA6agR6Dq6C7MSOxzfke89FEuTHtENsfk93cm3duATGZNLuyIPGiBBJlh74yTA+qfNkzRcW+RMzytg==
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id g16-20020a2e9e50000000b00261e3fdcdc5mr6731602ljk.56.1661852883220;
        Tue, 30 Aug 2022 02:48:03 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id by6-20020a05651c1a0600b0026181f65600sm1712560ljb.136.2022.08.30.02.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:48:02 -0700 (PDT)
Message-ID: <a04c5c6b-6195-91c6-dd83-4ca04767a441@linaro.org>
Date: Tue, 30 Aug 2022 12:48:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios property
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20220829090528.21613-1-sai.krishna.potthuri@amd.com>
 <20220829090528.21613-2-sai.krishna.potthuri@amd.com>
 <9a63271b-48c0-1b31-c450-5abc9eedbced@linaro.org>
 <6619ebc290f12fbb7613f32087aa9200@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6619ebc290f12fbb7613f32087aa9200@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_024804_946673_12BC36B4 
X-CRM114-Status: GOOD (  22.36  )
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

On 30/08/2022 12:36, Michael Walle wrote:
> Am 2022-08-30 11:21, schrieb Krzysztof Kozlowski:
>> On 29/08/2022 12:05, Sai Krishna Potthuri wrote:
>>> SPI-NOR flashes have RESET pin which can be toggled using GPIO
>>> controller, for those platforms reset-gpios property can be used to
>>> reset the flash device.
>>>
>>> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>>> ---
>>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml 
>>> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>> index 7149784a36ac..d2fc8e9c787f 100644
>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>> @@ -70,6 +70,12 @@ properties:
>>>        be used on such systems, to denote the absence of a reliable 
>>> reset
>>>        mechanism.
>>>
>>> +  reset-gpios:
>>> +    description:
>>> +      contains a GPIO specifier.
>>
>> Skip this part - obvious.
>>
>>> The reset GPIO is asserted and then deasserted
>>> +      to perform device reset. If "broken-flash-reset" is present 
>>> then having
>>> +      this property does not make any difference.
>>
>> Isn't then broken-flash-reset conflicting with this one (e.g.
>> disallowing it)?
> 
> Sometimes the spi-nor driver needs to switch modes, which are persistent
> until you either switch em back or do a hardware reset (or software
> reset IIRC) of the flash. If broken-flash-reset is set, we try hard
> to leave the flash in the mode which it is normally in after reset or
> don't switch modes at all.
> Of course we cannot make sure, our shutdown gets called in each case,
> thus there is may be warning during startup.
> 
> So, even if you have a reset-gpio it might be broken I guess. Think
> of it being high active, but someone forgot the pull-up. So, if you
> do an unexpected reset, the flash chip might not be reset
> automatically. So yes, I think, even if there is a dedicated reset
> gpio, it could still be messed up. How likely is it? I don't know,
> probably not very.

OK, so let's keep it and allow both.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
