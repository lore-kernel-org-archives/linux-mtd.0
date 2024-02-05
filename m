Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB40C48292
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGffH/IE639ML7n+ekYFEW2B9Mc3RYL4QPlWsowYECs=; b=5FI8D6n5kextUC/J2ejhCpt9xd
	W7PhHzodhIgrycBTqwqhP3bQvnhGgpM4xFt7cbTDeqeQm6LcuSriBC9r59g27UFbcPNfGsfUh16Ef
	xkZNeANVg3FIuQBgJokRShWF8vpuj3T4vyOTBz1vbsU12uDesNVuz5kNJvyfIU+NbwnvaSHG2rzND
	uLDat/awRSg5BaE4TzJ4YWz8ylgsXvcr4zbFJ6cmBcYRKLd0Pn0J0jGxdOxDuMk6gvbsYAm6v6clP
	oX4JGBqfJQH6FN6344ZvcNiULBqqvoAnbrQHyQpC8+CDmvkmdoNL3aPb0xfM3+Wl+4JX/p/xgmSm2
	IqN2JtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3LW-00000004Iug-0p6X;
	Mon, 05 Feb 2024 18:05:30 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3LS-00000004Irt-35dL
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 18:05:28 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-78407987510so196199385a.3
        for <linux-mtd@lists.infradead.org>; Mon, 05 Feb 2024 10:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1707156321; x=1707761121; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jOr0HQl0rPYamFE6kqRkqwG0VFVB22YGXqSqkvQT6vM=;
        b=JrN9Z6Lt+WHa+GRFf6OXZ6clUwTMtNmz9+vov7qTePG3Ol9cDf0QAwYbtXrg7UQckK
         ipD/VA8NkueWKeBpDUXrxl83ZIa+QnIP2L4qJ0iupWfTwuxsye4u6eYF2cLFdSeMn08P
         jGqcPA28wOTLe63C/UwAVO/v6dIMjJblImmig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707156321; x=1707761121;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOr0HQl0rPYamFE6kqRkqwG0VFVB22YGXqSqkvQT6vM=;
        b=m+u8FjBku3nMg1ioLQy6Q7BM4VckMXLu/TfdANEGyU9m/XNR2q/aR5OqgXOcwfPTet
         OHz+XxLH8Yg6jm1YSemXLbMGm2Rf66b4XbDAnWKfBdcfeAaSQgHqY14jXB0mtywYZ523
         2Zf27Isdvm+qcXhIWwImiPVel5N1/TYnZtU4p8LkFMlrvfXf6WskkZbPzT8+HIsbvKPh
         i88E1Agcx/4rzJ/cwaV5ZaNgMKzrZfPcT/WVjwyY+LW67MlNGyjcZCAFKYe/rAcfjr1u
         5q4fM3ONdZfwzA38vqFIM+ikSRjKMTzybLTgCWLlVQEVMHjMMlNcqN4VFLWxF2w8K29l
         4y/w==
X-Gm-Message-State: AOJu0YxgluK+Eh2mWl5XG6c/r38OfxOmDaZTznluAOm1YDw36fyANd7H
	5RAGpjP4AMG7U4b918DogrRfL/6SM41+oH6QZjIORssyocYluw1HOE1iH/X5NQ==
X-Google-Smtp-Source: AGHT+IHJOrG26UXg1GYrtgDsisBbqw4bUF1Iq+0bdiUtoBxha/UeZvQnBtl5u7pUiPolSadieaNBrw==
X-Received: by 2002:a05:6214:20a8:b0:685:98fd:f165 with SMTP id 8-20020a05621420a800b0068598fdf165mr130206qvd.49.1707156319110;
        Mon, 05 Feb 2024 10:05:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXSnHQHIIeSV8QfzImLfo92wxRWfKadXEqGpluDeq1P1x2FB6Cv+m/nkbmMSMVLwuJyh3iHY+rg657QpRCpUgKwjwOAvVQUNWSk966I+RaPvJ1V8T/NDdtGpZHL5TGR6z2jDtx1jNyMHkLfCMjKejZQPL9NlxMnuTSXRApl2uophyf9+LmiMojvhp3j5w+MuU7jgtpExoq+hsDSHVzkCGfCYqLooYI1ewmKITQmAsfwqtT/uZTpe5q8Jc2WDqmpa79yrQjnDDhc6N4c37j0gSsO0qywmgFXo9xl+G5j9H7bTBmvdMGJw5DywWDsd0tftE94EYuluHD1LjE4/AssY80p8oLwo2BeN5pOQwemmgDwrew1taeiY0IGdouJK/sqCkJNI0/Qp/hlbkTQlJGkUQXexLkrtcA1z+4v+spxWFne5Tr/tEjFtJf0PEmzf3bhgDg0viCkpuKTxW3t8QTLpm9Ghd7F4fjBkNV+GDa0DGtfbpRYou+Ttl1XS2tnU9lf7UGtyGRmyZ8Za7KYvXQ56GXQNPwehOU+9VQ14kIzEj/TWPjLnWO3h+uxinctWlaz33uEK2AG+Pd0nCpSzjcpBEzZXr8bXPNUCfMmTMkoHIS/uQjefvHgHXDxfEMV9Dm33RiOqHLnT76kqAW/fS0MhSvsbgYhSmND+HpLUPgEHXKIWIPMF+UhtIRJdI86zzODFXSDkx2bZSH2OjEDj7vK9ot3w4+LbIoUOPF5LQ6i
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id lg6-20020a056214548600b0068caaba0e6dsm202211qvb.22.2024.02.05.10.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 10:05:17 -0800 (PST)
Message-ID: <ce15922e-4292-41d6-8c5f-2b4fbfa83d5c@broadcom.com>
Date: Mon, 5 Feb 2024 10:05:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] dt-bindings: mtd: brcmnand: Add ecc strap
 property
To: Miquel Raynal <miquel.raynal@bootlin.com>, Conor Dooley <conor@kernel.org>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 f.fainelli@gmail.com, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
 <20240203002834.171462-4-william.zhang@broadcom.com>
 <20240203-expenses-tarmac-c564bc7ae34f@spud> <20240205142639.5d7c70f0@xps-13>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <20240205142639.5d7c70f0@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_100526_860744_705C720F 
X-CRM114-Status: GOOD (  23.65  )
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
Content-Type: multipart/mixed; boundary="===============3796974320414726773=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3796974320414726773==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001820380610a64ed6"

--0000000000001820380610a64ed6
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 2/5/24 05:26, Miquel Raynal wrote:
> Hi,
> 
> conor@kernel.org wrote on Sat, 3 Feb 2024 14:49:50 +0000:
> 
>> On Fri, Feb 02, 2024 at 04:28:24PM -0800, William Zhang wrote:
>>> Add brcm,nand-ecc-use-strap to get ecc and spare area size settings from
>>> board boot strap for broadband board designs because they do not specify
>>> ecc setting in dts but rather using the strap setting.
>>>
>>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> - Move ecc strap property to this separate patch and remove some
>>> non-binding related text from the description
>>>
>>> Changes in v3: None
>>> Changes in v2: None
>>>
>>>   Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>> index d0168d55c73e..2599d902ec3a 100644
>>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>> @@ -147,6 +147,14 @@ patternProperties:
>>>             layout.
>>>           $ref: /schemas/types.yaml#/definitions/uint32
>>>   
>>> +      brcm,nand-ecc-use-strap:
>>> +        description:
>>> +          This flag indicates the ecc strength and spare area size should
>>> +          be retrieved from the SoC NAND boot strap setting instead of
>>> +          nand-ecc-strength and brcm,nand-oob-sector-size or auto detection.
>>
>> I'm still on the fence about this being overly prescriptive about the
>> operating systems behaviour. I think it would be good to say why the
>> strap values are better than those explicitly provided in DT rather than
>> just saying "these strap values should be used".
> 
> I don't know if there is a point is saying why they would be better, as
> they are not. It is a -questionable- design choice. However I would
> just get rid of any mention to other properties. Just say one should
> expect the strap value to be read and applied by the system when this
> property is present.
> 
Agree we don't need to say which is better as it is just a design 
choice. And it is used by all BCMBCA internal ref boards and customer 
designs. But if we just say strap value is read and applied, it is vague 
and nobody would know what is applied.  I replied this email yesterday 
and suggest the followings:

This property provides a choice for retrieving ecc strength and spare 
area size from the SoC NAND boot strap setting. It is commonly used by 
the BCMBCA SoC board design.

Hope this make everyone happy and we can move forward.


>>> +          This is commonly used by the BCMBCA SoC board design.
>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +
>>>       unevaluatedProperties: false
>>>   
>>>   allOf:
>>> -- 
>>> 2.37.3
>>>    
> 
> 
> Thanks,
> Miquèl

--0000000000001820380610a64ed6
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIHovBHqM1raO73r4nriO30FZPHL0
FuDLyNt5OBJadNpKMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDIwNTE4MDUyMVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBvBtnB6V3ghKjztyH2hKRlrJpbRu0U1UAs2mTATElzMKeH
4TmKc3Shekh2jM7mSYg25B+d6qw/HG2a/+NTmahWF1p0nAj3XB7g+4dlmP6qN4GWgY1OnxRlGLu9
duXFxtLTZvWDcYG39//+3RUidw+JFhNM3IzQNCm0b2WpWnx/bzDz8Ugj9JtQOhamJT+HeadA539O
Y8+Ianzl0PWF7jKDXUHJUcOK6I8jREDF0M4It2iAqYwqdL+/jJxmFZEUs4dWSap6BI5c8vMBJLs+
xMPesKKMwYdzYEUsiFEgIxVuifm6SAqMaKEXPUVgQnOSyeyeJ2VF9jbRE1WDkclhiMwt
--0000000000001820380610a64ed6--


--===============3796974320414726773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3796974320414726773==--

