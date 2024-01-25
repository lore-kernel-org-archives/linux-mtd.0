Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4122DC47258
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 03:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZKtui3Qk/WwXE3UhqHG6c8nPrwV+NDAkY0aEa+xXkM=; b=V1qpHYv/rCcesh0tIHt55sFlll
	7EbZa06fMZ1KeWQ5NsxiXis281ZpAkv/+iOdyRk5FyAwExPI5VnVR1di/F89dDC7NHlBs2EdyuTBp
	wxtviyCC/l229+lp9tNbA3evpc40If9t/xLDAOf2MYe0RBnn6gd6+dEYhD4d4xxowZAKOwfd17YSs
	7upzcHXB125ZzLeEZGXvHMyN6QPuxCA+yo/NTEcFEKjVRisQ2ekZ8WaiGQjPtua63myMsO55BZ9Me
	grVtCevL7p5kn/4MuCxfj8tuM3OZ6yvYvCooI9TBxlUPKFyTJSNMpZjtAsvnD6QSxENNnSaO3PTb4
	SAock6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSqBh-005zVL-07;
	Thu, 25 Jan 2024 03:13:57 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSqBc-005zTX-1d
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 03:13:54 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso3452820a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 24 Jan 2024 19:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706152428; x=1706757228; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=17LCSb1+14EHw2gOvJZO0s6lf28cwAgNJP2dCX8Zbvg=;
        b=L1U3W7QkNj4TLtaG9is3+LGucQhla+aIZs6H6B9Ht0zdYYa+Mj1c6TT624xy3SPb8c
         /EamqVbltApReEvQOQhCOaLK4syfGRn5WzUQzANsXBWTIk+gVRL6cbsFrFBiXx+zV5Vf
         UD10tLJwgD2mz5v8id5y7+zfvfWYTAC47Fxs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706152428; x=1706757228;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17LCSb1+14EHw2gOvJZO0s6lf28cwAgNJP2dCX8Zbvg=;
        b=Wd9uUTlw9N36HPDSOfcT6RxL+hp8OBjSAOmNSD9Jv6wFTv1Rps04lAEBr9G2TIE8Ov
         cMgIwvTzIDVAbBL8eramrTfhK6UHuARj/31ABLT2ObqW8zLHM/6iFJUlCWkgNmVKuidW
         VIiv9UBZa72Mph1bCK2vf1FaIxr5J/O7JrRzKppWT7zWVujvp/0ww1uXqr2+1AZ9fcI4
         5cuFlpv7kUxEp4wGjEWBvUWKKhMR9XLgvcDWQW0+4ciMHByk/AdtmeQsgdeLWtgV8X8r
         25DM0mF0y5qurUzhV4R+Ekt6j2wYW3NI7JP6RlzRArTXxhz9K+l5DRuwUp2vw4DdFeaw
         G7kQ==
X-Gm-Message-State: AOJu0Yz86G+soVxgNG6A+WecCipeJR4syiYM9lGMcQ83a0J3zjNX9dhE
	3anm0GBrZ4cpHGwWgqIA7Iad6kjpkmo4ipVq73dEgf86Kc3FkWTZENy0jmwI8xlJ/CP1uExvKJj
	qCA==
X-Google-Smtp-Source: AGHT+IEh8pPkKN39L5yFBrTbbUqwL/tWSZACJhvFXuMqscj2IrvLo4adiqYeQJujoTTLA7mrt1TYPw==
X-Received: by 2002:a05:6a20:2594:b0:19c:56cf:1cdd with SMTP id k20-20020a056a20259400b0019c56cf1cddmr416400pzd.46.1706152427836;
        Wed, 24 Jan 2024 19:13:47 -0800 (PST)
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902a5c300b001d755ec4bc0sm5328111plq.241.2024.01.24.19.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 19:13:47 -0800 (PST)
Message-ID: <48f3c65f-4e27-42d8-b32a-3889329303c2@broadcom.com>
Date: Wed, 24 Jan 2024 19:13:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] mtd: rawnand: brcmnand: Add support for getting
 ecc setting from strap
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
 <20240124030458.98408-7-dregan@broadcom.com> <20240124183207.5898cbfd@xps-13>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <20240124183207.5898cbfd@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_191352_577133_F59AFEE6 
X-CRM114-Status: GOOD (  18.27  )
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
Content-Type: multipart/mixed; boundary="===============1047486649249555470=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1047486649249555470==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006ad08a060fbc91f8"

--0000000000006ad08a060fbc91f8
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 1/24/24 09:32, Miquel Raynal wrote:
> Hi David,
> 
>> @@ -2622,19 +2667,43 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>>   		nanddev_get_memorg(&chip->base);
>>   	struct brcmnand_controller *ctrl = host->ctrl;
>>   	struct brcmnand_cfg *cfg = &host->hwcfg;
>> -	char msg[128];
>> +	struct device_node *np = nand_get_flash_node(chip);
>>   	u32 offs, tmp, oob_sector;
>> -	int ret;
>> +	int ret, sector_size_1k = 0;
>> +	bool use_strap = false;
>> +	char msg[128];
>>   
>>   	memset(cfg, 0, sizeof(*cfg));
>> +	use_strap = of_property_read_bool(np, "brcm,nand-ecc-use-strap");
>>   
>> -	ret = of_property_read_u32(nand_get_flash_node(chip),
>> -				   "brcm,nand-oob-sector-size",
>> +	/*
>> +	 * Set ECC size and strength based on hw configuration from strap
>> +	 * if device tree does not specify them and use strap property is set
>> +	 * If ecc strength is set in dts, don't use strap setting.
>> +	 */
> 
> You would have to use the strap settings only if the property is set.
> If not property is set, the default from the core should apply I guess.
> 
Maybe the comment confuse you... I will make it more clear.  But the 
logic here is exactly what you said.  If no properties are set, the core 
value is already set in chip->ecc.strength and chip->ecc.size and it 
clear the use_strap flag too.

>> +	if (chip->ecc.strength)
>> +		use_strap = 0;
>> +
>> +	if (use_strap) {
>> +		chip->ecc.strength = brcmnand_get_ecc_strength(host);
>> +		sector_size_1k = brcmnand_get_sector_size_1k(host);
>> +		if (chip->ecc.size == 0) {
>> +			if (sector_size_1k < 0)
>> +				chip->ecc.size = 512;
>> +			else
>> +				chip->ecc.size = 512 << sector_size_1k;
>> +		}
>> +	}
>> +
>> +	ret = of_property_read_u32(np, "brcm,nand-oob-sector-size",
>>   				   &oob_sector);
>>   	if (ret) {
>> -		/* Use detected size */
>> -		cfg->spare_area_size = mtd->oobsize /
>> -					(mtd->writesize >> FC_SHIFT);
>> +		if (use_strap)
>> +			cfg->spare_area_size = brcmnand_get_spare_size(host);
>> +		else
>> +			/* Use detected size */
>> +			cfg->spare_area_size = mtd->oobsize /
>> +						(mtd->writesize >> FC_SHIFT);
>>   	} else {
>>   		cfg->spare_area_size = oob_sector;
>>   	}
> 
> 
> Thanks,
> Miquèl

--0000000000006ad08a060fbc91f8
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIF+VJ4d1/Lh6uSqHgwd4DnNUNCYq
nPGjLQxaHUmRQF7IMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDEyNTAzMTM0OFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBvs+9j2MZiFTsRL1fvJwy0jauuFwHMfXwm4HzVZqKVG0Zp
lVi2hQbaplVxMx6VeUz1y40HbDmoBmLIlxa0B6rSpepKX6HnCZ5mmEwd6y7nYNnuahjIsct1GEJX
GZsWiK9woJQrg0e/hR6LG0IiCvjbR3PfDUvLsiOkd8H1SRq9ZXVoJ3L4mF2f4gON1pmpsy3m7Vvp
PC8m5IK1jvZhOw7kIjtIMxU2F5Njrha2LxBn7uoQqggG0+WSPzHiXQiZaMHB/D6vfOM1mpBCJRmR
a/mtR91JoA/oPX00A+uNKbo7/N7hrq6WxaN60T5oNhyo5vP2LQkmQluwZpjD/SkWRMzF
--0000000000006ad08a060fbc91f8--


--===============1047486649249555470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1047486649249555470==--

