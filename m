Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24BDC47DDF
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 03:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FPLffIeO9KDyfNQ4xp8g5rPw09kwmWdHoVySFEUs/g=; b=Eaz/PTlKnumY5kfbQrvGa5LUEl
	CDtA1rjJYa5/rr8fiI44guYzxDQESe2dieUpai0T3KpI/U9+SVWx78FEcrVeocwyx4Z26LfLqku+Y
	J8pdPZ5IOIInflYyL0pmYhTAFepBuu4LxSAODyxHF9cCUFGn5kG/edUNTt/a83SWjr9VSWUX/3AXs
	CMjCarBpNTgEUjwGO5zs9dRkHq2Llb04DPzk8/FyqoEbgfpnIA3O2n+MOMimkUzR3Kl6MKG4r0qlq
	Nun6HAOEANDY676xkKBUxTiGB3CJosCTuIq+q0GZ03D7RTYHaz4MbkGqDK0xJ1CK40t2kZ3+glSxg
	/FHel0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSqC0-005zgj-1O;
	Thu, 25 Jan 2024 03:14:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSqBw-005zbz-2C
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 03:14:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d751bc0c15so36730065ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 24 Jan 2024 19:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706152449; x=1706757249; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YaUl7JG3TotEQ43RC3hJDkUAeTP8ICL21pknq8r+zxg=;
        b=GQd19l92ihLQ2Q0FUlBYrPvEWEbLNzobJ9V2XUEZ5MxcxM69CrkbVNRcoZYhqNW/Tg
         j14LPJLILd1OLlHiyPmzT+hVRR8HiKvzPgV1j05ECMJi2Ln7Y7jkuqEi5iPlMK1veUri
         8eim7iHyxI+Z4dG5NNP7iqKGimqddGwhRvdro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706152449; x=1706757249;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaUl7JG3TotEQ43RC3hJDkUAeTP8ICL21pknq8r+zxg=;
        b=nMYBUrPmxt+42BjeXcrUPxCw1FBcYtl36W/bSzEAgkBC61BibJHoBQX5gm0fdfnZ+I
         mJ4zOK9gXacN8BMzB733tCYeW6g+4OYfp/TGm958Rb/guaagxRp7LMA+0Fwb6jg5ARVA
         en9HSulQkg2Rg1fglqitMIaDZzlEi9kC24pHATHDfLGdymmh/aL4Lb1+0QIOgVU09Rgd
         aEOuUjTt/JJdRrBMWDLi2cvEz1NkHoSuhRZw0oeARGMY9FmBgtxnSq0qc8e+P3g6ldbP
         IlUausj6KxlvpgKH6pS8Dors448+18pik/XQ36Gm60hG/JnM2DMNOu0znS8nDdAqi7qu
         xSLA==
X-Gm-Message-State: AOJu0Yy28gZ2KhnT/JXdwswvCIY0CiFx6shKsbhHIaA5OG2v4OWNoYmX
	yPjrlmmjw9mbFM+6sbSnonNvMkr+E2uyljz9E25N0+BrkK5ADtwnDLw+SWZXpg==
X-Google-Smtp-Source: AGHT+IHewB79tNDYYPPysrECtfUIbLuUo+seUCWy6dAnOzH6MomzFsofGzML4yV7CdDLmHe/epMABA==
X-Received: by 2002:a17:902:e547:b0:1d4:c445:c705 with SMTP id n7-20020a170902e54700b001d4c445c705mr519834plf.26.1706152449565;
        Wed, 24 Jan 2024 19:14:09 -0800 (PST)
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902a5c300b001d755ec4bc0sm5328111plq.241.2024.01.24.19.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 19:14:08 -0800 (PST)
Message-ID: <b46ccaff-fad1-476c-b70d-2c23c484cd6e@broadcom.com>
Date: Wed, 24 Jan 2024 19:14:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 anand.gore@broadcom.com, kursad.oney@broadcom.com,
 florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@linaro.org
References: <20240124030458.98408-1-dregan@broadcom.com>
 <20240124030458.98408-2-dregan@broadcom.com> <20240124183408.245b7bb4@xps-13>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <20240124183408.245b7bb4@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_191412_721967_12F3D191 
X-CRM114-Status: GOOD (  11.99  )
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
Content-Type: multipart/mixed; boundary="===============2981143473348234538=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2981143473348234538==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b54568060fbc9258"

--000000000000b54568060fbc9258
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/24/24 09:34, Miquel Raynal wrote:
> Hi David,
> 
> dregan@broadcom.com wrote on Tue, 23 Jan 2024 19:04:49 -0800:
> 
>> From: William Zhang <william.zhang@broadcom.com>
>>
>> Update the descriptions to reflect different families of broadband SoC and
>> use the general name bcmbca for ARM based SoC.
>>
>> Add brcm,nand-use-wp property to have an option for disabling this
>> feature on broadband board design that does not use write protection.
>>
>> Add brcm,nand-ecc-use-strap to get ecc setting from board boot strap for
>> broadband board designs because they do not specify ecc setting in dts
>> but rather using the strap setting.
>>
>> Remove the requirement of interrupts property to reflect the driver
>> code. Also add myself to the list of maintainers.
>>
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>> Reviewed-by: David Regan <dregan@broadcom.com>
> 
> Please split this into three commits. dt-bindings are hard enough to
> think again, mixing changes is definitely not a good idea.
> 
Will do

> Thanks,
> Miquèl

--000000000000b54568060fbc9258
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIEUqu+Rcpkaet8QkKxks+8dt+a4U
jODKbRw6z02ozxDLMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDEyNTAzMTQwOVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBycHt9XSCpS3F0+VVjshs/KrzqyA3TktjgJ4JBb5dLOc9u
XM3PK/nu5uhN6YeiKztWkc6DYGQ/dLGcj68H4pb0746wkJMY4cosTMvZd72KzyO+Yow2en44KV5f
sxnOdo8pRz/x/54p6+wC3rxZ3usWlumJzojLo6tbbIVyFKsgC4XMebXUL9RYgeE0NezQ7kc5fdDV
fwgK96sI3OEwyM0H19DAslYivYGeAzQeeLPcQEt52pPg4ojW1m2oRIy5xJYyGXO65tx7Eggprmx7
ie3ZKsUEqxDu2YBECilD8Gd7fC7RvbOPBQHG0a+DBDx682gPFi82IzNSK2J/fQ/HkAYf
--000000000000b54568060fbc9258--


--===============2981143473348234538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2981143473348234538==--

