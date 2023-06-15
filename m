Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A11CEB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 00:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WQPHUqCFX3cFQy9jXNM24ciHayZ75XNo8Dhn+Tu0XY=; b=I0lCSJKOb5Loa+n3yIZq8ctHfn
	Y2pH8cWKTo2vUotWlDIj29B84QW4B7Jwg7aKekVqnx2+7reZERH+fLWp0ervpRNzAB5zX1w7so5B/
	0vgSr9ZeFDP7K5F49AAgHWioV4gLDT6iRumvPnJ7eyzjmVuoGP3EzJmfqBZpeQafV60Ch+2QIYk2D
	5VXVk2YfVNB7zdAAcFcl+YpJWoss1cUKG+DIZvr4Fhx/hntuNFjg/fL7zUE6wscgiqAQqk1aUJ9/0
	TkizfHWzc+58PNfZWG0mMaHNlwxs79Uz5PbteuT/fOY12wethCcFO3a7slnFnihH56HrI1JPWrjiY
	ml65nQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9b2v-00DAc6-2T;
	Thu, 15 Jun 2023 00:41:05 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9b2r-00DAbP-27
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 00:41:03 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3f9eea9d0a1so25184251cf.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 17:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1686789660; x=1689381660;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=3VtI3yWrQqBNppPOseEUXk7DmR1+RYBBSAxlmLPyPRA=;
        b=fpPfYSKUYz6Bs/O8F/ROyvTlhY26a5w4cAO982ZvZSCE9ybGfp/SUgOafmCL8RRp/S
         U6LE1DV3RnxGcHOs4VF/KJ6ZS7paskyZRSFZl4Yyq9+rZIDBRxGsumPq/eECrOY1vgxo
         bbGXxQU/qZzIubrV/1j0lxeX0Hkr2G+fd6IjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686789660; x=1689381660;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VtI3yWrQqBNppPOseEUXk7DmR1+RYBBSAxlmLPyPRA=;
        b=WdITt7TObaZ9ncQoGvBLQDYP4+aL5mZ9wWAMVsqfDCKHc+QBtdlEfY0XkTMALHfmX9
         hrJmwsyOl6S4zajvhJDQeFOD7J6nMPUhB5Ue32REzt/N1xoGkAGnVKfSsCvhy+uCyFeQ
         V4WdOGZujp0Z7oLj1SzLT7haCAq6vSYDlqPPvbj+VnUe/lYpoOWarkWo6zoQz25ZUqz1
         IMqnHF4cNjZUlMiMnjIlbpD9Av/+D6OBFby93AQqMAi/gbZq4kdekOg0hJ4Rm3E3ZQvg
         3XEOERxU5jiW5b1FUYbhWjLg0DKG6mTvoTJYrYauOL7xXpnJh6v9JaQgwhgTHlkBUV4s
         Yo7A==
X-Gm-Message-State: AC+VfDxsbG89keEwrzMT2nbULHlKI8ef/LDD5u3oUDSPq670ZknwPXr1
	/vJ26SedUGF8RQuXEo1F7KTQQQ==
X-Google-Smtp-Source: ACHHUZ4SW7suYJRETsMfGnkWcan/YnzezUP+Ky5UHqcP/jKYy0jYkqKhescJ6SFlOqEAD60BB6dGNw==
X-Received: by 2002:a05:622a:13:b0:3f9:d619:bb1 with SMTP id x19-20020a05622a001300b003f9d6190bb1mr4570649qtw.7.1686789660248;
        Wed, 14 Jun 2023 17:41:00 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id o16-20020a05622a009000b003ef2c959d1bsm5519507qtw.67.2023.06.14.17.40.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2023 17:40:59 -0700 (PDT)
Subject: Re: [PATCH 05/12] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
To: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Kamal Dasu <kdasu.kdev@gmail.com>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
 <20230606231252.94838-6-william.zhang@broadcom.com>
 <20230607101452.4c265d7e@xps-13> <20230614224605.GB2990941-robh@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <d9eea504-d030-7d5e-247a-1c06e525e048@broadcom.com>
Date: Wed, 14 Jun 2023 17:40:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20230614224605.GB2990941-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_174101_701129_2CF0D352 
X-CRM114-Status: GOOD (  25.99  )
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
Content-Type: multipart/mixed; boundary="===============0550559954247272655=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0550559954247272655==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000087230a05fe2052bd"

--00000000000087230a05fe2052bd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Rob,

On 06/14/2023 03:46 PM, Rob Herring wrote:
> On Wed, Jun 07, 2023 at 10:14:52AM +0200, Miquel Raynal wrote:
>> Hi William,
>>
>> william.zhang@broadcom.com wrote on Tue,  6 Jun 2023 16:12:45 -0700:
>>
>>> Use new compatiable brcm,nand-bcmbca to support BCMBCA broadband
>>> product. The old compatible string is still kept in the driver so old
>>> dtb can still work.
>>>
>>> Add brcm,nand-use-wp property to have an option for disabling this
>>> feature on broadband board design that does not use write protection.
>>> Add brcm,nand-ecc-use-strap to get ecc setting from board strap for
>>> broadband board designs because they do not specify ecc setting in dts
>>> but rather using the strap setting.
>>>
>>> Remove the requirement of interrupts and interrupt-names properties to
>>> reflect the driver code.
>>>
>>> This patch also includes a few minor fixes to the BCM63xx compatibles
>>> and add myself to the list of maintainers.
>>>
>>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>>> ---
>>>
>>>   .../bindings/mtd/brcm,brcmnand.yaml           | 64 +++++++++++++------
>>>   1 file changed, 43 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>> index 1571024aa119..1fe1c166a9db 100644
>>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>> @@ -9,6 +9,7 @@ title: Broadcom STB NAND Controller
>>>   maintainers:
>>>     - Brian Norris <computersforpeace@gmail.com>
>>>     - Kamal Dasu <kdasu.kdev@gmail.com>
>>> +  - William Zhang <william.zhang@broadcom.com>
>>>   
>>>   description: |
>>>     The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
>>> @@ -18,9 +19,10 @@ description: |
>>>     supports basic PROGRAM and READ functions, among other features.
>>>   
>>>     This controller was originally designed for STB SoCs (BCM7xxx) but is now
>>> -  available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
>>> -  iProc/Cygnus. Its history includes several similar (but not fully register
>>> -  compatible) versions.
>>> +  available on a variety of Broadcom SoCs, including some BCM3xxx, MIPS based
>>> +  Broadband SoC (BCM63xx), ARM based Broadband SoC (BCMBCA) and iProc/Cygnus.
>>> +  Its history includes several similar (but not fully register compatible)
>>> +  versions.
>>>   
>>>     -- Additional SoC-specific NAND controller properties --
>>>   
>>> @@ -53,9 +55,9 @@ properties:
>>>                 - brcm,brcmnand-v7.2
>>>                 - brcm,brcmnand-v7.3
>>>             - const: brcm,brcmnand
>>> -      - description: BCM63138 SoC-specific NAND controller
>>> +      - description: BCMBCA SoC-specific NAND controller
>>>           items:
>>> -          - const: brcm,nand-bcm63138
>>> +          - const: brcm,nand-bcmbca
>>>             - enum:
>>>                 - brcm,brcmnand-v7.0
>>>                 - brcm,brcmnand-v7.1
>>> @@ -65,11 +67,15 @@ properties:
>>>             - const: brcm,nand-iproc
>>>             - const: brcm,brcmnand-v6.1
>>>             - const: brcm,brcmnand
>>> -      - description: BCM63168 SoC-specific NAND controller
>>> +      - description: BCM63xx SoC-specific NAND controller
>>>           items:
>>> -          - const: brcm,nand-bcm63168
>>> -          - const: brcm,nand-bcm6368
>>> -          - const: brcm,brcmnand-v4.0
>>> +          - enum:
>>> +              - brcm,nand-bcm63168
>>> +              - brcm,nand-bcm6368
>>> +          - enum:
>>> +              - brcm,brcmnand-v2.1
>>> +              - brcm,brcmnand-v2.2
>>> +              - brcm,brcmnand-v4.0
>>>             - const: brcm,brcmnand
>>>   
>>>     reg:
>>> @@ -111,6 +117,19 @@ properties:
>>>         earlier versions of this core that include WP
>>>       type: boolean
>>>   
>>> +  brcm,nand-use-wp:
>>> +    description:
>>> +      Use this integer to indicate if board design uses
>>> +      controller's write protection feature and connects its
>>> +      NAND_WPb pin to nand chip's WP_L pin. Driver defaults to
>>> +      use this feature when this property does not exist.
>>> +      Set to 0 if WP pins are not connected and feature is not
>>> +      used. Set to 1 if WP pins are connected and feature is used.
>>> +      Set to 2 if WP pins are connected but disable this feature
>>> +      through driver that sets controller to output high on NAND_WPb.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1, 2]
>>
>> Perhaps strings would be welcome. I'll let binding maintainers say what
>> they think of it.
> 
> 1 is redundant as it is the same as not present. Seems like a
> 'brcm,disable-wp' boolean would suffice here.
> WP feature present is indicated by the existing flag brcm,nand-has-wp. 
1 is the opposite of 0 (use this feature vs not use this feature while 
chip has this feature). 2 is kind of strange (for feature disabled 
intentionally at run time while feature is used), maybe for testing 
purpose or for certainly nand chip that has issue with WP but the board 
design already connect the WP pin. I keep it here to match the driver 
code that have these three states of the wp usage.

> Rob
> 

--00000000000087230a05fe2052bd
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEILrNS2ICHKrGZun0TnbQW5BL5G8F
+m/68BQeL9Gh3NvQMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDYxNTAwNDEwMFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCb9bdp/gwe93Odl6GNA0m1h7zDi+630q5BnYcxm0oeQvU9
hjcg9wqoU0LcNha6Ca2Jf2N01kHXP9p+8xkz58/0tJWvR/Jb9WQcStgsRDOJmk/459VD4idasbaC
GuUm5/1X/TVUmcGMx3PcaU0czbRYMngDayF2jtdI1cQUlXjQGApCm9aR7kjvYygKRNGZtysSOotN
GYCX0YOcArLZ2zU29kD1ngiH5T67RS+Uf8YGXphmWGyfI0TQMPwEQgCFXUVBRVO4fpYqo4C1WYBX
8NosRIdw+KRK5CxvfN/ParL+yVCfMdSdfqF7UI4BkGSFfr7ibPqZSjUdw5W0601FK0uo
--00000000000087230a05fe2052bd--


--===============0550559954247272655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0550559954247272655==--

