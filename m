Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1726FEB64D9
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 00:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RT4UHmdM36HgJCprBrPs2g27krnnVsOztyU4tqUmf6I=; b=c2YNc1rFPkZzfAAAbwrh0RrEDZ
	yVsuugg4iFbf1kqMR26RDxEhBPmXYdrn/xGHyKB5dh8KF5RmXcZ6SrY/D556cE/0SWO4pXg0VHPAd
	xzu6AhbwQqhdyVkJ4a4/YDI4nLZbB93tGOP+lHFIPDK3IuBz4CmobU3hYRxuxE5hWp88OycgLFcmi
	GDKUafxIx7khoffl/dBtZ1y03kMbOHsGjVcnwzdPYSHixQzL28B8zZETFeLx2npqHXinK8IplpyC4
	pglV9X9FfcjrZPV5OEW3pO2wAygfwv7N5jZObtnx07gDtT45wdHWySnOHJV5iQh9+EnJfJYnqAuj7
	ii5d3kDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqj6-00EUMV-2k;
	Wed, 05 Jul 2023 00:50:36 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqj3-00EUM4-2p
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 00:50:35 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bdd069e96b5so6780229276.2
        for <linux-mtd@lists.infradead.org>; Tue, 04 Jul 2023 17:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1688518232; x=1691110232;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=2NBIt4HjHyyUNw8UB9CtDkpeyJjXG2tU9lfYIgUJXHk=;
        b=FKvD6sJ8bIgKSHMothsLXQNrS/HypySaJjEnD56jWU/h2Yz/LMrFoDUnHpxwIYSfPE
         tepe+2cZmqm66oFFqWPkHP082qnDlX1KFTpMCv3Ntv7i1TEpyQppnB9TDOeB1i0Ax09w
         /o5QsaMr8Tah4/uySJgPBU/iXQkiSJbdQkWcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688518232; x=1691110232;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NBIt4HjHyyUNw8UB9CtDkpeyJjXG2tU9lfYIgUJXHk=;
        b=i/QSa+Hc3O51Li7yIddDgpYag6A5EyCs2Ji1xXJy4A8oHSJ01ylJe9FwH3qAPJGPdB
         P2CVggLX+UavVESj/1zeO7HsxuAiYZTzwBSid03WqE2UnKyTnaPPEGCYawG08JDBzJOw
         fhjg26pTXty483ebD7X/sez0faC/hLS6wwj70EFVTIh6+6rkclb/x8286T90LwaA6xWb
         yn9pSbEFhyj3K52eqZM9eFdBaCUaZ3k3fXmA8WOzejqbtP4qDeI7f6vsRCvYOFrdFNMv
         mzZpF5RiToPxODTyhejgU/Aw0Wn/xthVj6r27UNNOmD+LUqW7MEmhLEVrxlZ1Y/MQUIL
         lVHQ==
X-Gm-Message-State: ABy/qLa1qd0LS9lFtKape9meDb7Log/85ACnatBPDUe0Bu8nOHoYuXmX
	g3dhiTzWRE8aJgx3Ci6IrYPmMg==
X-Google-Smtp-Source: APBJJlGAc60/2YEs/wXzZRs6nCS/lBtVnqS5iKEir74yVGwdsJUOt8Z6sDCnz1eou+jBwNCC3IMoeQ==
X-Received: by 2002:a05:6902:28c:b0:c37:f855:cff4 with SMTP id v12-20020a056902028c00b00c37f855cff4mr12465761ybh.63.1688518231690;
        Tue, 04 Jul 2023 17:50:31 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id et11-20020a056214176b00b0063596878aaasm12235385qvb.18.2023.07.04.17.50.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:50:30 -0700 (PDT)
Subject: Re: [PATCH v3 5/5] mtd: rawnand: brcmnand: Fix mtd oobsize
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon
 <bbrezillon@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
 <20230627193738.19596-6-william.zhang@broadcom.com>
 <20230704173047.395e445e@xps-13>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <c09a72df-c49f-75e9-e95e-4e19fe10a278@broadcom.com>
Date: Tue, 4 Jul 2023 17:50:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20230704173047.395e445e@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_175033_923950_650AB95D 
X-CRM114-Status: GOOD (  26.98  )
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
Content-Type: multipart/mixed; boundary="===============0078054197949776946=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0078054197949776946==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006b138c05ffb2c96f"

--0000000000006b138c05ffb2c96f
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 07/04/2023 08:30 AM, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Tue, 27 Jun 2023 12:37:38 -0700:
> 
>> brcmnand controller can only access the flash spare area up to certain
>> bytes based on the ECC level. It can be less than the actual flash spare
>> area size. For example, for many NAND chip supporting ECC BCH-8, it has
>> 226 bytes spare area. But controller can only uses 218 bytes. So brcmand
>> driver overrides the mtd oobsize with the controller's accessible spare
>> area size. When the nand base driver utilizes the nand_device object, it
>> resets the oobsize back to the actual flash spare aprea size from
>> nand_memory_organization structure and controller may not able to access
>> all the oob area as mtd advises.
>>
>> This change fixes the issue by overriding the oobsize in the
>> nand_memory_organization structure to the controller's accessible spare
>> area size.
> 
> I am clearly not a big fan of this solution. memorg should be and
> remain a read only object. Can you please find another solution?
> 
I was debating on this too but I don't see option because there is no 
other hooks after nanddev_init to set the mtd->oobsize as far as I can 
see and I see there were similar fixes for other controller drivers 
after the nand device object init was committed, for example:
Fixes: 629a442cad5f ("mtd: rawnand: Fill memorg during detection")

I will think through this again but I am open to any suggestion.

>>
>> Fixes: a7ab085d7c16 ("mtd: rawnand: Initialize the nand_device object")
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>>
>> ---
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> index 407bf79cbaf4..39c7f547db1f 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> @@ -2647,6 +2647,8 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>>   	struct nand_chip *chip = &host->chip;
>>   	const struct nand_ecc_props *requirements =
>>   		nanddev_get_ecc_requirements(&chip->base);
>> +	struct nand_memory_organization *memorg =
>> +		nanddev_get_memorg(&chip->base);
>>   	struct brcmnand_controller *ctrl = host->ctrl;
>>   	struct brcmnand_cfg *cfg = &host->hwcfg;
>>   	char msg[128];
>> @@ -2668,10 +2670,11 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>>   	if (cfg->spare_area_size > ctrl->max_oob)
>>   		cfg->spare_area_size = ctrl->max_oob;
>>   	/*
>> -	 * Set oobsize to be consistent with controller's spare_area_size, as
>> -	 * the rest is inaccessible.
>> +	 * Set mtd and memorg oobsize to be consistent with controller's
>> +	 * spare_area_size, as the rest is inaccessible.
>>   	 */
>>   	mtd->oobsize = cfg->spare_area_size * (mtd->writesize >> FC_SHIFT);
>> +	memorg->oobsize = mtd->oobsize;
>>   
>>   	cfg->device_size = mtd->size;
>>   	cfg->block_size = mtd->erasesize;
> 
> 
> Thanks,
> Miquèl
> 

--0000000000006b138c05ffb2c96f
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIG+qrrktL4FJ2PMSZq9CDI/E0HJM
vY2omOg1CZDy6jmVMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDcwNTAwNTAzMlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBCRjFlpA0b4QD6Z31cikJvWfh4LaNJ0e1iPRjmCDlA4uUy
dgvfgfzkpNJ8spXUGurCE8HNncWT8re91XkVUmm+V8aWFOdxIAGyYkW1IFIb9GTHVhecBMiNdfcA
WYtBhXGm+UXhmUe6t+AXS22XeCQFD5Vl8w73mIskQkuoQDUxP617zd60hhWsSyMm0/sG7ehrZc8Y
ny9E3+ysWNlgsMibP+tI2eMtcuPKB/0H5rUCFsSkVpntyirratb7B0AilzE5CPdiFXtE6Yvee0Xs
dgmoMGiEUxajbljp+UINsfSW8UvsgTbeztRtgrMetTicqDFvK61r/LXI6OC0hbgP9F84
--0000000000006b138c05ffb2c96f--


--===============0078054197949776946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0078054197949776946==--

