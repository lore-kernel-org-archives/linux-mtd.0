Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67D5C001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 18:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOlMSpllvtuQIUSDUQhi1O8BifTfnDjKYJTLAIkarCA=; b=OS37kmWMLX1mdt8fL3ja7OCv7K
	5o9i8uSQdaBDe3lnF3SGQe+fAFLGELC1NW+zMHR9ddwBLfX0hAQauESkPDW+bL5SlPYccZjwF/0+h
	mRo5mcblw/EFGuYs3RPi5+NmHVd7hxWL7Xf8fHTcUk0YCobCQK2UNNolKR0nu9Oob92Hpic7S+q/B
	uNKCcyV1OeKYFaBeXrCcEaOwwqMKtQCPRPR9nc25cudf4pgL1P9h0y9Jxzlss2VCG1hhcemFl+Cwt
	whgcaoEeKaU1aV0I99JSvppkOwuMf/YOh15iU/wf0G+zgdY1CD+26O61Jl1lFXGhLM9eXf/UwA0yA
	yckQpy5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT4a9-000N6u-2x;
	Mon, 07 Aug 2023 18:03:53 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT4a6-000N5r-1g
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 18:03:52 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-687087d8ddaso4640125b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 11:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1691431422; x=1692036222;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=9UNLed0jorBwAbtCEd30YFHFfUSvzIqw/XeHToz0qJU=;
        b=aw9lFhzuuPdFILn+zifcI/dsDmk92I3TafZnM1BjJmlY+cP/Jxc9T00HdRpDIfnWSq
         35DOVA9K7A29pVFgAM8FmyebAe85e3MwBTwbPXSgRx5wRrk+ZlVEm7ErJwCVHBc6K2tS
         xWmbQ7hfdvpUzqlEozCPdJ5nev5eUadNjN0uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691431422; x=1692036222;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UNLed0jorBwAbtCEd30YFHFfUSvzIqw/XeHToz0qJU=;
        b=aRaCy8sBokzYbKvGznpxO2pPwANs7JqisXLWuZi8avCnecXJXMVkFe96EreSRR0HDJ
         e2GKrmyd7KXpXZ8Bk8DvgzeNRLlWNi28tH4Uun6ecfSc8yq5saesSCPGWI+89e6QzbLB
         fKV9rSHnJxIFrQeqwxh3Gz3Wjxr/vC3SZmjNhm2CVYeP0yANfCWU6Ik5DYc/TthoNYxc
         SHuNpZgfwKpkATZK4mwBCW1WxDSvGcm3S87/GcPZwkGrF3Erxvp/SxkKOihKtyUq0t8T
         q/AINzkJ+fXZaD1+dIUr964dVpRja9PSO/zDn5iWIt4DhkdSLUk1yM8WAFLrV2rdvamV
         PhRA==
X-Gm-Message-State: AOJu0YyMYib4ULUNoPriy/wl52vI9l2s3aieMWzcrX1fak2BVXnI/9GO
	IajxdU8NVh3Mi9Y56LKKLmhdjQ==
X-Google-Smtp-Source: AGHT+IF6EaMp3HIlSVnGwhrLAggXbKN9xnhUVH5KAbqb7vlPbY8qSxlRAHglI+4RpN5oPrO+C3dgLw==
X-Received: by 2002:a05:6a00:130b:b0:641:3bf8:6514 with SMTP id j11-20020a056a00130b00b006413bf86514mr11656760pfu.10.1691431422522;
        Mon, 07 Aug 2023 11:03:42 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id g12-20020a62e30c000000b006870814361bsm6470548pfh.114.2023.08.07.11.03.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Aug 2023 11:03:41 -0700 (PDT)
Subject: Re: [PATCH -next v2] mtd: rawnand: Propagate error values for
 brcmstb_nand_wait_for_completion()
To: Ruan Jinjie <ruanjinjie@huawei.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20230805050146.1858880-1-ruanjinjie@huawei.com>
 <647680c7-4d47-943d-0455-0039302ac1aa@broadcom.com>
 <0d328161-0d4a-a239-2cdd-d78f0f339b4d@huawei.com>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <72f1d2ad-64a7-67ae-7bb2-4b4e2baada8f@broadcom.com>
Date: Mon, 7 Aug 2023 11:03:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <0d328161-0d4a-a239-2cdd-d78f0f339b4d@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_110350_566470_A6B366F5 
X-CRM114-Status: GOOD (  21.20  )
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
Content-Type: multipart/mixed; boundary="===============6492759809545584641=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6492759809545584641==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000207ab206025911ad"

--000000000000207ab206025911ad
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 08/07/2023 02:42 AM, Ruan Jinjie wrote:
> 
> 
> On 2023/8/6 14:09, William Zhang wrote:
>> Hi Jinjie,
>>
>> On 08/04/2023 10:01 PM, 'Ruan Jinjie' via BCM-KERNEL-FEEDBACK-LIST,PDL
>> wrote:
>>> As bcmnand_ctrl_poll_status() return negative errno, and the < 0
>>> case does not exist for wait_for_completion_timeout(), so return
>>> -ETIMEDOUT if sts = 0 and zero otherwise. It is not sensible for
>>> brcmstb_nand_wait_for_completion() to return bool value, change it
>>> to int to propagate the error.
>>>
>>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>>> ---
>>> v2:
>>> - Update the commit title and message.
>>> - Propagate the error instead of upon error.
>>> ---
>>>    drivers/mtd/nand/raw/brcmnand/brcmnand.c | 9 +++++----
>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>> b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>> index 03764b589ec5..25e5b15fbd6a 100644
>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>> @@ -1653,12 +1653,12 @@ static void brcmnand_cmd_ctrl(struct nand_chip
>>> *chip, int dat,
>>>        /* intentionally left blank */
>>>    }
>>>    -static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
>>> +static int brcmstb_nand_wait_for_completion(struct nand_chip *chip)
>>>    {
>>>        struct brcmnand_host *host = nand_get_controller_data(chip);
>>>        struct brcmnand_controller *ctrl = host->ctrl;
>>>        struct mtd_info *mtd = nand_to_mtd(chip);
>>> -    bool err = false;
>>> +    int err = 0;
>>>        int sts;
>>>          if (mtd->oops_panic_write || ctrl->irq < 0) {
>>> @@ -1666,13 +1666,14 @@ static bool
>>> brcmstb_nand_wait_for_completion(struct nand_chip *chip)
>>>            disable_ctrl_irqs(ctrl);
>>>            sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
>>>                               NAND_CTRL_RDY, 0);
>>> -        err = (sts < 0) ? true : false;
>>> +        err = sts;
>>>        } else {
>>>            unsigned long timeo = msecs_to_jiffies(
>>>                            NAND_POLL_STATUS_TIMEOUT_MS);
>>>            /* wait for completion interrupt */
>>>            sts = wait_for_completion_timeout(&ctrl->done, timeo);
>>> -        err = (sts <= 0) ? true : false;
>>> +        if (!sts)
>>> +            err = -ETIMEDOUT;
>>>        }
>>>          return err;
>>>
>> Sorry that I missed your first patch but the original goal of this
>> function is to return if time out happens. So you can simplify the
>> ternary operator but propagate -ETIMEDOUT from its caller
>> brcmnand_waitfunc instead.
> 
> So not change the return from bool to int? Just simplify ternary
> operator. 
Yes

> How to propagate -ETIMEDOUT to brcmstb_nand_wait_for_completion?
In the brcmnand_waitfunc,  if err is true, return -ETIMEDOUT. Otherwise, 
keep the original execution path.
I can submit a separate patch late for this if it is more than what you 
want to fix. Totally up to you.





--000000000000207ab206025911ad
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIPqMWm4o8fynit1KSQ5cRgto+YHz
jfW1k9OPe1QsqjQHMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDgwNzE4MDM0MlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAKTO4WoPzp7k7JekmUVWu3qZlzmOekJYiJdcySwIxVVEtj
aGnSW46NkVQWIUc634u/BMeMcmRdA1/32lpMzJ2lVYKeiGwEel1Gas9+gxj48nDpD3JviumVdEMr
ok42QsMOFUL+zbVrIeJKGmKlXWxSRHfycpr1oVqwPdOsvlKRlcX7+mvVhUYT0F7lxt3xINumgfEd
pb+PUehwhwlctLQ3iuWVCXPNBB2yHI1OWk7DtfMf7F4wwVsZsL2ahE0WCqnTbLnX3wKzttP9zMS3
PiDslX9MlLFpnQd7ylx5I7xtFERj8Z8A6jAWvJnaRy6tT25C2cAMTqMZtKA1K8WY4oKh
--000000000000207ab206025911ad--


--===============6492759809545584641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6492759809545584641==--

