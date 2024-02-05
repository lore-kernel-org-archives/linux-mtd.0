Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207B6C48292
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTGUBC22fW1BqmIsDNUXvzO2EEo01aQ7wU2mtPZR1NQ=; b=GP4pXqItDs6EcALmlMjGLqPKCw
	Q4okNZuDn46hP4zepP12uy6+l+FaXqgu5ArsBhMNzr+7s6hxJhcgfANpZFcoNmPQhDRaL7LlG4r7p
	gMy5ggLwBMj9OVhJuF30Qv4iGM9alCsBm0RzwwHObiOdQ0RXC3Rp9GzZQwCodi1UYE9K7MSfkfImV
	GYrxs16xrRlqcDQ1qB/EfNylQPlf6q73eq2/7NpLFPTmSrkDrf2R2lhwNhrNgL8CnlSnPnIOVPnLk
	kjSF9DIFi6OIedsLWbGTVINXltP50mHvPwuf+nsh1ES/SZE6Rp7ao8tK28FMWbzYNPO4L9ME9Azgo
	re2IGBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3Zz-00000004LTc-3crc;
	Mon, 05 Feb 2024 18:20:27 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3Zw-00000004LRv-2emh
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 18:20:26 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-78562c1ca4dso77219385a.0
        for <linux-mtd@lists.infradead.org>; Mon, 05 Feb 2024 10:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1707157223; x=1707762023; darn=lists.infradead.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/N5FJmghmndyotm8BkKlie3wuT/cMjciDIkP3BQ0FE=;
        b=f9vySQhITCy6Kgnb8KZ+mrkwGjk9k+tKJmb6N1Bg00zSpqjQCIuN4gk6SzyJzw3qmR
         NdISzYz9Gu30XBF+taDsPyh3ehPm46H83QxeHoKyZsGpJE9BzyxKoU8iuf9I2wKvhjQA
         vbyP98v6Ddv5bYziPFV0a/Xl2zFp8kS1Qawr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157223; x=1707762023;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/N5FJmghmndyotm8BkKlie3wuT/cMjciDIkP3BQ0FE=;
        b=H/8MPglKlg0uq32rrkWwN+9VJKhjq/5C4VfIb3kDSK7PRuHjVJP90giWbT26gojA8H
         mXUw4WOs/Xyeydc5/uUSiC17xBqylKLUnK/DpuELF3LqjA2vqi69H5XJPBDELYcmDoHg
         K5b6EN7dPogPY9TZgPw9sXHGJKOU2ykMOJOZBOFTJCvK7PPVSU71y6LdIT4gcexCHWxy
         TyiHSzu2IhOG+cnSd7FwLxQAnQuJq1bfdC1oT/XQxOhxrqLjeqDpSbPmlKF0VDPriEcM
         ATXgAnt9TzDlb/6qt7eW1jS/Kf/EFzq/wIQs5+hpjw1/NMQDJd1zdI4U9HBlVV3omcqY
         KUCQ==
X-Gm-Message-State: AOJu0YwDCyOxVewWEXJ+vJiKiqOPBddsbIMugazdtBjRlneXbG8QAPHC
	2+ly1jh0HUobI/RxbROI3FzrHfns5thGbYy4gGHUylanPXxrdxvhvE2nCgw6VQ==
X-Google-Smtp-Source: AGHT+IFiAyBISQABOUTXHzgAbqNJIzsZul9TFvA2cg6rohKZ2ECrktNlbK+NBzqzDiq1lwDp3Q8PpQ==
X-Received: by 2002:a05:620a:6189:b0:783:8d71:e4e6 with SMTP id or9-20020a05620a618900b007838d71e4e6mr214364qkn.76.1707157223219;
        Mon, 05 Feb 2024 10:20:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX1krThgvCvjeHlU9YLFtQF2CqdhQ96Hp6oMQSBGVeIYUQoiQ77LkBYS1nSw094jy+XLugr2uCHGuvdwveHXHxuwSvXoESrSP+Lptmp7h6Ja3WrRQwSzUAYCsXmDVG/aoK7rP32uoR/QYg1FX+HA9wYdJMRnQx7uTeDjD7986N+ygeXk4jO5Jpi2ZMpT6NgOgjI6P54ugwdR+Fix50QtCHKcoSGHuVNCkM8Batln817emngE9xJhQNVvUis+hirMl+/gDl9a057iecFPa41zsMMGs7rtAF0FoJtoUhCHdm3lWVsg7teRrQEM5vAuvVkwoc5QEXhFrK3wSnn8agLlUuKcDHgYgrOpfOxFyr2SHB2UkT6A40WpQuGjGzQOBDki7f4ULhGhZFHUAOz9oarOkph28AI0gdkLH+3nzck7flA19zyTxoWpMIf4nptUmvV4Xr0+904AsI9I7ZkTkOJr6XVgh18khrqbBR0Oso83Tvnem6EzqUm6H+wSRFot57HvGNeYOWLWQtJFr9mrWUsssRtljeg6mFsD/CtLK0xdNQWUvkIxQofsj8bcggFSLJuWI5c
Received: from [192.168.52.129] ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id y5-20020ae9f405000000b00783dc450d84sm172363qkl.12.2024.02.05.10.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 10:20:22 -0800 (PST)
Message-ID: <2b299550-4cd8-4f32-93e4-71e529d7c266@broadcom.com>
Date: Mon, 5 Feb 2024 10:20:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] mtd: rawnand: brcmnand: update log level
 messages
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
References: <20240203002834.171462-1-william.zhang@broadcom.com>
 <20240203002834.171462-13-william.zhang@broadcom.com>
 <20240205143745.5a1036c6@xps-13>
From: William Zhang <william.zhang@broadcom.com>
In-Reply-To: <20240205143745.5a1036c6@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_102024_712972_6F4BADF1 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Type: multipart/mixed; boundary="===============3059732076712230206=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3059732076712230206==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e33e350610a683ed"

--000000000000e33e350610a683ed
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/5/24 05:37, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Fri,  2 Feb 2024 16:28:33 -0800:
> 
>> From: David Regan <dregan@broadcom.com>
>>
>> Update log level messages so that more critical messages
>> can be seen.
> 
> This commit log does not convince me. Warning messages are visible,
> they are in dmesg. If you want them on your console, lower your default
> console level by 1 and they will appear. I'm fine increasing the log
> level on error messages, but the justification cannot be specific to
> your own setup.
> 
It is mainly for troubleshooting our customer devices. Understand we can 
get the log through dmesg but when we deal with system hang issue, 
console log is very important. And also sometimes customer has rebooted 
the device due to error condition and we lost the dmesg.

How about we update the commit message to:
Update log level messages so that more critical messages
can be logged to console and help the troubleshooting with customer 
devices.

>>
>> Signed-off-by: David Regan <dregan@broadcom.com>
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>> Reviewed-by: William Zhang <william.zhang@broadcom.com>
>>
>> ---
>>
>> Changes in v4:
>> - Revert the log level change for correctable ecc error
>>
>> Changes in v3: None
>> Changes in v2:
>> - Added to patch series
>>
>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> index 7ce2b267676f..e50582b45182 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> @@ -1143,7 +1143,7 @@ static int bcmnand_ctrl_poll_status(struct brcmnand_host *host,
>>   	if ((val & mask) == expected_val)
>>   		return 0;
>>   
>> -	dev_warn(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
>> +	dev_err(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
>>   		 expected_val, val & mask);
>>   
>>   	return -ETIMEDOUT;
>> @@ -2196,7 +2196,7 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>>   				return err;
>>   		}
>>   
>> -		dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",
>> +		dev_err(ctrl->dev, "uncorrectable error at 0x%llx\n",
>>   			(unsigned long long)err_addr);
>>   		mtd->ecc_stats.failed++;
>>   		/* NAND layer expects zero on ECC errors */
> 
> 
> Thanks,
> Miquèl

--000000000000e33e350610a683ed
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIAQc5n33l2jZiU6UoUHmcckwvJq6
Xc1DVwZy+P5iyFOXMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDIwNTE4MjAyM1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBMM/yWwCujtJQJRXjnBNuc/FRNeMDeqLqXWDIEqMok4XEz
IR3z7O52wkIxCCpU68XAM6DQeX2s56NAjwJ9VuKUlJAVDjeN+gBKMrHU1gp6XPF2EiTNkEV4fIdB
A/CG6hLPghoe4mG8gWCx7ocgRlkPeFhVHh3jUwMNZBUpQ8A34JExUFL6jUM7/htawp4NOg6FqchK
BCv3KCZBD4lfTKCqz148TB/toCvF55ceL07o5TIl535n1Eeslx2bDJVMRv1DdugOywnOX7G9C8se
GtqLP4g4yBiJkdltk2yBy51flykkGy81Q5VnIqkbSTjMxOF6++nOHxvjuTTi7SeUxJA5
--000000000000e33e350610a683ed--


--===============3059732076712230206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3059732076712230206==--

