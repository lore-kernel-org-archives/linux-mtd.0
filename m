Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E333AC46CD2
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jan 2024 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfzNS2FpoZO0TNI0XvRtrPn0gm8uK3h0gW473p1I7PU=; b=gm93z62ffWn3ckzxonHKaY6/eg
	Z7b3BRVIgupNUbTHRmkodp/3EV3d1GV5BuiKBkqprh9qD/VtTX6W/34zpDPt/xhWyub9KbESRh3GF
	kUUWOX41PBDirHxFp44TeIxnttN8fesY98ix06fjAHjZOl8J4/pKOi2n+C6joPJ1CPV3BatqxHw2E
	CEeV/xFR0kUKC5bcd3sRVi1XgdSFsspRwe98DjfOTa63zu7u0FVvWk/dS4XcFLr0tkt/qtHb0weJI
	nYYBAQrwRkYBVdZi0Q/NtDHJxGXEVzlNIdKzmgmlBr7Q1anE1g0gb2/FUOOYTUAZWjZ2lB1z8v7iN
	D0V6jvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjDb-0000000FdyV-3R43;
	Tue, 30 Jan 2024 08:11:43 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjDX-0000000Fdw7-1X0u
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jan 2024 08:11:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d911c2103aso923845ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jan 2024 00:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706602297; x=1707207097; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nYVHvQm+JcE1ihtVd6+f1PQVp/vVF15bnzrOfHcYTag=;
        b=BbDIHgU56+c741EGh4YJeLfN9Gi9u4NcJxiamnDkOfCCY4JG/G4VQvMPwT2hTrfdOp
         ozCn2ppmFmeoH+5KTk0X2hrbP1n33T4oE5OVpHGP3b9892PGafESti8a+vJQiNLEpsd2
         gH8LFHyO2KzweRvrcqrIqD8AfJ49kERZpKHKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706602297; x=1707207097;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYVHvQm+JcE1ihtVd6+f1PQVp/vVF15bnzrOfHcYTag=;
        b=jHVWbMDBdUMFYHUu9ABnJ0dOF50yUPDtgi7pc6XKK6TZDoh4Ys4dxlQe3Iyu2KHr1E
         RFkBoxlcrxesD9w+bYBwVl+/boDKjfCxE5rR+qA6GRFyKzZSMuAEO/6cGhPNsDwr4vSN
         uM0w0jhR+XyWjFK+e8PO25xifW6CwW0V/H9qv/fX2OFiZp80tOOsNkA3Pll7aeUz1h1L
         pwFgKm1VmmSies2EKA5f/XhQkEvN2hTp+45DuulCFVdrTfvQVbwzBBKJ5uE+KJEUt1Sn
         SaD0cKvT9FuvEqGn9S1OGn2PO0h0jOKS02VTFks3+YNvH2oPAfg0AGUb4tJivzvDC6Bj
         DC5w==
X-Gm-Message-State: AOJu0YwHsIBo7KdN0fgROP9xJ+2onpLQnIRiSSs5LPZRzBjnqsGA0lQC
	oCZaekXz/5HrDs8erm8i05E7HuYYd448fDJCulm9qyIEfO0NbRlK/7i+26HAQg==
X-Google-Smtp-Source: AGHT+IEcxqImwCqE/lLYqX6Zqlcv5ceRggfc3cR8GUhrMXHiRxUaI66sopvDFtFmUB5WKpsf2PVpWQ==
X-Received: by 2002:a17:903:22c8:b0:1d7:6d49:c78a with SMTP id y8-20020a17090322c800b001d76d49c78amr6850809plg.58.1706602297023;
        Tue, 30 Jan 2024 00:11:37 -0800 (PST)
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902ee8a00b001d8e93fe344sm2697941pld.143.2024.01.30.00.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 00:11:35 -0800 (PST)
Message-ID: <2a3edcf5-7afc-410c-a402-3d8cd3feb1da@broadcom.com>
Date: Tue, 30 Jan 2024 00:11:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joel Peshkin <joel.peshkin@broadcom.com>,
 Tomer Yacoby <tomer.yacoby@broadcom.com>,
 Dan Beygelman <dan.beygelman@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240124030458.98408-1-dregan@broadcom.com>
 <20240124030458.98408-11-dregan@broadcom.com>
 <20240124184027.712b1e47@xps-13>
 <CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
 <20240126071913.699c3795@xps-13>
 <CAA_RMS5gX88v_Qt1csgSL_ffMNsqo2G8B164EB_Hg=hXd620eg@mail.gmail.com>
 <20240129115228.06dc2292@xps-13>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <20240129115228.06dc2292@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_001139_486068_FC8C6669 
X-CRM114-Status: GOOD (  33.70  )
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
Content-Type: multipart/mixed; boundary="===============6883947030057695911=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6883947030057695911==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b6d7a70610254f96"

--000000000000b6d7a70610254f96
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 1/29/24 02:52, Miquel Raynal wrote:
> Hi David,
> 
> dregan@broadcom.com wrote on Fri, 26 Jan 2024 11:57:39 -0800:
> 
>> Hi Miquèl,
>>
>> On Thu, Jan 25, 2024 at 10:19 PM Miquel Raynal
>> <miquel.raynal@bootlin.com> wrote:
>>>
>>> Hi David,
>>>
>>> dregan@broadcom.com wrote on Thu, 25 Jan 2024 11:47:46 -0800:
>>>   
>>>> Hi Miquèl,
>>>>
>>>> On Wed, Jan 24, 2024 at 9:40 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>>>>>
>>>>> Hi David,
>>>>>
>>>>> dregan@broadcom.com wrote on Tue, 23 Jan 2024 19:04:58 -0800:
>>>>>   
>>>>>> Allow settings for on-die ecc such that if on-die ECC is selected
>>>>>> don't error out but require ECC strap setting of zero
>>>>>>
>>>>>> Signed-off-by: David Regan <dregan@broadcom.com>
>>>>>> Reviewed-by: William Zhang <william.zhang@broadcom.com>
>>>>>> ---
>>>>>> Changes in v3: None
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - Added to patch series
>>>>>> ---
>>>>>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 14 ++++++++++----
>>>>>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>>> index a4e311b6798c..42526f3250c9 100644
>>>>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>>> @@ -2727,9 +2727,11 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>>>>>>        cfg->blk_adr_bytes = get_blk_adr_bytes(mtd->size, mtd->writesize);
>>>>>>
>>>>>>        if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST) {
>>>>>> -             dev_err(ctrl->dev, "only HW ECC supported; selected: %d\n",
>>>>>> -                     chip->ecc.engine_type);
>>>>>> -             return -EINVAL;
>>>>>> +             if (chip->ecc.strength) {
>>>>>> +                     dev_err(ctrl->dev, "ERROR!!! HW ECC must be set to zero for non-hardware ECC; selected: %d\n",
>>>>>> +                             chip->ecc.strength);
>>>>>
>>>>> Can you use a more formal string? Also clarify it because I don't
>>>>> really understand what it leads to.
>>>>
>>>> How about:
>>>>
>>>> dev_err(ctrl->dev, "HW ECC set to %d, must be zero for on-die ECC\n",
>>>
>>> Actually I am wondering how legitimate this is. Just don't enable the
>>> on host ECC engine if it's not in use. No need to check the core's
>>> choice.
>>
>> Our chip ECC engine will either be on if it's needed or off if it's not.
>> Either I can do that in one place or put checks in before each
>> read/write to turn on/off the ECC engine, which seems a lot more
>> work and changes and possible issues/problems.
>> Turning it on/off as needed has not been explicitly tested and
>> could cause unforeseen consequences. This
>> is a minimal change which should have minimal impact.
>>
>>>   
>>>>   
>>>>>   
>>>>>> +                     return -EINVAL;
>>>>>> +             }
>>>>>>        }
>>>>>>
>>>>>>        if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN) {
>>>>>> @@ -2797,7 +2799,11 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>>>>>>        if (ret)
>>>>>>                return ret;
>>>>>>
>>>>>> -     brcmnand_set_ecc_enabled(host, 1);
>>>>>> +     if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE) {
>>>>>> +             dev_dbg(ctrl->dev, "Disable HW ECC for on-die ECC\n");
>>>>>
>>>>> Not needed.
>>>>
>>>> Will remove.
>>>>   
>>>>>   
>>>>>> +             brcmnand_set_ecc_enabled(host, 0);
>>>>>> +     } else
>>>>>> +             brcmnand_set_ecc_enabled(host, 1);
>>>>>
>>>>> Style is wrong, but otherwise I think ECC should be kept disabled while
>>>>> not in active use, so I am a bit surprised by this line.
>>>>
>>>> This is a double check to turn on/off our hardware ECC.
>>>
>>> I expect the engine to be always disabled. Enable it only when you
>>> need (may require an additional patch before this one).
>>
>> We are already turning on the ECC enable at this point,
>> this is just adding the option to turn it off if the NAND chip
>> itself will be doing the ECC instead of our controller.
> 
> Sorry if I have not been clear.
> 
> This sequence:
> - init
> - enable hw ECC engine
> Is broken.
> 
ECC engine is not enabled for all the cases. Here we only intended to 
enable it for the nand chip that is set to use 
NAND_ECC_ENGINE_TYPE_ON_HOST. The logic here should better change to:
if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
     brcmnand_set_ecc_enabled(host, 1);
else
     brcmnand_set_ecc_enabled(host, 0);

> It *cannot* work as any operation going through exec_op now may
> perform page reads which should be unmodified by the ECC engine. You > driver *must* follow the following sequence:
> - init and disable (or keep disabled) the hw ECC engine
> - when you perform a page operation with correction you need to
> 	- enable the engine
> 	- perform the operation
> 	- disable the engine
> Maybe I am missing something here but are you saying the exec_op can 
have different ecc type for page read/write at run time on the same nand 
chip? I don't see the op instr structure has the ecc type field and 
thought it is only bind to the nand chip and won't change at run time. 
So looks to me the init time setting to the engine based on 
ecc.engine_type should be sufficient.

What you described here can work for the hw.ecc read path (ecc.read_page 
= brcmnand_read_page) which always assumes ecc is enabled. Although it 
is probably not too bad with these two extra operation, it would be 
better if we don't have to add anything as our current code does. For 
the brcmnand_read_page_raw,  we currently disable the engine and then 
re-enable it(but we need to fix it to only enable it with hw ecc engine 
type).  So it is just opposite of you logic but works the same with no 
impact on the most performance critical path.


> Thanks,
> Miquèl

--000000000000b6d7a70610254f96
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIM2Vg6cGFkHIgPn6Tul1txXAtMbm
1/W7efMiTY7s88mrMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDEzMDA4MTEzN1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQATVOOWhCDyQ0pKBBLcrr56SEvlwt8K+m+7djY8xzT1dIcL
shu5i9LGF2AR7ZRNnyofK8wDlxA8QXitLgqRlP07oKnzVUnHcv9NyNKJEFJDWj6HVNUIzVoEMFrw
9V4NblQTFtgbWCZd0xOuBnfnuEYsc5ScV1Y5rEOM9PApT/TAyGmgd605ESRFvxJ0qg0KfFEs3sBl
/b0P4exJFuim3pRPovXMumAHDRXPUv65fdC9RoknRW+mGabtAuE6UUTIrxaXzBnIE1jV4xZYEJw2
NO7+ySS0jpHWESfmpmgIAGIfyPNTxshtp5eRq3gqzhbZezih06znHwSQ4eItr2O7EEMX
--000000000000b6d7a70610254f96--


--===============6883947030057695911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6883947030057695911==--

