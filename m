Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06151C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTpz3NG4xJBaJPjQJ15bjR/WDJ2tCiaFFTVxdso39go=; b=slxVDRunxBDHLfcVI39bJ5/+kq
	Lsc69w0GhTehyM/KypDLgTjxdW5ouZax16DfM+/wf75zRPQq8vHCkpfL1PPYRSvrfSBK+82cwHFXz
	+SOerUsqlRWAawGOmpEiz7vdLXTUxyEZ3kt2LvA6traFGByxYSJ+oAEYfJV0wKLD9t5AKe8XO3AcL
	jRFlujJnC9svtScFsiwa5KIHeKM71xKSNI1LNKzcJ8wkEy+VmXLr+c/DepeQEG+HK2cqnj40zMICx
	yvmLqjpO7lw5ZFWvA8M70zueCaJ1m4QZMqqrpxq/tEF/2d0bhjKU4tJHN17XaLKoHfF4lC2NuDvGc
	xmDBs4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zM6-00737O-1o;
	Wed, 07 Jun 2023 20:02:06 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zM3-00736m-1d
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 20:02:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-653f9c7b3e4so3557819b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 13:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1686168120; x=1688760120;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=xHijXXV8A+ICphmid+jr0ztAU7c2+tcsA5aI9FHtDhI=;
        b=Qkgp8ER6dEPq0Hy1KWDeeFwnb32Sb+I2YFPP3/Ls0ZCYgbY1pDn0+drNUnY7p0IC+D
         GBCDxqU4qSo6JaQ4PpNF1C3x86mIqouMVGDwNy+LQEO9EvGeB2H1lZ4g1qAQFAkb7Bm8
         Ub4zdr8BGeLM6hOrS7zEU5PrvwHZakbafaUv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686168120; x=1688760120;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHijXXV8A+ICphmid+jr0ztAU7c2+tcsA5aI9FHtDhI=;
        b=R9kOemRL6e2qsiIfs5lZ2kriBJujOxoWSjRyAaErDt7Gld9com/ENMPJ+gWLoorRZU
         NvA4hzFseyVK/oMuYkEYCKFGnCog0uZrN7W/GUkF7HTXKivASHohtlNKfc8axFyNsHpH
         lD3rbGwExfprBFEPpZn5zSMfPDjrBM+uZ7dynWJindt+KVYFXxI+Ih10b9zJS7JldqH9
         yZD+NR5EXQxWa7ePU7ssBFYDSxL9Q6jejvGhnGrHweEkNRlo9WCbzOwGKmxYwNJm+Gpm
         RqdyuCk9Nh3IA4ukOWW45J6rSe7M64wLr64zjp4VOGUHGzdOJRDdZMj3fpXp/q1s0MWT
         3Nng==
X-Gm-Message-State: AC+VfDxqfq9tqrcJBduBFaPpJySw6jE/NWYpPWcDmotU7ACO+EVKnuEY
	ApqjqqjG7RGF723w+1D1N/2i6w==
X-Google-Smtp-Source: ACHHUZ76S9iGqFxaT56LbelPvonoaLiRzWIReq00V7CA+plCKJO7OZoyemHHwLRcvBOOh1aTOwDwrA==
X-Received: by 2002:a05:6a00:a8d:b0:647:370c:2c2a with SMTP id b13-20020a056a000a8d00b00647370c2c2amr4748391pfl.6.1686168119659;
        Wed, 07 Jun 2023 13:01:59 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id q17-20020a62ae11000000b0064f95bb8255sm8821029pff.53.2023.06.07.13.01.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jun 2023 13:01:57 -0700 (PDT)
Subject: Re: [PATCH 05/12] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
 <20230606231252.94838-6-william.zhang@broadcom.com>
 <20230607101452.4c265d7e@xps-13>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <84e97108-29d4-5103-14f4-03e3c0eba165@broadcom.com>
Date: Wed, 7 Jun 2023 13:01:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20230607101452.4c265d7e@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_130203_760733_3AB358D3 
X-CRM114-Status: GOOD (  41.58  )
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
Content-Type: multipart/mixed; boundary="===============5853591465712543303=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5853591465712543303==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d53b9305fd8f9b27"

--000000000000d53b9305fd8f9b27
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 06/07/2023 01:14 AM, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Tue,  6 Jun 2023 16:12:45 -0700:
> 
>> Use new compatiable brcm,nand-bcmbca to support BCMBCA broadband
>> product. The old compatible string is still kept in the driver so old
>> dtb can still work.
>>
>> Add brcm,nand-use-wp property to have an option for disabling this
>> feature on broadband board design that does not use write protection.
>> Add brcm,nand-ecc-use-strap to get ecc setting from board strap for
>> broadband board designs because they do not specify ecc setting in dts
>> but rather using the strap setting.
>>
>> Remove the requirement of interrupts and interrupt-names properties to
>> reflect the driver code.
>>
>> This patch also includes a few minor fixes to the BCM63xx compatibles
>> and add myself to the list of maintainers.
>>
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>> ---
>>
>>   .../bindings/mtd/brcm,brcmnand.yaml           | 64 +++++++++++++------
>>   1 file changed, 43 insertions(+), 21 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>> index 1571024aa119..1fe1c166a9db 100644
>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>> @@ -9,6 +9,7 @@ title: Broadcom STB NAND Controller
>>   maintainers:
>>     - Brian Norris <computersforpeace@gmail.com>
>>     - Kamal Dasu <kdasu.kdev@gmail.com>
>> +  - William Zhang <william.zhang@broadcom.com>
>>   
>>   description: |
>>     The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
>> @@ -18,9 +19,10 @@ description: |
>>     supports basic PROGRAM and READ functions, among other features.
>>   
>>     This controller was originally designed for STB SoCs (BCM7xxx) but is now
>> -  available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
>> -  iProc/Cygnus. Its history includes several similar (but not fully register
>> -  compatible) versions.
>> +  available on a variety of Broadcom SoCs, including some BCM3xxx, MIPS based
>> +  Broadband SoC (BCM63xx), ARM based Broadband SoC (BCMBCA) and iProc/Cygnus.
>> +  Its history includes several similar (but not fully register compatible)
>> +  versions.
>>   
>>     -- Additional SoC-specific NAND controller properties --
>>   
>> @@ -53,9 +55,9 @@ properties:
>>                 - brcm,brcmnand-v7.2
>>                 - brcm,brcmnand-v7.3
>>             - const: brcm,brcmnand
>> -      - description: BCM63138 SoC-specific NAND controller
>> +      - description: BCMBCA SoC-specific NAND controller
>>           items:
>> -          - const: brcm,nand-bcm63138
>> +          - const: brcm,nand-bcmbca
>>             - enum:
>>                 - brcm,brcmnand-v7.0
>>                 - brcm,brcmnand-v7.1
>> @@ -65,11 +67,15 @@ properties:
>>             - const: brcm,nand-iproc
>>             - const: brcm,brcmnand-v6.1
>>             - const: brcm,brcmnand
>> -      - description: BCM63168 SoC-specific NAND controller
>> +      - description: BCM63xx SoC-specific NAND controller
>>           items:
>> -          - const: brcm,nand-bcm63168
>> -          - const: brcm,nand-bcm6368
>> -          - const: brcm,brcmnand-v4.0
>> +          - enum:
>> +              - brcm,nand-bcm63168
>> +              - brcm,nand-bcm6368
>> +          - enum:
>> +              - brcm,brcmnand-v2.1
>> +              - brcm,brcmnand-v2.2
>> +              - brcm,brcmnand-v4.0
>>             - const: brcm,brcmnand
>>   
>>     reg:
>> @@ -111,6 +117,19 @@ properties:
>>         earlier versions of this core that include WP
>>       type: boolean
>>   
>> +  brcm,nand-use-wp:
>> +    description:
>> +      Use this integer to indicate if board design uses
>> +      controller's write protection feature and connects its
>> +      NAND_WPb pin to nand chip's WP_L pin. Driver defaults to
>> +      use this feature when this property does not exist.
>> +      Set to 0 if WP pins are not connected and feature is not
>> +      used. Set to 1 if WP pins are connected and feature is used.
>> +      Set to 2 if WP pins are connected but disable this feature
>> +      through driver that sets controller to output high on NAND_WPb.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2]
> 
> Perhaps strings would be welcome. I'll let binding maintainers say what
> they think of it.
> 
Practically there is really just use cases of 0 and 1. I could use a 
bool flag but to keep consistent with the driver code and in case there 
is any existing usage of 2.

>> +
>>   patternProperties:
>>     "^nand@[a-f0-9]$":
>>       type: object
>> @@ -136,13 +155,23 @@ patternProperties:
>>             layout.
>>           $ref: /schemas/types.yaml#/definitions/uint32
>>   
>> +      brcm,nand-ecc-use-strap:
>> +        description:
>> +          This flag is used by the driver to get the ecc strength and
>> +          spare area size from the SoC NAND boot strap setting. This
>> +          is commonly used by the BCMBCA SoC board design. If ecc
>> +          strength and spare area size are set by nand-ecc-strength
>> +          and brcm,nand-oob-sector-size in the dts, these settings
>> +          have precedence and override this flag.
>> +        $ref: /schemas/types.yaml#/definitions/flag
> 
> How in practice do you access the strap value? Don't you need a phandle
> over a specific area in the SoC?
> 
The strap value is latched and stored in the NAND controller register so 
there is no extra phandle needed.

>> +
>>   allOf:
>>     - $ref: nand-controller.yaml#
>>     - if:
>>         properties:
>>           compatible:
>>             contains:
>> -            const: brcm,nand-bcm63138
>> +            const: brcm,nand-bcmbca
>>       then:
>>         properties:
>>           reg-names:
>> @@ -153,7 +182,9 @@ allOf:
>>         properties:
>>           compatible:
>>             contains:
>> -            const: brcm,nand-bcm6368
>> +            enum:
>> +              - brcm,nand-bcm63168
>> +              - brcm,nand-bcm6368
>>       then:
>>         properties:
>>           reg-names:
>> @@ -173,20 +204,12 @@ allOf:
>>               - const: nand
>>               - const: iproc-idm
>>               - const: iproc-ext
>> -  - if:
>> -      properties:
>> -        interrupts:
>> -          minItems: 2
>> -    then:
>> -      required:
>> -        - interrupt-names
> 
> Why do you remove this? Removing "interrupts" from the required
> properties is fine, but constraining the interrupts property when it is
> relevant is still expected.
> 
There is no requirement for interrupt name even if it have two 
interrupts. Driver code does not use interrupt name but the interrupt 
index instead.

>>   
>>   unevaluatedProperties: false
>>   
>>   required:
>>     - reg
>>     - reg-names
>> -  - interrupts
> 
> This should be done in a separate patch.
> 
I thought this is also related to my update for bcmbca chips because 
they don't need to interrupt and interrupt name.

>>   
>>   examples:
>>     - |
>> @@ -215,8 +238,7 @@ examples:
>>       };
>>     - |
>>       nand-controller@10000200 {
>> -        compatible = "brcm,nand-bcm63168", "brcm,nand-bcm6368",
>> -                     "brcm,brcmnand-v4.0", "brcm,brcmnand";
>> +        compatible = "brcm,nand-bcm6368", "brcm,brcmnand-v2.1", "brcm,brcmnand";
>>           reg = <0x10000200 0x180>,
>>                 <0x100000b0 0x10>,
>>                 <0x10000600 0x200>;
> 
> 
> Thanks,
> Miquèl
> 

--000000000000d53b9305fd8f9b27
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIA13auqOgod+E8Qygi6bk4Ts5L77
dS+70593hlm800LdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDYwNzIwMDIwMFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCFsg3kR8yr/3lnoMTJ3GeyQ81HnNMB//Txg/WgZ5V3AA3v
kqXS/UaqbbEHrtYr3+UCA7u4WWw4IpyBdhafeqP2a7QaIDHc7ofL0qMtA9yTdsLGiFWW0ek7evuY
aRQFQGvVCqYRpjFqaK6P6RqviTnoRe7dejEw29nj5BzfojyvfgfC/5pYMavFocohnbkPBelCb3nE
HTijeOmjNZqJMZ1sNI01FYQTgTl01b5FypX2rNVU0jV6FUIGmom6WVs9eEkOcD8tEb+e2gIADv8m
d4KS+uWn8Pjh02pEEHV+PuMS3m5mCqvBmD03iGTJ02/ew33rj7Qr2amYqh5Sv/nqACcu
--000000000000d53b9305fd8f9b27--


--===============5853591465712543303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5853591465712543303==--

