Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434E4C48BC4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 03:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HP7/9jUP9hWjmM7T6oSwJ3EcZoWOTiKQ/NnTwgRMeA=; b=YHQ9AMsw0voCHfv9tncr1T5lMw
	w0cphQF08O0bXKO++EqNUEjmSynUs0EVgVo/bkGDQUbA6a+xnkMrT9cxNsD20Ow2VukhWfI3BonMf
	RcF6enRTg+IuQgMuoNFKL5VyxjS7pYEOGTMhXeLa9BEsA5K9BPeFcJrIrX085lzuVzoSKbYnvSC6B
	YszZF2KoNYcXyImGonKeNBS5RuCu44ZmP1pGdNqo4Vm1kI7pOqJJitDGSiyCEkzev2imeQCZi4RQp
	Jh1HctfWFPLVF4J2YQ+y5prL8Bid19C5prcK0TpAC+bAJViVQWn9nd/2OqKSIkkZQXWZEFGChEGRJ
	9Nic7OLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMLV-00000007iOG-3gDs;
	Fri, 23 Feb 2024 03:35:33 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMLO-00000007iJx-386I
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 03:35:32 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-599f5e71d85so320991eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 19:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1708659316; x=1709264116; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WBTBLV+hf23t9y7tOTi1qZxI+n2Ztc3Yqg4zq+oy2Vk=;
        b=egXDufakEqGZu7jhIHT6vFFfZ8c73/HDCbGZjvA2F7QkySbeMz3EDOdErIZh3s6MB9
         qDjyzCjVgcndGF+8FXJJfP3bmKnP1OfOxyuq1PLE+5lBaOYtVkUvjOH5bsPw3MUlEmv8
         J0ORjoru/f17YBbkZkBbnUuMpJzozaOjnvZDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708659316; x=1709264116;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBTBLV+hf23t9y7tOTi1qZxI+n2Ztc3Yqg4zq+oy2Vk=;
        b=pGTwC20yay+cjDoX+DuKcKgOpxzcoaVmYmpyRnLv2m6ToRdUKmuIOJI8dj5395/2eJ
         FEZsl4H53w5sqOo0BVuMUHgFdLj4x6h0qrsFK+3JYz7TJZHchMdCP/fOmbU12iPJa53t
         CgNMOlaOQCQl8f5gwqfy5c2HqmwrPunXPEhHb46GgV5K3am4tjjVZrnHdYuJUOkSof5o
         1clPZqm0ifUrQ62xFroFg6kC3uGtgJKzveAKYFRpVRU9R3UApNJGjscq0augPpup+So/
         BzngPgXsr3ejwFYyzNnQNMsEykHAHo4xJ3nJ93FIUJ1RH+kbSgXF6cOu1KyLUAxRM3GG
         Cy6g==
X-Gm-Message-State: AOJu0Yyma0IFiUvJVp2AAEAWuv/wADFm9NgEyId+9HdRjVxNj3pQyzcb
	7uta0ha877117jVTyedCFcFSrN1yzj0/p1PsWc2z1J5cRQukVeBklJNRKODxiA==
X-Google-Smtp-Source: AGHT+IGcwaIrtV+u+dVjykxQHW2Ht6QYGFO/CPljMZIxhocwRy+qvZtb8CVwj6dJODIO/isXdWuDIA==
X-Received: by 2002:a05:6358:938c:b0:17b:602f:24e7 with SMTP id h12-20020a056358938c00b0017b602f24e7mr727705rwb.14.1708659315675;
        Thu, 22 Feb 2024 19:35:15 -0800 (PST)
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id u21-20020a62d455000000b006e4625a0f0dsm9240062pfl.169.2024.02.22.19.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 19:35:13 -0800 (PST)
Message-ID: <cc0e98e4-b92f-4da5-879d-7535e787b98f@broadcom.com>
Date: Thu, 22 Feb 2024 19:35:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] mtd: rawnand: brcmnand: Add support for getting
 ecc setting from strap
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 f.fainelli@gmail.com, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 David Regan <dregan@broadcom.com>, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-10-william.zhang@broadcom.com>
 <20240220105313.5e3c600d@xps-13>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <20240220105313.5e3c600d@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_193527_178186_AB36AC57 
X-CRM114-Status: GOOD (  31.23  )
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
Content-Type: multipart/mixed; boundary="===============2847765036505850670=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2847765036505850670==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009e18ef0612043f20"

--0000000000009e18ef0612043f20
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 2/20/24 01:53, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Wed,  7 Feb 2024 12:22:54 -0800:
> 
>> BCMBCA broadband SoC based board design does not specify ecc setting in
>> dts but rather use the SoC NAND strap info to obtain the ecc strength
>> and spare area size setting. Add brcm,nand-ecc-use-strap dts propety for
>> this purpose and update driver to support this option.
>>
>> The generic nand ecc settings still take precedence over this flag. For
>> example, if nand-ecc-strength is set in the dts, the driver ignores the
>> strap setting and falls back to original behavior. This makes sure that
>> the existing BCMBCA board dts still works the old way even the strap
>> flag is set in the BCMBCA chip dtsi.
>>
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>> Reviewed-by: David Regan <dregan@broadcom.com>
>>
>> ---
>>
>> Changes in v5: None
>> Changes in v4:
>> - Update the comments for ecc setting selection
>>
>> Changes in v3: None
>> Changes in v2:
>> - Minor cosmetic fixes
>>
>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 83 ++++++++++++++++++++++--
>>   1 file changed, 76 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> index 73fdf7ce21aa..efeee9e80213 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> @@ -1038,6 +1038,19 @@ static inline int brcmnand_sector_1k_shift(struct brcmnand_controller *ctrl)
>>   		return -1;
>>   }
>>   
>> +static int brcmnand_get_sector_size_1k(struct brcmnand_host *host)
>> +{
>> +	struct brcmnand_controller *ctrl = host->ctrl;
>> +	int shift = brcmnand_sector_1k_shift(ctrl);
>> +	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
>> +						  BRCMNAND_CS_ACC_CONTROL);
>> +
>> +	if (shift < 0)
>> +		return 0;
>> +
>> +	return (nand_readreg(ctrl, acc_control_offs) >> shift) & 0x1;
> 
> What is this & 0x1 ? If you return a yes/no value, please make this
> function return a bool. Also, please use intermediate steps to clarify
> what you do.
> 
> sector_1k_bit = ...;
> acc = nand_readreg();
> return acc & BIT(sector_1k_bit);
> 
> Or something like that.
> 
This sector 1k bit is just single bit field. But we do want to return 
negative for error condition and 0 for 512 sector and 1 for 1K sector 
size. Will add intermediate steps.

>> +}
>> +
>>   static void brcmnand_set_sector_size_1k(struct brcmnand_host *host, int val)
>>   {
>>   	struct brcmnand_controller *ctrl = host->ctrl;
>> @@ -1055,6 +1068,38 @@ static void brcmnand_set_sector_size_1k(struct brcmnand_host *host, int val)
>>   	nand_writereg(ctrl, acc_control_offs, tmp);
>>   }
>>   
>> +static int brcmnand_get_spare_size(struct brcmnand_host *host)
>> +{
>> +	struct brcmnand_controller *ctrl = host->ctrl;
>> +	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
>> +						  BRCMNAND_CS_ACC_CONTROL);
>> +	u32 acc = nand_readreg(ctrl, acc_control_offs);
>> +
>> +	return (acc & brcmnand_spare_area_mask(ctrl));
>> +}
>> +
>> +static int brcmnand_get_ecc_strength(struct brcmnand_host *host)
> 
> 					_from_strap
> 
>> +{
>> +	struct brcmnand_controller *ctrl = host->ctrl;
>> +	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
>> +						  BRCMNAND_CS_ACC_CONTROL);
>> +	int sector_size_1k = brcmnand_get_sector_size_1k(host);
>> +	int spare_area_size, ecc_level, ecc_strength;
>> +	u32 acc;
>> +
>> +	spare_area_size = brcmnand_get_spare_size(host);
>> +	acc = nand_readreg(ctrl, acc_control_offs);
>> +	ecc_level = (acc & brcmnand_ecc_level_mask(ctrl)) >> ctrl->ecc_level_shift;
> 
> Please use FIELD_PREP/FIELD_GET.
> 
These macros do not work here as the mask is not constant.

>> +	if (sector_size_1k)
>> +		ecc_strength = ecc_level * 2;
>> +	else if (spare_area_size == 16 && ecc_level == 15)
>> +		ecc_strength = 1; /* hamming */
>> +	else
>> +		ecc_strength = ecc_level;
>> +
>> +	return ecc_strength;
>> +}
>> +
>>   /***********************************************************************
>>    * CS_NAND_SELECT
>>    ***********************************************************************/
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
>> +	 * if brcm,nand-ecc-use-strap is set. However if nand-ecc-strength
>> +	 * is set, its value will be used and ignore the strap setting.
> 
> Please error out in this case. It's one or the other, not both.
> 
Will update.

>> +	 */
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
> 
> I'd instead make a function named brcmnand_get_ecc_settings() with the
> chip->ecc parameter, so you can directly fill the entries without
> getting another time the sector_size_1k thing.
> 
> Strength and step size are tightly linked, it does make sense to derive
> them both at the same time.
> 
Will update.

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

--0000000000009e18ef0612043f20
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIO/wu27rmaIsSf8uhWQq95lnl1HB
pHt8btQgLLcqlRxBMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDIyMzAzMzUxNlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQDHlXF6zSDHkiTiRsY3AaTkpQH83/25Q48SZZipEJ13OOD6
YJSpWnz3aNkga3MXsIgQkGPwjPOB/hclQBs/UmmkvtvTk7pXs8W38aUIXJtuS3jBtaA5gH1YQ9Kc
K1WYgc4qHDu8oK/nESMDoE2xeZHhLwVlrrVsd2uy1fuyo/Yaj5QR3bCzkKscquqoo86y/4etCmR3
22Z4ry24/XfpXGrSSJFBFulEb3OjlDxtCj2QXU2+o94ZjmoI/MceS50Z3FENsqQ+8rVHAswp0tz1
QnH9s7nYlCy09RXjRahohHD/Tk+ql/N6qNzF+De0G+3RPz0euuWhC8E7ZFfXawGVB8As
--0000000000009e18ef0612043f20--


--===============2847765036505850670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2847765036505850670==--

