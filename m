Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E41BC4725D
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jan 2024 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBlwgw8jtQABodboHRpeQ2BnQwXxIxoXYwxr7xlqVyg=; b=ehSN838i09CFCpubyeunLRqfHo
	KbXOfS668KHAl4joA3rqr1w5WB7co1xX+AC+u5g5jXVGuAVRAfV0A0B9Q3apr3LzjD6nPSUTEYrTM
	wotODm9JIl+f6vEjmRvWWMbBKiaBQ1Xfk/dHLovE5JaWIt/nrvngCCciljRZyuNhk7W9OrFTUGGAE
	kLniWbkYMhmPR40T4the3g5nE6yl8YtU+HlNjqDZ+HLZeBvGfBQGKDYmU9rFZdjnsP1ifhve4/0Ag
	3Pgyyun1V8CLdFjY7mt7FFl80aRd0xWn/OAZPMV8D9TbmWL5A7y40N13jU13q5dMAnRZkgjJdxEd/
	80id6rvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQtEf-006LZ9-0B;
	Fri, 19 Jan 2024 18:04:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQtEa-006LYC-35
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jan 2024 18:04:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d45f182fa2so9205305ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 19 Jan 2024 10:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705687490; x=1706292290; darn=lists.infradead.org;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=9R/nl2xff5me7G6OhiPk0C7LVEHD8frs1pekYdiwHnQ=;
        b=FsNGuoZSJOAm/T7IKpsLJe6ws/a2In82ZY5GHiBbafV6IfvHJOC77sY0l00s4NyBOS
         lwGX7Q31Abz/HNBrtCfN27D+8l4UlwTnt5Jhq4fLO7uPGOeESQooxZH8AQaIk1DBUJnB
         rbzR3BNJDFdgDaRXv/81VSiyb8rNkWYkkMbzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705687490; x=1706292290;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9R/nl2xff5me7G6OhiPk0C7LVEHD8frs1pekYdiwHnQ=;
        b=JIjtWbCTlNCfj8J5PauuAjpjuRQXkTDiZ1UWV8qWeOhBvUsva9LoOOIT2CQH0wkb8/
         msPJL6l3vhH4vPJ5d8EZXDNaPQJPSOjWLIDUNHImxiSgrN4OiYG9nV+vAF403BlmnfGm
         M2EGdXcn+ubalLslgYtw5GIUtBIBLL849IoC0UiPbAwFRjHxG1w+IOcn2vqco1wQz7Yw
         VbiIomon88olhSbfgQ2nIq1RCPAmQ+LGZFLfYYJiPRnWRRyDovEnL+l0L/+FLJvzQfpF
         4B2lqUj8U/X12R+ILqncXCIUkb5SRibCWYF5WbsSLfTAifLEIXHafdTcFJCwUK2KWeS7
         R3Lg==
X-Gm-Message-State: AOJu0YwaGfF7Qigmf4my0oEGSe8pqV/hPnAJSvwS1AsnNW+ecbfM3p75
	0vtxnsQ6MzRe6NE6NjqBQHpSl0mJM//4BqFngFYTautIQjkQVYb7MgfbbABLGw==
X-Google-Smtp-Source: AGHT+IHXUxTE1TDvyZbks48OoPrImAzVoDuqMzay6upKNKHqc4tOpJRXE8j7pVhUiO8JAdt9xGwnCA==
X-Received: by 2002:a17:902:d4c3:b0:1d7:1ef5:d325 with SMTP id o3-20020a170902d4c300b001d71ef5d325mr376859plg.34.1705687490137;
        Fri, 19 Jan 2024 10:04:50 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id lc11-20020a170902fa8b00b001d40cc2c9c3sm3322709plb.35.2024.01.19.10.04.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jan 2024 10:04:48 -0800 (PST)
Subject: Re: [PATCH v2 05/10] mtd: rawnand: brcmnand: Add BCMBCA read data bus
 interface
To: Dan Carpenter <dan.carpenter@linaro.org>, dregan@broadcom.com
Cc: dregan@mail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 anand.gore@broadcom.com, kursad.oney@broadcom.com,
 florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org
References: <20240118195356.133391-1-dregan@broadcom.com>
 <20240118195356.133391-6-dregan@broadcom.com>
 <4b3f4316-0da4-4fde-a806-7b579948db50@moroto.mountain>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <61f3cc1e-66f4-86d7-659b-9ff1219b4274@broadcom.com>
Date: Fri, 19 Jan 2024 10:04:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <4b3f4316-0da4-4fde-a806-7b579948db50@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_100453_388912_EA41DD07 
X-CRM114-Status: GOOD (  16.84  )
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
Content-Type: multipart/mixed; boundary="===============7287920931621366965=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7287920931621366965==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f8847c060f5050fe"

--000000000000f8847c060f5050fe
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 01/18/2024 09:36 PM, Dan Carpenter wrote:
> On Thu, Jan 18, 2024 at 11:53:51AM -0800, dregan@broadcom.com wrote:
>> diff --git a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
>> index 3e2f3b79788d..e97e13ae246c 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
>> @@ -26,6 +26,18 @@ enum {
>>   	BCMBCA_CTLRDY		= BIT(4),
>>   };
>>   
>> +#if defined(CONFIG_ARM64)
>> +#define ALIGN_REQ		8
>> +#else
>> +#define ALIGN_REQ		4
>> +#endif
>> +
>> +static inline bool bcmbca_nand_is_buf_aligned(void *flash_cache,  void *buffer)
>> +{
>> +	return IS_ALIGNED((uintptr_t)buffer, ALIGN_REQ) &&
>> +				IS_ALIGNED((uintptr_t)flash_cache, ALIGN_REQ);
>> +}
>> +
>>   static bool bcmbca_nand_intc_ack(struct brcmnand_soc *soc)
>>   {
>>   	struct bcmbca_nand_soc *priv =
>> @@ -56,6 +68,20 @@ static void bcmbca_nand_intc_set(struct brcmnand_soc *soc, bool en)
>>   	brcmnand_writel(val, mmio);
>>   }
>>   
>> +static void bcmbca_read_data_bus(struct brcmnand_soc *soc,
>> +				 void __iomem *flash_cache,  u32 *buffer, int fc_words)
>> +{
>> +	/*
>> +	 * memcpy can do unaligned aligned access depending on source
>> +	 * and dest address, which is incompatible with nand cache. Fallback
>> +	 * to the memcpy for io version
>> +	 */
>> +	if (bcmbca_nand_is_buf_aligned((void *)flash_cache, buffer))
>> +		memcpy((void *)buffer, (void *)flash_cache, fc_words * 4);
>> +	else
>> +		memcpy_fromio((void *)buffer, flash_cache, fc_words * 4);
>> +}
> 
> This comment is confusing or maybe the if statement is reversed...
> We're falling back to memcpy_fromio() for the unaligned accesses but the
> comment says we're falling back to memcpy().
> 
Yes that's a typo. Fallback to memcpy_fromio when unalgined.  Will 
update the comments in v3. Thanks!

> regards,
> dan carpenter
> 

--000000000000f8847c060f5050fe
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIHG99h/evlbXjkEiueEHtlGjPoyC
Y5F4U8avZ/jNl85GMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDExOTE4MDQ1MFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCtDfAtQjyUkzgplV+Yv01ykYQ71ciHLUddlKZojRXpNqcS
oVItDODTro/zUThq2dyqp2tzm8ieZXHMHgNI/kAZdZxGDRLeTOm9v/9g0Fo1qmpILG4EQmlv5uEy
L8H42hHNhdhXZGWY3dIJUs9EnECzrAWfB2LCO0US8b879LkcUFJnlj00Ozk4KJrsrlvkLcSde9+8
ghVd1JO0E1y8LIQ1ka7gG6UrDdZsHguOHUVPKINuBf5ATeuXgGClnDaslsC1jl53dri2K7YPBKq7
IMa4xJnufHtfoOf/01wHSp9KPPxv6LnYmlNm6o096DjTEs+ta0i4iwnddqF0Xcl1FnPP
--000000000000f8847c060f5050fe--


--===============7287920931621366965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7287920931621366965==--

