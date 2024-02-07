Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA69C4828D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Feb 2024 02:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E955WG0qiI3scgcMZrxZCeczJ5WL+Ar49mY+1pZGOQk=; b=Rgmxm9tU3JwIiz96pvwaJc3d/s
	WUaaUBqTsDXtXZ0LrF4oEfcNzsEVp1OX2c7wlUyx08Z9OPLtpJWpaBzHJ1i2hONTFyqV7iKm63Xkf
	i2ZHui/qcf99KSn4G2kv5Gm0YhFfxyC9ZF/Ceft8PWBIS+Xsq+Q8c+lUqJnI+VtfGXsoJA/TpWCiJ
	wbsc84Sgn+/6gMlQIwcySlOAPzo7PzviBtGLakq8Eg0CXP6f9qCf1y0xLOhyY9ZdPfi/a8KxMSc/h
	BDIHJ62dbs21NpRvuLq+GpVp0bHn/yPwNUiK8C6glWnPfoVoUiXdr5L3dB9GPJywH5rte9AAfmd0A
	pFF2aUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXXZb-00000009SY4-2Kvn;
	Wed, 07 Feb 2024 02:22:03 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXXZX-00000009SX7-46PG
	for linux-mtd@lists.infradead.org;
	Wed, 07 Feb 2024 02:22:01 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-42a0ba5098bso497801cf.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Feb 2024 18:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1707272517; x=1707877317; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hNZzj4IhzIgKVZ8zZxqK2xAFI6OttPKbKjzbt9CFX48=;
        b=KdSB6Cudytqko+1iiVGfX3e7NAG1k3KrPYDYXcKJCqh2vWV84RHuU/cHcSy1L2nL3G
         h8snxwgtUskYTtfNtM3r0tuUHv6KuH+5Z6qULesfGV6S5113F1HXvPw4+eDSP9IQK4/i
         c1tRjmvPNnZPqi3W7UzZVojcHoNig6iSdf6W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707272517; x=1707877317;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNZzj4IhzIgKVZ8zZxqK2xAFI6OttPKbKjzbt9CFX48=;
        b=rqGmsxM/awgXE5fripGW2jZNgHXTN7lC7+Dht/WT8b+CUjA9pMpQL8/h4iKAs4SZD+
         EXSSxoP8BH2Xktx7m56LTgk/YKNvXMnxnR6iK0nrsh1emyW9BdJCwqTTCalh7p4cMrPR
         Hh8W8Q7i+Q2vNk4VC2fbVfrp3IPHjmqeiWQLW1MLORrXIwEhicdFTJctvkcWsMIW0+zY
         HIFDukApnwj78pgBCEoN9bD+xQm7Cpd/b8vpqesG2hivvZNIMXDUkqHcgE5Ocfr/pEh2
         9dkuXYekY98jxWuirixMIrAhBsYAQvEqm1U0W247SOfD7A8MmBSEF6y81oh8HBBs7Zx5
         keiA==
X-Gm-Message-State: AOJu0YwCUIPD38dr5pX8U24dVRns/pf5EY0R8cSTZ4VYXPWywaWK6G81
	2yQ4pmZwQJuDM+Y5HzId2aIwdDYcPhL3f1wIez7YA/eRRFRrcq/cyHYneMWqYQ==
X-Google-Smtp-Source: AGHT+IFHxpBKqU/LZONSi0Bp6d0fDUaqgDHs6WoTtI6vmkdRTjErWkjxirbzqpgRc48uAmFLQ823zw==
X-Received: by 2002:ac8:5b92:0:b0:42c:b61:ef3c with SMTP id a18-20020ac85b92000000b0042c0b61ef3cmr4498599qta.43.1707272516803;
        Tue, 06 Feb 2024 18:21:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvzG0DHnHwJCvMf+xtuQOQyIyeZ28UWpvFZPskQgn6NAxMVHi5DQrBfV8NH0YjfWCzgM8ypCM41TVXMscnDBMVlbKTaHJ8F1tazBghGS9ZU2ow8tEbPZvjpfLBYuwCOVCH5CvQLL4zbOMjX73ez68Q4xCg/v8z/fPzNj06AOE5FLmzX7mBMO1+jfITFPjaWGP3qWoWGd5MpubKOH2qj69jq56PX6KqeqitTg1socWQTaL6aRvfYvVmpx4bLM4tsX0gZSX1uzpVLv34pb9Qczvxcm64qIvbvqm0FA8tw8BZYTCDVLFMDG5xIFphxEKzsfcnsEYaNS0FjozucagBGhbDZ4smAaTSxac0u0qXa877xb+6SChQK5ZSguMo4AJ2vJfLXlgJjAkx0imcAKxi6l9phFgs9m5Zcg+mlTUEfcafMA4N4zsELZzmZNtNxWrfsHJDiobdGWkELC0+H2n/T53vwcGsXm0svt67s8a3ABR5U2s4aQcpgbXti0+SWhUPubN1EV6/kUNbp/THTVTWoX2fYi/99jxIPw5hxNaVmg+yE7Lgwl38yOzoQ2CYwX11WkxIsGDe8U3Iikc7cOscTS78EgPhHfdCnVXdNm+6Mg5/SgD8+sqLNm0E23Q5x1SLD8yP8s4m9f1GHF1Vm9CanEjLOdP00CozWyv0hIF+bbqwiv6EyT1upbEYru7vYCG/qOh83YDvaLM6qKUJn0A4i6koXHGrCg==
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id z8-20020ac87ca8000000b0042992b06012sm108957qtv.2.2024.02.06.18.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 18:21:55 -0800 (PST)
Message-ID: <376d63f1-fd01-4fc2-a8fa-d59361910f3d@broadcom.com>
Date: Tue, 6 Feb 2024 18:21:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] dt-bindings: mtd: brcmnand: Add ecc strap
 property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>,
 Linux MTD List <linux-mtd@lists.infradead.org>,
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
 <ce15922e-4292-41d6-8c5f-2b4fbfa83d5c@broadcom.com>
 <20240206103453.7ac23384@xps-13>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <20240206103453.7ac23384@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_182200_075106_AA1C1E2B 
X-CRM114-Status: GOOD (  28.59  )
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
Content-Type: multipart/mixed; boundary="===============5904469600756610323=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5904469600756610323==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000eb75a90610c15be4"

--000000000000eb75a90610c15be4
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/6/24 01:34, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Mon, 5 Feb 2024 10:05:14 -0800:
> 
>> Hi Miquel,
>>
>> On 2/5/24 05:26, Miquel Raynal wrote:
>>> Hi,
>>>
>>> conor@kernel.org wrote on Sat, 3 Feb 2024 14:49:50 +0000:
>>>    
>>>> On Fri, Feb 02, 2024 at 04:28:24PM -0800, William Zhang wrote:
>>>>> Add brcm,nand-ecc-use-strap to get ecc and spare area size settings from
>>>>> board boot strap for broadband board designs because they do not specify
>>>>> ecc setting in dts but rather using the strap setting.
>>>>>
>>>>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes in v4:
>>>>> - Move ecc strap property to this separate patch and remove some
>>>>> non-binding related text from the description
>>>>>
>>>>> Changes in v3: None
>>>>> Changes in v2: None
>>>>>
>>>>>    Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 8 ++++++++
>>>>>    1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>>>> index d0168d55c73e..2599d902ec3a 100644
>>>>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
>>>>> @@ -147,6 +147,14 @@ patternProperties:
>>>>>              layout.
>>>>>            $ref: /schemas/types.yaml#/definitions/uint32
>>>>>    >>> +      brcm,nand-ecc-use-strap:
>>>>> +        description:
>>>>> +          This flag indicates the ecc strength and spare area size should
>>>>> +          be retrieved from the SoC NAND boot strap setting instead of
>>>>> +          nand-ecc-strength and brcm,nand-oob-sector-size or auto detection.
>>>>
>>>> I'm still on the fence about this being overly prescriptive about the
>>>> operating systems behaviour. I think it would be good to say why the
>>>> strap values are better than those explicitly provided in DT rather than
>>>> just saying "these strap values should be used".
>>>
>>> I don't know if there is a point is saying why they would be better, as
>>> they are not. It is a -questionable- design choice. However I would
>>> just get rid of any mention to other properties. Just say one should
>>> expect the strap value to be read and applied by the system when this
>>> property is present.
>>>    
>> Agree we don't need to say which is better as it is just a design choice. And it is used by all BCMBCA internal ref boards and customer designs. But if we just say strap value is read and applied, it is vague and nobody would know what is applied.  I replied this email yesterday and suggest the followings:
>>
>> This property provides a choice for retrieving ecc strength and spare area size from
>   the SoC NAND boot strap setting. It is commonly used by the BCMBCA SoC board design.
> 
> What about:
> 
> This property requires the host system to get the ECC strength and step
> size from the SoC NAND boot strap setting. This is a common hardware
> design on BCMBCA based boards.
> 
Sounds good.  Will update.

> I would also like to constrain this more by adding an exclusive use wrt
> the nand-ecc-* properties. So either you put this property, or you put
> the generic nand-ecc-* properties, or you put nothing (which, again, is
> by far the best solution), but in no case you can have a mix.
> 
Right, nobody should have a mix but in case it happens, the driver code 
handles that well by taking nand-ecc-* property. So not sure if the 
exclusion check is really important. Anyway I will add a condition check 
in the yaml on them as you requested.

>>
>> Hope this make everyone happy and we can move forward.
> 
> I was advising to avoid mentioning too specific DT properties, but
> mentioning the kind of impact it has (on the choice for the ECC
> strength and size) is fine.
> 
>>
>>
>>>>> +          This is commonly used by the BCMBCA SoC board design.
>>>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>>>> +
>>>>>        unevaluatedProperties: false
>>>>>    >>>   allOf:
>>>>> -- >>> 2.37.3
>>>>>     > >
>>> Thanks,
>>> Miquèl
> 
> 
> Thanks,
> Miquèl

--000000000000eb75a90610c15be4
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQcAYJKoZIhvcNAQcCoIIQYTCCEF0CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3HMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU8wggQ3oAMCAQICDDG6HZcbcVdEvVYk4TANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMTMxNDVaFw0yNTA5MTAxMTMxNDVaMIGQ
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFjAUBgNVBAMTDVdpbGxpYW0gWmhhbmcxKTAnBgkqhkiG9w0B
CQEWGndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAyKF+RmY29Wvfmfe3L8J4rZNmBIvRmrWKI5td5L0vlpPMCEzUkVhBdL2N9cDP0rPScvWL
CX/9cI1a2BUy/6/ZT5j9PhcUn6A3kwKFGukLY2itfKaDrP3ANVJGhBXPVJ6sx55GF41PkiL2EMnY
7LJGNpl9WHYrw8VqtRediPyXq8M6ZWGPZWxygsE6y1pOkEk9qLpvXTb2Epxk2JWcQFZQCDWVULue
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEILZWPguz3TLCnaSDd99SoDyrkGJs
k5WSYQpFh3P17nFKMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDIwNzAyMjE1N1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBm44g544lSIWbsIKESPmD2HL0JTW0OypmXEBnDUWEitR5H
19ULIQnx+wd8NU3Px9PuyF5ULLu8w2O4fYUWmoj5P30I9w/waOVaEP545Xu2Ppm1aYRpQkBJUMp7
5kfj9jxQhqHJ92akOwpFdKf6O/Z843buWhtK64Olx4PGG8EyxSqr7vF52KyIQhpzqc9xVUNyj138
Uz6n4yHUXaasBMrmzXgDji1ZAFYYJ8VP5nb4aTCqcZ3UwakK5j+BmPeVpif4nEq7Si0kw/Ui0oqd
Zdk3s4IwMXvcAI8yOnUqYNDHBxS+MJ6TABKa25ia88m4Hq17nbWQ/AG7xFzO1RkknX+M
--000000000000eb75a90610c15be4--


--===============5904469600756610323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5904469600756610323==--

