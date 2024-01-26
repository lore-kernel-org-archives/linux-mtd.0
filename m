Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDF8C47422
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jan 2024 18:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hYPvJjF+/q0UVmNXK0IKovtNfODRgmu+0nAFe8Y1KA=; b=bv8mMCYoknUYdCKre6D7V+u0uF
	Smrp9mlA7O7J8GyTnzVi6HiI1uE2FmbWcflGg0w/c9DeU1cWnJPrN6i6Sv8gHKB7R/rYoF5w1h6Hr
	XHTq85UP8E8cOVsyof/+GG4KyC1ufqIWoglu1A6gPtGFSDHTv0H8XYBYQ7cqL0mF8+N3kv2cByKqK
	05imoiIYs8K8BrpfzdC8B8qI5mE8uskR7rMTe2QFibRcI7xmzoxWxvxtGzEBPOO518mwTQHCJQSVq
	qCQghz/bhcKOERqHATNFDOnucGoEaU5ZHfqZ24e9q6SB7t0atr2vzo1kPe8n71RsGQDxcJrL/qGGA
	JFSwPgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTQdv-000000050ll-2tK0;
	Fri, 26 Jan 2024 18:09:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTQds-000000050kj-0Dq0
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jan 2024 18:09:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d74678df08so4714245ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2024 10:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706292566; x=1706897366; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=maW8eYW9t6EVQetELRm41imoxktxAA5ggw4U+iO/zVQ=;
        b=ILLoVQSVeFB4aR42LfWZZyYQ5fvH6VAZ/6OWFc/4OcFKT3a6yL/7sHalH0ioS1zWBj
         3zf9J8TwFhIWHx+DiknYRTpIVUqiUp5n51cNGIkhcTByVIcEKZ8yPZndviXBNXBm7jEe
         neRGEpm/d4eYYwrkHD7gMzjsiuTcLt8HZvzW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706292566; x=1706897366;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maW8eYW9t6EVQetELRm41imoxktxAA5ggw4U+iO/zVQ=;
        b=wxG5q5tXPAOKS9AUSDjjhUDnD1FemaAbf5Oka34qrvxNFZSHVoJ8x+eRHoNETynINu
         ARrmcEMwFJpwR4Q4BKyrbp1b9XBoycw03f8wgnGJiu0NzbshD/RuO2ogX4KffwTB0723
         zRZbnnSnQK/7TS2NtCB1owt2B8PCP4NJIqCfCvDxr2dTrk4u+lmxBjJ4u99sHz7vOAcz
         4Cc4hSHZzNNkj0uWFakGLDnVx2blbgr9WT1m+/Ejcn6vZjI2nDCCwVOxkU5bU+o2RQQC
         0CyNHJ4X4Mo3IYUQQm7xY8REfs5v3pD8jq0tH34nLBN083jfGCpfu9WQOwGPxs5tK9Ro
         s7Kw==
X-Gm-Message-State: AOJu0YybwyV/hQKg4Ci4+wHaNS7e9cMG305FHRHY0Jry+3qRcij2Mjm1
	yOt8lVuvnpuWve7kDSCpFx8h72HdSWw2FSfofiAlLiakaUYBsA54PeX4fK3uzQ==
X-Google-Smtp-Source: AGHT+IGxNUhpLxiiCPrISZ5CIlxnOeh1sXqyVtIXkr9k5mtrWbdl/kpZNbxvv5U/gLfZ1J+fJNgcQA==
X-Received: by 2002:a17:902:c703:b0:1d5:bc1d:eb99 with SMTP id p3-20020a170902c70300b001d5bc1deb99mr101785plp.131.1706292565623;
        Fri, 26 Jan 2024 10:09:25 -0800 (PST)
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id g10-20020a170902c98a00b001d6f4d7ed1bsm1221475plc.296.2024.01.26.10.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 10:09:24 -0800 (PST)
Message-ID: <9af23e54-a484-44b7-bf88-0ade194ab74e@broadcom.com>
Date: Fri, 26 Jan 2024 10:09:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
To: Conor Dooley <conor@kernel.org>
Cc: David Regan <dregan@broadcom.com>, dregan@mail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
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
 <20240124030458.98408-2-dregan@broadcom.com>
 <20240124-direness-outpost-bbc22550a161@spud>
 <451151f3-33df-4de8-ab62-a683ad4b7cb1@broadcom.com>
 <20240125-drove-undiluted-5d822b7fd4fa@spud>
 <b2bc0948-7039-4dbd-8152-08a51e744c59@broadcom.com>
 <20240126-armadillo-clean-e3509ed23ed5@spud>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <20240126-armadillo-clean-e3509ed23ed5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_100928_280227_8A36E3E0 
X-CRM114-Status: GOOD (  43.71  )
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
Content-Type: multipart/mixed; boundary="===============6455007508489739640=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6455007508489739640==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000048462e060fdd32f4"

--00000000000048462e060fdd32f4
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/26/24 08:46, Conor Dooley wrote:
> On Thu, Jan 25, 2024 at 05:55:29PM -0800, William Zhang wrote:
>> On 1/25/24 11:51, Conor Dooley wrote:
>>> On Wed, Jan 24, 2024 at 07:01:48PM -0800, William Zhang wrote:
>>>> On 1/24/24 09:24, Conor Dooley wrote:
>>>>> On Tue, Jan 23, 2024 at 07:04:49PM -0800, David Regan wrote:
>>>>>> From: William Zhang <william.zhang@broadcom.com>
> 
>>>> And the reason I keep it as int is because there could be a potential value
>>>> of 2 for another mode that the current driver could set the wp_on to.
>>>
>>> Can you explain, in driver independent terms, what this other mode has
>>> to do with how the WP is connected?
>>> Either you've got the standard scenario where apparently "NAND_WPb" and
>>> "WP_L" are connected and another situation where they are not.
>>> Is there another pin configuration in addition to that, that this 3rd
>>> mode represents?
>>>
>> The 3rd mode is WP pin connected but wp feature is disabled in the
>> controller.
> 
> What does "disabled" mean? The controller itself is not capable of using
> the WP pin because of hardware modifications? Or there's a bit in a
> register that disables it and that bit has been set by software?
> 
Yes that is a bit in the controller reg to disable the feature by the 
driver even the chip have the WP pin connected.

> If it is a hardware difference for that controller, why does it not have
> a dedicated compatible? If it's a software decision, then it shouldn't
> be in the DT in the first place ;)
> 
Agree it is more on the software for that particular mode.

> We've gone back here a bunch trying to figure stuff out, and you give me
> a vague one sentence answer. Please.
> 
>>>> I
>>>> don't see it is being used in BCMBCA product but I am not sure about other
>>>> SoC family. So I don't want to completely close the door here just in case.
>>>
>>> If you ever need it, you could have a "brcm,wp-in-wacky-configuration"
>>> property that indicates that the hardware is configured in that way
>>> (providing that this hardware configuration is not just "NAND_WPb" and
>>> "WP_L" pins connected. The property can very easily be made mutually
>>> exclusive with "brcm,wp-not-connected" iff it ever comes to be.
>> Yes we could have a new property but if we can have a single int property to
>> cover all, IMHO it is better to just have one property as these three modes
>> are related. I would really like to have it as an int property to keep
>> things simple.
> 
> It is "better" because it is easier for you perhaps, but ripe for abuse.
> 
Well if binding only say 3 possible value, you can not use this property 
for other value of course. DTS binding check will fail. But agree there 
is no check on this in the driver side for any integer property.

>> But if you think this is absolutely against the dts rule,  I will switch to
>> the "brcm,wp-not-connected" boolean property as you suggested.
> 
> I'll answer this when you describe the mode better, right now I cannot
> really comment, but I have not yet seen a justification for the non-flag
> version of the property. Even if there's a justification for documenting
> that other mode in the DT, I'm likely to still think boolean properties
> are a better fit.
> 
That's fine. I will just change to the boolean.

>>>>>> If ecc
>>>>>> +          strength and spare area size are set by nand-ecc-strength
>>>>>> +          and brcm,nand-oob-sector-size in the dts, these settings
>>>>>> +          have precedence and override this flag.
>>>>>
>>>>> Again, IMO, this is not for the binding to decide. That is a decision
>>>>> for the operating system to make.
>>>>>
>>>> Again this is just for historic reason and BCMBCA as late player does not
>>>> want to break any existing dts setting.  So I thought it is useful to
>>>> explain here.  I can remove this text if you don't think it should be in the
>>>> binding document.
>>>
>>> I don't, at least not in that form. I think it is reasonable to explain
>>> why these values are better though.
>> I understand the decision is for OS/driver to make. If we were to write
>> another driver for other OS, the same precedence will apply too so the
>> binding works the same way across all the OS. So I am not sure what better
>> explanation or form I can put up here. I am open to any suggestion or I just
>> delete it.
> 
> I would just delete it tbh.
Will delete.

> 
> Thanks,
> Conor.

--00000000000048462e060fdd32f4
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIE2qzo+wcRTLgU2qDiiv4j8dwQpn
jDFUaaeRwg6M0RNOMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDEyNjE4MDkyNlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAPcTbAkWF5mLRxzPMaByt7wTe9DZvHFWom2cTkEmYn/CKn
TSKIT8MXUmbh8Eafk+vfqFqwdqZQVTHDPmCx8zn3TfKL8WLUDvdS4w0Q+/tMhl0RwOUX4n8X5IrQ
mdfhh6tPkRbs/Vi8/92N5b90NNGeMkniTD8Q9uiZQnWaMWzwSyJpztBVm/ob5Js1/eRv5XI1aJbK
solxYYOsZFnFsngyfTBa4VoAZtq6vQZGmRCGAMg3PyvoiwFbi2kiiPCOSSsuFahs+r+uYniHvkQV
h37Cz7rasz+0qkdskmlDI5r7DeX1WBcJHpy7TmIHLqHulMSg7aIhI1S3SC3MBHO36WsB
--00000000000048462e060fdd32f4--


--===============6455007508489739640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6455007508489739640==--

