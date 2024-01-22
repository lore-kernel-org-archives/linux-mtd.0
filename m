Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757AFC46CD2
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 23:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXDqFiPwO/R/gahGGCShZ19zhov2qxWA8h1KbzAz8JQ=; b=dwy7smYQcShoAfsqKb69nV9vX1
	Tog4e3czLh6l2Wo2lg27OFZgp+D5yDUH5f9RuR32Pu3IYQ54SufCxFEGRTS01VXtga0EDulObqsw9
	tDFI82C8mJLC/4MaiKYDrZgMXd6ANv83ACXYg8HTXu08Eu7Gy50G2M+iPPtU44ypPtayO9xKR0uLU
	Eu2vtC4Ao6i4eCJ1Rr9uodgTEeAZtMGDvQFTJ9upnW20Ax2eSzsO4D6kZGpjGDalP4QJ185/SHmV+
	mr03ijmKYVuLCsTdJRNwYbXUCfYa9C+fs6Ocxw8iFHfDbUix0V8b3UrVLD/lMqZMv1qHwFyLzsNOA
	zitV3N8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS41D-00ES2L-28;
	Mon, 22 Jan 2024 23:47:55 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS41A-00ES1V-0z
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 23:47:53 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7831be84f4eso316616485a.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 Jan 2024 15:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705967267; x=1706572067; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G5yv2R7Pni830aQJhB9GZmRmLmwvDbMum8nGvqRSgMY=;
        b=O7PzycaFpfN/HqdVKmpau2kzwRYI47jE0OliLhrvEsQ2dUdNIkPWSm9ACOq+5rHmNt
         DGomsaymT5aarrSQf3RvzRf3iZRrgxZl0JP0doYhvJtDsxnvYSWas0sDKmBFMh3qLfOd
         QSszOH7ybBCPb9xNlskTmx4KOU72pKZSiecVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705967267; x=1706572067;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5yv2R7Pni830aQJhB9GZmRmLmwvDbMum8nGvqRSgMY=;
        b=vyHeFqsFC8Flb/QvWeYGvL3ysWMql3iFrcRAdIptj3zUYzuSBeJ1b6uXY/FEI94KE7
         ZKomNNko1AZ/4ZWqn2wG+KzWyawMAl+LulbSNJ9zhVwowqfLnPcFMLNWqH4lr0ELDdFv
         BcvKalwJ968ndnhVvje80+jyLRnuBAaFqSRdkAgVIiWoi22CW1PKFUgyxRwTYYQuIZEz
         BcAFfZAWPBwIEZ1DhqoaRsJxPV8K++g0bcFwzTltFPPgDLXKFPoDWMSXVifzBP1rGvZb
         ddxRTxsLPRnACYmeGI+NXeSlzcNurMlVbHXRO1Mx0vvQVGaiDVIe55szbq1Gs1B8G9Jl
         E2zA==
X-Gm-Message-State: AOJu0YyOytrFWiuSjKGAPqMW5AmNXXdqOVsreSRd1qSSoy7XzdmLJjlt
	uHH8xJXYZ/RPFNWtziZFevjnGZxSV1Hitv50bco5VrMEVhPfpZH1DVGuKg973w==
X-Google-Smtp-Source: AGHT+IHIY+YgryUz53Z1kHNUdYATs6I3P6p+8BOPeYV1/WUIy/DZi9d49i6FOzAYIfdBkS2xoHXTXA==
X-Received: by 2002:a05:620a:1032:b0:783:6260:cae4 with SMTP id a18-20020a05620a103200b007836260cae4mr5341501qkk.154.1705967267326;
        Mon, 22 Jan 2024 15:47:47 -0800 (PST)
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id qp16-20020a05620a389000b00783574d5017sm2582945qkn.19.2024.01.22.15.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 15:47:45 -0800 (PST)
Message-ID: <8f837a36-b33d-4335-b19d-b16b61b80ce3@broadcom.com>
Date: Mon, 22 Jan 2024 15:47:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, dregan@broadcom.com,
 miquel.raynal@bootlin.com
Cc: dregan@mail.com, richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 anand.gore@broadcom.com, kursad.oney@broadcom.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 andre.przywara@arm.com, baruch@tkos.co.il,
 linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
References: <20240118195356.133391-1-dregan@broadcom.com>
 <20240118195356.133391-2-dregan@broadcom.com>
 <12d06516e5f1310b508c5d8136131787@milecki.pl>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <12d06516e5f1310b508c5d8136131787@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_154752_343782_0F5BE094 
X-CRM114-Status: GOOD (  13.13  )
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
Content-Type: multipart/mixed; boundary="===============4182477636936659707=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4182477636936659707==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000fe2fce060f91740e"

--000000000000fe2fce060f91740e
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 1/22/24 10:57, Rafał Miłecki wrote:
> On 2024-01-18 20:53, dregan@broadcom.com wrote:
>> @@ -111,6 +113,17 @@ properties:
>>        earlier versions of this core that include WP
>>      type: boolean
>>
>> +  brcm,nand-use-wp:
>> +    description:
>> +      Use this property to indicate if board design uses
>> +      controller's write protection feature and connects its
>> +      NAND_WPb pin to nand chip's WP_L pin. Driver defaults to
>> +      use this feature when this property does not exist.
>> +      Set to 0 if WP pins are not connected and feature is not
>> +      used. Set to 1 if WP pins are connected and feature is used.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1]
>> +
>>  patternProperties:
>>    "^nand@[a-f0-9]$":
>>      type: object
> 
> Please take a look at:
> [PATCH 1/2] dt-bindings: mtd: brcmnand: add "no-wp" property
> https://lore.kernel.org/linux-mtd/20211109115215.5bcef0db@xps13/T/
> 
> Miquel suggested a generic property applicable to all raw NANDs for
> such purpose. Unfortunately I dropped the ball on that.
> 
This is already added in this commit 
https://github.com/torvalds/linux/commit/cb57fae479be41d1233f5a49d4760de9a5692b6e. 
But brcmnand nand controller has dedicated pin for WP and don't use 
GPIO.  So it does not apply to here.  Basically brcmnand controller 
handle the WP inside the controller and its driver.

brcm,nand-has-wp is SoC level flag and it actually is only needed for 
some rare earlier versions of the controller.  I don't want to break 
that so I added this board level flag brcm,nand-use-wp for per board 
control of the WP pin usage.  As you know many BCMBCA reference boards 
(like the 4908 based) do not connect WP pin so customer follow the same. 
You can use this flag in the Asus GT-AC5300 board dts as you intended to 
address in your patch.


--000000000000fe2fce060f91740e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIF4uLu7y0W/PYjJLA84CLUzzBdLh
idin6NiTCxjPcM/QMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDEyMjIzNDc0N1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQC6vrRnYVt/VGu+cvwbiNLlO9UJGdArgri3cKL9UjGZNiNb
JqJkc9VSMHzmnHnRxQkrQUrxdd5ANYBs1MlYVxFmRIGzKd1Z8hhMoTkS/elo8fZXc1gGmaz46H2M
sFb8yyFQSG6WCwoPBct1R4FS969fE7/K7G6dUOclQF1vNU1uJb9IeP7dIv3ctsDLVjWUx19jKU/v
/NLrkT3n0K0Tfy61abXeD8PtF8hM+eSz8XFGdb4XqJqvcq5rvKRvC7l8xkzS/Z1Sfm5SnVVJdvjr
EBESX1IrqxgsI5n9vOzLtaU/35aozwjfdSdLz/EdYgjbOslqrl7WW5l0fQMCVxF9zeGM
--000000000000fe2fce060f91740e--


--===============4182477636936659707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4182477636936659707==--

