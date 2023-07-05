Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D24EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 01:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Qf4Ubjw2pYStXtRpNtuudw40xzz8+Ef1b/9X4jvLFo=; b=skKNkOwW9AmNv2YQcs4ej4wKIC
	hnGSaR8WY56Q0TSt7VoUJDzwdTnS0wRl2DISYl6U8o9Z1BGiXMQce98R6ewv1Oy60KrTy8xdCZVUe
	Cxp3Doi8KI7XZK+X18pIyewr3SZUuBg7wlJIpnO1YDfjn++FbyCMtSLjPzdbJWdAKMut5v8WYFb00
	xKfDdk7D11EK9yVyGOPupewKxXO9Zq6tdv8dNl9Y84HmunzJ54jru5rRIdKKzydhG/1rw5WPG+YVe
	hGADzgAV2CqBb22vDMDc035CNXDHjZQvh0UnItkaOmFAjyp4BXiwZOeiT0k9GlB8FLM+KhmdVk5rf
	NUEwLuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGraS-00EYuQ-1t;
	Wed, 05 Jul 2023 01:45:44 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqc0-00ETw1-31
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 00:43:18 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7658430eb5dso653837285a.2
        for <linux-mtd@lists.infradead.org>; Tue, 04 Jul 2023 17:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1688517795; x=1691109795;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=gacoxMSPxIJuaePWoCboXIP4Dj2uvzhSMbdKYB2CflY=;
        b=X0/Ih/mLpqw+wqIpCUQUPKQH+3t1C/XDI5/IRbhef2ut1LNL0oUkJzmmWaZNk/lHS8
         P3A7GwjYkcr2RmBYn275n9iSxIVpZfA4S+WCjzuX/E1kg8A0F27vusjnofHtqH5DMExy
         1qHxlwsR14AmBWaKZOjjOZog9k1EsdzBP2igw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688517795; x=1691109795;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gacoxMSPxIJuaePWoCboXIP4Dj2uvzhSMbdKYB2CflY=;
        b=RhWRSChhcdQ1h6k3Hp8s+0408NKdNsllH5z5JWuClLmCW5tgEESpm7xOhr88pWF0a7
         gXtC1EsBGwsLcWWL7RiM6gjlvtQtn9yZuEvNNrczvHvxa8QILJUKVkAYpTFaNA1TPN8+
         6H9TZCkb14RW67eYjnhw905D/yskRJEUpV+zj8rTorP1QTEvRuZuW7HY1sDYHjB8ek65
         B0zpGbTKrFGkoYAYF7WIl5am07CcTUsO1wbGZStnm/hV7wvf8oLbr7NuBBldJoLuzDii
         BAUPHfdsGGJ3i8MGWMXwpAG4CrdC7hQ7PV4JEv9J96dsp8xfFBj7dMlw3IetGMIDSdy7
         eITw==
X-Gm-Message-State: ABy/qLZhvCDKrU1C2Q8bUvk36fYQIqmTdIfDfw8tl2/t+Wi46Nm1/s5Y
	9+Hf/wpy4aHgeiqqTWoofsw4EA==
X-Google-Smtp-Source: APBJJlHZTW0H2cLXy+eKDFNVHJOzGgR9TQkQkWOHFPZif7aB6cpYVmSzbXitGbvwKb3cz00loTrUbg==
X-Received: by 2002:a05:620a:2989:b0:765:4e03:b136 with SMTP id r9-20020a05620a298900b007654e03b136mr19263552qkp.53.1688517795322;
        Tue, 04 Jul 2023 17:43:15 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id l24-20020a62be18000000b006829ef1e179sm2666320pff.99.2023.07.04.17.43.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:43:13 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] mtd: rawnand: brcmnand: Fix potential
 out-of-bounds access in oob write
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, Florian Fainelli
 <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Kamal Dasu <kdasu.kdev@gmail.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
 <20230627193738.19596-5-william.zhang@broadcom.com>
 <20230704172817.02e4cdb8@xps-13>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <5aa6cb07-eec9-d448-95d7-3a5591874d02@broadcom.com>
Date: Tue, 4 Jul 2023 17:43:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20230704172817.02e4cdb8@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_174316_979498_BC0E3C06 
X-CRM114-Status: GOOD (  23.73  )
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
Content-Type: multipart/mixed; boundary="===============1593794891510785910=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1593794891510785910==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000067c71605ffb2af18"

--00000000000067c71605ffb2af18
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 07/04/2023 08:28 AM, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Tue, 27 Jun 2023 12:37:37 -0700:
> 
>> When the oob buffer length is not in multiple of words, the oob write
>> function does out-of-bounds read on the oob source buffer at the last
>> iteration. Fix that by always checking length limit on the oob buffer
>> read and fill with 0xff when reaching the end of the buffer to the oob
>> registers.
>>
>> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> 
> Wrong Fixes.
Same here.  The function write_oob_to_regs was added by this commit and 
no change since then.


> 
> Missing Cc stable.
Will add
> 
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>
>> ---
>>
>> Changes in v3:
>> - Fix kernel test robot sparse warning:
>>     drivers/mtd/nand/raw/brcmnand/brcmnand.c:1500:54: sparse: expected unsigned int [usertype] data
>>     drivers/mtd/nand/raw/brcmnand/brcmnand.c:1500:54: sparse: got restricted __be32 [usertype]
>>
>> Changes in v2:
>> - Handle the remaining unaligned oob data after the oob data write loop
>>
>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> index ea03104692bf..407bf79cbaf4 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> @@ -1477,19 +1477,28 @@ static int write_oob_to_regs(struct brcmnand_controller *ctrl, int i,
>>   			     const u8 *oob, int sas, int sector_1k)
>>   {
>>   	int tbytes = sas << sector_1k;
>> -	int j;
>> +	int j, k = 0;
>> +	u32 last = 0xffffffff;
>> +	u8 *plast = (u8 *)&last;
>>   
>>   	/* Adjust OOB values for 1K sector size */
>>   	if (sector_1k && (i & 0x01))
>>   		tbytes = max(0, tbytes - (int)ctrl->max_oob);
>>   	tbytes = min_t(int, tbytes, ctrl->max_oob);
>>   
>> -	for (j = 0; j < tbytes; j += 4)
>> +	for (j = 0; (j + 3) < tbytes; j += 4)
> 
> Maybe a comment here as well to mention that you stop at the last
> iteration? Otherwise, just reading the line does not make you choice
> obvious.
> 
Will add comment.

>>   		oob_reg_write(ctrl, j,
>>   				(oob[j + 0] << 24) |
>>   				(oob[j + 1] << 16) |
>>   				(oob[j + 2] <<  8) |
>>   				(oob[j + 3] <<  0));
>> +
>> +	while (j < tbytes)
>> +		plast[k++] = oob[j++];
>> +
>> +	if (tbytes & 0x3)
>> +		oob_reg_write(ctrl, (tbytes & ~0x3), (__force u32)cpu_to_be32(last));
>> +
>>   	return tbytes;
>>   }
>>   
> 
> 
> Thanks,
> Miquèl
> 

--00000000000067c71605ffb2af18
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIGZ8kIypyAAGpfv7013kBGmIZZ1C
+Y/KIT6CuI10W9tAMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDcwNTAwNDMxNVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCyXdwLRLWS6b+zbSq8Vnn/hxRIi++67qwNQt3m7xuECLkw
qigS2o0xfWHKMO5hDIoeccsjTWt5DjEb7eZOnaZBqrIjpz++qDIoD4CrQammyS/Lbz029x0y4Glr
qpxdl6LRAZ2WbYniLdt/RTfnPiFy3+18/IqCNGpouuw1cc/W7GBg7b/upI14MwxOVSfg8yeterIb
lQ4WE+iAnDBOJTyQq4NOjfzm6P28fFIRP+nHs5IlJBlh6AZiwTq1VVfGjU4yFd8Ql7+54PSIayNf
SwhLSb6Q2DkgOkKqDzEzxYPu8uA77QoQKp0h8Rbm9b7SfvVNBNUFX1Wq8SoNWEWBUFfu
--00000000000067c71605ffb2af18--


--===============1593794891510785910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1593794891510785910==--

