Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35F8C54788
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 16:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dM2IssIqnh0k9fIhP6VlbmkUEVfB32X4AZJ7weiGcoY=; b=HLQ/qIBSAT1Upu4BVz1MtdREpG
	N21tlcJSL947jyDn43Oo+vtGi5FCvtqPZUJtor2U33IgCRfcbORp05KmuzrVVeq+MpdbAI60OH2F/
	rt/TIyEuCvXvB3NMN3Lq9pW3ofYxomuit/iV6YpO8sJ87gTIHL65trt/5R3BjzY37pys5TWsALRq4
	bNT/hIE3U+bF22mc90QOkI9mGtRz+gchDYbpbBzv00USk/ce7splnw76B3SJrsw5jDlVB+07HmSFs
	WFm6NLZ/Z/iNKPoCDeC1cJWSsvjaXWl2QdicNQHgtAQGORnVve+UiBS04Snu6sokjx0JSJLVYHNPt
	mW1unPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBp0-00000005aQn-3pU2;
	Thu, 22 Feb 2024 16:21:18 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBoy-00000005aPY-0hjp
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 16:21:17 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3c031c24fbeso1407190b6e.3
        for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 08:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1708618875; x=1709223675; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A1uM0H9n8dsAcC+0rwyFCSIZL1AJSzk34muAm05NQZg=;
        b=XILYFRAmoLMYTDvq4Qpih3HDdlt3QLQwbT0ghIW1AmdjU9hcD0jsdBwU34w5Yh8Nbe
         Aa5Y2VEeD3Kz0FqjrfeoQpQf2+RvcBsJs+lcaSXuQD+B2jJe0z3aRu+T4DQMlArlcwAr
         iu5a+vSn5wS0DZXb0CPgAgoKONLaeOu0eEg3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708618875; x=1709223675;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1uM0H9n8dsAcC+0rwyFCSIZL1AJSzk34muAm05NQZg=;
        b=Ii9vvJBqCJnojcMPv4fQJHWLMW0jj9Ny3IgySKwOENYJINiA3ex+yBvMjaHk8fSR7Y
         4/nG3IFG+MBNGY2NAgcjp8dQN+pHsjeI31F0fA4HSOV4tAjqSiSBoRw25hCwGMLd7Zhe
         WON4fGx2NNUrI2blLg3VFU12BiYUpdw7H5LLVVusyNjgISfmO3g62ESITzNWnMlryXSy
         cxDViQjlkJyrs6DQhHwfBLTCU3nOzMny2G+Kv+coQFOKEv7yd5GTLqmWuMLBlaaS1ykj
         okCq26p1Md6rp8TZYRMDQ7MMvPCDF+aAFfNsfRSLteJgYDJDoix99hsZccwIOfixo2YX
         iucA==
X-Gm-Message-State: AOJu0YzJawAZmoEqO6R0PEGyZKhnD/1biJGaqhfFekXEejOvNdKElNwE
	RoyWctvWcCWq+5a5g2nsH5RHsf8rt186z9uy4sRp0aUTGnINXEyiKM9o/dQCRw==
X-Google-Smtp-Source: AGHT+IHWWzIo+0EQiVxM2OCt4bOm7z1ywHNuv+p61MQ+W9WdK8KJJ4DRb+X8XgRyKTOpxEapw7/+rA==
X-Received: by 2002:a05:6808:487:b0:3c1:1398:9eca with SMTP id z7-20020a056808048700b003c113989ecamr19530704oid.28.1708618874859;
        Thu, 22 Feb 2024 08:21:14 -0800 (PST)
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id ol10-20020a0562143d0a00b0068f0ff36defsm2501115qvb.47.2024.02.22.08.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 08:21:13 -0800 (PST)
Message-ID: <e32c59d7-62bd-4a8d-b2ae-0d73d2f6d90c@broadcom.com>
Date: Thu, 22 Feb 2024 08:21:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] arm64: dts: broadcom: bcmbca: Add NAND
 controller node
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 f.fainelli@gmail.com, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 David Regan <dregan@broadcom.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-6-william.zhang@broadcom.com>
 <cd32d304d740e3c1875e449d459c805a@milecki.pl>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <cd32d304d740e3c1875e449d459c805a@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_082116_277438_FD4B77E4 
X-CRM114-Status: GOOD (  14.69  )
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
Content-Type: multipart/mixed; boundary="===============0816685243898426822=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0816685243898426822==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001cc34c0611fad542"

--0000000000001cc34c0611fad542
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rafal,

On 2/22/24 00:27, Rafał Miłecki wrote:
> On 2024-02-07 21:22, William Zhang wrote:
>> diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
>> b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
>> index 2f124b027bbf..336016e334d9 100644
>> --- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
>> @@ -589,7 +589,7 @@ hsspi: spi@1000 {
>>              status = "disabled";
>>          };
>>
>> -        nand-controller@1800 {
>> +        nand_controller: nand-controller@1800 {
>>              #address-cells = <1>;
>>              #size-cells = <0>;
>>              compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", 
>> "brcm,brcmnand";
>> @@ -597,7 +597,7 @@ nand-controller@1800 {
>>              reg-names = "nand", "nand-int-base";
>>              interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>>              interrupt-names = "nand_ctlrdy";
>> -            status = "okay";
>> +            status = "disabled";
>>
>>              nandcs: nand@0 {
>>                  compatible = "brcm,nandcs";
> 
> You disable NAND controller here breaking support for all dependant
> devices.
> 
> I see you fix it afterwards in PATCH 06/12 but it's still a poor way of
> handling such change and this issue can be hit e.g. during git bisect.
> 
> Also: given that 99% of BCM4908 devices use NAND controller can we just
> save ourselves efforts and keep it enabled in .dtsi?
> 
I was trying to fix this according to the dts convention per 
maintainers' requirement(only enable the node in the board dts, not soc 
include). We have 100% of BCMBCA devices use strap for ecc but we still 
have to put the property in board dts.
I understand if someone try to bisect the commits, it may hit the 
problem but this will be very obvious that controller is not even shown 
in the boot up so hopefully it is easy to figure out.  Anyway if 
maintainer(Minque and/or anyone from device tree side) is okay with your 
request, I can change it back to enable in the dtsi.

--0000000000001cc34c0611fad542
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEICM9OY8pGVIJk59OqI1ibr4p/3Mc
wM8isYkqrA9ucA2lMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDIyMjE2MjExNVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBUQDKQD4VXaIlym9erM5eHTdaoKOPTZTVuiGnwhsddlzhK
5ztHYdO25WQglVYlLfeWxGsMNbjlbNLIJpaKeCc7ESmDPc+rn8ZwS491Lee2H72SSrqPrHHxA7ca
5ivrHqpgNukxRJr9Pk7griQaollGRNaxyvwXri5JqpBv3I02dn2kPAn9BgfWHzBBN6iWQEy7Oas4
fqLSXLbg7ib2b3w8YvqcgSL+TvGQF6fKO35r80IkoTxUkqP14uXbfAgGCV1qPnknR4jPtVojKAac
URw4HfxoMdLswhEI8R01PjfKlWY/RnaQZC/JIZnTbAGcefc20kXH0EvFYuNwJ7Gzirkr
--0000000000001cc34c0611fad542--


--===============0816685243898426822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0816685243898426822==--

